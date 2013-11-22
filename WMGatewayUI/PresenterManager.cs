using System;
using MSR.LST.Net.Rtp;
using MSR.LST;
using System.Threading;
using System.Net;
using System.Collections;
using System.Windows.Forms;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;
using Microsoft.Win32;
using System.Diagnostics;
using CP3 = UW.ClassroomPresenter;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Handle Presenter listen threads, presenter data logging.
	/// One instance of this class exists for the duration of the app.
	/// RtpManager creates and disposes the Presenter listener. 
	/// subscribe to RtpManager events to find out when Presentation streams come and go.
	///	
	///	PRI2:  Should track presenters by cname not ssrc.  This will allow changing venues
	///	while keeping the same instructor selected.
	/// </summary>
	public class PresenterManager
	{
		#region Declarations
		private ScriptQueue		scriptQueue;		//the class that handles script commands
		private BeaconPacketSet livenessMonitor;	//For Presenter liveness beacon
		private TimeSpan		BeaconTimeout;		// ..
		private Thread			maintenanceThread;		// ..
		private ArrayList		presenterListenThreads = null; //list of active presenter listen threads.
		private uint			currentPresenterSSRC=0; //Currently active presenter SSRC.
		private DateTime		LastSlideTime;
		private int				DefaultScriptBitrate;
		private int				scriptCount;
		private StreamWriter	PPTLogStreamWriter = null; //A separate log file for PPT slide transitions.
		private StreamWriter	ScriptLogStreamWriter = null; //log file for CXP scripts
		private MainForm		mainform;
		private String baseURL;
		private String imageExtent;
		RtpManager	rtpManager;
		private bool StopListeningNow;
		private EventLog eventLog;
		#endregion
		#region Properties
		private bool log_slides;
		public bool LogSlides
		{
			get {return log_slides;}
		}

		private bool log_scripts;
		public bool LogScripts
		{
			get {return log_scripts;}
		}

		private UWVenue presenterVenue;
		public UWVenue PresenterVenue
		{
			get {return presenterVenue;}
		}

		private bool presenterEnabled;
		public bool PresenterEnabled
		{
			get {return presenterEnabled;}
		}

		private bool scriptEventsEnabled;
		/// <summary>
		/// Indicates whether or not SendRawScript and SendUrlScript events should be raised.
		/// </summary>
		public bool ScriptEventsEnabled
		{
			get {return scriptEventsEnabled;}
			set {scriptEventsEnabled = value;}
		}

		/// <summary>
		/// Configure with the bits per second which the current WM Profile can accept.
		/// This should be configured after the call to SetPresenterIntegration, but  before 
		/// ScriptEventsEnabled is set to true.  If PresenterEnabled is false, this 
		/// will be ignored.  It can be changed at any time.
		/// </summary>
		public int ScriptBitrate
		{
			get 
			{
				if (scriptQueue != null)
				{
					return scriptQueue.ScriptBitrate;
				}	
				return 0;
			}

			set
			{
				if (scriptQueue != null)
				{
					scriptQueue.ScriptBitrate = value;
				}			
			}
		}

		/// <summary>
		/// Name of the presenter node currently being listened to.
		/// </summary>
		public string CurrentInstructorCname
		{
			get
			{
				Hashtable ht = rtpManager.GetPresenterStreams();
				if ((ht != null) && (ht.ContainsKey(currentPresenterSSRC)))
				{
					return (String)ht[currentPresenterSSRC];
				}
				return "none";
			}
		}

		#endregion
		#region Constructor

		public PresenterManager(RtpManager rtpMgr, MainForm mainform)
		{
			eventLog = new EventLog("WMG",".","WMGCore");
			this.mainform = mainform;
			rtpManager = rtpMgr;
			rtpManager.OnPresentationStreamAdded += new RtpManager.PresentationStreamAddedHandler(PresentationStreamAdded);
			rtpManager.OnPresentationStreamRemoved += new RtpManager.PresentationStreamRemovedHandler(PresentationStreamRemoved);

			RestoreConfig();

			BeaconTimeout = new TimeSpan(0,0,10);
			livenessMonitor = new BeaconPacketSet();
			maintenanceThread = null;
			LastSlideTime = DateTime.Now;
			scriptQueue = null;
			presenterListenThreads = new ArrayList();
			StopListeningNow = false;
			DefaultScriptBitrate = 10000;

			StartMaintenanceThread();

			// Set initial state of presenter integration, 
			// start the presenter listener, if appropriate.
			SetInitialPresenterState();			
		}

		public void Dispose()
		{
			if (maintenanceThread != null)
			{
				maintenanceThread.Abort();
				maintenanceThread = null;
			}

			AbortListenerWorkers();
			stopScriptQueue();
			ClosePPTLogFile();
			CloseScriptLogFile();
			SaveConfig();
		}

		#endregion
		#region Events

		/// <summary>
		/// Indicate to the UI the count of presenters on-line
		/// </summary>
		public event presenterSourceUpdateHandler OnPresenterSourceUpdate;
		public delegate void presenterSourceUpdateHandler(NumericEventArgs ea);
		
		/// <summary>
		/// Indicate to the UI the count of Presentation frames received.
		/// </summary>
		public event presenterFrameCountUpdateHandler OnPresenterFrameCountUpdate;
		public delegate void presenterFrameCountUpdateHandler(NumericEventArgs ea);

		/// <summary>
		/// Custom Base64 encoded message ready to be delivered to the encoder.
		/// </summary>
		public event sendRawScriptHandler OnSendRawScript;
		public delegate void sendRawScriptHandler(ScriptEventArgs ea);

		/// <summary>
		/// Standard URL script command ready to be delivered to the encoder.
		/// </summary>
		public event sendUrlScriptHandler OnSendUrlScript;
		public delegate void sendUrlScriptHandler(ScriptEventArgs ea);

		#endregion
		#region Private Methods

		//Store parts of the current config so that it can be reloaded next time.
		private void SaveConfig()
		{
			try
			{
				RegistryKey BaseKey = Registry.CurrentUser.OpenSubKey("Software\\UWCSE\\WMGateway", true);
				if ( BaseKey == null) 
				{
					BaseKey = Registry.CurrentUser.CreateSubKey("Software\\UWCSE\\WMGateway");
				}
				BaseKey.SetValue("PresenterMode",presenterEnabled);
				BaseKey.SetValue("PresenterPort",presenterVenue.IpEndpoint.Port.ToString());
				BaseKey.SetValue("PresenterVenueName",presenterVenue.Name);
				BaseKey.SetValue("PresenterIP",presenterVenue.IpEndpoint.Address.ToString());
				BaseKey.SetValue("BaseURL",baseURL);
				BaseKey.SetValue("ImageExtent",imageExtent);
				BaseKey.SetValue("LogSlides",log_slides);
				BaseKey.SetValue("LogScripts", log_scripts);
			}
			catch
			{
				MessageBox.Show("Exception while saving configuration.");
			}
		}


		// Restore the user's last configuration from the registry.
		private void RestoreConfig()
		{
			// First set defaults
			presenterEnabled = false;  //presenter integration 
			String presenterAddr = "234.5.5.5"; //A default venue
			String presenterPort = "5004";
			String presenterVenueName = "Local Default";
			presenterVenue = new UWVenue(presenterVenueName,new IPEndPoint(IPAddress.Parse(presenterAddr),Convert.ToInt32(presenterPort)));
			baseURL = "http://slide/location/";
			imageExtent = "jpg";
			log_slides = false;
			log_scripts = false;

			// now get the previously configured values here, if any:			
			try
			{
				RegistryKey BaseKey = Registry.CurrentUser.OpenSubKey("Software\\UWCSE\\WMGateway", true);
				if ( BaseKey == null) 
				{ //no configuration yet.. first run.
					//logger.Write("No registry configuration found.");
					return;
				}

				presenterEnabled = Convert.ToBoolean(BaseKey.GetValue("PresenterMode", presenterEnabled));
				presenterAddr = Convert.ToString(BaseKey.GetValue("PresenterIP", presenterAddr));
				presenterPort = Convert.ToString(BaseKey.GetValue("PresenterPort", presenterPort));
				presenterVenueName = Convert.ToString(BaseKey.GetValue("PresenterVenueName", presenterVenueName));
				baseURL = Convert.ToString(BaseKey.GetValue("BaseURL", baseURL));
				imageExtent = Convert.ToString(BaseKey.GetValue("ImageExtent", imageExtent));
				log_slides = Convert.ToBoolean(BaseKey.GetValue("LogSlides",log_slides));
				log_scripts = Convert.ToBoolean(BaseKey.GetValue("LogScripts",log_scripts));
			}
			catch(Exception e)
			{
				eventLog.WriteEntry("Failed to restore Presenter configuration: " + e.ToString(), EventLogEntryType.Error, 1003);
			}
			presenterVenue = new UWVenue(presenterVenueName,new IPEndPoint(IPAddress.Parse(presenterAddr),Convert.ToInt32(presenterPort)));
		}

		private void PresentationStreamAdded(RtpEvents.RtpStreamEventArgs ea)
		{
			Thread thread = CreateTheListeningThread(new ListeningThreadMethod(ListenerWorker), ea.RtpStream);
			thread.IsBackground = true;
			thread.Name = "Presenter ListenerWorker";
			thread.Start();
			presenterListenThreads.Add(new ListenerThreadData(ea.RtpStream,thread));
		}

		/// <summary>
		/// Presenter left the venue.  Note that this is not raised if the listener was terminated.
		/// </summary>
		/// <param name="ea"></param>
		private void PresentationStreamRemoved(RtpEvents.RtpStreamEventArgs ea)
		{
			Debug.WriteLine("PresentatinStreamRemoved: " + ea.RtpStream.SSRC.ToString());
			if (ea.RtpStream.SSRC == currentPresenterSSRC)
				currentPresenterSSRC=0;
		}
	
		/// <summary>
		/// Bring listen threads back in sync with streams known to listener.
		/// </summary>
		/// It *shouldn't* ever be necessary to do this.
		private void RefreshThreads()
		{
			AbortListenerWorkers(); //abort threads and unsubscribe.
			rtpManager.AddPresenterStreams(); //Have RtpManager raise Presenter streamadded events again.
		}


		/// <summary>
		/// Discover which presenter source should be initially selected in the combobox.
		/// </summary>
		/// <param name="cb"></param>
		private void SetDefaultPresenterSSRC(ComboBox cb)
		{
			if (cb.Items.Count == 0)
				return;

			int i = 0;
			foreach (SSRCItem si in cb.Items)
			{
				if (si.SSRC==currentPresenterSSRC)
					break;
				i++;
			}

			if (i < cb.Items.Count)
			{
				cb.SelectedIndex = i;
			} 
			else  //Didn't find a default, so use zero.
			{
				cb.SelectedIndex = 0;
			}
		}
	

		/// <summary>
		/// Start initial listener upon app launch, if enabled.
		/// </summary>
		private void SetInitialPresenterState()
		{
			if (presenterEnabled)
			{
				if (!rtpManager.StartListener(presenterVenue,false))
				{
					//PRI2: Failed to start RtpSession.  Tell the user?
				}
				if (log_slides)
				{
					CreateOpenPPTLogFile();
				}
				if (log_scripts)
				{
					CreateOpenScriptLogFile();
				}
				startScriptQueue(DefaultScriptBitrate);
			}
		}


		/// <summary>
		/// Thread proc for presenter listening.  This happens when onStreamAdded event occurs with the presenter payload.
		/// </summary>
		/// <param name="rtpStream"></param>
		private void ListenerWorker(RtpStream rtpStream)
		{
			eventLog.WriteEntry("ListenerWorker starting: " + rtpStream.Properties.CName + 
				" " + rtpStream.PayloadType.ToString() + " " + rtpStream.SSRC.ToString() );
			try
			{
				//rtpStream.Subscribe();
				presenterListen(rtpStream);
			}
			catch (Exception e)
			{
				eventLog.WriteEntry("Exception in ListenerWorker for " + rtpStream.Properties.CName + 
					" " + rtpStream.PayloadType.ToString() + " " + rtpStream.SSRC.ToString() + ":" + e.ToString(),EventLogEntryType.Warning );
			}
			eventLog.WriteEntry("ListenerWorker ending for SSRC: " + rtpStream.Properties.CName + 
				" " + rtpStream.PayloadType.ToString() + " " + rtpStream.SSRC.ToString() );
		}

		/// <summary>
		/// Abort presenter listener threads and unsubscribe from the corresponding streams.
		/// </summary>
		private void AbortListenerWorkers()
		{
			StopListeningNow = true; //first ask nicely.
			int i = 0;
			lock(presenterListenThreads)
			{
				foreach(object o in presenterListenThreads)
				{
					ListenerThreadData thisThread = (ListenerThreadData)o;
					while (thisThread.ListenerThread.IsAlive)
					{
						Thread.Sleep(10);
						i++;
						if (i>1000)
							break;					
					}
					Debug.WriteLine("Aborting threads, i="+i.ToString());
					if (thisThread.ListenerThread.IsAlive)
					{
						Debug.WriteLine("Thread wouldn't die, aborting.");
						thisThread.ListenerThread.Abort();//be more forceful.
					}
					try
					{
						//thisThread.Stream.Unsubscribe();
					}
					catch (Exception e)
					{
						Debug.WriteLine("AbortListenerWorkers: Exception while unsubscribing: " + e.ToString());
					}
					thisThread.aborted = true;

				}
				presenterListenThreads.Clear();
			}
			StopListeningNow = false;
		}


		/// <summary>
		/// Verify the Presenter listener thread for the given SSRC
		/// </summary>
		/// <param name="ssrc"></param>
		/// <returns></returns>
		private bool VerifyListenerSSRC(uint ssrc)
		{
			lock(presenterListenThreads)
			{
				foreach(object o in presenterListenThreads)
				{
					ListenerThreadData data = (ListenerThreadData)o;
					if (!data.aborted)
					{
						if (data.ListenerThread.IsAlive) 
						{
							if (data.Stream.SSRC == ssrc)
							{
								return true;
							}
						}
					}
				}
			}
			return false;
		}


		// This business with the delegate and the arguments class is necessary to
		// pass an argument to the thread.. 
		private delegate void ListeningThreadMethod(RtpStream rtpStream);
		private class ListeningMethodArguements 
		{
			public RtpStream rtpStream;
			public ListeningThreadMethod threadMethod;

			public ListeningMethodArguements(ListeningThreadMethod threadMethod, RtpStream rtpStream)
			{
				this.threadMethod = threadMethod;
				this.rtpStream = rtpStream; 
			}

			public void CallThreadMethod()
			{
				threadMethod(rtpStream);
			}
		}

		private static Thread CreateTheListeningThread(ListeningThreadMethod start, RtpStream rtpStream)
		{
			ListeningMethodArguements args = new ListeningMethodArguements(start, rtpStream);
			Thread t = new Thread(new ThreadStart(args.CallThreadMethod));
			t.IsBackground = true;
			return t;
		}

		/// <summary>
		/// Receive Presenter data
		/// </summary>
		/// Note: we catch a timeout exception when the presenter Listener is terminated.  This
		/// causes the thread to terminate as well.
		/// <param name="rtpStream"></param>
		private void presenterListen(RtpStream rtpStream)
		{
			BufferChunk bc;
			rtpStream.IsUsingNextFrame = true;
			while (true) 
			{
				try 
				{
					bc = rtpStream.NextFrame();
				}
				catch(Exception e)
				{
					Debug.WriteLine("Presenter Listen Thread ending:" + e.ToString());
					break;
				}

				if (StopListeningNow)
				{
					Debug.WriteLine("Presenter listen thread has been asked to terminate.");
					break;
				}

				try 
				{
					presenterRTNavReceive(bc,rtpStream.SSRC); //Presenter 2.0
				}
				catch (Exception e)
				{
					Debug.WriteLine("Exception receiving Presenter data:" + e.ToString());
				}

			}
		}

		private void startScriptQueue(int bitrate)
		{
			if (scriptQueue != null)
			{
				scriptQueue.Dispose();
				scriptQueue = null;
			}

			scriptQueue = new ScriptQueue(100,bitrate,baseURL,imageExtent);
			scriptQueue.OnDequeue += new ScriptQueue.dequeueHandler(ScriptDequeueHandler);
			scriptQueue.OnEnqueue += new ScriptQueue.enqueueHandler(ScriptEnqueueHandler);
			scriptQueue.OnSlideTransition += new ScriptQueue.slideTransitionHandler(ScriptSlideTransitionHandler);
		}

		private void stopScriptQueue()
		{
			if (scriptQueue != null)
			{
				scriptQueue.Dispose();
				scriptQueue = null;
			}
		}


		/// <summary>
		/// Handles the main scriptqueue's dequeue event.  Send the data to the encoder.
		/// </summary>
		/// <param name="queue"></param>
		/// <param name="dea"></param>
		private void ScriptDequeueHandler(object queue, ScriptEventArgs sea)
		{
			if (scriptEventsEnabled)
			{
				//Debug.WriteLine("PresenterManager.ScriptDequeueHandler type=" + sea.type);
				if (OnSendRawScript != null)
				{
					OnSendRawScript(sea);
				}
			}
		}

		/// <summary>
		/// Log WebViewer compliant presentation archive
		/// </summary>
		/// <param name="queue"></param>
		/// <param name="dea"></param>
		private void ScriptEnqueueHandler(object queue, ScriptEventArgs dea)
		{
			ScriptLogFileWrite(dea.type, dea.data);
		}


		/// <summary>
		/// Handles the ScriptQueue OnSlideTransition event.  Send a URL script type to the encoder.
		/// </summary>
		/// <param name="url"></param>
		private void ScriptSlideTransitionHandler(Object url)
		{
			PPTLogFileWrite(url.ToString());

			if (scriptEventsEnabled)
			{
				//Debug.WriteLine("PresenterManager.ScriptSlideTransitionHandler url=" + (String)url);

				if (OnSendUrlScript != null)
				{
					ScriptEventArgs sea = new ScriptEventArgs((String)url,"URL");
					OnSendUrlScript(sea);
				}
			}
		}



		/// <summary>
		/// receive frame from Presenter 3
		/// </summary>
		/// <param name="bc"></param>
		/// <param name="ssrc"></param>
		private void presenterRTNavReceive(BufferChunk bc, uint ssrc)
		{

			BinaryFormatter bf = new BinaryFormatter();
			Object obj = null;
			try 
			{
				MemoryStream ms = new MemoryStream((byte[]) bc);
				obj = bf.Deserialize(ms);

				//Debug.WriteLine("presenterRTNavReceive deserialized bc Size=" + bc.Length.ToString());

				//The BeaconPacket is used to allow us to latch on to a presenter if we are not 
				//currently listeneing to anyone, and to update the active presenters count
				//on the main form.  Beacon packet also contains the background color, so we will
				//send it to scriptQueue as well.
                if (obj is CP3.Network.Chunking.Chunk) {
                    string friendlyName;
                    int role = CP3Manager.CP3Manager.AnalyzeChunk((CP3.Network.Chunking.Chunk)obj, out friendlyName);
                    if (1 == role) {
                        BeaconPacket bp = new BeaconPacket(ssrc.ToString(),(int)ssrc, ssrc.ToString(), 
                            ViewerFormControl.RoleType.Presenter,
                            DateTime.Now, System.Drawing.Color.White);
                        ReceiveBeacon(bp, ssrc);
                    }                    
                }
			}
			catch (Exception e)
			{
				Debug.WriteLine("PresenterRTNavReceive exception deserializing message. size=" + bc.Length.ToString() +
					" exception=" + e.ToString());
				//eventLog.WriteEntry(e.Message );
				return;
			}

			if (ssrc != currentPresenterSSRC) // not from the currently selected ssrc
				return;

			if (scriptQueue != null)
				scriptQueue.Enqueue(obj);

			scriptCount++;//this is not quite right because not all frames result in scripts. 
			
		}


		private void ReceiveBeacon(BeaconPacket bp, uint thisSSRC)
		{
			DateTime dt = DateTime.Now;
			livenessMonitor.Add(bp, dt);

			if ((bp.Role == ViewerFormControl.RoleType.Presenter) && (currentPresenterSSRC==0))
			{
				currentPresenterSSRC = thisSSRC;
			}

			// This happens if a presenter we're listening to changes roles.
			if ((bp.Role != ViewerFormControl.RoleType.Presenter) && (currentPresenterSSRC == thisSSRC))
			{
				currentPresenterSSRC = 0;
			}
		}

		/// <summary>
		/// Make some UI updates to show current status
		/// </summary>
		private void MaintenanceThread()
		{
			DateTime cutoffTime;
			int presenters, last;
			last = -1;
			while (true) 
			{
				Thread.Sleep((int)(2 * 1000));
				cutoffTime = DateTime.Now - BeaconTimeout;
				presenters = livenessMonitor.LivePresenters(cutoffTime);
				//Debug.WriteLine("ReportBeacon: presenters="+presenters.ToString());
				if ((presenters != last) && (OnPresenterSourceUpdate != null))
				{
					last = presenters;
					OnPresenterSourceUpdate(new NumericEventArgs(presenters));
				}
				UpdateScriptCount(scriptCount);
			}
		}


		// Log slide transitions to a special file
		private void CreateOpenPPTLogFile() 
		{
			string fileName = "ppt_log.txt";
         
			PPTLogStreamWriter = null;

			FileStream PPTLogFileStream = new FileStream(fileName,
				FileMode.Append, FileAccess.Write, FileShare.None);
         
			PPTLogStreamWriter = new StreamWriter(PPTLogFileStream);
			PPTLogStreamWriter.WriteLine("Starting. " + DateTime.Now.ToString());
		}

		private void ClosePPTLogFile()
		{
			if (PPTLogStreamWriter != null)
			{
				PPTLogStreamWriter.Flush();
				PPTLogStreamWriter.Close();
				PPTLogStreamWriter = null;
			}
		}

		private void FlushPPTLogFile()
		{
			if (PPTLogStreamWriter != null)
			{
				PPTLogStreamWriter.Flush();
			}
		}

		private void PPTLogFileWrite(String s)
		{
			// format for slide transition is  "HH:mm:ss Slide N"
			s = DateTime.Now.ToString("HH:mm:ss") + " " + s;
			
			if (PPTLogStreamWriter != null) 
			{
				PPTLogStreamWriter.WriteLine(s);
				//LoggerWriteInvoke ("Logging slide transition.");
			}
		}

		// Log for detailed presenter data
		private void CreateOpenScriptLogFile() 
		{
			string fileName = "script_log.xml";
         
			ScriptLogStreamWriter = null;

			FileStream ScriptLogFileStream = new FileStream(fileName,
				FileMode.Append, FileAccess.Write, FileShare.None);
         
			ScriptLogStreamWriter = new StreamWriter(ScriptLogFileStream);
			ScriptLogStreamWriter.WriteLine("<?xml version=\"1.0\"?> ");
			ScriptLogStreamWriter.WriteLine("<!-- Application Starting. " + DateTime.Now.ToString() + " -->");
			ScriptLogStreamWriter.WriteLine("<WMBasicEdit > ");
			ScriptLogStreamWriter.WriteLine("<RemoveAllScripts /> ");
			ScriptLogStreamWriter.WriteLine("<ScriptOffset Start=\"" + DateTime.Now.ToString("M/d/yyyy HH:mm:ss.ff") + "\" /> ");
			ScriptLogStreamWriter.WriteLine("<Options NoAutoTOC=\"false\" PreferredWebViewerVersion=\"1.9.0.0\" /> ");
			ScriptLogStreamWriter.WriteLine("<Slides BaseURL=\"" + baseURL + "\" Extent=\"" + imageExtent + "\" />");
		}


		private void CloseScriptLogFile()
		{
			if (ScriptLogStreamWriter != null)
			{
				ScriptLogStreamWriter.WriteLine( "</WMBasicEdit> ");
				ScriptLogStreamWriter.Flush();
				ScriptLogStreamWriter.Close();
				ScriptLogStreamWriter = null;
			}
		}

		private void FlushScriptLogFile()
		{
			if (ScriptLogStreamWriter != null)
			{
				ScriptLogStreamWriter.Flush();
			}
		}

		private void ScriptLogFileWrite(string type, string cmd)
		{
			// format for slide transition is  "HH:mm:ss Slide N"
			string t = DateTime.Now.ToString("M/d/yyyy HH:mm:ss.ff");
			
			if (ScriptLogStreamWriter != null) 
			{
				lock (ScriptLogStreamWriter)
					ScriptLogStreamWriter.WriteLine("<Script Time=\"" + t + "\" Type=\"" + type + 
						"\" Command=\"" + cmd + "\" />");
			}
		}


		private void OnPrintSlideTitles(object text)
		{
			if (ScriptLogStreamWriter != null) 
			{
				lock (ScriptLogStreamWriter)
					ScriptLogStreamWriter.Write((String)text);
			}

		}

		
		private void UpdateScriptCount(int cnt)
		{
			if (OnPresenterFrameCountUpdate != null)
				OnPresenterFrameCountUpdate(new NumericEventArgs(cnt));
		}




		private void StartMaintenanceThread()
		{
			if (maintenanceThread == null) 
			{
				// this just keeps the beacon statistics reporting up to date
				maintenanceThread = new Thread( new ThreadStart(MaintenanceThread));
				maintenanceThread.IsBackground = true;
				maintenanceThread.Start();
			}
		}

		#endregion
		#region Public Methods

        /// <summary>
        /// Show the config form
        /// </summary>
        /// <returns></returns>
		public UWVenue ConfigPresenter()
		{
			UWVenue ret = null;
			String myAddr = presenterVenue.IpEndpoint.Address.ToString();
			String myPort = presenterVenue.IpEndpoint.Port.ToString();
			PConfigForm frmConfig = new PConfigForm();	
			frmConfig.txtAddr.Text = myAddr;
			frmConfig.txtPort.Text = myPort;
			frmConfig.txtBaseURL.Text = baseURL;
			frmConfig.txtExtent.Text = imageExtent;
			frmConfig.checkBoxPILog.Checked = log_slides;
			frmConfig.checkBoxSLog.Checked = log_scripts;

			if (frmConfig.ShowDialog(mainform) == DialogResult.OK ) 
			{
				if (log_slides != frmConfig.checkBoxPILog.Checked)
				{
					log_slides = frmConfig.checkBoxPILog.Checked;
					if (log_slides) // turn on slide transition logging
					{
						CreateOpenPPTLogFile();
					} 
					else //turn off logging
					{
						ClosePPTLogFile();
					}
				}
				if (log_scripts != frmConfig.checkBoxSLog.Checked)
				{
					log_scripts = frmConfig.checkBoxSLog.Checked;
					if (log_scripts) // turn on script logging
					{
						CreateOpenScriptLogFile();
					} 
					else //turn off logging
					{
						CloseScriptLogFile();
					}
				}
				if (baseURL != frmConfig.txtBaseURL.Text) 
				{
					// If the user didn't include a trailing '/', add it.
					baseURL = frmConfig.txtBaseURL.Text;
					if (!baseURL.EndsWith("/"))
					{
						baseURL = baseURL + "/";
					}
					if (scriptQueue != null)
						scriptQueue.BaseUrl = baseURL;
					//logger.Write("Set BaseURL to: " + baseURL);
				}
				imageExtent = frmConfig.txtExtent.Text;
				//If the user entered with a leading ".", remove it.
				char [] ca = {'.'};
				imageExtent = imageExtent.TrimStart(ca);
				if (scriptQueue != null)
					scriptQueue.Extent = imageExtent;

				if ((myAddr != frmConfig.txtAddr.Text) ||
					(myPort != frmConfig.txtPort.Text))
				{
					myAddr = frmConfig.txtAddr.Text;
					myPort = frmConfig.txtPort.Text;
					//Note: these inputs are validated in the form.
					ret = new UWVenue("Custom Venue",new IPEndPoint(IPAddress.Parse(myAddr),Convert.ToInt32(myPort)));
				}
				//showLoggingStatus(true);
			}
			frmConfig.Dispose();
			return ret;
		}

		/// <summary>
		/// Enable or disable Presenter Integration. Called when the 
		/// checkbox state is changed.
		/// </summary>
		/// <param name="enable"></param>
		public void SetPresenterIntegration(bool enable)
		{
			if (enable == presenterEnabled)
				return;

			presenterEnabled = enable;
			if (enable)
			{
				if (!rtpManager.StartListener(presenterVenue,false))
				{
					//PRI2: failed to start RtpSession.  Tell the user?
				}
				if (log_slides)
				{
					CreateOpenPPTLogFile();
				}
				if (log_scripts)
				{
					CreateOpenScriptLogFile();
				}
				startScriptQueue(DefaultScriptBitrate);
			}
			else
			{
				AbortListenerWorkers(); 
				rtpManager.StopListener(false);
				stopScriptQueue();
				ClosePPTLogFile();
				CloseScriptLogFile(); // this can take a long time when the file is big
			}
		}

		/// <summary>
		/// Restart Presenter listeners and threads in a new venue.  Called when the Presenter 
		/// venue combo selection is changed, or when a custom venue is specified.
		/// </summary>
		/// <param name="venue"></param>
		public bool ChangeVenue(UWVenue venue)
		{
			if ((!presenterEnabled) || (venue==null) || (presenterVenue.Equals(venue)))
				return false;

			presenterVenue = venue;

			AbortListenerWorkers(); 

			//Restart listener
			if (!rtpManager.ChangeVenue(venue,false))
			{
				return false;
			}

			//Reset so that we can pick up a new instructor node in the new venue:
			currentPresenterSSRC = 0;  
			return true;
		}

		/// <summary>
		/// Allow the user to select the Presentation source
		/// </summary>
		public void SelectPresenter()
		{
			PSelectSSRC frmSelectSSRC = new PSelectSSRC();	

			Hashtable streams = rtpManager.GetPresenterStreams();

			if (streams != null)
			{
				frmSelectSSRC.comboPSource.Items.Clear();
				foreach(uint ssrc in streams.Keys)
				{
					//PRI2: filter out those that are known to be student or public nodes
                    //PRI2: CP3 cname is a Guid. Can we at least get the IP address too?
					frmSelectSSRC.comboPSource.Items.Add(new SSRCItem(ssrc,(String)streams[ssrc]));
				}
				SetDefaultPresenterSSRC(frmSelectSSRC.comboPSource);
			}

			if (frmSelectSSRC.ShowDialog(mainform) == DialogResult.OK ) 
			{
				//Debug.WriteLine("SSRC selected index: " + frmSelectSSRC.comboPSource.SelectedIndex.ToString());
				//Debug.WriteLine("old presenter ssrc: " + currentPresenterSSRC.ToString());
				if (frmSelectSSRC.comboPSource.Items.Count > 0)
				{
					currentPresenterSSRC = ((SSRCItem)frmSelectSSRC.comboPSource.SelectedItem).SSRC;
					// verify the thread on this ssrc didn't timeout
					if (!VerifyListenerSSRC(currentPresenterSSRC))
						RefreshThreads();
					//logger.Write("Presenter selected: " + ((SSRCItem)frmSelectSSRC.comboPSource.SelectedItem).ToString());
				}
				//Debug.WriteLine("new presenter ssrc: " + currentPresenterSSRC.ToString());
			}
			frmSelectSSRC.Dispose();
		}

		/// <summary>
		/// Write the encoding start time into the script log as a comment.
		/// This is just an aid to post-production.
		/// </summary>
		/// <param name="type"></param>
		/// <param name="cmd"></param>
		public void ScriptLogWriteStartEncoding()
		{
			if (ScriptLogStreamWriter != null) 
			{
				ScriptLogStreamWriter.WriteLine("<!-- Start Encoding. " + DateTime.Now.ToString("M/d/yyyy HH:mm:ss.ff") + " -->");
			}
		}

		#endregion
		#region Utility Classes
		/// <summary>
		/// Encapsulate some basic bits about the presenter sources for use in
		/// the combo box.  
		/// </summary>
		private class SSRCItem
		{
			private uint m_ssrc;
			private string m_cname;

			public uint SSRC
			{	
				get
				{
					return m_ssrc;
				}
				set
				{
					m_ssrc = value;
				}
			}

			public string Cname
			{	
				get
				{
					return m_cname;
				}
				set
				{
					m_cname = value;
				}
			}
			public SSRCItem(uint ssrc, String cname)
			{
				m_ssrc = ssrc;
				m_cname = cname;
			}

			// the override is necessary to make the comboBox show the string we want.
			public override string ToString()
			{
				return m_cname;
			}
		}

		/// <summary>
		/// Encapsulate some bits about the listen threads.
		/// </summary>
		private class ListenerThreadData
		{
			public RtpStream Stream;
			public Thread ListenerThread;
			public bool aborted;
			public ListenerThreadData(RtpStream stream, Thread thread)
			{
				Stream = stream;
				ListenerThread = thread;
				aborted = false;
			}
		}

		#endregion
	}
}
