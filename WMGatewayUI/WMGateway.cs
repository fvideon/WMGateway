using System;
using System.Net;
using System.IO;
using System.Diagnostics;
using System.Configuration;
using System.Text.RegularExpressions;
using Microsoft.Win32;
using MSR.LST;
using MSR.LST.MDShow;
using MSR.LST.Net.Rtp;
using System.Threading;
using System.Collections;
using System.Collections.Specialized;
using System.Windows.Forms;
using System.Runtime.Serialization.Formatters.Binary;
using System.Management;
using UW.CSE.DISC.net.pnw_gigapop.confxp.venues;


namespace UW.CSE.DISC
{
	/// <summary>
	/// Perform all the base WMGateway functions.  An instance corresponds to the app. 
	/// </summary>
	/// -respond to user actions.
	/// -manage most runtime parameters and configuraton persistence
	/// -Obtain venue lists from server and appconfig
	/// -create and manage diagnostic loggers (event log, textbox, file)
	/// -manage instance of rtpManager which manages RtpSessions, monitors sources
	/// -manage instance of PresenterManager which handles Presenter listening and logging
	/// -manage instances of graphbuilder to build/start/stop/rebuild/dispose graphs.  One instance per graph.
	/// -manage instance of WMWriter. One instance per encoding session.
	/// -manage instance of MediaBuffer.  Once instance per encoding session.
	/// -facilitate communications between the components to perform the encoding job.
	/// 
	public class WMGateway
	{
		#region Properties
		private ArrayList confVenues;
		/// <summary>
		/// List of conferencing venues
		/// </summary>
		public ArrayList ConfVenues
		{
			get {return confVenues;}
		}

		private UWVenue confVenue;
		/// <summary>
		/// Currently selected conferencing venue
		/// </summary>
		public UWVenue ConfVenue
		{
			get {return confVenue;}
		}

		private ArrayList presenterVenues;
		/// <summary>
		/// Available Presenter venues
		/// </summary>
		public ArrayList PresenterVenues
		{
			get {return presenterVenues;}
		}

		/// <summary>
		/// Currently selected Presenter venue
		/// </summary>
		public UWVenue PresenterVenue
		{
			get {return presenterMgr.PresenterVenue;}
		}

		private bool videoVisible;
		public bool VideoVisible
		{
			get {return videoVisible;}
		}

		private bool audioMuted;
		public bool AudioMuted
		{
			get {return audioMuted;}
		}

		/// <summary>
		/// Presenter listening turned on or off.
		/// </summary>
		public bool PresenterEnabled
		{
			get {return presenterMgr.PresenterEnabled;}
		}

		private bool running;
		/// <summary>
		/// Currently encoding
		/// </summary>
		public bool Running
		{
			get {return running;}
		}

		private bool archiving;
		/// <summary>
		/// Archiving to WMV
		/// </summary>
		public bool Archiving
		{
			get {return archiving;}
		}

		/// <summary>
		/// Logging slide transitions to file.
		/// </summary>
		public bool LogSlides
		{
			get {return presenterMgr.LogSlides;}
		}

		/// <summary>
		/// Logging Presenter data to file.
		/// </summary>
		public bool LogScripts
		{
			get {return presenterMgr.LogScripts;}
		}

		private String errorMsg;
		/// <summary>
		/// User-friendly reason for encoding failure.
		/// </summary>
		public String ErrorMsg
		{
			get {return errorMsg;}
		}

		//Reflector Service
		private RegistryKey reflectorsRegKey = null;
		public RegistryKey ReflectorsRegKey
		{
			get { return this.reflectorsRegKey; } 
		}
		public bool ReflectorEnabled
		{
			get { return rtpMgr.ReflectorEnabled; }
		}

        public Uri DiagnosticServiceUri {
            get { return this.diagnosticServiceUri; }
        }

		#endregion
		#region Declarations

		/// <summary>
		/// The localhost port from which to send the Windows Media stream.
		/// </summary>
		private uint wmPort;
			
		/// <summary>
		/// Maximum allowed remote connections to the Windows Media Stream.
		/// </summary>
		private uint wmMaxConnections;

		private MainForm		parent;
		private IPHostEntry		myIPHostEntry;
		private String			myHostName;
		private bool			useLogFile = false;	//app.config flag
        private string diagnosticServerName;        //Diagnostic Server as specified from app.config.
		private String			archive_file;		//WMV file name
		private int				WMProfile;			//Windows Media system profile ID
		private String			CustomProfile;		//Path to PRX file defining custom profile
		private	Thread			workThread;			//Start and run encoder
		private String			myCname;
		private String			myFriendlyName;
		private EventLog		eventLog;			//log some things to Application event log
		private string			customCname = null;		//User-specified CNAME
		private	Logger			logger;					//diagnostic writer
		private string			addRemoveAudioCname;	//add or remove this audio cname while encoding
		private string			changeVideoCname;		//changing to this video cname while encoding
		private bool			addRemoveAudioAdd;		//add or remove audio source
		private PresenterManager	presenterMgr;
		private RtpManager			rtpMgr;
		private VideoGraphBuilder	videoGraphBuilder;
		private ArrayList			audioGraphBuilders;
		private MediaBuffer			mediaBuffer;
		private WMWriter			wmWriter;
		private UW.CSE.MDShow.MediaType			videoMediaType;
		private UW.CSE.MDShow.MediaType			audioMediaType;
		private Thread			maintenanceThread;		// Keep an eye on things
		private ReportTimer		rptTimer;
        private Uri diagnosticServiceUri; //from app.config

		//built-in constants..  
		private TimeSpan		StreamRestartPeriod = new TimeSpan(0,1,0);	// how often to try restarting
		//private ulong			StreamHungThreshold = 10000;				// milliseconds before we attempt stream restart.
		private const int		MAX_AUDIO_STREAMS = 10;						// at most, encode/mix this many audio streams
        

