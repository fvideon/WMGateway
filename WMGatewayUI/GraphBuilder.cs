using System;
using System.Diagnostics;
using MSR.LST.MDShow;
using MSR.LST.Net.Rtp;
using System.Net;
using System.Runtime.InteropServices;


namespace UW.CSE.DISC
{
	/// <summary>
	/// Base class for filtergraph operations.  
	/// An instance corresponds to the lifetime of one graph.
	/// Derived classes add mediatype-specific functionality.  
	/// </summary>
	public abstract class GraphBuilder
	{
		#region Declarations
		
		protected FilgraphManagerClass fgm;
		private bool playing;
		private uint rotnum;
		private uint ssrc;
		private RtpStream stream;
		private MediaBuffer mediaBuffer;
		protected int index;
		private UW.CSE.MDShow.ISampleGrabberCB callBack;
		_AMMediaType connectedMT;
		protected EventLog		eventLog;
		
		#endregion
		#region Properties
		
		protected String errorMsg;
		public String ErrorMsg
		{
			get {return errorMsg;}
		}

		public uint Ssrc
		{
			get {return ssrc;}
		}
		
		#endregion
		#region Constructor

		public GraphBuilder(MediaBuffer mb,int index)
		{
			eventLog = new EventLog("WMG",".","WMGCore");
			playing = false;
			rotnum = 0;
			mediaBuffer = mb;
			this.ssrc = 0;
			this.index = index;
			callBack = new SGCallback(mediaBuffer,index);
			errorMsg = "";
		}
		#endregion
		#region Public Methods
		
		/// <summary>
		/// Build a graph with sampleGrabber.  Render it, and get the media type.
		/// </summary>
		/// <param name="payload"></param>
		/// <returns></returns>
		public bool Build(PayloadType payload,RtpStream newStream)
		{
			this.stream = newStream;
			this.ssrc=newStream.SSRC;

			//Required as of RC3:
			this.stream.IsUsingNextFrame = true;

			if ((ssrc==0) || !((payload == PayloadType.dynamicVideo) || (payload == PayloadType.dynamicAudio)))
			{
				errorMsg = "Invalid inputs to build method.";
				return false;
			}

			fgm = new FilgraphManagerClass();

			MSR.LST.MDShow.IBaseFilter bfSource = null;
			IGraphBuilder iGB = (IGraphBuilder)fgm;            

			//if (false)
			//	rotnum = FilterGraph.AddToRot(iGB); //AddToRot(iGB);

			try
			{
				bfSource = RtpSourceClass.CreateInstance();
				((MSR.LST.MDShow.Filters.IRtpSource)bfSource).Initialize(this.stream);
				iGB.AddFilter(bfSource, "RtpSource");
				MSR.LST.MDShow.IPin sourceOutput = Filter.GetPin(bfSource, _PinDirection.PINDIR_OUTPUT, Guid.Empty, 
					Guid.Empty, false, 0);


				//Add SampleGrabber filter
				MSR.LST.MDShow.IBaseFilter bfGrabber = SampleGrabberClass.CreateInstance();
				iGB.AddFilter(bfGrabber, "Grabber");
				UW.CSE.MDShow.ISampleGrabber sgGrabber = (UW.CSE.MDShow.ISampleGrabber)bfGrabber;

				//Set mediatype
				UW.CSE.MDShow._AMMediaType mt = new UW.CSE.MDShow._AMMediaType();
				if (payload == PayloadType.dynamicVideo)
				{
					mt.majortype = MediaType.MajorType.MEDIATYPE_Video;
					//PRI2: RGB24 seems to work for all video?  We have used YUY2 in the past, but that won't work
					// for screen streaming.  Probably could use more testing
					//mt.subtype = MediaType.SubType.MEDIASUBTYPE_YUY2;
					mt.subtype = MediaType.SubType.MEDIASUBTYPE_RGB24;
				}
				else
				{
					mt.majortype = MediaType.MajorType.MEDIATYPE_Audio;
					mt.subtype = MediaType.SubType.MEDIASUBTYPE_PCM; //MEDIASUBTYPE_PCM;
				}

				sgGrabber.SetMediaType(ref mt);

				//Add samplegrabber callback
				//0 is sampleCB, 1 is bufferCB.  Only bufferCB is actually returning data so far.
				sgGrabber.SetCallback(callBack,1);
				sgGrabber.SetOneShot(0);
				sgGrabber.SetBufferSamples(0);

				iGB.Render(sourceOutput);

				UW.CSE.MDShow._AMMediaType uwmt = new UW.CSE.MDShow._AMMediaType();
				sgGrabber.GetConnectedMediaType(ref uwmt);
				connectedMT = copy_AMMediaType(uwmt);
			}
			catch (Exception e)
			{
				errorMsg = e.Message;
				Debug.WriteLine("Exception while building graph: " + e.ToString());
				eventLog.WriteEntry("Exception while building graph: " + e.ToString(), EventLogEntryType.Error, 1001);
				return false;
			}
			return true;
		}

