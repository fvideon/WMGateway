using System;
using System.Diagnostics;
using System.Collections;
using System.Threading;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using Microsoft.Ink;
using MSR.LST;
using ArchiveRTNav;
using CP3 = UW.ClassroomPresenter;
using System.Collections.Generic;
using System.Drawing;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Maintains queues and encapsulates logic for delivering Presenter data to the Windows Media script stream.
	/// </summary>
	/// The ScriptQueue functions as follows:
	/// -Upon creation, determine a maximum script size (from the bitrate), and the maximum aggregate
	/// script data per second which we can safely allow to be sent to the WM stream, then start a dequeue 
	/// thread to process work items.
	/// -The dequeue thread will work at a rate which will prevent too much data being sent to the
	/// script stream.  When an item is to be dequeued the thread will raise an event.  
	/// Internally there are two queues: the main queue and a low priority queue.
	/// The low priority queue will only be serviced if the main queue 
	/// is empty.  The dequeue thread will also check to see if
	/// items in the low priority queue should be promoted to the main queue.  If work items exceed the maximum allowed
	/// size for a single command, the dequeue thread will fragment them.
	/// -During enqueueing we will do some prioritizing and filtering.  Opcodes: cleardeck, emptydeck, clearslide,
	/// min/max, erasestroke are enqueued directly in the main queue with no additional logic.
	/// -SlideIndex will be enqueued on transition and once every N1 seconds
	/// -SlideIndex will also enqueue a URL work item on transition, and once every N2 seconds.
	/// -stroke will be enqueued with a guid.  If a new item comes in with the same guid, it will replace 
	/// the last.  Initially stroke will be placed on low priority queue.  If a new stroke comes in with a 
	/// different guid, or if a period N4 passes during which another request with the same stroke guid does not 
	/// arrive, then the work item will be moved to the main queue, and will receive priortity appropriate given 
	/// its last timestamp.
	/// -scrollpos will be enqueued in the main queue only if one of the coordinates has changed since the last time.
	/// 
	public class ScriptQueue
	{
		#region Declarations

		private ArrayList mainQueue;
		private ArrayList subQueue;
		private Thread DequeueThread;
		private DateTime lastSlideTime;
		private DateTime lastScrollTime;
		private DateTime lastURLTime;
		private DateTime lastEnqueueTime;
		private int lastSlideIndex;
		private Guid lastDeckGuid;
		private int minDequeuePeriod;

		private int scriptBitrate;
		private int maxBytesPerSecond;
		private object bwUpdateLockObject;
		
		private Hashtable seenStudentSubmissions;

		private RTUpdate rtUpdate; //the one and only outbound "beacon" packet.

		private const int URLPeriod = 10;			//seconds between URL script commands
		private const int SlideIndexPeriod = 2;		//seconds between slide index commands.
		private const int maxScribbleAge = 1000;	//milliseconds to wait before moving a stroke to mainQueue

		private const string scriptType = "CXP3";	//Standard type tag for script commands derived from Presenter data
		private const string fragmentType = "CXP4";	//This type indicates that the payload is a fragment, but not the final piece
		private const string slidePathType = "CXP2";//Give the live viewer slide URL data updates
		
		private Mutex scEnqueueMutex; //Prevent ScriptCommand resend from messing up.

		private string baseUrl;
		private string extent;
		private string lastUrl;
		private RTUpdate LastRtUpdate;

        private CP3Manager.CP3Manager cp3Mgr;

		#endregion
		#region Constructor


        /// <summary>
        /// Construct.
        /// </summary>
        /// <param name="msMinDequeuePeriod">Minimum delay in milliseconds between dequeue events</param>
        /// <param name="scriptBitrate">Bits per second available in the current Windows Media script stream</param>
        public ScriptQueue(int msMinDequeuePeriod, int scriptBitrate, String baseUrl, String extent) {
            seenStudentSubmissions = new Hashtable();
            rtUpdate = new RTUpdate();
            mainQueue = new ArrayList();
            subQueue = new ArrayList();
            lastSlideTime = lastURLTime = lastScrollTime = DateTime.Now;
            lastEnqueueTime = DateTime.MinValue;
            lastSlideIndex = 0;
            lastDeckGuid = Guid.Empty;
            minDequeuePeriod = msMinDequeuePeriod;

            this.scriptBitrate = scriptBitrate;
            maxBytesPerSecond = scriptBitrate / 10;  //theoretically we would divide by 8, but in practice we need a little extra safety factor.
            bwUpdateLockObject = new object();

            this.baseUrl = baseUrl;
            this.extent = extent;
            lastUrl = null;

            scEnqueueMutex = new Mutex(false, "scEnqueue");
            DequeueThread = new Thread(new ThreadStart(dequeueThread));
            DequeueThread.Name = "ScriptQueue dequeue thread";
            DequeueThread.SetApartmentState(ApartmentState.MTA); //Needed for WM interop
            DequeueThread.Start();
            LastRtUpdate = new RTUpdate();
            cp3Mgr = new CP3Manager.CP3Manager();
        }
		

		public void Dispose()
		{
			if (DequeueThread.IsAlive)
			{
				DequeueThread.Abort();
				DequeueThread = null;
			}

			mainQueue = null;
			subQueue = null;
		}
		#endregion
		#region Properties

		public int ScriptBitrate
		{
			get 
			{
				return scriptBitrate;
			}
			set 
			{
				//queue this to run asynchronously, since otherwise there could be a significant delay 
				//waiting for a lock to be released.
				ThreadPool.QueueUserWorkItem(new WaitCallback(updateScriptBitrate),value);
			}
		}

		private void updateScriptBitrate(object newValue)
		{
			lock (bwUpdateLockObject)
			{
				scriptBitrate = (int)newValue;
				maxBytesPerSecond = scriptBitrate/10;
				//Debug.WriteLine("ScriptQueue:updateScriptBitrate setting to:" + scriptBitrate.ToString());
			}		
		}

		public String BaseUrl
		{
			get { return baseUrl; }
			set {
                if (this.baseUrl != value) {
                    this.baseUrl = value;
                    if (this.rtUpdate != null) {
                        this.rtUpdate.BaseUrl = baseUrl;
                    }
                }
            }
		}

		public String Extent
		{
			get { return extent; }
            set {
                if (this.extent != value) {
                    extent = value;
                    if (this.rtUpdate != null) {
                        this.rtUpdate.Extent = this.extent;
                    }
                }
            }
		}

		public String LastUrl
		{
			get { return lastUrl; }
			set { lastUrl = value; }
		}

		#endregion
		#region Enqueuing

		private void DumpScrollLayer(ArchiveRTNav.RTScrollLayer rtsl)
		{
			Debug.WriteLine("ScrollLayer: si=" + rtsl.SlideIndex.ToString() +
				" se=" + rtsl.ScrollExtent.ToString() +
				" sp=" + rtsl.ScrollPosition.ToString() +
				" di=" + rtsl.DeckGuid.ToString()); 
		}

        private void DumpBeacon(BeaconPacket bp)
		{
			Debug.WriteLine("BeaconPacket dump: \n" +
				"  Alive=" + bp.Alive.ToString() + "\n" +
				"  BGColor=" + bp.BGColor.ToString() + "\n" +
				"  ID=" + bp.ID.ToString() + "\n" +
				"  Role=" + bp.Role.ToString() + "\n" +
				"  FName=" + bp.FriendlyName + "\n" +
				"  Name=" + bp.Name + "\n" +
				"  Time=" + bp.Time.ToString() + "\n\n"  );
		}


		/// <summary>
		/// Enqueue RTObject types
		/// </summary>
		/// <param name="rtobj"></param>
		public void Enqueue(object rtobj)
		{

			//These types chatter once a second:
			//WorkSpace.BeaconPacket
			//PresenterNav.CPDeckCollection
			//PresenterNav.CPPageUpdate
			//PresenterNav.CPScrollLayer	//These also emitted during scroll

			//Other types we need to listen to:
			//PresenterNav.CPDrawStroke;
			//PresenterNav.CPDeleteStroke;
			//PresenterNav.CPEraseLayer;
			//PresenterNav.CPEraseAllLayers;

            if (rtobj is CP3.Network.Chunking.Chunk) {
                AcceptCP3Chunk((CP3.Network.Chunking.Chunk)rtobj);
            }
            else {
                Type t = rtobj.GetType();
                Debug.WriteLine("Unhandled Type:" + t.ToString());
            }
		}

        private void AcceptCP3Chunk(UW.ClassroomPresenter.Network.Chunking.Chunk chunk) {
            List<object> rtObjList = cp3Mgr.Accept(chunk);
            if ((rtObjList == null) || (rtObjList.Count==0)) {
                if (cp3Mgr.WarningLog != null) {
                    foreach (string s in cp3Mgr.WarningLog) {
                        Debug.WriteLine(s);
                    }
                    cp3Mgr.WarningLog.Clear();
                }
                FilterCP3RTUpdate();
                return;
            }

            foreach (object rto in rtObjList) {
                if (rto is ArchiveRTNav.RTUpdate) {
                    Debug.WriteLine("**CP3Mgr returns RtUpdate: " + ((RTUpdate)rto).ToString());
                    UpdateRTUpdate((RTUpdate)rto);
                    FilterCP3RTUpdate();
                }
                else if (rto is ArchiveRTNav.RTDrawStroke) { 
                    FilterRTDrawStroke((RTDrawStroke)rto);
                }
                else if (rto is ArchiveRTNav.RTDeleteStroke) {
                    FilterRTDeleteStroke((RTDeleteStroke)rto);
                }
                else if (rto is ArchiveRTNav.RTTextAnnotation) {
                    FilterRTTextAnnotation((RTTextAnnotation)rto);
                }
                else if (rto is ArchiveRTNav.RTImageAnnotation) {
                    FilterRTImageAnnotation((RTImageAnnotation)rto);
                }
                else if ((rto is ArchiveRTNav.RTDeleteTextAnnotation)) {
                    FilterRTDeleteTextAnnotation((RTDeleteTextAnnotation)rto);
                }
                else if ((rto is ArchiveRTNav.RTDeleteAnnotation)) {
                    FilterRTDeleteAnnotation((RTDeleteAnnotation)rto);
                }
                else if (rto is ArchiveRTNav.RTEraseLayer) {
                    ArchiveRTNav.RTEraseLayer rtel = (RTEraseLayer)rto;
                    BufferChunk bc = new BufferChunk(Helpers.ObjectToByteArray(rtel));
                    enqueueMain(new WorkItem(bc, PacketType.ClearScribble, rtel.SlideIndex, rtel.DeckGuid));
                }
                else if (rto is ArchiveRTNav.RTQuickPoll) {
                    ArchiveRTNav.RTQuickPoll rtqp = (RTQuickPoll)rto;
                    BufferChunk bc = new BufferChunk(Helpers.ObjectToByteArray(rtqp));
                    enqueueMain(new WorkItem(bc, PacketType.RTQuickPoll, rtqp.SlideIndex, rtqp.DeckGuid));                    
                }
                else {
                    Debug.WriteLine("CP3Manager returned unhandled archive type: " + rto.GetType().ToString());
                }
            }
        }

        /// <summary>
        /// This is an image that the user added dynamically.
        /// TODO:  We need to compress most images down to fairly small size in order to work..
        /// </summary>
        /// <param name="rtia"></param>
        private void FilterRTImageAnnotation(RTImageAnnotation rtia) {
            Guid guid = rtia.Guid;
            BufferChunk data;
            lock (subQueue) {
                //if annotation with this guid is found in low priority queue, replace it, otherwise enqueue it.
                for (int i = 0; i < subQueue.Count; i++) {
                    if ((((WorkItem)subQueue[i]).OpCode == PacketType.RTImageAnnotation) &&
                        (((WorkItem)subQueue[i]).Guid == guid)) {
                        subQueue.RemoveAt(i);
                        break;
                    }
                }
            }
            rtia.Img = CompressImage(rtia.Img);
            data = new BufferChunk(Helpers.ObjectToByteArray(rtia));
            WorkItem wi = new WorkItem(data, PacketType.RTImageAnnotation, guid);
            wi.DeckGuid = rtia.DeckGuid;
            wi.SlideIndex = rtia.SlideIndex;
            enqueueSub(wi);
        }

        /// <summary>
        /// Make sure the image is pretty small to improve the chances of getting it over the script stream 
        /// channel in a timely manner.  The 320x240 JPG images seem to be around 16KB.
        /// </summary>
        /// <param name="image"></param>
        /// <returns></returns>
        private Image CompressImage(Image image) {    
            Bitmap bm = new Bitmap(image, new Size(320, 240));
            Stream s = new MemoryStream();
            bm.Save(s, System.Drawing.Imaging.ImageFormat.Jpeg);
            return Image.FromStream(s);
        }

        /// <summary>
        /// This could be a delete for a text annotation or a dynamically added image (so called Image Annotation).
        /// </summary>
        /// <param name="rtda"></param>
        private void FilterRTDeleteAnnotation(RTDeleteAnnotation rtda) {
            Guid guid = rtda.Guid;

            lock (subQueue) {
                //if annotation with this guid is found in low priority queue, remove it.  
                //We assume there will never be more than one due to the way we enqueue annotations.
                for (int i = 0; i < subQueue.Count; i++) {
                    if (((((WorkItem)subQueue[i]).OpCode == PacketType.RTTextAnnotation) || 
                        (((WorkItem)subQueue[i]).OpCode == PacketType.RTImageAnnotation)) &&
                        (((WorkItem)subQueue[i]).Guid == guid)) {
                        subQueue.RemoveAt(i);
                        break;
                    }
                }
            }

            BufferChunk bc = new BufferChunk(Helpers.ObjectToByteArray(rtda));
            enqueueMain(new WorkItem(bc, PacketType.RTDeleteTextAnnotation, rtda.SlideIndex, rtda.DeckGuid));
        }

        /// <summary>
        /// RTTextAnnotation is obsolete with CP 3.1 and later.
        /// </summary>
        /// <param name="rtta"></param>
        private void FilterRTTextAnnotation(RTTextAnnotation rtta) {
            Guid guid = rtta.Guid; //verify that this property is actually populated.
            BufferChunk data;
            lock (subQueue) {
                //if annotation with this guid is found in low priority queue, replace it, otherwise enqueue it.
                for (int i = 0; i < subQueue.Count; i++) {
                    if ((((WorkItem)subQueue[i]).OpCode == PacketType.RTTextAnnotation) &&
                        (((WorkItem)subQueue[i]).Guid == guid)) {
                        subQueue.RemoveAt(i);
                        break;
                    }
                }
            }
            data = new BufferChunk(Helpers.ObjectToByteArray(rtta));
            WorkItem wi = new WorkItem(data, PacketType.RTTextAnnotation, guid);
            wi.DeckGuid = rtta.DeckGuid;
            wi.SlideIndex = rtta.SlideIndex;
            enqueueSub(wi);
        }

        private void FilterRTDeleteTextAnnotation(RTDeleteTextAnnotation rtdta) {
            Guid guid = rtdta.Guid;

            lock (subQueue) {
                //if annotation with this guid is found in low priority queue, remove it.  
                //We assume there will never be more than one due to the way we enqueue annotations.
                for (int i = 0; i < subQueue.Count; i++) {
                    if ((((WorkItem)subQueue[i]).OpCode == PacketType.RTTextAnnotation) &&
                        (((WorkItem)subQueue[i]).Guid == guid)) {
                        subQueue.RemoveAt(i);
                        break;
                    }
                }
            }

            BufferChunk bc = new BufferChunk(Helpers.ObjectToByteArray(rtdta));
            enqueueMain(new WorkItem(bc, PacketType.RTDeleteTextAnnotation, rtdta.SlideIndex, rtdta.DeckGuid));
        }

        /// <summary>
        /// If strokes with this Guid are found in the queue, remove them, then enqueue the delete.
        /// </summary>
        /// <param name="rtds"></param>
        private void FilterRTDeleteStroke(RTDeleteStroke rtds) {
            Guid guid = rtds.Guid; 

            lock (subQueue) {
                //if stroke with this guid is found in low priority queue, remove it.  
                //We assume there will never be more than one due to the way we enqueue strokes.
                for (int i = 0; i < subQueue.Count; i++) {
                    if ((((WorkItem)subQueue[i]).OpCode == PacketType.Scribble) &&
                        (((WorkItem)subQueue[i]).Guid == guid)) {
                        subQueue.RemoveAt(i);
                        break;
                    }
                }
            }

            BufferChunk bc = new BufferChunk(Helpers.ObjectToByteArray(rtds));
            enqueueMain(new WorkItem(bc, PacketType.ScribbleDelete, rtds.SlideIndex, rtds.DeckGuid));
        }

        private void UpdateRTUpdate(RTUpdate rtu) {
            lock (rtUpdate) {
                rtUpdate = rtu;
                rtUpdate.BaseUrl = baseUrl;
                rtUpdate.Extent = extent;
            }
        }


        /// <summary>
        /// Simplified version of FilterRTUpdate for CP3 data.  CP3 code does not use the OverlayMessage cache 
        /// or the scroll position cache.  Also, we drop the URL script command feature because we believe they 
        /// are never used.
        /// </summary>
        private void FilterCP3RTUpdate() {
            BufferChunk data;
            DateTime now = DateTime.Now;

            lock (rtUpdate) {
                ///enqueue a page update on transition and every 2 seconds.
                if (((now - lastSlideTime) >= TimeSpan.FromSeconds(SlideIndexPeriod)) ||
                    (lastSlideIndex != rtUpdate.SlideIndex) ||
                    (lastDeckGuid != rtUpdate.DeckGuid)) {
                    if (rtUpdate.DeckGuid.Equals(Guid.Empty)) {
                        Debug.WriteLine("***Warning: ScriptQueue.FilterCP3RTUpdate not sending RTUpdate because it has an empty deck Guid.");
                        return;
                    }
                    lastSlideTime = now;
                    data = new BufferChunk(Helpers.ObjectToByteArray(rtUpdate));
                    enqueueMain(new WorkItem(data, PacketType.RTUpdate, rtUpdate.SlideIndex, rtUpdate.DeckGuid), rtUpdate);
                    Debug.WriteLine("FilterRTUpdate: " + rtUpdate.DeckType.ToString());
                }

                lastSlideIndex = rtUpdate.SlideIndex;
                lastDeckGuid = rtUpdate.DeckGuid;
            }
       
        }


		private void FilterRTDrawStroke(ArchiveRTNav.RTDrawStroke rtds)
		{
			Guid guid = rtds.Guid; //verify that this property is actually populated.
			BufferChunk data;
			lock(subQueue)
			{
				//if stroke with this guid is found in low priority queue, replace it, otherwise enqueue it.
				for(int i = 0; i<subQueue.Count;i++)
				{
					if ((((WorkItem)subQueue[i]).OpCode == PacketType.Scribble) &&
						(((WorkItem)subQueue[i]).Guid == guid))
					{
						subQueue.RemoveAt(i);
						break;
					}
				}
			}
			data = new BufferChunk(Helpers.ObjectToByteArray(rtds));
			WorkItem wi = new WorkItem(data,PacketType.Scribble,guid);
			wi.DeckGuid = rtds.DeckGuid;
			wi.SlideIndex = rtds.SlideIndex;
			enqueueSub(wi);
		}


		private void enqueueMain(WorkItem wi)
		{
			enqueueMain(wi,null);
		}

		private void enqueueMain(WorkItem wi, RTUpdate rtu)
		{
			lock (mainQueue)
				mainQueue.Add(wi);

			if (wi.Type != "URL")
			{
				if (OnEnqueue != null)
				{
					ScriptEventArgs dea = new ScriptEventArgs(Convert.ToBase64String(wi.BC.Buffer,wi.BC.Index,wi.BC.Length),wi.Type);
					OnEnqueue(this,dea);
				}
			}
		}


		private void enqueueSub(WorkItem wi)
		{
			lock (subQueue)
				subQueue.Add(wi);

			if (wi.Type != "URL")
			{
				if (OnEnqueue != null)
				{
					ScriptEventArgs dea = new ScriptEventArgs(Convert.ToBase64String(wi.BC.Buffer,wi.BC.Index,wi.BC.Length),wi.Type);
					OnEnqueue(this,dea);
					//Debug.WriteLine("ScriptQueue.enqueueSub: " + wi.ToString());
				}
			}		
		}

		#endregion
		#region Dequeuing

		private void dequeueThread()
		{
			int sleepPeriod = 0;
			int dequeueBytes;

			while (true)
			{
				//possibly promote items from sub to main queue
				promoteWorkItems();

				//try to dequeue
				dequeueBytes = dequeueMain();
				if (dequeueBytes == 0)
				{
					dequeueBytes = dequeueSub();
				}
	
				//calculate sleep based on bytes we just dequeued.
				lock (bwUpdateLockObject)
				{
					if (maxBytesPerSecond != 0)
					{
					
						sleepPeriod = Convert.ToInt32(1000.0 * (Convert.ToDouble(dequeueBytes)/Convert.ToDouble(maxBytesPerSecond)));
						//Debug.WriteLine("dequeueBytes="+dequeueBytes.ToString() + " maxPerSec=" + maxBytesPerSecond.ToString() + " sleeping: " + sleepPeriod.ToString());

					}
					if (minDequeuePeriod > sleepPeriod)
						sleepPeriod = minDequeuePeriod;
				}

				Thread.Sleep(sleepPeriod);
			}
		}

		/// <summary>
		/// Move qualified items from subQueue to mainQueue
		/// </summary>
		/// Items to be promoted are:
		/// -Scribble items which are not the most recent scribble item
		/// -Scribble items older than maxScribbleAge
		private void promoteWorkItems()
		{
			bool done,foundScribble;
			int i;
			DateTime now = DateTime.Now;
			lock(subQueue)
			{
				while (true)
				{
					done = true;
					foundScribble = false;
					for (i=subQueue.Count - 1; i>=0; i--)
					{
						if ((((WorkItem)subQueue[i]).OpCode==PacketType.Scribble) ||
                            (((WorkItem)subQueue[i]).OpCode==PacketType.RTImageAnnotation))
						{
							if (foundScribble ||
							   ((now - ((WorkItem)subQueue[i]).TimeStamp) > TimeSpan.FromMilliseconds(maxScribbleAge)))
							{
								done = false;
								break;
							}
							foundScribble = true;
						}

					}
					if (done) break;
					lock(mainQueue)
					{
						mainQueue.Add(subQueue[i]);
					}
					subQueue.RemoveAt(i);
				}
			}
		}

		private void printQueue(ArrayList queue)
		{
			Debug.WriteLine("Print queue length:" + queue.Count.ToString());
			lock (queue)
			{
				foreach (WorkItem wi in queue)
				{
					Console.Write(" Opcode:" + wi.OpCode.ToString());
					Console.Write(" buffer length:" + wi.BC.Length.ToString());
					Debug.WriteLine(" buffer firstbyte:" + ((byte)(wi.BC.Buffer[0])).ToString() );
				}
			}
		}

		/// <summary>
		/// Dequeue the next item in the mainQueue.  If it needs to be fragmented, handle the fragmentation here.
		/// </summary>
		/// <returns>Number of bytes dequeued</returns>
		private int dequeueMain()
		{
			int dequeueBytes = 0;
			WorkItem wi;
			string stype;

			if (mainQueue.Count == 0)
			{
				return 0;
			}

			lock (mainQueue)
			{
				mainQueue.Sort(new WorkItem.WorkItemComparer()); //sort on timestamp
				wi = ((WorkItem)mainQueue[0]);
				mainQueue.RemoveAt(0);
			}

			lock (bwUpdateLockObject) //make sure maxBytesPerSecond doesn't change while we are in this block.
			{

				if (maxBytesPerSecond == 0)
				{
					return 0;
				}
				if (wi.BC.Length <= maxBytesPerSecond)
				{
					dequeueBytes = wi.BC.Length;
					if (wi.Type == "URL")
					{
						String url = baseUrl + wi.DeckGuid.ToString() + "/slide" + (wi.SlideIndex+1).ToString() + "." + extent;
						if (OnSlideTransition != null) OnSlideTransition(url);
						lastUrl = url;
						//Debug.WriteLine("ScriptQueue.dequeueMain: OnSlideTransition" + wi.ToString());
					}
					else
					{

						ScriptEventArgs dea = new ScriptEventArgs(Convert.ToBase64String(wi.BC.Buffer,wi.BC.Index,wi.BC.Length),wi.Type);
						if (OnDequeue != null) OnDequeue(this,dea);

						//Debug.WriteLine("ScriptQueue.dequeueMain: OnDequeue" + wi.ToString());
					}
				} 
				else if (wi.Type != "URL") //if a URL needs to be fragmented, forget about it.
				{
					// send fragments
					while (wi.BC.Length > 0) 
					{
						if (wi.BC.Length > maxBytesPerSecond)
						{
							stype = fragmentType;
							dequeueBytes = maxBytesPerSecond;
						}
						else
						{
							stype = scriptType; // The final fragment is sent with normal script type.
							dequeueBytes = wi.BC.Length;
						}
						BufferChunk nbc = wi.BC.NextBufferChunk(dequeueBytes);
						ScriptEventArgs dea = new ScriptEventArgs(Convert.ToBase64String(nbc.Buffer,nbc.Index,nbc.Length),stype);
						if (OnDequeue != null) OnDequeue(this,dea);
						Debug.WriteLine("ScriptQueue.dequeueMain: OnDequeue (fragment)" + wi.ToString());
						if (wi.BC.Length > 0)
						{
							Thread.Sleep(1000);
						}					
					}
				}
			}
			return dequeueBytes;
		}

		/// <summary>
		/// Dequeue next item from subQueue.
		/// </summary>
		/// <returns>Number of bytes dequeued</returns>
		/// Items in the subQueue which are large enough that they need to be fragmented will be
		/// skipped over.  Those items need to be promoted to the mainQueue before they will be
		/// sent.
		private int dequeueSub()
		{
			int dequeueBytes = 0;
			int i;
			WorkItem wi = null;
			bool foundOne;
			lock (subQueue)
			{
				if (subQueue.Count == 0)
				{
					return 0;
				}

				foundOne = false;
				lock (bwUpdateLockObject)  // make sure maxBytesPerSecond doesn't change while we are in this block.
				{
					for(i=0;i<subQueue.Count;i++)
					{
						if (((WorkItem)subQueue[i]).BC.Length <= maxBytesPerSecond)
						{
							foundOne = true;
							break;
						}
					}
				}
				if (foundOne) 
				{
					wi = ((WorkItem)subQueue[i]);
					dequeueBytes = wi.BC.Length;
					subQueue.RemoveAt(i);
				}
			}
			if (foundOne)
			{
				ScriptEventArgs dea = new ScriptEventArgs(Convert.ToBase64String(wi.BC.Buffer,wi.BC.Index,wi.BC.Length),wi.Type);
				if (OnDequeue != null) OnDequeue(this,dea);
				//Debug.WriteLine("ScriptQueue.dequeueSub: OnDequeue" + wi.ToString());
			}
			return dequeueBytes;
		}

		#endregion
		#region Event

		/// <summary>
		/// Return a fully qualified URL to a presentation deck upon slide transition.
		/// </summary>
		public event slideTransitionHandler OnSlideTransition;
		public delegate void slideTransitionHandler(object url);

		/// <summary>
		/// Return WebViewer compliant presentation data with timing and frame sizes
		/// appropriate for a live Windows Media stream, given
		/// the specified script stream bandwidth.
		/// </summary>
		public event dequeueHandler OnDequeue;
		public delegate void dequeueHandler(object queue, ScriptEventArgs scriptEventArgs);

		/// <summary>
		/// Return WebViewer compliant presentation data in real time.  Use this for archive logging only.
		/// </summary>
		public event enqueueHandler OnEnqueue;
		public delegate void enqueueHandler(object queue, ScriptEventArgs scriptEventArgs);

		#endregion
		#region WorkItem
		/// <summary>
		/// Data for one work item
		/// </summary>
		private class WorkItem : IComparable
		{
			private BufferChunk bc;
			private Byte oc;	//opcode
			private Guid guid;	//Stroke guid.
			private Guid deckguid; //deck guid.
			private int slideindex;
			private DateTime timestamp; //WorkItem creation time for dequeue prioritization.
			private string type;		//CXP2, CXP3, URL ..

			/// <summary>
			/// Constructor for erase slide and erase deck messages.
			/// </summary>
			public WorkItem(BufferChunk bc, Byte oc)
			{	
				Initialize();
				this.bc = new BufferChunk(bc.Length);
				this.bc.Length = bc.Length;
				bc.CopyTo(this.bc,0);
				this.oc = oc;
			}
			
			/// <summary>
			/// Constructor for stroke add and stroke erase messages.
			/// </summary>
			/// The guid identifies the stroke.
			public WorkItem(BufferChunk bc, Byte oc, Guid guid)
			{	
				Initialize();
				this.bc = new BufferChunk(bc.Length);
				this.bc.Length = bc.Length;
				bc.CopyTo(this.bc,0);
				this.oc = oc;
				this.guid= guid;
			}

			/// <summary>
			/// Constructor for PageUpdate and ScrollLayer messages
			/// </summary>
			/// 
			public WorkItem(BufferChunk bc, Byte oc, int slideindex, Guid deckguid)
			{	
				Initialize();
				this.bc = new BufferChunk(bc.Length);
				this.bc.Length = bc.Length;
				//PRI2: bc.CopyTo now verifies this.bc.length.  Note that this is zero because it hasn't been set by the ctr.
				//  how is this supposed to work?  Need to make sure we do this correctly throughout the sln.
				bc.CopyTo(this.bc,0);
				this.oc = oc;
				this.slideindex = slideindex;
				this.deckguid = deckguid;
			}

			/// <summary>
			/// Constructor for URL and CXP2 types
			/// </summary>
			public WorkItem(BufferChunk bc, Byte oc, int slideindex, Guid deckguid, string type)
			{	
				Initialize();
				this.bc = new BufferChunk(bc.Length);
				this.bc.Length = bc.Length;
				bc.CopyTo(this.bc,0);
				this.oc = oc;
				this.slideindex = slideindex;
				this.deckguid = deckguid;
				this.type = type;
			}

			private void Initialize()
			{
				this.bc = null;
				this.oc = 0;
				this.guid= Guid.Empty;
				this.slideindex = 0;
				this.timestamp = DateTime.Now;
				this.type = scriptType; //default to CXP3 for Presenter2.
				this.deckguid = Guid.Empty;
			}
	
			public BufferChunk BC
			{
				get { return this.bc; }
				set { this.bc = value; }
			}
			public Byte OpCode
			{
				get { return this.oc; }
				set { this.oc = value; }
			}

			public Guid Guid
			{
				get { return this.guid; }
				set { this.guid = value; }
			}

			public int SlideIndex
			{
				get { return this.slideindex; }
				set { this.slideindex = value; }
			}
			public DateTime TimeStamp
			{
				get { return this.timestamp; }
				set { this.timestamp = value; }
			}
			public string Type
			{
				get { return this.type; }
				set { this.type = value; }
			}
			
			public Guid DeckGuid
			{
				get { return this.deckguid; }
				set { this.deckguid = value; }
			}
			
			//implement sorting by timestamp
			public int CompareTo(object rh)
			{
				return this.timestamp.CompareTo(((WorkItem)rh).timestamp);
			}

			public class WorkItemComparer: IComparer
			{
				public int Compare(object lh, object rh)
				{
					return ((WorkItem)lh).CompareTo(rh);
				}
			}

			public override String ToString()
			{
				String ret = " " + this.Type + " opcode=" + this.OpCode.ToString() + " length=" + this.BC.Buffer.Length.ToString() + " slideindex=" + this.SlideIndex.ToString() + " deckguid=" + this.DeckGuid.ToString();
				return ret;
			}

		}


		#endregion
		#region Misc
		private enum Priority : int
		{
			low = 0,
			normal = 1,
			high = 2
		}

		private static ushort UnpackShort(BufferChunk bc, int index)
		{
			return (ushort)(256 * bc.Buffer[index + 1] + bc.Buffer[index]);
		}

		private static int UnpackSignedInt(BufferChunk bc, int index)
		{
			uint val = UnpackInt(bc, index);
			int rVal;
			if (val > int.MaxValue)
				rVal = -(int)(~val) - 1;
			else
				rVal = (int)val;

			return rVal;
		}

		// Unpack an int from a buffer chunk
		private static uint UnpackInt(BufferChunk bc, int index)
		{
			uint v0 = bc.Buffer[index];
			uint v1 = bc.Buffer[index + 1];
			uint v2 = bc.Buffer[index + 2];
			uint v3 = bc.Buffer[index + 3];
			uint rVal = (v3 << 24) + (v2 << 16) + (v1 << 8) + v0;
			return rVal;
		}
		#endregion
	}

    #region ScriptEventArgs
    /// <summary>
	/// Contains two strings representing the type and payload of a Windows Media Script Command.
	/// </summary>
	public class ScriptEventArgs : EventArgs
	{
		public ScriptEventArgs(string data, string type)
		{
			this.type = type;
			this.data = data;
		}
		public readonly string type;
		public readonly string data;
	}
    #endregion ScriptEventArgs
    #region PacketType
    // Type information for RTP messages
    public class PacketType {
        public const byte SlideIndex = 1;
        public const byte Slide = 2;
        public const byte Scribble = 3;
        public const byte RequestAllSlides = 4;
        public const byte NoOp = 5;
        public const byte Comment = 6;
        public const byte Highlight = 7;
        public const byte Pointer = 8;
        public const byte Scroll = 9;
        public const byte ClearAnnotations = 10;
        public const byte ResetSlides = 11;
        public const byte RequestSlide = 12;
        public const byte ScreenConfiguration = 13;
        public const byte ClearSlide = 14;
        public const byte Beacon = 15;
        public const byte ScribbleDelete = 16;
        public const byte TransferToken = 17;
        public const byte ID = 18;
        public const byte ClearScribble = 19;
        public const byte RequestMissingSlides = 20;
        public const byte DummySlide = 21;				// Empty slides for debugging


        //Presenter2.0 only
        public const byte BackgroundColor = 22;
        public const byte RTUpdate = 23;

        //Presenter 3
        public const byte RTTextAnnotation = 24;
        public const byte RTDeleteTextAnnotation = 25;
        public const byte RTQuickPoll = 26;
        public const byte RTImageAnnotation = 27;
    }
    #endregion PacketType
    #region BeaconPacket
    public class ViewerFormControl {
        /// <summary>
        /// The currently role of the application. Presenter is the distinguished
        /// display which serves the slides. Viewer is any of the (possibly many) 
        /// displays that follow the presenter but belong to a single individual 
        /// (or at least to a "public" screen). Shared is any of the (possibly many)
        /// displays that follow the presenter and are publicly broadcast to the
        /// class.
        /// </summary>
        public enum RoleType { Presenter, Viewer, SharedDisplay }
    }

    /// <summary>
    /// Beacon Packets are used to announce status of viewers and presenters.
    /// </summary>
    [Serializable]
    public class BeaconPacket {
        private string name;
        public string Name {
            get { return name; }
        }

        private string friendlyName;
        public string FriendlyName {
            get { return friendlyName; }
        }

        private ViewerFormControl.RoleType role;
        public ViewerFormControl.RoleType Role {
            get { return role; }
        }

        private DateTime time;
        public DateTime Time {
            get { return time; }
        }

        private bool alive = true;
        public bool Alive {
            get { return alive; }
            set { alive = value; }
        }

        private int id;
        public int ID {
            get { return id; }
        }

        private System.Drawing.Color bgColor;
        public System.Drawing.Color BGColor {
            get { return bgColor; }
        }

        public BeaconPacket(string name, int id, string friendlyName, ViewerFormControl.RoleType role, DateTime time, System.Drawing.Color bgColor) {
            this.name = name;
            this.id = id;
            this.friendlyName = friendlyName;
            this.role = role;
            this.time = time;
            this.bgColor = bgColor;
        }
    }
#endregion BeaconPacket
}