		#endregion
		#region Constructor
		public WMGateway(MainForm parent)
		{
						
			this.parent = parent;

			//prepare to write to event log
			eventLog = new EventLog("WMG",".","WMGCore");
			this.reflectorsRegKey = Registry.CurrentUser.CreateSubKey(@"Software\UWCSE\WMGateway\ReflectorService");

			GetAppConfigSettings();

            if (this.diagnosticServerName != null) {
                //Flag the RTP code to participate in conference diagnostics by sending our diagnostic information to the server.
                MSR.LST.Net.Rtp.RtpSession.DiagnosticsServer = this.diagnosticServerName;
                MSR.LST.Net.Rtp.RtpSession.DiagnosticsEnabled = true;
            }

			//prepare our own diagnostic writer/logger
			string logFilename;
			if (useLogFile) //defined by app.config
				logFilename = "diagnostic_log.txt";
			else
				logFilename = null;
			logger = new Logger(parent.txtDiagnostics,logFilename);
			logger.Write("Application starting: " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
			if (customCname != null)
				logger.Write("Custom CNAME configured: " + customCname);

			//Retrieve persisted config from registry
			RestoreConfig();

			// other status/config
			running = false;
			audioMuted = true;
			myIPHostEntry = Dns.GetHostEntry(Dns.GetHostName());
			myHostName = myIPHostEntry.HostName;
			//venue service requires something that looks like a real email address
			if (myHostName.IndexOf(".") == -1) 
				myHostName = myHostName+".org";

			//Configure our RTCP identity
			if (customCname == null)
				myCname = "WMGateway@" + myHostName; 
			else
				myCname = customCname;
			myFriendlyName = "Windows Media Gateway (" + myHostName + ")";
			
			// Query web service for list of venues
			confVenues = new ArrayList();
			presenterVenues = new ArrayList();
			GetVenueList();

			// Load additional venues from app.config
			GetAppConfigVenues();
			
			// RtpManager handles RtpListeners and events.
			rtpMgr = new RtpManager(myCname,myFriendlyName);
			rtpMgr.OnStreamAddRemove += new RtpManager.StreamAddRemoveHandler(ConfStreamAddRemove);
			rtpMgr.OnStreamRestored += new RtpManager.StreamRestoredHandler(ConfStreamRestored);
			SetReflectorService(); //Set Reflector params
			// Start initial conference listener
			if (!rtpMgr.StartListener(confVenue,true))
			{
				logger.Write("Failed to start RtpSession.  See event log for details.");
			}

			// PresenterManager creates presenter listener, if initial state is enabled.
			presenterMgr = new PresenterManager(rtpMgr,parent);
			presenterMgr.OnPresenterFrameCountUpdate += new PresenterManager.presenterFrameCountUpdateHandler(FrameCountUpdate);
			presenterMgr.OnPresenterSourceUpdate += new PresenterManager.presenterSourceUpdateHandler(SourceUpdate);
			presenterMgr.OnSendRawScript += new PresenterManager.sendRawScriptHandler(SendRawScript);
			presenterMgr.OnSendUrlScript += new PresenterManager.sendUrlScriptHandler(SendUrlScript);

			rptTimer = new ReportTimer();
			maintenanceThread = null;
			maintenanceThread = new Thread( new ThreadStart(MaintenanceThread));
			maintenanceThread.Name = "WMG Maintenance Thread";
			maintenanceThread.IsBackground = true;
			maintenanceThread.Start();

		}

		
		public void Dispose()
		{
			if (running)
			{
				/// PRI2: if we run this in a MTA thread, the WMWriter probably won't except on stop.
				/// One way to do this would be to use the Form Closing event.  Note that waiting in
				/// that event handler (or here) will cause deadlock if anything is invoked on the main
				/// form thread.
				StopEncoding();
			}

			if (maintenanceThread != null)
			{
				maintenanceThread.Abort();
				maintenanceThread = null;
			}

			SaveConfig(); //persist to registry

			presenterMgr.Dispose();
			rtpMgr.Dispose();

			logger.Close();
		}


		#endregion
		#region Private Methods
		/// <summary>
		/// Pass this event on up to the UI
		/// </summary>
		/// <param name="ea"></param>
		private void SourceUpdate(NumericEventArgs ea)
		{
			if (OnPresenterSourceUpdate != null)
				OnPresenterSourceUpdate(ea);
		}

		/// <summary>
		/// Pass event up to the UI
		/// </summary>
		/// <param name="ea"></param>
		private void FrameCountUpdate(NumericEventArgs ea)
		{
			if (OnPresenterFrameCountUpdate != null)
				OnPresenterFrameCountUpdate(ea);
		}

		/// <summary>
		/// Bubble Stream Add/remove events up to UI
		/// </summary>
		/// <param name="ea"></param>
		private void ConfStreamAddRemove(StreamAddRemoveEventArgs ea)
		{
			//Debug.WriteLine("wmg.ConfStreamAddRemove");
			if (OnStreamAddRemove != null)
				OnStreamAddRemove(ea);
		}

		/// <summary>
		/// Handle auto restart if encoding. 
		/// </summary>
		/// <param name="ea"></param>
		/// Note: this runs on a thread pool thread from SSRCManager, so it's ok to take our time.
		/// This happens when RTP Listener sees a stream added that belongs to the encoding set.
		private void ConfStreamRestored(StreamRestoredEventArgs ea)
		{
			Debug.WriteLine("wmg.ConfStreamRestored");
			if (running)
			{
				lock (rptTimer)
				{   
					//This prevents warnings about the stream being stuck from being displayed at in appropriate times.
					if (rptTimer != null)
						rptTimer.SetReportTime(ea.Cname,ea.Payload.ToString());
				}

				LoggerWriteInvoke("Rebuilding graph to restore stream for: " + ea.Cname + 
					" Payload: " + ea.Payload.ToString());

				RtpStream stream = rtpMgr.GetConfRtpStream(ea.NewSsrc);
				if (stream==null)
				{
					Debug.WriteLine("Failed to find restored stream.");
					return;
				}

				//PRI2: This doesn't work if the video resolution changed.  It can
				// create interesting video artifacts, and is also suspected to be a cause of
				// WMWriter exceptions.  To fix:
				//	make a new graph and a new media buffer
				//  splice the stream much like we do in the case of changing video sources.
				//  feed the wmwriter the new media type.
				//  dispose of the old graph
				// A workaround for now is to manually switch to a different video source, then back.
				if (ea.Payload == PayloadType.dynamicVideo)
				{
					if (!videoGraphBuilder.Restart(stream))
						LoggerWriteInvoke("Video Graph Restart Failed.");
	
					//Warn if the video media type changed.
					UW.CSE.MDShow.MediaType newMT = videoGraphBuilder.GetMediaType();

					if (!CompareVideoMediaTypes(this.videoMediaType, newMT))
					{
						LoggerWriteInvoke("Warning: Resolution of encoding video changed.");
					}
					//PRI1: if the type changed, video will be either messed up or frozen.  Fix.
					//PRI2: if this is restored in a paused state, will that work?  Currently restoring in paused state isn't possible??
				}
				else if (ea.Payload == PayloadType.dynamicAudio)
				{
					lock (this)
					{
						foreach (AudioGraphBuilder agb in audioGraphBuilders)
						{
							if (agb.Ssrc == ea.OldSsrc)
							{
								//PRI2: if restored in a paused state, would it work?  It's currently not possible??
								if (!agb.Restart(stream))
									LoggerWriteInvoke("Audio Graph Restart Failed.");	
								break;
							}
						}
					}
				}
			}
		}

		/// <summary>
		/// Determine if the two media types represent different video resolution
		/// </summary>
		/// <param name="mt1"></param>
		/// <param name="mt2"></param>
		/// <returns></returns>
		private bool CompareVideoMediaTypes(UW.CSE.MDShow.MediaType mt1, UW.CSE.MDShow.MediaType mt2)
		{

			if ((mt1==null) && (mt2==null))
				return false;

			if (mt1.SampleSize != mt2.SampleSize)
				return false;

			return true;
		}


		/// <summary>
		/// Get configuration from app.config.  Note this runs from constructor before logger exists.
		/// </summary>
		private void GetAppConfigSettings()
		{
			// Use app.config to let the user configure diagnostic logging.
			useLogFile = false;
			if (ConfigurationManager.AppSettings["WMGateway.logfile"] != null)
			{
				useLogFile = Convert.ToBoolean(ConfigurationManager.AppSettings["WMGateway.logfile"]);
			}

            // Get a custom CNAME from app.config
            customCname = null;
            if (ConfigurationManager.AppSettings["WMGateway.cname"] != null) {
                customCname = ConfigurationManager.AppSettings["WMGateway.cname"];
            }

            // Get a  Diagnostics Server from app.config
            diagnosticServerName = null;
            if (ConfigurationManager.AppSettings["WMGateway.DiagnosticService"] != null) {
                diagnosticServerName = ConfigurationManager.AppSettings["WMGateway.DiagnosticService"];
            }

            // Get a  Diagnostic Service Uri from app.config
            this.diagnosticServiceUri = null;
            if (ConfigurationManager.AppSettings["WMGateway.DiagnosticServiceUri"] != null) {
                try {
                    diagnosticServiceUri = new Uri(ConfigurationManager.AppSettings["WMGateway.DiagnosticServiceUri"]);
                }
                catch {
                    diagnosticServiceUri = null;
                }
            }

        }

		/// <summary>
		/// Persist current config to registry
		/// </summary>
		private void SaveConfig()
		{
			try
			{
				RegistryKey BaseKey = Registry.CurrentUser.OpenSubKey("Software\\UWCSE\\WMGateway", true);
				if ( BaseKey == null) 
				{
					BaseKey = Registry.CurrentUser.CreateSubKey("Software\\UWCSE\\WMGateway");
				}
				BaseKey.SetValue("VenueIP",confVenue.IpEndpoint.Address.ToString());
				BaseKey.SetValue("VenuePort",confVenue.IpEndpoint.Port.ToString());
				BaseKey.SetValue("VenueName",confVenue.Name);
				BaseKey.SetValue("ArchiveMode",archiving);
				BaseKey.SetValue("ArchiveFile",archive_file);
				BaseKey.SetValue("ProfileID",WMProfile);
				BaseKey.SetValue("WMPort",wmPort);
				BaseKey.SetValue("MaxConn",wmMaxConnections);
				BaseKey.SetValue("CustomProfile",CustomProfile);
				BaseKey.SetValue("VideoVisible", videoVisible);
			}
			catch
			{
				MessageBox.Show("Exception while saving configuration.");
			}
		}


		/// <summary>
		///  Restore the user's last configuration from the registry.
		/// </summary>
		private void RestoreConfig()
		{
			// First set defaults
			archiving = false;
			archive_file = "C:\\archive.wmv";
			String myAddr = "233.31.135.34"; //Virtual Cubicle
			String myPort = "5004";
			String myVenueName = "Virtual Cubicle";
			confVenue = new UWVenue(myVenueName,new IPEndPoint(IPAddress.Parse(myAddr),Convert.ToInt32(myPort)));
			WMProfile = 10;
			CustomProfile = ""; //path to a prx file
			wmPort = 8888;
			wmMaxConnections = 5;
			videoVisible = false;

			// now get the previously configured values here, if any:			
			try
			{
				RegistryKey BaseKey = Registry.CurrentUser.OpenSubKey("Software\\UWCSE\\WMGateway", true);
				if ( BaseKey == null) 
				{ //no configuration yet.. first run.
					logger.Write("No registry configuration found.");
					return;
				}

				myAddr = Convert.ToString(BaseKey.GetValue("VenueIP",myAddr));
				myPort = Convert.ToString(BaseKey.GetValue("VenuePort",myPort));
				myVenueName = Convert.ToString(BaseKey.GetValue("VenueName",myVenueName));
				archiving = Convert.ToBoolean(BaseKey.GetValue("ArchiveMode",archiving));
				archive_file =Convert.ToString(BaseKey.GetValue("ArchiveFile",archive_file));
				WMProfile = Convert.ToInt32(BaseKey.GetValue("ProfileID", WMProfile));
				wmPort = Convert.ToUInt32(BaseKey.GetValue("WMPort", wmPort));
				wmMaxConnections = Convert.ToUInt32(BaseKey.GetValue("MaxConn", wmMaxConnections));
				CustomProfile = Convert.ToString(BaseKey.GetValue("CustomProfile", CustomProfile));
				videoVisible = Convert.ToBoolean(BaseKey.GetValue("VideoVisible",videoVisible));
			}
			catch
			{
				logger.Write("Exception while restoring configuration.");
			}
			confVenue = new UWVenue(myVenueName,new IPEndPoint(IPAddress.Parse(myAddr),Convert.ToInt32(myPort)));
		}

	
		/// <summary>
		/// Query the web service for the list of venues.
		/// </summary>
		private void GetVenueList()
		{
			Venue[]	m_sv;		//Results of webservice venue query
			try 
			{	 
				VenueService vs = new VenueService();
				vs.Timeout = 15000; //15 seconds
				m_sv = vs.GetVenues(myCname);
				UWVenue uwv;
				foreach(Venue sv in m_sv)
				{
					uwv = new UWVenue(sv);
					confVenues.Add(uwv);
					presenterVenues.Add(uwv);
				}				 
			}
			catch 
			{
				logger.Write("Failed to get venue list from Web service.");
			}
		}

		/// <summary>
		/// Get additional Presenter and conferencing venues from app.config
		/// </summary>
		private void GetAppConfigVenues()
		{
			NameValueCollection venues;
			UWVenue uwv;
			string address;
			string port;

			//presenter venues
			try 
			{
				venues = (NameValueCollection)ConfigurationManager.GetSection("presenterVenues");
				//logger.Write("found " + venues.Count.ToString() + " presenter venues.");
			}
			catch
			{
				logger.Write("Exception while parsing presenterVenues section in config file.");
				return;
			}
			foreach(string key in venues.Keys)
			{
				try 
				{
					address = (venues[key]).Substring(0,(venues[key]).IndexOf(":"));
					port = (venues[key]).Substring((venues[key]).IndexOf(":")+1);
					uwv = new UWVenue(key,new IPEndPoint(IPAddress.Parse(address),Convert.ToInt32(port)));
					presenterVenues.Add(uwv);
				}
				catch
				{
					logger.Write("Exception while parsing Presenter Venue in config file.");
				}
				
			}

			//conferencing venues
			try 
			{
				venues = (NameValueCollection)ConfigurationManager.GetSection("conferenceVenues");
				//logger.Write("found " + venues.Count.ToString() + " conference venues.");
			}
			catch
			{
				logger.Write("Exception while parsing conferenceVenues section in config file.");
				return;
			}
			foreach(string key in venues.Keys)
			{
				try 
				{
					address = (venues[key]).Substring(0,(venues[key]).IndexOf(":"));
					port = (venues[key]).Substring((venues[key]).IndexOf(":")+1);
					uwv = new UWVenue(key,new IPEndPoint(IPAddress.Parse(address),Convert.ToInt32(port)));
					confVenues.Add(uwv);
				}
				catch
				{
					logger.Write("Exception while parsing Conference Venue in config file.");
				}	
			}
		}

		/// <summary>
		/// Thread procedure in which we start the encoder.
		/// </summary>
		private void StartEncodingThread()
		{ 
			//set up the archive filename
			if (archiving) 
				archive_file = GenerateUniqueFileName(archive_file);			

			bool success = true;
			//Verify streams are valid.
			errorMsg = rtpMgr.VerifyEncodingStreams();
			if (errorMsg == "")  
			{
				mediaBuffer = new MediaBuffer(MAX_AUDIO_STREAMS);
				if (CreateGraphs())
				{
					if (CreateWMWriter())
					{
						presenterMgr.ScriptBitrate = (int)wmWriter.ScriptBitrate;
						//Debug.WriteLine("presenterMgr.ScriptBitrate=" + presenterMgr.ScriptBitrate.ToString());
						//Debug.WriteLine("wmWriter.ScriptBitrate=" + wmWriter.ScriptBitrate.ToString());
						if (ConfigureMediaBuffer())
						{
							if (Start())
							{
								rtpMgr.EnableSourceRestoredEvents(true);
								//Success!
							}
							else
							{
								success = false;
								errorMsg = "Failed to start encoding components. " + errorMsg;
							}
						}
						else
						{
							success = false;
							errorMsg = "Failed to configure media buffer.  " + errorMsg;
						}
					}
					else
					{
						success = false;
						errorMsg = "Failed to create Windows Media writer.  " + errorMsg;
					}
				}
				else
				{
					success = false;
					errorMsg = "Failed to create Filter Graphs.  " + errorMsg;
				}
			}
			else
			{
				success = false;			
				//errorMsg = errorMsg + "  Please refresh sources and try again.";
			}


			if (success)
			{
				presenterMgr.ScriptEventsEnabled = true;
				running = true;
				LoggerWriteInvoke ("Encoding successfully started.");
				LoggerWriteInvoke ("Streaming on http://localhost:" + this.wmPort.ToString());	
				if (this.archiving)
					LoggerWriteInvoke("Archiving to file: " + this.archive_file);
				if (presenterMgr.PresenterEnabled)
				{
					presenterMgr.ScriptLogWriteStartEncoding();
					if (wmWriter.ScriptBitrate < 1000)
					{
						LoggerWriteInvoke("Warning: Profile's script bitrate is too small to support Presenter data.");
					}
					else
					{
						LoggerWriteInvoke("Script bitrate: " + wmWriter.ScriptBitrate.ToString());
					}
				}
			}
			else
			{
				DisposeEncodingComponents();
				rtpMgr.UnselectEncodingStreams();
				LoggerWriteInvoke("Failed to start encoding.");			
			}
		
			//Raise event to cause UI to be updated.
			if (OnStartCompleted != null)
				OnStartCompleted();
		}


		/// <summary>
		/// Change a video source while encoding
		/// </summary>
		private void ChangeVideoThread()
		{
			//This to simulate failure for UI testing:
			//Thread.Sleep(1000);
			//if (OnChangeVideoCompleted != null)
			//	OnChangeVideoCompleted(new StringEventArgs("Testing"));
			//return;


			uint ssrc;
			string errorMsg = "";
			VideoGraphBuilder tmpVideoGraphBuilder;
			UW.CSE.MDShow.MediaType tmpVideoMediaType;
			String oldVideoCname = "";

			//Disable source restored events
			//PRI3: These events should not be disabled, but rather queued to run later.
			rtpMgr.EnableSourceRestoredEvents(false);

			foreach(String s in rtpMgr.EncodingVideoSsrcs.Keys)
			{
				oldVideoCname=s;
			}

			//Change the video running set and verify it's an active source.
			if (rtpMgr.ChangeVideoStream(this.changeVideoCname))
			{
				//Make a new video media buffer (since resolution may have changed)
				ssrc = (uint)rtpMgr.EncodingVideoSsrcs[changeVideoCname];
				int bufferIndex = mediaBuffer.CreateTempBufferIndex(changeVideoCname,PayloadType.dynamicVideo);

				RtpStream stream = rtpMgr.GetConfRtpStream(ssrc);
				if (stream==null)
				{
					errorMsg = "Failed to find video stream.";
				}
				else
				{
					errorMsg = rtpMgr.CheckForPausedStream(stream);
				}

				if (errorMsg == "")
				{
					//Build the new filtergraph
					tmpVideoGraphBuilder = new VideoGraphBuilder(mediaBuffer,bufferIndex,videoVisible);
					if (tmpVideoGraphBuilder.Build(stream))
					{
						//Configure new media buffer, start new graph, splice the new buffer in place.
						tmpVideoMediaType = tmpVideoGraphBuilder.GetMediaType();
						GC.Collect();
						try
						{
							mediaBuffer.CreateTempBuffer(bufferIndex,tmpVideoMediaType);
						}
						catch (Exception e)
						{
							if (e is OutOfMemoryException)
							{
								errorMsg = "Out of memory.";
							}
							else
							{
								errorMsg = "Exception while creating video buffer.";
							}
							tmpVideoGraphBuilder.Teardown();
							tmpVideoGraphBuilder = null;
						}
						if (errorMsg == "")
						{
							tmpVideoGraphBuilder.Run();
							errorMsg = mediaBuffer.ReplaceVideoBuffer(wmWriter);
						}
						if (errorMsg == "")
						{
							videoMediaType = tmpVideoMediaType;
							uint oldSsrc = videoGraphBuilder.Ssrc;
							videoGraphBuilder.Stop();
							videoGraphBuilder.Teardown();
							videoGraphBuilder = tmpVideoGraphBuilder;
							tmpVideoGraphBuilder = null;
							//success!!
						}
						else
						{
							tmpVideoGraphBuilder.Stop();
							tmpVideoGraphBuilder.Teardown();
							tmpVideoGraphBuilder = null;
						}
					}
					else
					{
						errorMsg = tmpVideoGraphBuilder.ErrorMsg;
						tmpVideoGraphBuilder = null;
					}
				}
			}
			else
			{ 
				errorMsg = "Video stream was not active.";
			}

			if (errorMsg != "")
			{
				errorMsg = "Failed to switch video source: " + errorMsg;
				LoggerWriteInvoke(errorMsg);
				eventLog.WriteEntry(errorMsg,EventLogEntryType.Error,1004);
				rtpMgr.ChangeVideoStream(oldVideoCname);
			}
			else
			{
				LoggerWriteInvoke("Successfully changed video source to " + changeVideoCname);
			}
			
			//Reenable source restored.
			rtpMgr.EnableSourceRestoredEvents(true);

			GC.Collect();

			//Raise an event to tell the UI we're done.
			//Pass the error message so the UI can tell whether the change succeeded or not, and the checkbox change can
			// be undone if necessary.
			if (OnChangeVideoCompleted != null)
				OnChangeVideoCompleted(new StringEventArgs(errorMsg));
		}

		/// <summary>
		/// Add or remove an audio source while encoding
		/// </summary>
		private void AddRemoveAudioThread()
		{
			//This to simulate failure for UI testing:
			//Thread.Sleep(1000);
			//if (OnAddRemoveAudioCompleted != null)
			//	OnAddRemoveAudioCompleted(new StringEventArgs("Testing"));
			//return;

			string errorMsg = "";
			string op = "";
			//Disable source restored event
			//PRI3: queue the events, don't disable them.
			rtpMgr.EnableSourceRestoredEvents(false);

			if (addRemoveAudioAdd)
			{
				errorMsg = AddAudioSource(addRemoveAudioCname);
				op = "added";
			}
			else
			{
				errorMsg = RemoveAudioSource(addRemoveAudioCname);
				op = "removed";
			}

			if (errorMsg != "")
			{
				errorMsg = "Failed to change audio source: " + errorMsg;
				LoggerWriteInvoke(errorMsg);
				eventLog.WriteEntry(errorMsg,EventLogEntryType.Error,1004);
			}
			else
			{
				LoggerWriteInvoke("Successfully " + op + " audio source " + addRemoveAudioCname);
			}
			
			//Reenable source Restored event
			rtpMgr.EnableSourceRestoredEvents(true);

			//Raise an event to tell the UI we're done.
			if (OnAddRemoveAudioCompleted != null)
				OnAddRemoveAudioCompleted(new StringEventArgs(errorMsg));
		}	

		/// <summary>
		/// Add a new audio stream while encoding.
		/// </summary>
		/// <param name="cname"></param>
		/// <returns></returns>
		private string AddAudioSource(string cname)
		{
			string errorMsg = "";
			UW.CSE.MDShow.MediaType tmpAudioMediaType;

			//	verify we are not already at the max audio streams
			if (rtpMgr.EncodingAudioSsrcs.Count == MAX_AUDIO_STREAMS)
			{
				return "Already encoding the maximum number of audio streams.";
			}

			//  verify the source is active and if so, add to running set.
			if (!rtpMgr.AddRemoveAudioStream(cname,true))
			{
				return "Source is not active.";
			}

			uint ssrc = (uint)rtpMgr.EncodingAudioSsrcs[cname];

			RtpStream stream = rtpMgr.GetConfRtpStream(ssrc);
			if (stream==null)
			{
				errorMsg = "Failed to find stream.";
			}
			else
			{
				errorMsg = rtpMgr.CheckForPausedStream(stream);
			}

			if (errorMsg != "")
			{
				rtpMgr.AddRemoveAudioStream(cname,false);
				return errorMsg;	
			}

			//  get a temp media buffer index.
			int bufferIndex = mediaBuffer.CreateTempBufferIndex(cname,PayloadType.dynamicAudio);

			//Build the new filtergraph
			AudioGraphBuilder tmpAudioGraphBuilder = new AudioGraphBuilder(mediaBuffer,bufferIndex,audioMuted);

			if (!tmpAudioGraphBuilder.Build(stream))
			{
				rtpMgr.AddRemoveAudioStream(cname,false);
				return tmpAudioGraphBuilder.ErrorMsg;
			}

			//Get the new media type.
			tmpAudioMediaType = tmpAudioGraphBuilder.GetMediaType();
			
			//Verify media type is consistent with the rest.
			if (!CompareAudioMediaTypes(tmpAudioMediaType,audioMediaType))
			{
				tmpAudioGraphBuilder.Teardown();
				rtpMgr.AddRemoveAudioStream(cname,false);
				return "Incompatible audio media type.";
			}

			//Create/configure temp audio media buffer
			mediaBuffer.CreateTempBuffer(bufferIndex,tmpAudioMediaType);

			//Start buffering.  When samples have been received, add to the buffer collection.
			tmpAudioGraphBuilder.Run();
			errorMsg = mediaBuffer.AddAudioBuffer();
			if (errorMsg == "")
			{
				//add tmpAudioGraphBuilder to the collection.
				audioGraphBuilders.Add(tmpAudioGraphBuilder);
				//success!!
			}
			else
			{
				tmpAudioGraphBuilder.Stop();
				tmpAudioGraphBuilder.Teardown();
				tmpAudioGraphBuilder = null;
				rtpMgr.AddRemoveAudioStream(cname,false);
			}

			return errorMsg;
		}

		/// <summary>
		/// Remove an audio stream while encoding.
		/// </summary>
		/// <param name="cname"></param>
		/// <returns></returns>
		private string RemoveAudioSource(string cname)
		{
			string errorMsg = "";
			uint ssrc;
			//	verify there are at least two audio sources of which cname is one.
			if (rtpMgr.EncodingAudioSsrcs.Count > 1)
			{
				if (rtpMgr.EncodingAudioSsrcs.ContainsKey(cname))
				{
					ssrc = (uint)rtpMgr.EncodingAudioSsrcs[cname];
					//  remove from running set
					rtpMgr.AddRemoveAudioStream(cname,false);
					//  remove media buffer
					if (mediaBuffer.RemoveAudioBuffer(cname))
					{
						//	teardown/dispose graph	
						lock (this)
						{
							foreach (AudioGraphBuilder agb in audioGraphBuilders)
							{
								if (agb.Ssrc == ssrc)
								{
									agb.Stop();
									agb.Teardown();
									audioGraphBuilders.Remove(agb);
									break;
								}
							}
						}
					}
					else
					{
						errorMsg = "Buffer not found.";
					}
				}
				else
				{
					errorMsg = "Stream not found.";
				}
			}
			else
			{
				errorMsg = "Cannot remove the last audio stream.";
			}
			return errorMsg;
		}

		/// <summary>
		/// Create the Windows Media Writer and configure its network parameters, archive file,
		/// encoding profile and audio and video media types.
		/// </summary>
		/// <returns></returns>
		private bool CreateWMWriter()
		{

			//Give wmWriter a pointer to the media buffer so that it can receive sample events.
			wmWriter = new WMWriter(mediaBuffer);

			if (!wmWriter.Init())
			{
				errorMsg = "Failed to initialize Windows Media writer.";
				wmWriter.Cleanup();
				wmWriter=null;
				return false;			
			}

			if (archiving)
			{
				if (!wmWriter.ConfigFile(this.archive_file))
				{
					errorMsg = "Failed to initialize Windows Media file writer.";
					wmWriter.Cleanup();
					wmWriter=null;
					return false;						
				}
			}

			if (!wmWriter.ConfigNet(this.wmPort,this.wmMaxConnections))
			{
				errorMsg = "Failed to initialize Windows Media network writer.";
				wmWriter.Cleanup();
				wmWriter=null;
				return false;						
			}

			if (!wmWriter.ConfigProfile(this.CustomProfile,(uint)this.WMProfile))
			{
				errorMsg = "Failed to configure Windows Media profile.";
				wmWriter.Cleanup();
				wmWriter=null;
				return false;						
			}

			if (!wmWriter.ConfigVideo(videoMediaType)) 
			{
				errorMsg = "Failed to configure Windows Media video media type.";
				wmWriter.Cleanup();
				wmWriter=null;
				return false;						
			}
			if (!wmWriter.ConfigAudio(audioMediaType)) 
			{
				errorMsg = "Failed to configure Windows Media audio media type.";
				wmWriter.Cleanup();
				wmWriter=null;
				return false;						
			}

			return true;
		}


		/// <summary>
		/// Retrieve the mediatype structs from each graph.  We can only return one audio MediaType, so 
		/// if there are multiple audio graphs, we need to verify that the types are close enough to the same.
		/// </summary>
		/// <returns></returns>
		private bool GetMediaTypes()
		{
			errorMsg = "";
			if (videoGraphBuilder != null)
			{
				videoMediaType = videoGraphBuilder.GetMediaType();
			}
			else
			{
				errorMsg = "Video Graph unavailable.";
				return false;
			}

			UW.CSE.MDShow.MediaType mt, lastmt;
			mt = lastmt = null;
			if (audioGraphBuilders != null)
			{
				if (audioGraphBuilders.Count == 1)
				{
					audioMediaType = ((AudioGraphBuilder)audioGraphBuilders[0]).GetMediaType();
                    mediaBuffer.RegisterAudioMediaType(audioMediaType, ((AudioGraphBuilder)audioGraphBuilders[0]).Index);
				}
				else
				{
					lock (this)
					{
						foreach (AudioGraphBuilder agb in audioGraphBuilders)
						{
							mt = agb.GetMediaType();
                            mediaBuffer.RegisterAudioMediaType(mt, agb.Index);

							if (!CompareAudioMediaTypes(mt,lastmt))
							{
								/// Not sure if this will ever happen, but if it does, the simple audio
								/// mixing we use will not work.
								eventLog.WriteEntry("Two selected audio media types differ in such a way that audio mixing will not work.", EventLogEntryType.Error, 1004);
								errorMsg = "Audio Media Types differ substantially.";
								return false;
							}
							else
							{
								lastmt = mt;
							}
						}
					}
					audioMediaType = mt;
				}
			}
			else
			{
				errorMsg = "Audio graphs unavailable.";
				return false;
			}

			return true;
		}

		/// <summary>
		/// Compare two audio media types to verify compatibility with our audio mixing
		/// algorithm.  To date, I have never seen this return false, but we should 
		/// continue to check anyway.
		/// </summary>
		/// <param name="mt1"></param>
		/// <param name="mt2"></param>
		/// <returns></returns>
		private bool CompareAudioMediaTypes(UW.CSE.MDShow.MediaType mt1, UW.CSE.MDShow.MediaType mt2)
		{
			if ((mt1 == null) || (mt2 == null))
				return true;  //one of them is unassigned.

			UW.CSE.MDShow.MediaTypeWaveFormatEx wfe1 = mt1.ToMediaTypeWaveFormatEx();
			UW.CSE.MDShow.MediaTypeWaveFormatEx wfe2 = mt2.ToMediaTypeWaveFormatEx();
			
			if ((mt1.MajorType == mt2.MajorType) &&
				(mt1.SubType == mt2.SubType) &&
				(wfe1.WaveFormatEx.SamplesPerSec == wfe2.WaveFormatEx.SamplesPerSec) &&
				(wfe1.WaveFormatEx.BitsPerSample == wfe2.WaveFormatEx.BitsPerSample))
				return true;

			return false;
		}


		/// <summary>
		/// Configure MediaBuffer with DirectShow media type info 
		/// while starting a new encoding job.
		/// </summary>
		/// <returns></returns>
		private bool ConfigureMediaBuffer()
		{
			mediaBuffer.SetMediaTypes(audioMediaType,videoMediaType);
			try
			{
				if(!mediaBuffer.CreateBuffers())
				{
					errorMsg = "Failed to create buffers.";
					return false;
				}
			}
			catch (Exception e)
			{
				if (e is OutOfMemoryException)
				{
					errorMsg = "Failed to create buffers: Out of memory.";
				}
				else
				{
					errorMsg = "Failed to create buffers: " + e.ToString();
				}
				return false;
			}
			return true;
		}

		/// <summary>
		/// Start the Filter Graphs, WMWriter and MediaBuffer.  
		/// If any of the starts fail, all components are returned to the stopped state.
		/// </summary>
		/// <returns></returns>
		private bool Start()
		{
			bool success = true;

			if (StartFilterGraphs())
			{
				if (wmWriter.Start())
				{
					if (mediaBuffer.Start())
					{
						//success
					}
					else
					{
						wmWriter.Stop();
						StopFilterGraphs();
						errorMsg = "Failed to start Media Buffer.";
						success = false;
					}
				}
				else
				{
					StopFilterGraphs();
					errorMsg = "Failed to start Windows Media writer.";
					success = false;
				}
			}
			else
			{
				StopFilterGraphs();
				success = false;
				errorMsg = "Failed to start filter graphs.";
			}

			return success;
		}

		/// <summary>
		/// Clean up when encoding fails to start, or after encoding ends.  
		/// Dispose MediaBuffer, WMWriter, Teardown filter graphs.
		/// </summary>
		private void DisposeEncodingComponents()
		{
			if (mediaBuffer != null)
			{
				mediaBuffer.Dispose();
				mediaBuffer = null;
			}
			if (wmWriter != null)
			{
				wmWriter.Cleanup();
				wmWriter = null;
			}
			if (videoGraphBuilder != null)
			{
				videoGraphBuilder.Teardown();
				videoGraphBuilder = null;
			}
			if (audioGraphBuilders != null)
			{
				foreach (AudioGraphBuilder agb in audioGraphBuilders)
				{
					agb.Teardown();
				}
				audioGraphBuilders = null;
			}
		}

		/// <summary>
		/// Thread in which we stop the encoding job.
		/// </summary>
		/// <param name="o"></param>
		private void StopEncodingThread()
		{
			if (running)
			{
				StopEncoding();
			}
			//Raise event to update UI.
			if (OnStopCompleted != null)
				OnStopCompleted();
		}

		/// <summary>
		/// Stop and dispose encoding components in sequence.  Call from UI and possibly by Dispose.
		/// </summary>
		private void StopEncoding()
		{
			running = false;

			//disable SourceRestored events
			rtpMgr.EnableSourceRestoredEvents(false);

			//tell presenterMgr that we have stopped -- stop sending script events
			presenterMgr.ScriptEventsEnabled = false;

			rtpMgr.UnselectEncodingStreams(); 

			mediaBuffer.Stop(); //stop sending samples to wmwriter
			wmWriter.Stop(); //stop encoding.

			StopFilterGraphs(); 
			DisposeEncodingComponents();

			/// PRI3: Even with the explicit collect, garbage collector seems to take too long
			/// releasing all the memory.  Is there a reference whose release should be made explicit somewhere? 
			GC.Collect(); 

			LoggerWriteInvoke("Encoding ended.");
		}

		/// <summary>
		/// Call the Run method on all filtergraphs.
		/// </summary>
		private bool StartFilterGraphs()
		{
			if ((videoGraphBuilder == null) || (audioGraphBuilders == null))
				return false;

			if (!videoGraphBuilder.Run())
				return false;

			foreach (AudioGraphBuilder agb in audioGraphBuilders)
			{
				if (!agb.Run())
					return false;
			}
			return true;
		}
		

		/// <summary>
		/// Call the Stop method on all filtergraphs.
		/// </summary>
		private void StopFilterGraphs()
		{
			if (videoGraphBuilder != null)
			{
				videoGraphBuilder.Stop();
			}

			if (audioGraphBuilders != null)
			{
				foreach (AudioGraphBuilder agb in audioGraphBuilders)
				{
					agb.Stop();
				}
			}
		}

		/// <summary>
		/// Make a unique file name by adding or incrementing a numeral on the root part.  
		/// If the input names a file
		/// that does not exist, just return it.
		/// </summary>
		/// <param name="rawname">user-supplied input</param>
		/// <returns>unique file name</returns>
		private string GenerateUniqueFileName(string rawname)
		{
			FileInfo fi = new FileInfo(rawname);
			if (!fi.Exists) 
				return rawname;

			string root, extent;
			int num;
			string left, right;

			if (rawname.LastIndexOf(".") <= 0)
			{
				root = rawname;
				extent = ".wmv";
			}
			else
			{
				root = rawname.Substring(0,rawname.LastIndexOf("."));
				extent = rawname.Substring(rawname.LastIndexOf("."));
			}

			Regex re = new Regex("^(.*?)([0-9]*)$");
			Match match = re.Match(root); 
			if (match.Success)
			{
				left = match.Result("$1");
				right = match.Result("$2");
				if (right != "")
					num = Convert.ToInt32(right);
				else
					num=0;
			}
			else
			{
				num = 0;
				left = root;
			}
			num++;

			while (true)
			{
				fi = new FileInfo(left + num.ToString() + extent);
				if (!fi.Exists)
					break;
				else
					num++;
			}

			return left + num.ToString() + extent;
		}

		/// <summary>
		/// Handle PresenterManager event.  Custom script ready to be sent to encoder.
		/// </summary>
		/// <param name="sea"></param>
		private void SendRawScript(ScriptEventArgs sea)
		{
			if (running)
			{
				wmWriter.SendScript(sea.type,sea.data,true);
			}
		}

		/// <summary>
		/// Handle PresenterManager event.  URL script ready to be sent to encoder.
		/// </summary>
		/// <param name="sea"></param>
		private void SendUrlScript(ScriptEventArgs sea)
		{
			if (running)
			{
				wmWriter.SendScript(sea.type,sea.data,false);
			}
		}


		private delegate void LoggerWriteDelegate(string msg);		
		private void LoggerWrite(string msg)
		{
			logger.Write(msg);
		}

		/// <summary>
		/// Write a log message on the main form thread.
		/// </summary>
		/// <param name="msg"></param>
		private void LoggerWriteInvoke(string msg)
		{
			try
			{
				parent.Invoke(new LoggerWriteDelegate(LoggerWrite), new object[] {msg});
			}
			catch 
			{
				//can throw an exception when the window handle doesn't exist
				// (during startup and shutdown.)
			}
		}

		private delegate void LoggerFlushDelegate();		
		private void LoggerFlush()
		{
			logger.Flush();
		}

		/// <summary>
		/// Write a log message on the main form thread.
		/// </summary>
		/// <param name="msg"></param>
		private void LoggerFlushInvoke()
		{
			try
			{
				parent.Invoke(new LoggerFlushDelegate(LoggerFlush));
			}
			catch 
			{
				//can throw an exception when the window handle doesn't exist
				// (during startup and shutdown.)
			}
		}

		
		/// <summary>
		/// Run stream restart on the main form thread. Obsolete.
		/// </summary>
		/// This is called when the maintenance thread detects a problem with a stream.
		/// <param name="ssrc"></param>
		private void AutoRestartStream(uint ssrc, PayloadType payload)
		{
			Debug.WriteLine("AutoRestartStream: ssrc=" + ssrc.ToString() + " payload=" + payload.ToString());
			/// Note: restarting an individual video graph results in about 3 times too many samples 
			/// for the first 6 or so seconds.  The stream is much smoother
			/// if we just restart the listener.  In the case of audio, just rebuild the one graph. 
			if (payload == PayloadType.dynamicVideo)
			{
				//if (!rtpMgr.RestartListener(true))
				//{
				//	LoggerWriteInvoke("Failed to restart RtpSession.  See event log for details.");
				//}

				//if (!videoGraphBuilder.Restart(ssrc))
				//	LoggerWriteInvoke("Video Graph Restart Failed." + videoGraphBuilder.ErrorMsg);	
			}
			else if (payload == PayloadType.dynamicAudio)
			{
				RtpStream stream = rtpMgr.GetConfRtpStream(ssrc);
				if (stream==null)
				{
					Debug.WriteLine("Failed to find audio stream.");
					return;
				}

				lock (this)
				{
					foreach (AudioGraphBuilder agb in audioGraphBuilders)
					{
						if (agb.Ssrc == ssrc)
						{
							//if (!agb.Restart(stream))
							//	logger.Write("Audio Graph Restart Failed. " + agb.ErrorMsg);	
							break;
						}
					}
				}
			}
		}

		private delegate void AutoRestartDelegate(uint ssrc, PayloadType payload);


		/// <summary>
		/// Look for paused or stuck streams and issue warnings as appropriate.
		/// </summary>
		/// <param name="cname"></param>
		/// <param name="ssrc"></param>
		/// <param name="payload"></param>
		private void CheckReportStream(String cname, uint ssrc, PayloadType payload)
		{
			if (!rtpMgr.KnownToConferenceListener(ssrc))
			{
				//Debug.WriteLine("CheckRestartStream: ssrc is unknown to conference listener.");
				//This happens if someone left the venue.  Don't warn in this case.
				return;
			}
			ulong stopTime = 0;  //milliseconds since data was received from the graph
			TimeSpan timeSinceReport; //time since most recent report or Stream Restored event
			stopTime = mediaBuffer.GetStreamStopTime(cname,payload);
			lock (rptTimer)
			{
				timeSinceReport = DateTime.Now - rptTimer.GetReportTime(cname,payload.ToString());
				//Compare stopTime to a value greater than zero to prevent spurious warnings just after someone
				// left the venue.  We also call SetReportTime in the ConfStreamRestored event handler to 
				// prevent spurious warnings just after someone returned to the venue but before the bits start
				// flowing again.
				if ((stopTime > 500) && (timeSinceReport  > ReportTimer.ReportThreshold))
				{
					rptTimer.SetReportTime(cname,payload.ToString()); 
					LoggerWriteInvoke ("Warning: Stream paused or stuck: " + cname + 
						":" + payload.ToString() + ".");
					//parent.Invoke(new AutoRestartDelegate(AutoRestartStream), new object[] {ssrc,payload});
				}
			}

			if (stopTime==0)
			{
				rptTimer.ResetReportTime(cname,payload.ToString());
			}
		}


		/// <summary>
		/// This is called by the maintenance thread once every 10 seconds to see if any streams are
		/// no longer delivering data to the filter graph.  If they are, the most likely cause is
		/// that they were paused.  
		/// Iterate over the set of sources which the RtpManager thinks we are encoding.
		/// Check each one against the RtpListener to make sure it is still known, and 
		/// against MediaBuffer to make sure samples are being received.
		/// If samples are not currently being received, write a warning to indicate
		/// that the stream appears to be paused.  Repeat the warning about every minute or so. 
		/// </summary>
		private void checkStreamStatus()
		{
			Hashtable audioStreams;
			Hashtable videoStreams;
			if (running)
			{
				audioStreams = rtpMgr.EncodingAudioSsrcs;
				videoStreams = rtpMgr.EncodingVideoSsrcs;
				foreach (DictionaryEntry de in audioStreams)
				{
					CheckReportStream((String)de.Key,(uint)de.Value,PayloadType.dynamicAudio);
				}
				foreach (DictionaryEntry de in videoStreams)
				{
					CheckReportStream((String)de.Key,(uint)de.Value,PayloadType.dynamicVideo);
				}

			}
		}

		//Do various maintenance tasks.
		private void MaintenanceThread()
		{
			string mem;

			while (true)
			{
				checkStreamStatus();
				LoggerFlushInvoke();
				//Check for other pathological conditions.  These *should* never happen.
				//LoggerWriteInvoke("Free memory=" + GetFreePhysicalMemory());
				if (running)
				{
					if (mediaBuffer.VideoBufferOverrun)
					{
						mem = GetFreePhysicalMemory();
						LoggerWriteInvoke("Warning: Video buffer overrun detected. Free Physical Memory=" + mem + "KB");
						eventLog.WriteEntry("Video buffer overrun detected. Free Physical Memory=" + mem + "KB",EventLogEntryType.Error,1004);
					}
				}
				
				Thread.Sleep(10000);
			}
		}

		private string GetFreePhysicalMemory()
		{
			string result = "unknown";
			try
			{
				ManagementClass myMC = new ManagementClass("Win32_OperatingSystem");
				ManagementObjectCollection myOC = myMC.GetInstances();
				foreach(ManagementObject mo in myOC)
				{
					PropertyData pd = mo.Properties["FreePhysicalMemory"];
					if ((pd != null) && (pd.Value != null))
						return pd.Value.ToString();
				}
			}
			catch {}
			return result;
		}

		/// <summary>
		/// Create GraphBuilders and build graphs for each source in RtpManager's running set.  Also
		/// retrieve the connected audio and video media types from the filter graphs.
		/// </summary>
		/// <returns></returns>
		private bool CreateGraphs()
		{
			audioGraphBuilders = new ArrayList();
			uint ssrc = 0;
			String videoCname = "";
			foreach (String cname in rtpMgr.EncodingVideoSsrcs.Keys) 
			{
				videoCname = cname;
				ssrc = (uint)rtpMgr.EncodingVideoSsrcs[cname];
			}
			//assume only one video graph for now.
			int bufferIndex = mediaBuffer.CreateBufferIndex(videoCname,PayloadType.dynamicVideo);
			videoGraphBuilder = new VideoGraphBuilder(mediaBuffer,bufferIndex,videoVisible);

			RtpStream stream = rtpMgr.GetConfRtpStream(ssrc);
			if (stream==null)
			{
				Debug.WriteLine("Failed to find stream.");
				return false;
			}

			if (!videoGraphBuilder.Build(stream))
			{
				errorMsg = videoGraphBuilder.ErrorMsg;
				videoGraphBuilder = null;
				return false;
			}

			AudioGraphBuilder agb;

			foreach (String cname in rtpMgr.EncodingAudioSsrcs.Keys)
			{
				ssrc = (uint)rtpMgr.EncodingAudioSsrcs[cname];
				bufferIndex = mediaBuffer.CreateBufferIndex(cname,PayloadType.dynamicAudio);
				agb = new AudioGraphBuilder(mediaBuffer,bufferIndex,audioMuted);

				stream = rtpMgr.GetConfRtpStream(ssrc);
				if (stream==null)
				{
					Debug.WriteLine("Failed to find stream.");
					return false;
				}

				if (!agb.Build(stream))
				{
					errorMsg = agb.ErrorMsg;
					audioGraphBuilders.Clear();
					audioGraphBuilders = null;
					videoGraphBuilder = null;
					return false;
				}
				audioGraphBuilders.Add(agb);
			}

			if (!GetMediaTypes())
			{
				audioGraphBuilders.Clear();
				audioGraphBuilders = null;
				videoGraphBuilder = null;
				errorMsg = "Failed to get DirectShow media types." + errorMsg;
				return false;
			}

			return true;
		}


		/// <summary>
		/// Set reflector properties from values found in registry
		/// </summary>
		private void SetReflectorService()
		{       
			if (rtpMgr == null)
			{
				eventLog.WriteEntry("Failed to set ReflectorService Parameters.",EventLogEntryType.Error);
				return;
			}
			string[] names = reflectorsRegKey.GetValueNames(); 
			rtpMgr.ReflectorEnabled = false;

			if (names != null)
			{
				foreach (string key in names)
				{
					if (bool.Parse((string) reflectorsRegKey.GetValue(key)))
					{
						try
						{
							rtpMgr.ReflectorEnabled = true;
							rtpMgr.ReflectorAddress = key.Substring(0,key.LastIndexOf(":")); // strip off the port number
							rtpMgr.ReflectorPort = int.Parse(key.Substring(key.LastIndexOf(":")+1));   
							break;
						}
						catch
						{
							rtpMgr.ReflectorEnabled = false;
							rtpMgr.ReflectorAddress = "";
							rtpMgr.ReflectorPort = 0;     
							Debug.WriteLine("Failed to parse reflector service registry entry.");
						}
					} 
				}                           
			}
		}

		#endregion
		#region Public Methods

		/// <summary>
		/// Note any changes to the reflectorService and restart RtpSessions.
		/// </summary>
		public void ChangeReflectorService()
		{
			SetReflectorService();
			if (!rtpMgr.RestartAllSessions())
			{
				MessageBox.Show("Failed to start RtpSession.  Verify reflector server parameters. See event log for details.");
			}
		}


		/// <summary>
		/// User changed the Presenter Venue
		/// </summary>
		/// <param name="venue"></param>
		public void ChangePresenterVenue(UWVenue venue)
		{
			Debug.WriteLine("ChangePresenterVenue: " + venue.Name);

			if ((venue == null) ||(venue.Equals(presenterMgr.PresenterVenue)))
				return;

			if (!presenterMgr.ChangeVenue(venue))
			{
				logger.Write("Failed to restart RtpSession.  See event log for details.");
			}

		}
	
		/// <summary>
		/// User turned on or off Presenter Integration.
		/// This also happens right after app starts with Presenter enabled.
		/// </summary>
		/// <param name="enable"></param>
		public void SetPresenterIntegration(bool enable)
		{
			presenterMgr.SetPresenterIntegration(enable);
		}

		/// <summary>
		/// User changed the conferencing venue
		/// </summary>
		/// <param name="venue"></param>
		public void ChangeConferencingVenue(UWVenue venue)
		{
			Debug.WriteLine("ChangeConferencingVenue:" + venue.Name);
			if (confVenue.Equals(venue))
				return;

			confVenue = venue;
			if (!rtpMgr.ChangeVenue(venue,true))
			{
				logger.Write("Failed to restart RtpSession.  See event log for details.");
			}
		}

		/// <summary>
		/// User clicked the 'get statistics' button
		/// </summary>
		public void GetEncodeStatus()
		{
			if (running)
			{
				ulong fr;
				double et;
				et = mediaBuffer.EncodeTime;
				logger.Write("Elapsed encoding time (seconds): " + et.ToString("N"));
				Hashtable audioStreams = rtpMgr.EncodingAudioSsrcs;
				Hashtable videoStreams = rtpMgr.EncodingVideoSsrcs;
				ulong stoptime;
				ulong bytesbuffered;
				foreach (DictionaryEntry de in audioStreams)
				{
					stoptime = mediaBuffer.GetStreamStopTime((String)de.Key,PayloadType.dynamicAudio);
					bytesbuffered = mediaBuffer.GetBytesBuffered((String)de.Key);
                    string bufferStats = mediaBuffer.GetAudioStreamStats((string)de.Key);
					logger.Write("Audio stoptime=" + stoptime.ToString() + ";" + bufferStats + ";From:" +(String)de.Key);
					if (!rtpMgr.KnownToConferenceListener((uint)de.Value))
					{
						logger.Write("Audio from " + (String)de.Key + " is unknown to the RtpListener.");
					}

				}
				foreach (DictionaryEntry de in videoStreams)
				{
					stoptime = mediaBuffer.GetStreamStopTime((String)de.Key,PayloadType.dynamicVideo);
					logger.Write("Video stoptime=" + stoptime.ToString() + "; From:" + (String)de.Key );
					if (!rtpMgr.KnownToConferenceListener((uint)de.Value))
					{
						logger.Write("Video from " + (String)de.Key + " is unknown to the RtpListener.");
					}
				}
				fr = mediaBuffer.VideoFramesReceived;
				double fps = fr;
				double videoBufferTime = mediaBuffer.VideoBufferTime;
				fps = fps/videoBufferTime;
				logger.Write("Video Frames received: " + fr.ToString() + " (" + fps.ToString("N") + "/sec)");
				logger.Write("Video Frames faked: " + mediaBuffer.VideoFramesFaked.ToString());
				logger.Write("Current video frames buffered: " + mediaBuffer.CurrentVideoFramesInBuffer.ToString());
				
			} 
			else
			{
				logger.Write ("Not encoding.");

			}

			//Show Presenter stats even if not encoding.
			if (presenterMgr.PresenterEnabled)
			{
				logger.Write("Presenter script stream bitrate: " + presenterMgr.ScriptBitrate.ToString());
				logger.Write("Current Presenter source: " + presenterMgr.CurrentInstructorCname);
			}
			else
			{
				logger.Write("Presenter Listener Disabled.");
			}

		}


		/// <summary>
		/// Restart conferencing listener in response to user clicking the refresh button
		/// </summary>
		public void RestartListeners()
		{
			if (!rtpMgr.RestartListener(true))
			{
				logger.Write("Failed to restart RtpSession.  See event log for details.");
			}
		}

		/// <summary>
		/// User changed the Mute/unmute local audio device checkbox.
		/// </summary>
		/// <param name="mute"></param>
		public void MuteAudio(bool mute)
		{
			if (mute == this.audioMuted)
				return;

			this.audioMuted = mute;

			if (running) 
			{
				if (audioGraphBuilders != null)
				{
					lock (this)
					{
						foreach (AudioGraphBuilder agb in audioGraphBuilders)
						{
							agb.SetMute(audioMuted);
						}
					}
				}
			}
		}


		/// <summary>
		/// User changed the Show/hide video window checkbox.
		/// </summary>
		/// <param name="show"></param>
		public void ShowVideo(bool show)
		{
			if (this.videoVisible == show)
				return;

			this.videoVisible = show;

			if (running)
			{
				if (videoGraphBuilder != null)
				{
					videoGraphBuilder.SetVisible(videoVisible);
				}
			}
		}
		
		/// <summary>
		/// User clicked the select presenter source button.  Put up a dialog
		/// to allow the user to select an instructor node.
		/// </summary>
		public void SelectPresenter()
		{
			presenterMgr.SelectPresenter();
		}

				
		/// <summary>
		/// User Clicked the configure conferencing button
		/// </summary>
		/// return the venue only if the conferencing venue changed.
		public UWVenue ConfigConferencing()
		{
			String myAddr = confVenue.IpEndpoint.Address.ToString();
			String myPort = confVenue.IpEndpoint.Port.ToString();
			ConfigForm frmConfig = new ConfigForm();	
			UWVenue ret = null;
			frmConfig.txtAddr.Text = myAddr;
			frmConfig.txtPort.Text = myPort;
			frmConfig.ID = WMProfile;
			frmConfig.Path = CustomProfile;
			frmConfig.SetDefaultProfile();
			frmConfig.textBoxFile.Text = archive_file;
			frmConfig.txtWMPort.Text = wmPort.ToString();
			frmConfig.txtMaxConn.Text = wmMaxConnections.ToString();

			if (archiving) 
			{
				frmConfig.checkBoxArchive.Checked = true;
			} 
			else 
			{
				frmConfig.checkBoxArchive.Checked = false;
			}
			if (frmConfig.ShowDialog(parent) == DialogResult.OK ) 
			{
				if ((myAddr != frmConfig.txtAddr.Text) ||
					(myPort != frmConfig.txtPort.Text))
				{
					myAddr = frmConfig.txtAddr.Text;
					myPort = frmConfig.txtPort.Text;
					//Note: these inputs are validated in frmConfig.
					ret = new UWVenue("Custom Venue",new IPEndPoint(IPAddress.Parse(myAddr),Convert.ToInt32(myPort)));
				}
				WMProfile = frmConfig.ID;
				CustomProfile = frmConfig.Path;
				archiving = frmConfig.checkBoxArchive.Checked;
				archive_file = frmConfig.textBoxFile.Text;
				wmPort = Convert.ToUInt32(frmConfig.txtWMPort.Text); //pre-validated by the form.
				wmMaxConnections = Convert.ToUInt32(frmConfig.txtMaxConn.Text);		 // ..ditto..		
			}
			frmConfig.Dispose();
			return ret;
		}

		/// <summary>
		/// User clicked the configure Presenter button
		/// </summary>
		/// <returns></returns>
		public UWVenue ConfigPresenter()
		{
			return presenterMgr.ConfigPresenter();
		}


		/// <summary>
		///  User clicked the start encoding button.  Assume we have already verified that
		///  appropriate audio and video sources seem to be checked.
		/// </summary>
		/// <param name="audioCnames"></param>
		/// <param name="videoCname"></param>
		public bool AsyncStart(ArrayList audioCnames, ArrayList videoCnames )
		{
			//Let the RtpManager keep track of the streams:
			if (!rtpMgr.SelectEncodingStreams(audioCnames, videoCnames))
				return false;

			//Start the encoding job in this thread:
			workThread = new Thread(new ThreadStart(StartEncodingThread));
			workThread.Name = "Start Encoding Thread";
            workThread.TrySetApartmentState(ApartmentState.MTA); //Needed for WM interop
			workThread.Start();

			return true;
		}

		/// <summary>
		/// User clicked the stop encoding button.
		/// </summary>
		public bool AsyncStop()
		{
			if (running)
			{
				workThread = new Thread(new ThreadStart(StopEncodingThread));
				workThread.Name = "Stop Encoding Thread";
                workThread.TrySetApartmentState(ApartmentState.MTA); //Needed for WM interop
				workThread.Start();
			}
			else
				return false;
			return true;
		}

		/// <summary>
		/// Respond to UI clicks on the video CheckedListBox while encoding.
		/// Note that cname is not guaranteed to have changed.  If the user clicks
		/// on the currently selected source, we still get called, but we
		/// should do nothing in this case and return false.
		/// The UI only allows one video source at a time to be selected.
		/// Return true if UI should wait for source to be changed.  False
		/// if there is no change.
		/// </summary>
		/// <param name="cname"></param>
		public bool AsyncChangeVideoSource(string cname)
		{
			if (!rtpMgr.EncodingVideoSsrcs.ContainsKey(cname))
			{
				Debug.WriteLine("AsyncChangeVideoSource:Cname changed. cname=" + cname);
				//Avoid the hassle of passsing args to the thread by using member variables.
				//Assert that it is safe to do this because there will never be more than one of
				//these running at a time.
				changeVideoCname = cname;

				Thread changeVideoThread = new Thread(new ThreadStart(ChangeVideoThread));
				changeVideoThread.Name = "Change Video Source Thread";
                changeVideoThread.TrySetApartmentState(ApartmentState.MTA); //Needed for WM interop
				changeVideoThread.Start();

				return true;
			}
			return false;
		}

		/// <summary>
		/// Respond to UI clicks on the audio CheckedListBox while encoding.
		/// The UI requires at least one source to be selected, so this could
		/// be an add or a remove.  It is not guaranteed to be any change at all.
		/// If the user clicks on the only item selected, we still get called,
		/// but we should do nothing and return false.
		/// Return true if the UI should wait for a source to change, false if there
		/// is no change.
		/// </summary>
		/// <param name="cname"></param>
		/// <param name="add"></param>
		public bool AsyncAddRemoveAudioSource(string cname, bool add)
		{
			bool exists = rtpMgr.EncodingAudioSsrcs.ContainsKey(cname);
			if ((exists && !add) || (!exists && add))
			{
				//Avoid the hassle of passsing args to the thread by using member variables.
				//Assert that it is safe to do this because there will never be more than one of
				//these running at a time.
				addRemoveAudioCname = cname;
				addRemoveAudioAdd = add;
				Debug.WriteLine("AsyncAddRemoveAudioSource: cname=" + cname + " add=" + add.ToString());
				Thread changeAudioThread = new Thread(new ThreadStart(AddRemoveAudioThread));
				changeAudioThread.Name = "Change Audio Source Thread";
                changeAudioThread.TrySetApartmentState(ApartmentState.MTA); //Needed for WM interop
                changeAudioThread.Start();
				return true;
			}
			return false;
		}

        /// <summary>
        /// If the venue password is valid, update the venue record with the true multicast address,
        /// and return true.  Otherwise, return false.
        /// </summary>
        /// <param name="password"></param>
        /// <param name="newVenue"></param>
        /// <returns></returns>
        internal bool ResolvePassword(string password, UWVenue venue) {
            VenueService vs = new VenueService();
            vs.Timeout = 15000; //15 seconds
            byte[] passwordHash = PasswordHasher.getInstance().HashPassword(password);

            Venue retVal = vs.GetVenueWithPassword(venue.Identifier, passwordHash);
            if (retVal == null || retVal.IPAddress == null || retVal.IPAddress.Equals(IPAddress.None)) {
                return false;
            }
            else {
                //update venue; 
                venue.IpEndpoint = new IPEndPoint(IPAddress.Parse(retVal.IPAddress), retVal.Port);
                venue.PasswordResolved = true;
                return true;
            }
        }

        internal string GetDiagnosticWebQuery() {
            if (this.diagnosticServiceUri == null) {
                return null;
            }
            string webQuery = this.diagnosticServiceUri.ToString();

            //Add a query string to cause the default view to go to the current venue.
            string venueMoniker = this.confVenue.Name + "#" + this.confVenue.IpEndpoint.Address.ToString();
            webQuery += "?venue=" + System.Net.WebUtility.HtmlEncode(venueMoniker);
            return webQuery;
        }
		#endregion
		#region Events

		/// <summary>
		/// AsyncStart is completed.
		/// </summary>
		public event startCompletedHandler OnStartCompleted;
		public delegate void startCompletedHandler();

		/// <summary>
		/// AsyncStop is completed.
		/// </summary>
		public event stopCompletedHandler OnStopCompleted;
		public delegate void stopCompletedHandler();

		/// <summary>
		/// Tell the UI when conferencing streams come and go.
		/// </summary>
		public static event streamAddRemoveHandler OnStreamAddRemove;
		public delegate void streamAddRemoveHandler(StreamAddRemoveEventArgs ea);

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
		/// Change Video source while encoding completed
		/// </summary>
		public event changeVideoCompletedHandler OnChangeVideoCompleted;
		public delegate void changeVideoCompletedHandler(StringEventArgs ea);

		/// <summary>
		/// Add or remove an audio source while encoding completed.
		/// </summary>
		public event addRemoveAudioCompletedHandler OnAddRemoveAudioCompleted;
		public delegate void addRemoveAudioCompletedHandler(StringEventArgs ea);

		#endregion
    }