		private MSR.LST.MDShow._AMMediaType copy_AMMediaType(UW.CSE.MDShow._AMMediaType uwmt)
		{
			MSR.LST.MDShow._AMMediaType msrmt = new MSR.LST.MDShow._AMMediaType();
			msrmt.bFixedSizeSamples = uwmt.bFixedSizeSamples==0?false:true;
			msrmt.bTemporalCompression = uwmt.bTemporalCompression==0?false:true;
			msrmt.cbFormat = uwmt.cbFormat;
			msrmt.formattype = uwmt.formattype;
			msrmt.lSampleSize = uwmt.lSampleSize;
			msrmt.majortype = uwmt.majortype;
			msrmt.pbFormat = uwmt.pbFormat;
			msrmt.punk = uwmt.punk;
			msrmt.subtype = uwmt.subtype;
			return msrmt;
		}

		/// <summary>
		/// Call the graph manager run method.
		/// </summary>
		/// <returns></returns>
		public bool Run()
		{
			if (playing)
			{
				Debug.WriteLine("Graph is already running.");
				return false;
			}

			try
			{
				if (this.stream != null)
				{
					//Note: failing to do this will occasionally cause Run to fail. (as of 3.0 RC3)
					stream.BlockNextFrame();
				}
				fgm.Run();
				playing = true;
			}
			catch (Exception e)
			{
				Debug.WriteLine("Failed to run graph: " + e.ToString());
				eventLog.WriteEntry("Failed to run graph: " + e.ToString(), EventLogEntryType.Error, 1001);
				return false;
			}

			return true;
		}
		


		/// <summary>
		/// Call the graphmanager stop method.
		/// </summary>
		/// <returns></returns>
		public bool Stop()
		{
			if (!playing)
			{
				Debug.WriteLine("Graph is not running.");
				return false;
			}

			playing = false;

			if (fgm == null)
			{
				return true;
			}

			try
			{
				//If stream is paused Stop will hang unless we first call
				//RtpStream.UnblockNextFrame
				if (this.stream != null)
				{
					this.stream.UnblockNextFrame();
				}
				fgm.Stop();
			}
			catch (Exception e)
			{
				eventLog.WriteEntry("Failed to stop graph: " + e.ToString(), EventLogEntryType.Error, 1001);
				Debug.WriteLine("Failed to stop graph: " + e.ToString());
				return false;
			}
			return true;
		}
		
		/// <summary>
		/// Remove all filters from a graph. If the graph is running, we will stop it first.
		/// </summary>
		/// <returns></returns>
		public bool Teardown()
		{
			if (fgm == null)
			{
				playing = false;
				return true;
			}
			

			if (playing)
			{
				try
				{
					//If stream is paused Stop will hang unless we first call
					//RtpStream.UnblockNextFrame
					if (this.stream != null)
					{
						this.stream.UnblockNextFrame();
					}
					
					if (rotnum != 0)
						FilterGraph.RemoveFromRot((uint)rotnum); //RemoveFromRot(rotnum);

					fgm.Stop();
				}
				catch (Exception e)
				{
					Debug.WriteLine("Failed to stop graph: " + e.ToString());
				}
				playing = false;
			}

			FilterGraph.RemoveAllFilters(fgm);
			fgm = null;
			return true;
		}
		
		/// <summary>
		/// Return the media type of a connected graph.  If there is any problem obtaining the media type
		/// it should manifest during the Build method call.  This method should never fail.
		/// </summary>
		/// <returns></returns>
		public UW.CSE.MDShow.MediaType GetMediaType()
		{
			try

			{
				return new UW.CSE.MDShow.MediaType(connectedMT);
			}
			catch (Exception)
			{
				Debug.WriteLine("Could not get connected media type");
				return null;
			}
		}


		#endregion

		#region ROT

		//		[DllImportAttribute("ole32.dll")]
		//		private static extern int CreateItemMoniker(
		//			[MarshalAs(UnmanagedType.LPWStr)] string delim, 
		//			[MarshalAs(UnmanagedType.LPWStr)] string name,
		//			out UCOMIMoniker ppmk);
		//        
		//		[DllImport("ole32.dll")]
		//		private static extern int GetRunningObjectTable(
		//			int reserved, out UCOMIRunningObjectTable ROT);
		//
		//		public static Int32 AddToRot(MSR.LST.MDShow.IGraphBuilder graph)
		//		{
		//			int hr;
		//
		//			UCOMIRunningObjectTable rot;
		//			hr = GetRunningObjectTable(0, out rot);
		//			Marshal.ThrowExceptionForHR(hr);
		//
		//			UCOMIMoniker moniker;
		//			hr = CreateItemMoniker("!", string.Format("FilterGraph {0:x8} pid {1:x8}", 
		//				new Random().Next(), Process.GetCurrentProcess().Id), out moniker);
		//			Marshal.ThrowExceptionForHR(hr);
		//
		//			Int32 register;
		//			rot.Register(1, graph, moniker, out register);
		//
		//			return register;
		//		}
		//
		//        
		//		public static void RemoveFromRot(Int32 register)
		//		{
		//			UCOMIRunningObjectTable rot;
		//			GetRunningObjectTable(0, out rot);
		//
		//			rot.Revoke(register);
		//		}

		#endregion ROT
	}
}
