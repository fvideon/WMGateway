using System;
using System.Collections;
using System.Net;
using MSR.LST.Net.Rtp;
using System.Threading;
using System.Diagnostics;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Handle conference listeners, RTP event handlers, SSRC's, CNames, etc.
	/// </summary>
	/// When streams are added, raise events
	/// and let the UI change the list box contents.
	/// An instance is created once when the app starts. 
	/// Handle listeners for both conferencing and Presenter
	public class RtpManager
	{
		#region Properties
		/// <summary>
		/// Returns the currently encoding video sources.  Key is cname, value is RtpStream. 
		/// There should be one of them in most cases.  Probably never more.
		/// </summary>
		public Hashtable EncodingVideoSsrcs
		{
			get {return vssrcs.GetRunningSetSSRCs();}
		}

		/// <summary>
		/// Returns the set of encoding audio sources.  Key is cname, value is RtpStream.
		/// </summary>
		public Hashtable EncodingAudioSsrcs
		{
			get {return assrcs.GetRunningSetSSRCs();}
		}

		//Reflector 
		private bool reflectorEnabled = false;
		public bool ReflectorEnabled 
		{
			get { return this.reflectorEnabled; } 
			set { this.reflectorEnabled = value; }
		}

		private string reflectorAddress = "";
		public string ReflectorAddress 
		{
			get { return this.reflectorAddress; } 
			set { this.reflectorAddress = value; }
		}
		
		private int reflectorPort = 0;
		public int ReflectorPort 
		{
			get { return this.reflectorPort; } 
			set { this.reflectorPort= value; }
		}

		#endregion
		#region Declarations
		private SSRCManager		assrcs;				//Audio sources
		private SSRCManager		vssrcs;				//Video sources
		private String			myCname;
		private String			myFriendlyName;
		private RtpSession		confSession;
		private RtpSession		presenterSession;
		private UWVenue			confVenue;
		private UWVenue			presenterVenue;
		private EventLog		eventLog;
		#endregion
		#region Constructor
		/// <summary>
		/// Construct
		/// </summary>
		/// <param name="host">local host name</param>
		/// <param name="cname">custom cname, or null</param>
		public RtpManager(String cname, String fname)
		{
			eventLog = new EventLog("WMG",".","WMGCore");
			this.myCname = cname;
			this.myFriendlyName = fname;
			/// SSRC Managers maintain data structures to track streams as they come and go,
			/// and raise restored events when appropriate.
			/// Use one per payload type.
			assrcs = new SSRCManager(MSR.LST.Net.Rtp.PayloadType.dynamicAudio);
			vssrcs = new SSRCManager(MSR.LST.Net.Rtp.PayloadType.dynamicVideo);
			assrcs.OnSourceRestored += new SSRCManager.SourceRestoredHandler(this.OnSourceRestored);
			vssrcs.OnSourceRestored += new SSRCManager.SourceRestoredHandler(this.OnSourceRestored);
			
			// Add static RTP event handlers
			AddRemoveRtpEventHandlers(true);
		}

		
		public void Dispose()
		{
			//Dispose both listeners (if they exist)
			DisposeListener(ref confSession,presenterSession);
			DisposeListener(ref presenterSession,confSession);
		}

		#endregion
		#region Public Methods
		
		public RtpStream GetConfRtpStream(uint ssrc)
		{
			if (confSession != null)
			{
				if (confSession.Streams.ContainsKey(ssrc))
				{
					return confSession.Streams[ssrc];
				}
			}
			return null;
		}


		/// <summary>
		/// Return true if the ssrc is in the conference RtpSession's SSRCToStreamHashtable and the 
		/// RtpStream reference there is not null.
		/// </summary>
		/// <param name="ssrc"></param>
		/// <returns></returns>
		public bool KnownToConferenceListener(uint ssrc)
		{
			if (confSession != null)
			{
				SSRCToStreamHashtable ht = (SSRCToStreamHashtable)confSession.Streams.Clone();
				if (ht.ContainsKey(ssrc))
				{
					if (ht[ssrc] != null)
						return true;
				}
			}
			return false;
		}

		/// <summary>
		/// Get the time of the most recent stream restart.  If the stream is not found, return Now.
		/// This is updated whenever a streamAdded event is received from the conference listener
		/// (after a listener start/restart), and it should be updated manually with SetRestartTime 
		/// when the graph is detected to be stuck, and is manually rebuilt.
		/// </summary>
		/// <param name="cname"></param>
		/// <param name="payload"></param>
		/// <returns></returns>
		public DateTime GetRestartTime(String cname, PayloadType payload)
		{
			if (payload == PayloadType.dynamicAudio)
			{
				return assrcs.GetRestartTime(cname);
			}
			else if (payload == PayloadType.dynamicVideo)
			{
				return vssrcs.GetRestartTime(cname);
			}
			return DateTime.Now;
		}

		public void SetRestartTime(String cname, PayloadType payload)
		{
			if (payload == PayloadType.dynamicAudio)
			{
				assrcs.SetRestartTime(cname);
			}
			else if (payload == PayloadType.dynamicVideo)
			{
				vssrcs.SetRestartTime(cname);
			}
		}

		/// <summary>
		/// Start a listener on the venue specified.  If one was already running, dispose it
		/// regardless of the venue, and create a new one.
		/// isConfListener indicates whether this is a conferencing or Presenter listener.
		/// </summary>
		public bool StartListener(UWVenue venue, bool isConfListener)
		{
			if (venue == null)
				return false;

			if (isConfListener)
			{
				confVenue = venue;
				if (confSession != null)
				{
					DisposeListener(ref confSession, presenterSession);
				}
				confSession = CreateListener(presenterSession,venue);

				if (confSession == null)
				{
					return false;
				}

				// If conference and presenter now use the same venue, we 
				// may have already missed some relevant stream added events.
				if (confSession == presenterSession)
				{
					AddConferenceStreams();
				}

			}
			else
			{
				presenterVenue = venue;
				if (presenterSession != null)
				{
					DisposeListener(ref presenterSession, confSession);
				}
				presenterSession = CreateListener(confSession,venue);
				if (presenterSession == null)
					return false;

				if (confSession == presenterSession)
				{
					AddPresenterStreams();  
				}
			}
			return true;
		}

		/// <summary>
		/// User clicks the Refresh button during encoding
		/// </summary>
		/// <param name="isConfListener"></param>
		public bool RestartListener(bool isConfListener)
		{
			if (isConfListener)
			{
				DisposeListener(ref confSession,presenterSession);
				confSession = CreateListener(presenterSession,confVenue);

				if (confSession==null)
					return false;

				// If conference and Presenter listeners are on the same venue, we don't actually restart.
				// Just refresh the streams in this case.
				if (confSession == presenterSession)
				{
					AddConferenceStreams();
				}
				
			}
			else
			{
				Debug.WriteLine("Presenter Listener Restart not implemented");
				return false;
			}
			return true;
		}
		
		/// <summary>
		/// Called when Reflector params change.
		/// </summary>
		public bool RestartAllSessions()
		{
			bool ret = true;
			if (presenterSession == confSession)
			{
				presenterSession = null;
				if (confSession != null)
				{
					confSession.Dispose();
					confSession = null;
				}
				confSession = CreateListener(null,confVenue);
				presenterSession = confSession;
				if (confSession==null)
					ret = false;
				
			}
			else
			{
				if (confSession != null)
				{
					confSession.Dispose();
					confSession = null;
					confSession = CreateListener(null,confVenue);
					if (confSession==null)
						ret = false;
				}
				if (presenterSession != null)
				{
					presenterSession.Dispose();
					presenterSession = null;
					presenterSession = CreateListener(null,presenterVenue);
					if (presenterSession==null)
						ret = false;
				}
			}
			return ret;
		}

		/// <summary>
		/// Called when app ends or Presenter listening is disabled
		/// </summary>
		public void StopListener(bool isConfListener) 
		{
			if (isConfListener)
			{
				Debug.WriteLine("Stop conference listener not implemented");
			}
			else
			{
				DisposeListener(ref presenterSession,confSession);
			}
		}

		/// <summary>
		/// Register cnames with SSRCManager before starting encoding.  
		/// Note SourceRestored events are not enabled until SSRCManager.RaiseSourceRestored 
		/// is set to true.  Returns false if a stream was not found.
		/// </summary>
		/// <param name="audioCnames"></param>
		/// <param name="videoCname"></param>
		/// <returns></returns>
		public bool SelectEncodingStreams(ArrayList audioCnames, ArrayList videoCnames)
		{
			//snapshot running sets of ssrc's
			if (!assrcs.SnapshotRunningSet(audioCnames))
				return false;

			if (!vssrcs.SnapshotRunningSet(videoCnames))	
				return false;

			return true;
		}

		/// <summary>
		/// Adjust running set for video to support change of source while encoding.
		/// </summary>
		/// <param name="cname"></param>
		/// <returns></returns>
		public bool ChangeVideoStream(string cname)
		{
			if (!vssrcs.ReplaceRunningSet(cname))
				return false;
			return true;
		}

		/// <summary>
		/// Adjust running set for audio to support change of source while encoding.
		/// </summary>
		/// <param name="cname"></param>
		/// <param name="add"></param>
		/// <returns></returns>
		public bool AddRemoveAudioStream(string cname, bool add)
		{
			if (add)
			{
				if (!assrcs.AddToSnapshot(cname))
					return false;
			}
			else
			{
				if (!assrcs.RemoveFromSnapshot(cname))
					return false;			
			}
			return true;
		}

		/// <summary>
		/// Enable/disable SourceRestored events
		/// </summary>
		/// <param name="enable"></param>
		public void EnableSourceRestoredEvents(bool enable)
		{
			assrcs.RaiseSourceRestored = enable;
			vssrcs.RaiseSourceRestored = enable;
		}


		/// <summary>
		/// Called right before the user wants to begin encoding.  Verify
		/// all sources are present: RtpStreams are known to the RtpSession,
		/// none are null, and all are currently delivering frames.
		/// </summary>
		/// <param name="audioCnames"></param>
		/// <param name="videoCname"></param>
		/// <returns></returns>
		public String VerifyEncodingStreams()
		{
			if (confSession==null)
				return "Conferencing RtpSession does not exist.";

			Hashtable aht = assrcs.GetRunningSetSSRCs();
			Hashtable vht = vssrcs.GetRunningSetSSRCs();
			SSRCToStreamHashtable sht = (SSRCToStreamHashtable)confSession.Streams.Clone();
			ArrayList streams = new ArrayList();
			foreach (uint ssrc in aht.Values)
			{
				if (!sht.ContainsKey(ssrc))
					return "Selected audio ssrc is unknown to the RtpSession.";
				else if (sht[ssrc] == null)		
					return "Selected audio stream does not exist.";
				streams.Add(sht[ssrc]);
			}
			foreach (uint ssrc in vht.Values)
			{
				if (!sht.ContainsKey(ssrc))
					return "Selected video ssrc is unknown to the RtpSession.";
				else if (sht[ssrc] == null)		
					return "Selected video stream does not exist.";
				streams.Add(sht[ssrc]);
			}
			return CheckForPausedStreams(streams);
		}

		/// <summary>
		/// Check that the stream is currently delivering frames.  Return "" if it is, error message if it isn't.
		/// </summary>
		/// <param name="stream"></param>
		/// <returns></returns>
		public String CheckForPausedStream(RtpStream stream)
		{
			ArrayList streams = new ArrayList();
			streams.Add(stream);
			return CheckForPausedStreams(streams);
		}


		/// <summary>
		/// Check that an ArrayList of RtpStreams are all currently delivering frames.  Return "" if they all
		/// are, error message otherwise.
		/// </summary>
		/// <param name="streams"></param>
		/// <returns></returns>
		public String CheckForPausedStreams(ArrayList streams)
		{
			int[] framesReceived = new int[streams.Count];

			int timeout = 2000;

			for (int i=0; i<streams.Count;i++)
			{
				framesReceived[i] = ((RtpStream)streams[i]).FramesReceived;

				//Screen streaming is a special case because it is known to have very low and irregular frame rate.
				if (((RtpStream)streams[i]).Properties.Name.EndsWith("Screen Streaming"))
					timeout = 10000;
			}

			bool allReceived = false;
			String errorMsg = "";
			int clock = 50;
			int ind = 0;
			Thread.Sleep(50);

			while ((!allReceived) && (clock<timeout))
			{
				allReceived=true;
				for (ind=0; ind<streams.Count;ind++)
				{
					if (framesReceived[ind] == ((RtpStream)streams[ind]).FramesReceived)
					{
						allReceived=false;
						break;
					}
				}

				if (!allReceived)
				{
					errorMsg = "No data was received from stream: " + 
						((RtpStream)streams[ind]).PayloadType.ToString() + " " + 
						((RtpStream)streams[ind]).Properties.CName + ".";
					Thread.Sleep(50);
					clock+=50;
				}
			}
			
			if (allReceived)
			{
				Debug.WriteLine("CheckForPausedStreams received data from all streams after (ms):" + clock.ToString());
				return "";
			}
			else
				return errorMsg;

		}

		/// <summary>
		/// Clear running set for all streams.
		/// </summary>
		public void UnselectEncodingStreams()
		{
			assrcs.ClearRunningSet();
			vssrcs.ClearRunningSet();
		}



		/// <summary>
		/// Return a list of streams known to presenterSession which have the Presentaton payload.
		/// Key is ssrc, value is cname
		/// </summary>
		/// <returns></returns>
		public Hashtable GetPresenterStreams()
		{
			if (presenterSession == null)
				return null;

			SSRCToStreamHashtable streams;
			RtpStream stream;
			Hashtable streamList = new Hashtable();
			streams = (SSRCToStreamHashtable)presenterSession.Streams;
			foreach(object ssrc in streams.Keys)
			{
				stream = (RtpStream)streams[(uint)ssrc];
				if (stream==null)
					continue;
				if (stream.PayloadType == PayloadType.dynamicPresentation)
				{
					streamList.Add((uint)ssrc,stream.Properties.CName);
				}
			}
			return streamList;
		}

		/// <summary>
		/// Dispose of listener (if any), and create a new one on the new venue.
		/// </summary>
		/// <param name="venue"></param>
		/// <param name="isConferencingVenue"></param>
		public bool ChangeVenue(UWVenue venue,bool isConferencingVenue)
		{
			if (venue == null)
				return false; //shouldn't ever be.

			if (isConferencingVenue)
			{
				// Make sure it really did change because we could possibly have been using
				// the same address/port as a custom venue.
				if ((confVenue == null) || (!confVenue.Equals(venue)))
				{
					confVenue = venue;
					DisposeListener(ref confSession,presenterSession);
					//Note: long term we don't want to clear them if encoding ..
					assrcs.Clear();
					vssrcs.Clear();
					confSession = CreateListener(presenterSession,confVenue);
					//confSession.BufferPacketsForUnsubscribedStreams = false;

					if (confSession == null)
						return false;

					// If conference and presenter now use the same venue, we 
					// may have already missed some relevant stream added events.
					if (confSession == presenterSession)
					{
						AddConferenceStreams();
					}

				}
			}
			else
			{
				if ((presenterVenue == null) || (!presenterVenue.Equals(venue)))
				{
					presenterVenue = venue;
					DisposeListener(ref presenterSession, confSession);
					presenterSession = CreateListener(confSession,presenterVenue);
					if (presenterSession == null)
						return false;

					// If conference and presenter now use the same venue, we 
					// may have already missed some relevant stream added events.
					if (confSession == presenterSession)
					{
						AddPresenterStreams();
					}
				}
			}
			return true;
		}

		/// <summary>
		/// Add listen threads for any active presenter streams
		/// </summary>
		/// This would normally be done through RTPStreamAdded events.
		/// In the case where conference and presenter are on the same venue, 
		/// the streamAdded events may have already been missed.
		public void AddPresenterStreams()
		{
			SSRCToStreamHashtable streams;
			RtpStream stream;
			if (presenterSession != null)
			{
				streams = (SSRCToStreamHashtable)presenterSession.Streams;
				foreach(object ssrc in streams.Keys)
				{
					stream = (RtpStream)streams[(uint)ssrc];
					if (stream==null)
						continue;
					if (stream.PayloadType == PayloadType.dynamicPresentation)
					{
						if (OnPresentationStreamAdded != null)
						{
							OnPresentationStreamAdded(new RtpEvents.RtpStreamEventArgs(stream));
						}
					}
				}
			}
		}

		#endregion
		#region Events

		//for auto restart
		public event StreamRestoredHandler OnStreamRestored;
		public delegate void StreamRestoredHandler(StreamRestoredEventArgs ea);

		//For UI updating
		public event StreamAddRemoveHandler OnStreamAddRemove;
		public delegate void StreamAddRemoveHandler(StreamAddRemoveEventArgs ea);

		//Create and destroy Presenter listen threads
		public event PresentationStreamAddedHandler OnPresentationStreamAdded;
		public delegate void PresentationStreamAddedHandler(RtpEvents.RtpStreamEventArgs ea);
		public event PresentationStreamRemovedHandler OnPresentationStreamRemoved;
		public delegate void PresentationStreamRemovedHandler(RtpEvents.RtpStreamEventArgs ea);

		#endregion
		#region Private Methods

		/// <summary>
		/// record all the active conference streams in the SSRCManagers
		/// </summary>
		/// Note that this would normally happen via StreamAdded event handlers.
		/// This is a hack to workaround a situation with presenter and conference on 
		/// the same venue.
		private void AddConferenceStreams()
		{
			SSRCToStreamHashtable streams;
			RtpStream stream;
			String streamID;
			bool selected = false;
			if (confSession != null)
			{
				streams = (SSRCToStreamHashtable)confSession.Streams;
				foreach(object ssrc in streams.Keys)
				{
					stream = (RtpStream)streams[(uint)ssrc];
					if (stream==null)
						continue;
					streamID = makeStreamIdentifier(stream.Properties.CName,stream.Properties.Name);
					if (stream.PayloadType == PayloadType.dynamicAudio)
					{
						assrcs.Add((uint)ssrc,streamID);
						selected = assrcs.IsChecked(streamID);
					}
					if (stream.PayloadType == PayloadType.dynamicVideo)
					{
						vssrcs.Add((uint)ssrc,streamID);
						selected = vssrcs.IsChecked(streamID);
					}
					if (OnStreamAddRemove != null)
					{
						StreamAddRemoveEventArgs area = new StreamAddRemoveEventArgs(true,selected,streamID,stream.PayloadType);
						OnStreamAddRemove(area);
					}
				}
			}
		}


		/// <summary>
		/// Destroy a listener reference.  Dispose the listener if appropriate
		/// </summary>
		/// <param name="goner">The one to Dispose</param>
		/// <param name="other">The other (possible) reference which may be null</param>
		private void DisposeListener(ref RtpSession goner, RtpSession other)
		{
			if (goner != null)
			{
				if (other!=null)
				{
					if (CompareIPEndPoints(goner.RtpEndPoint,other.RtpEndPoint))
					{
						goner = null;
						return;
					}
				}
				goner.Dispose();
				goner = null;
			}
		}

		/// <summary>
		/// Create a listener if there isn't already one for this endpoint.
		/// If we fail, write eventlog entry and return null.
		/// </summary>
		/// <param name="other">The other (possible) listener</param>
		/// <param name="venue">New IP endpoint to use</param>
		private RtpSession CreateListener(RtpSession other, UWVenue venue)
		{
			if (other != null)
			{
				if (CompareIPEndPoints(other.RtpEndPoint,venue.IpEndpoint))
				{
					return other;
				}
			}

			RtpParticipant p = new RtpParticipant(myCname,myFriendlyName);
			RtpSession s;
			IPEndPoint refEP;
			if (this.reflectorEnabled)
			{
				try 
				{
					refEP = new IPEndPoint(System.Net.Dns.GetHostEntry(this.reflectorAddress).AddressList[0],this.reflectorPort);
					s = new RtpSession(venue.IpEndpoint,p,true,true,refEP);
                    s.VenueName = venue.Name;
				}
				catch (Exception e)
				{
					eventLog.WriteEntry("Failed to create RtpSession with Reflector enabled. " + e.ToString(),EventLogEntryType.Error,1002);
					s = null;
				}
			}
			else
			{
				try
				{
					s = new RtpSession(venue.IpEndpoint,p,true,true);
                    s.VenueName = venue.Name;
				}
				catch (Exception e)
				{
					eventLog.WriteEntry("Failed to create RtpSession. " + e.ToString(),EventLogEntryType.Error,1002);
					s = null;
				}
			}
			return s;
		}

		private bool CompareIPEndPoints(IPEndPoint ipe1, IPEndPoint ipe2)
		{
			if ((ipe1 != null) && (ipe2 != null))
			{
				if ((ipe1.Address.Equals(ipe2.Address)) &&
					(ipe1.Port == ipe2.Port))
					return true;
			}
			return false;
		}



		/// <summary>
		/// Clear flags used to indicate that streams were added since a particular point in time (after a listener restart).
		/// </summary>
		private void ClearStreamAddedFlags()
		{
			vssrcs.ClearStreamAddedFlags();
			assrcs.ClearStreamAddedFlags();
		}


		/// <summary>
		/// Wait until streams in the running set are added, or a timeout occurs.
		/// </summary>
		/// <param name="timeout"></param>
		/// <returns></returns>
		private bool CheckStreamsAdded(int timeout)
		{
			int timeleft = timeout;

			while (timeleft >= 0)
			{
				if (vssrcs.RunningSetAdded())
					break;
				
				Thread.Sleep(500);
				timeleft -= 500;
			}

			while (timeleft >= 0)
			{
				if (assrcs.RunningSetAdded())
					return true;
				Thread.Sleep(500);
				timeleft -= 500;
			}
			return false; //timeout expired
		}


		/// <summary>
		/// if SSRCManager detects a source restart, this is the event handler.
		/// Just bubble the event up to the parent.
		/// </summary>
		/// <param name="ea"></param>
		private void OnSourceRestored(StreamRestoredEventArgs ea)
		{
			if (OnStreamRestored != null)
			{
				OnStreamRestored(ea);
			}
		}


		private void AddRemoveRtpEventHandlers(bool add)
		{
			if (add)
			{
				RtpEvents.RtpStreamAdded += new RtpEvents.RtpStreamAddedEventHandler(OnRtpStreamAdded);
				RtpEvents.RtpStreamRemoved += new RtpEvents.RtpStreamRemovedEventHandler(OnRtpStreamRemoved);
			}
			else
			{
				RtpEvents.RtpStreamAdded -= new RtpEvents.RtpStreamAddedEventHandler(OnRtpStreamAdded);
				RtpEvents.RtpStreamRemoved -= new RtpEvents.RtpStreamRemovedEventHandler(OnRtpStreamRemoved);
			}
		}

		/// <summary>
		/// Since with CXP 3.0 there may be multiple video streams per cname, we need to construct an identifier
		/// that will allow us to determine if a particular video stream leaves the venue and returns (with a 
		/// new ssrc).  Accomplish this by parsing out part of the Name property and merging with the CName
		/// property.  This is not a bullet-proof solution.  We would really like to have CXP send a
		/// persistent and guaranteed unique device identifier.
		/// </summary>
		/// <param name="cname"></param>
		/// <param name="name"></param>
		/// <returns></returns>
		private String makeStreamIdentifier(String cname,String name)
		{
			int i = name.LastIndexOf(" - ");
			if (i == -1)
				return cname + " " + name;

			return cname + name.Substring(name.LastIndexOf(" - "));
		}

		#endregion
		#region RTP Event Handlers
		/// <summary>
		/// One of the listeners saw a new stream
		/// </summary>
		/// This could be invoked on behalf of either the presenter or the conferencing listener.
		/// <param name="rtpStream"></param>
		private void OnRtpStreamAdded(object o, RtpEvents.RtpStreamEventArgs ea)
		{
			String streamID = makeStreamIdentifier(ea.RtpStream.Properties.CName,ea.RtpStream.Properties.Name);

			Debug.WriteLine("StreamAdded: " + streamID + " payload:" + ea.RtpStream.PayloadType.ToString());
			bool selected = false;
			if ((confSession != null) && (confSession.Streams.ContainsKey(ea.RtpStream.SSRC)))
			{
				if (ea.RtpStream.PayloadType == MSR.LST.Net.Rtp.PayloadType.dynamicAudio) 
				{
					assrcs.Add(ea.RtpStream.SSRC,streamID);
					selected = assrcs.IsChecked(streamID);
				}

				if (ea.RtpStream.PayloadType == MSR.LST.Net.Rtp.PayloadType.dynamicVideo) 
				{
					vssrcs.Add(ea.RtpStream.SSRC,streamID);
					selected = vssrcs.IsChecked(streamID);
				}
				if (OnStreamAddRemove != null)
				{
					StreamAddRemoveEventArgs area = new StreamAddRemoveEventArgs(true,selected,streamID,ea.RtpStream.PayloadType);
					OnStreamAddRemove(area);
				}
			}

			if ((presenterSession != null) && (presenterSession.Streams.ContainsKey(ea.RtpStream.SSRC)))
			{
				if (ea.RtpStream.PayloadType == MSR.LST.Net.Rtp.PayloadType.dynamicPresentation)
				{
					//Note: this is not necessarily an Instructor node, but we need to let the listen threads figure that out.
					if (OnPresentationStreamAdded != null)
						OnPresentationStreamAdded(ea);
				}
			}
		}

		/// <summary>
		/// Event handler for RTP Stream Removed.  Note this is not raised before a listener terminates.
		/// </summary>
		/// <param name="o"></param>
		/// <param name="ea"></param>
		private void OnRtpStreamRemoved(object o, RtpEvents.RtpStreamEventArgs ea)
		{
			String streamID = makeStreamIdentifier(ea.RtpStream.Properties.CName,ea.RtpStream.Properties.Name);
			Debug.WriteLine("StreamRemoved: " + streamID + " payload:" + ea.RtpStream.PayloadType.ToString());

			//PRI2: There is a potential problem here because I have no way to tell which session triggered the event.
			if (confSession != null)
			{
				if (ea.RtpStream.PayloadType == MSR.LST.Net.Rtp.PayloadType.dynamicAudio) 
				{
					assrcs.Remove(streamID);
				}

				if (ea.RtpStream.PayloadType == MSR.LST.Net.Rtp.PayloadType.dynamicVideo) 
				{
					vssrcs.Remove(streamID);
				}

				if (OnStreamAddRemove != null)
				{
					StreamAddRemoveEventArgs area = new StreamAddRemoveEventArgs(false,false,streamID,ea.RtpStream.PayloadType);
					OnStreamAddRemove(area);
				}

			}

			if (presenterSession != null)
			{
				if (ea.RtpStream.PayloadType == MSR.LST.Net.Rtp.PayloadType.dynamicPresentation)
				{
					if (OnPresentationStreamRemoved != null)
						OnPresentationStreamRemoved(ea);
				}
			}
		}

		#endregion
	}
}