    #region Utility Classes

    public class StreamRestoredEventArgs:EventArgs
	{
		public uint NewSsrc;
		public uint OldSsrc;
		public String Cname;
		public PayloadType Payload;
		public StreamRestoredEventArgs(uint nssrc, uint ossrc, String cname, PayloadType payload)
		{
			this.NewSsrc = nssrc;
			this.OldSsrc = ossrc;
			this.Cname = cname;
			this.Payload = payload;
		}
	}

	public class StreamAddRemoveEventArgs:EventArgs
	{
		public bool Add;
		public bool Selected;
		/// <summary>
		/// Name is composed from both cname and device name
		/// </summary>
		public String Name;
		public MSR.LST.Net.Rtp.PayloadType Payload;

		public StreamAddRemoveEventArgs(bool add, bool selected, string name, PayloadType payload)
		{
			Add = add;
			Selected = selected;
			Name = name;
			Payload = payload;
		}
	}

	public class NumericEventArgs : EventArgs
	{
		public NumericEventArgs(Int32 N)
		{
			this.N = N;
		}
		public readonly Int32 N;
	}

	public class StringEventArgs : EventArgs
	{
		public StringEventArgs(String S)
		{
			this.S = S;
		}
		public readonly String S;
	}

    #endregion Utility Classes
}
