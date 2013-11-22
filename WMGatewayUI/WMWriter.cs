using System;
using UW.CSE.ManagedWM;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Text;
using System.IO;
using MSR.LST.MDShow;
using MediaType = UW.CSE.MDShow.MediaType;
using MSR.LST.Net.Rtp;
using MSR.LST;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Wrap essential Windows Media Format SDK functionality, and handle interop issues.
	/// </summary>
	public class WMWriter
	{
		#region Properties
		private	uint	scriptBitrate;
		/// <summary>
		/// Bits per second the script stream is configured to handle.  Exceeding this value
		/// will cause various nastiness in the Windows Media stream.
		/// </summary>
		public uint ScriptBitrate
		{
			get {return scriptBitrate;}
		}

		/// <summary>
		/// The WM Writer failed since the last time we checked.
		/// </summary>
		public bool WriteFailed
		{
			get 
			{
				if (writeFailed)
				{	
					writeFailed = false;
					return true;
				}
				else
					return false;
			}
		}
		#endregion
		#region Declarations
		private IWMWriterAdvanced		writerAdvanced;
		private IWMWriter				writer;
		private IWMWriterNetworkSink	netSink ;
		private IWMWriterFileSink 		fileSink;
		private IWMInputMediaProps      audioProps;
		private IWMInputMediaProps      videoProps;
		private uint	                audioInput;
		private uint	                videoInput;
		private ushort					scriptStreamNumber;
		private IWMProfileManager		profileManager;
		private bool					writeFailed;
		private EventLog				eventLog;
		private ulong					lastWriteTime;
		#endregion
		#region Constructor
		public WMWriter(MediaBuffer mb)
		{
			eventLog = new EventLog("WMG",".","WMGCore");
			mb.OnSampleReady += new MediaBuffer.sampleReadyHandler(ReceiveSample);
			scriptBitrate = 0;
			writerAdvanced = null;
			writer = null;
			netSink = null;
			fileSink = null;
			audioProps = null;
			videoProps = null;
			audioInput = 0;
			videoInput = 0;
			scriptStreamNumber = 0;
			lastWriteTime = 0;
			profileManager = null;
			writeFailed = false;
		}
		#endregion
		#region Public Methods

		/// <summary>
		/// Create the basic WM writer objects.
		/// </summary>
		/// <returns></returns>
		public bool Init()
		{
			try
			{
				uint hr = WMFSDKFunctions.WMCreateWriter(null, out writer);
				writerAdvanced = (IWMWriterAdvanced)writer;
				writerAdvanced.SetLiveSource(1);
				hr = WMFSDKFunctions.WMCreateWriterNetworkSink(out netSink);
			}
			catch (Exception e)
			{
				Debug.WriteLine("Failed to create IWMWriter: " + e.ToString());
				eventLog.WriteEntry("Failed to create IWMWriter: " + e.ToString(), EventLogEntryType.Error, 1000);
				return false;
			}
			return true;
		}

		/// <summary>
		/// Dispose of everything that may need disposing.
		/// </summary>
		public void Cleanup()
		{
			scriptBitrate = 0;
			writerAdvanced = null;
			writer = null;
			netSink = null;
			fileSink = null;
			audioProps = null;
			videoProps = null;
			audioInput = 0;
			videoInput = 0;
			scriptStreamNumber = 0;
			profileManager = null;
		}

		/// <summary>
		/// Prepare the network writer.
		/// </summary>
		/// <param name="port"></param>
		/// <param name="maxClients"></param>
		/// <returns></returns>
		public bool ConfigNet(uint port, uint maxClients)
		{
			if ((writerAdvanced == null) || (netSink == null))
			{
				Debug.WriteLine("WriterAdvanced and NetSink must exist before calling ConfigNet");
				return false;
			}

			try
			{
				netSink.SetNetworkProtocol(WMT_NET_PROTOCOL.WMT_PROTOCOL_HTTP);

				netSink.Open(ref port);
			
				uint size = 0;
				netSink.GetHostURL(IntPtr.Zero,ref size);
				IntPtr buf = Marshal.AllocCoTaskMem( (int)(2*(size+1)) );
				netSink.GetHostURL(buf,ref size);
				String url = Marshal.PtrToStringAuto(buf);
				Marshal.FreeCoTaskMem( buf );
				Debug.WriteLine("Connect to:" + url);

				netSink.SetMaximumClients(maxClients);
				writerAdvanced.AddSink(netSink);
			}
			catch (Exception e)
			{
				eventLog.WriteEntry("Failed to configure network: " + e.ToString(), EventLogEntryType.Error, 1000);
				Debug.WriteLine("Failed to configure network: " + e.ToString());
				return false;
			}
			return true;
		}

		/// <summary>
		/// Prepare the File writer.
		/// </summary>
		/// <param name="filename"></param>
		/// <returns></returns>
		public bool ConfigFile(String filename)
		{
			if (writerAdvanced == null)
			{
				Debug.WriteLine("WriterAdvanced must exist before ConfigFile is called.");
				return false;
			}

			try
			{
				uint hr = WMFSDKFunctions.WMCreateWriterFileSink(out fileSink);
				IntPtr fn = Marshal.StringToCoTaskMemUni(filename);
				fileSink.Open(fn);
				writerAdvanced.AddSink(fileSink);
				Marshal.FreeCoTaskMem(fn);
			}
			catch (Exception e)
			{
				Debug.WriteLine("Failed to configure FileSink" + e.ToString());
				eventLog.WriteEntry("Failed to configure FileSink" + e.ToString(), EventLogEntryType.Error, 1000);
				return false;
			}
			return true;
		}

		/// <summary>
		/// Return a list of all the system profiles.
		/// </summary>
		/// <returns></returns>
		public static String QuerySystemProfiles()
		{
			IWMProfileManager pm;
			IWMProfileManager2 pm2;

			uint hr = WMFSDKFunctions.WMCreateProfileManager(out pm);
			pm2 = (IWMProfileManager2)pm;
			pm2.SetSystemProfileVersion(WMT_VERSION.WMT_VER_7_0);
			pm2 = null;

			uint pCount;
			pm.GetSystemProfileCount(out pCount);

			IWMProfile profile;

			StringBuilder sb = new StringBuilder(500);
			sb.Append("System Profile count: " + pCount.ToString() + "\n\r");
			String name;
			for (uint i=0;i<pCount;i++)
			{
				pm.LoadSystemProfile(i,out profile);
				name = GetProfileName(profile);
				sb.Append((i+1).ToString() + "  " + name + "\n\r");
			}
			
			return(sb.ToString());

		}

		
		/// <summary>
		/// Load a WM Profile (system or custom).
		/// </summary>
		/// <param name="prxFile"></param>
		/// <param name="prIndex"></param>
		/// <returns></returns>
		public bool ConfigProfile(String prxFile, uint prIndex)
		{
			IWMProfile				profile;

			uint hr = WMFSDKFunctions.WMCreateProfileManager(out profileManager);

			if (prxFile == "")
			{
				//use system profile
				Guid prg = ProfileIndexToGuid(prIndex);
				if (prg == Guid.Empty)
				{
					profile = null;
					Debug.WriteLine("Unsupported Profile index.");
					return false;
				}
				
				try
				{
					GUID prG = WMGuids.ToGUID(prg);
					profileManager.LoadProfileByID(ref prG,out profile);
				}
				catch (Exception e)
				{
					eventLog.WriteEntry("Failed to load system profile: " +e.ToString(), EventLogEntryType.Error, 1000);
					Debug.WriteLine("Failed to load system profile: " +e.ToString());
					profile = null;
					return false;
				}
			}
			else
			{
				//use custom profile
				profile = LoadCustomProfile(prxFile);
				if (profile == null)
					return false;
			}
		
			/// Tell the writer to use this profile.
			try
			{
				writer.SetProfile(profile);
				string name = GetProfileName(profile);
				Debug.WriteLine("Using profile: " + name);
			}
			catch (Exception e)
			{
				eventLog.WriteEntry("Failed to set writer profile: " +e.ToString(), EventLogEntryType.Error, 1000);
				Debug.WriteLine("Failed to set writer profile: " +e.ToString());
				profile = null;
				return false;
			}

			/// A slightly confusing point:  Streams are subobjects of the profile, 
			/// while inputs are subobjects of the Writer.  The difference is in the
			/// multi-bitrate scenario where there may be multiple streams per input.
			/// Stream numbers start with 1, while input numbers and stream indexes begin at 0.
			/// If we have a profile that supports scripts, we need the stream number of
			/// the script stream.  For audio and video, we just need input number.
			scriptBitrate = 0;
			audioInput = videoInput = 0;
			scriptStreamNumber = 0;
			audioProps = videoProps = null;

			/// If the profile has a script stream, find the bitrate and stream number.
			uint cStreams;
			IWMStreamConfig streamConfig;
			GUID streamType;
			profile.GetStreamCount(out cStreams);
			for (uint i=0;i<cStreams;i++)
			{
				profile.GetStream(i,out streamConfig);
				streamConfig.GetStreamType(out streamType);
				if (WMGuids.ToGuid(streamType) == WMGuids.WMMEDIATYPE_Script)
				{
					streamConfig.GetStreamNumber(out scriptStreamNumber);
					streamConfig.GetBitrate(out scriptBitrate);
				}
			}
			
			/// Iterate over writer inputs, holding on to the IWMInputMediaProps* for each,
			/// so we can later configure them.  Also save input numbers for audio and video here.
			uint cInputs;
			writer.GetInputCount(out cInputs);
			GUID                guidInputType;
			IWMInputMediaProps  inputProps = null;
			for(uint i = 0; i < cInputs; i++ )
			{
				writer.GetInputProps( i, out inputProps );
				inputProps.GetType( out guidInputType );
				if( WMGuids.ToGuid(guidInputType) == WMGuids.WMMEDIATYPE_Audio )
				{
					audioProps = inputProps;
					audioInput = i;
				}
				else if( WMGuids.ToGuid(guidInputType) ==  WMGuids.WMMEDIATYPE_Video )
				{
					videoProps = inputProps;
					videoInput = i;
				}
				else if( WMGuids.ToGuid(guidInputType) == WMGuids.WMMEDIATYPE_Script )
				{
				}
				else
				{
					Debug.WriteLine( "Profile contains unrecognized media type." );
					return false;
				}
			}

			// We require an audio input, since that drives the timing for the whole stream.
			if( audioProps == null )
			{
				Debug.WriteLine("Profile should contain at least one audio input." );
				return false;
			}

			return true;
		}

		/// <summary>
		/// Configure Audio media type
		/// </summary>
		/// <param name="mt"></param>
		/// <returns></returns>
		public bool ConfigAudio(UW.CSE.MDShow.MediaType mt)
		{
			_WMMediaType _mt = ConvertMediaType(mt);
			return ConfigAudio(_mt);
		}

		/// <summary>
		/// Configure audio media type.
		/// </summary>
		public bool ConfigAudio(_WMMediaType mt)
		{
			if (audioProps == null)
			{
				Debug.WriteLine("Failed to configure audio: properties is null.");
				return false;
			}

			try
			{
				audioProps.SetMediaType(ref mt );
				writer.SetInputProps( audioInput, audioProps );
			}
			catch (Exception e)
			{
				eventLog.WriteEntry("Failed to set audio properties: " + e.ToString(), EventLogEntryType.Error, 1000);
				Debug.WriteLine("Failed to set audio properties: " + e.ToString());
				return false;
			}
			return true;
		}


		/// <summary>
		/// Hardcode audio config for testing.
		/// </summary>
		/// <returns></returns>
		public bool ConfigAudio()
		{
			//make up some media types for testing
			
			WAVEFORMATEX wfex = new WAVEFORMATEX();
			
			wfex.FormatTag = 1; //1==WAVE_FORMAT_PCM
			wfex.Channels = 1;
			wfex.SamplesPerSec = 16000;
			wfex.AvgBytesPerSec =  32000;
			wfex.BlockAlign = 2;
			wfex.BitsPerSample = 16;
			wfex.Size = 0;

			IntPtr wfexPtr = Marshal.AllocCoTaskMem(Marshal.SizeOf(wfex));
			Marshal.StructureToPtr(wfex,wfexPtr,true);

			_WMMediaType mt = new _WMMediaType();
			mt.majortype			= WMGuids.ToGUID(WMGuids.WMMEDIATYPE_Audio);
			mt.subtype				= WMGuids.ToGUID(WMGuids.WMMEDIASUBTYPE_PCM);
			mt.bFixedSizeSamples	= 1; //true
			mt.bTemporalCompression = 0; //false
			mt.lSampleSize			= 2;
			mt.formattype			= WMGuids.ToGUID(WMGuids.WMFORMAT_WaveFormatEx);  //This is the only value permitted.
			mt.pUnk					= null;
			mt.cbFormat				= (uint)Marshal.SizeOf( wfex ) + wfex.Size;
			mt.pbFormat				= wfexPtr;

			try
			{
				//  Used GetMediaType to sanity check the managed structs:
				//uint size = 0;
				//audioProps.GetMediaType(IntPtr.Zero,ref size);
				//IntPtr mtPtr = Marshal.AllocCoTaskMem((int)size);
				//audioProps.GetMediaType(mtPtr,ref size);
				//_WMMediaType mt2 = (_WMMediaType)Marshal.PtrToStructure(mtPtr,typeof(_WMMediaType));
				//WMMediaType.WaveFormatEx wfex2 = (WMMediaType.WaveFormatEx)Marshal.PtrToStructure(mt2.pbFormat,typeof(WMMediaType.WaveFormatEx));
				//  Examine here.
				//Marshal.StructureToPtr(mt,mtPtr,true);
				//audioProps.SetMediaType( mtPtr );
			}
			catch (Exception e)
			{
				eventLog.WriteEntry("Failed to set audio properties: " + e.ToString(), EventLogEntryType.Error, 1000);
				Debug.WriteLine("Failed to set audio properties: " + e.ToString());
				return false;
			}

			bool ret = ConfigAudio(mt);
			
			Marshal.FreeCoTaskMem(wfexPtr);
			return ret;

		}

		/// <summary>
		/// Configure video media type
		/// </summary>
		/// <param name="mt"></param>
		/// <returns></returns>
		public bool ConfigVideo(UW.CSE.MDShow.MediaType mt)
		{
			_WMMediaType _mt = ConvertMediaType(mt);
			return ConfigVideo(_mt);
		}

		/// <summary>
		/// Configure video media type
		/// </summary>
		/// <param name="mt"></param>
		public bool ConfigVideo(_WMMediaType mt)
		{
			if (videoProps == null)
			{
				Debug.WriteLine("Failed to configure video: properties is null.");
				return false;
			}

			try
			{
				videoProps.SetMediaType( ref mt );
				writer.SetInputProps( videoInput, videoProps );
			}
			catch (Exception e)
			{
				eventLog.WriteEntry("Failed to set video properties: " + e.ToString(), EventLogEntryType.Error, 1000);
				Debug.WriteLine("Failed to set video properties: " + e.ToString());
				return false;
			}

			return true;
		}

		/// <summary>
		/// Hardcode video config for testing.
		/// </summary>
		/// <returns></returns>
		public bool ConfigVideo()
		{
			// Basic video settings:
			int w=320;
			int h=240;
			int fps=30;	
	
			// For RGB24:
			ushort bpp=24;
			uint comp=0; 
			GUID stype = WMGuids.ToGUID(WMGuids.WMMEDIASUBTYPE_RGB24);

			// ..or for I420:
			//WORD bpp=12;
			//DWORD comp=0x30323449;
			//GUID stype= WMMEDIASUBTYPE_I420;

			// Settings for the video stream:
			// BITMAPINFOHEADER
			//  DWORD  biSize = size of the struct in bytes.. 40
			//	LONG   biWidth - Frame width
			//	LONG   biHeight	- height could be negative indicating top-down dib.
			//	WORD   biPlanes - must be 1.
			//	WORD   biBitCount 24 in our sample with RGB24
			//	DWORD  biCompression 0 for RGB
			//	DWORD  biSizeImage in bytes.. biWidth*biHeight*biBitCount/8
			//	LONG   biXPelsPerMeter 0
			//	LONG   biYPelsPerMeter 0; 
			//	DWORD  biClrUsed must be 0
			//	DWORD  biClrImportant 0
			//
			//	notes:
			//		biCompression may be a packed 'fourcc' code, for example I420 is 0x30323449, IYUV = 0x56555949...
			//		I420 and IYUV are identical formats.  They use 12 bits per pixel, and are planar,  comprised of
			//		nxm Y plane followed by n/2 x m/2 U and V planes.  Each plane is 8bits deep.
			
			BITMAPINFOHEADER bi = new BITMAPINFOHEADER();
			bi.Size=(uint)Marshal.SizeOf(bi);
			bi.Width = w;
			bi.Height = h;
			bi.Planes = 1; //always 1.
			bi.BitCount = bpp;
			bi.Compression = comp; //RGB is zero.. uncompressed.
			bi.SizeImage = (uint)(w * h * bpp / 8);
			bi.XPelsPerMeter = 0;
			bi.YPelsPerMeter = 0;
			bi.ClrUsed = 0;
			bi.ClrImportant = 0;

			// WMVIDEOINFOHEADER
			//  RECT  rcSource;
			//	RECT  rcTarget;
			//	DWORD  dwBitRate.. bps.. Width*Height*BitCount*Rate.. 320*240*24*29.93295=55172414
			//	DWORD  dwBitErrorRate zero in our sample.
			//	LONGLONG  AvgTimePerFrame in 100ns units.. 334080=10000*1000/29.93295
			//	BITMAPINFOHEADER  bmiHeader copy of the above struct.
			VIDEOINFOHEADER vi = new VIDEOINFOHEADER();
			RECT r = new RECT();
			r.Left=r.Top=0;
			r.Bottom = bi.Height;
			r.Right = bi.Width;
			vi.Source = r;
			//			vi.Source.Left	= 0;
			//			vi.Source.Top	= 0;
			//			vi.Source.Bottom = bi.Height;
			//			vi.Source.Right	= bi.Width;
			vi.Target		= vi.Source;
			vi.BitRate		= (uint)(w * h * bpp * fps);
			vi.BitErrorRate	= 0;
			vi.AvgTimePerFrame = (long) ((10000 * 1000) / fps);
			vi.BitmapInfo = bi;
			
			IntPtr viPtr = Marshal.AllocCoTaskMem(Marshal.SizeOf(vi));
			Marshal.StructureToPtr(vi,viPtr,true);

			// WM_MEDIA_TYPE
			//	GUID  majortype WMMEDIATYPE_Video
			//	GUID  subtype WMMEDIASUBTYPE_RGB24 in our sample
			//	BOOL  bFixedSizeSamples TRUE
			//	BOOL  bTemporalCompression FALSE
			//	ULONG  lSampleSize in bytes This was zero in our sample, but could be 320*240*24/8=230400
			//	GUID  formattype WMFORMAT_VideoInfo
			//	IUnknown*  pUnk NULL
			//	ULONG  cbFormat size of the WMVIDEOINFOHEADER 
			//	[size_is(cbFormat)] BYTE  *pbFormat pointer to the WMVIDEOINFOHEADER 

			//Note WM_MEDIA_TYPE is the same as Directshow's AM_MEDIA_TYPE.
			//WM_MEDIA_TYPE   mt;
			_WMMediaType mt = new _WMMediaType();
			mt.majortype = WMGuids.ToGUID(WMGuids.WMMEDIATYPE_Video);
			mt.subtype = stype;
			mt.bFixedSizeSamples = 1;
			mt.bTemporalCompression = 0;
			//mt.lSampleSize = w * h * bpp / 8;  // this was zero in avinetwrite!
			mt.lSampleSize = 0; //hmm.  Don't think it matters??
			mt.formattype = WMGuids.ToGUID(WMGuids.WMFORMAT_VideoInfo);
			mt.pUnk = null;
			mt.cbFormat = (uint)Marshal.SizeOf(vi);
			mt.pbFormat = viPtr;

			bool ret = ConfigVideo(mt);
			
			Marshal.FreeCoTaskMem(viPtr);
			return ret;
		}

		public bool Start()
		{
			try
			{
				writer.BeginWriting();
			}
			catch (Exception e)
			{
				eventLog.WriteEntry("Failed to start writing: " + e.ToString(), EventLogEntryType.Error, 1000);
				Debug.WriteLine("Failed to start writing: " + e.ToString());
				return false;
			}
			return true;
		}


		/// <summary>
		/// Write an audio sample.  Sample time is in ticks.
		/// </summary>
		/// <param name="sampleSize"></param>
		/// <param name="inBuf"></param>
		/// <param name="sampleTime">in Ticks</param>
		/// <returns></returns>
		public bool WriteAudio(uint sampleSize, BufferChunk inBuf, ulong sampleTime)
		{
			INSSBuffer sample;
			IntPtr sampleBuf = IntPtr.Zero;

			//Debug.WriteLine("WMWriter.WriteAudio: time=" + sampleTime.ToString());
			//return true;
			//	+ " size=" + sampleSize.ToString() +
			// " audio bytes " + inBuf[345].ToString() + " " +
			//	inBuf[346].ToString() + " " + inBuf[347].ToString() + " " + inBuf[348].ToString());

			try
			{
				lock(this)
				{
					writer.AllocateSample(sampleSize, out sample);
					sample.GetBuffer(out sampleBuf);
					Marshal.Copy(inBuf.Buffer,inBuf.Index,sampleBuf,(int)sampleSize);
					sample.SetLength(sampleSize);
					writer.WriteSample(audioInput,sampleTime,0,sample);
					//Debug.WriteLine("Wrote audio. time=" + sampleTime.ToString());
					Marshal.ReleaseComObject(sample);
					lastWriteTime = sampleTime;
				}
			}
			catch (Exception e)
			{
				//Debug.WriteLine("Exception while writing audio: " +
				//	"audioInput=" + videoInput.ToString() + 
				//	" sampleTime=" + sampleTime.ToString() + 
				//	" sampleSize=" + sampleSize.ToString());

				Debug.WriteLine("Exception while writing audio: " + e.ToString());
				eventLog.WriteEntry("Exception while writing audio: " + e.ToString(), EventLogEntryType.Error, 1000);
				return false;
			}
			//Debug.WriteLine("Audio write succeeded " +
			//		"audioInput=" + videoInput.ToString() + 
			//		" sampleTime=" + sampleTime.ToString() + 
			//		" sampleSize=" + sampleSize.ToString());
			return true;
		}

		/// <summary>
		/// Write a video sample. SampleTime is in ticks.
		/// </summary>
		/// <param name="sampleSize"></param>
		/// <param name="inBuf"></param>
		/// <param name="sampleTime"></param>
		/// <returns></returns>
		public bool WriteVideo(uint sampleSize, BufferChunk inBuf, ulong sampleTime)
		{			
			INSSBuffer sample;
			IntPtr sampleBuf = IntPtr.Zero;

			//Debug.WriteLine("WMWriter.WriteVideo: time=" + sampleTime.ToString());
			//return true;
			//	+ " size=" + sampleSize.ToString() +
			//  " video bytes " + inBuf[345].ToString() + " " +
			//	inBuf[346].ToString() + " " + inBuf[347].ToString() + " " + inBuf[348].ToString());

			try
			{
				lock(this)
				{
					writer.AllocateSample(sampleSize, out sample);
					sample.GetBuffer(out sampleBuf);
					Marshal.Copy(inBuf.Buffer,inBuf.Index,sampleBuf,(int)sampleSize);
					sample.SetLength(sampleSize);
					writer.WriteSample(videoInput,sampleTime,0,(INSSBuffer)sample);
					//Debug.WriteLine("Wrote video. time=" + sampleTime.ToString());
					Marshal.ReleaseComObject(sample);
					lastWriteTime = sampleTime;
				}
			}
			catch (Exception e)
			{
				//The most common cause of this seems to be failing to set or reset the media type correctly.
				Debug.WriteLine("Exception while writing video: " +
					"videoInput=" + videoInput.ToString() + 
					" sampleTime=" + sampleTime.ToString() + 
					" sampleSize=" + sampleSize.ToString());
				eventLog.WriteEntry("Exception while writing video: " + e.ToString(), EventLogEntryType.Error, 1000);
				return false;
			}
			//Debug.WriteLine("Video write succeeded 	videoInput=" + videoInput.ToString() +
			//		" sampleTime=" + sampleTime.ToString() +
			//		" sampleSize=" + sampleSize.ToString());
			return true;
		}

		/// <summary>
		/// Stop the encoder
		/// </summary>
		public void Stop()
		{
			try
			{
				writer.EndWriting();
				writerAdvanced.RemoveSink(netSink);
				netSink.Close();
			}
			catch (Exception e)
			{
				eventLog.WriteEntry("Failed to stop: " + e.ToString(), EventLogEntryType.Error, 1000);
				Debug.WriteLine("Failed to stop: " + e.ToString());
			}
		}


		/// <summary>
		/// Write a script command into the stream
		/// </summary>
		/// <param name="type"></param>
		/// <param name="script"></param>
		/// <param name="packScript">Use both bytes of the unicode script string.  This is 
		/// used to more efficiently transmit Base64 encoded data in a script.</param>
		/// <returns></returns>
		/// The writer expects two null terminated WCHARs (two bytes per character).
		public bool SendScript(String type, String script, bool packScript)
		{
			IntPtr typePtr, scriptPtr, bufPtr;
			byte[] sampleBuf;
			INSSBuffer sample;
			ulong curTime;
			uint typesz, scriptsz, nulls;

			//ScriptStreamNumber == 0 means there is no script stream in the profile.
			if (scriptStreamNumber == 0) 
			{
				return false;
			}

			if (packScript)
			{
				typesz = (uint)(2 * (type.Length + 1));
				//To make the script looks like unicode, need to terminate with two nulls, and 
				//the total length needs to be an even number.
				scriptsz = (uint)script.Length;
				if (scriptsz%2 == 0)
				{
					nulls=2;
				} 
				else 
				{
					nulls=3;
				}
				sampleBuf = new byte[typesz+scriptsz+nulls];
				typePtr = Marshal.StringToCoTaskMemUni(type);
				scriptPtr = Marshal.StringToCoTaskMemAnsi(script);
				Marshal.Copy(typePtr,sampleBuf,0,(int)typesz);
				Marshal.Copy(scriptPtr,sampleBuf,(int)typesz,(int)scriptsz);
				for(uint i=typesz+scriptsz+nulls-1;i>=typesz+scriptsz;i--)
				{
					sampleBuf[i] = 0;
				}
				scriptsz += nulls;
				Marshal.FreeCoTaskMem(typePtr);
				Marshal.FreeCoTaskMem(scriptPtr);
			}
			else
			{
				//Marshal both strings as unicode.
				typesz = (uint)(2 * (type.Length + 1));
				scriptsz = (uint)(2 * (script.Length + 1));
				sampleBuf = new byte[typesz+scriptsz];
				typePtr = Marshal.StringToCoTaskMemUni(type);
				scriptPtr = Marshal.StringToCoTaskMemUni(script);
				Marshal.Copy(typePtr,sampleBuf,0,(int)typesz);
				Marshal.Copy(scriptPtr,sampleBuf,(int)typesz,(int)scriptsz);
				Marshal.FreeCoTaskMem(typePtr);
				Marshal.FreeCoTaskMem(scriptPtr);
			}

			try
			{
				lock(this)
				{
					writer.AllocateSample((typesz+scriptsz),out sample);
					sample.GetBuffer(out bufPtr);
					Marshal.Copy(sampleBuf,0,bufPtr,(int)(typesz+scriptsz));
					// Let the writer tell us what time it wants to use to avoid
					// rebuffering and other nastiness.  Can this cause a loss of sync issue?
					writerAdvanced.GetWriterTime(out curTime);
					//writerAdvanced.WriteStreamSample(scriptStreamNumber,curTime,0,0,0,sample);
					if (lastWriteTime==0)
						lastWriteTime = curTime;

					//Write to one second later than last AV write.  This seems to give good sync??
					writerAdvanced.WriteStreamSample(scriptStreamNumber,lastWriteTime+10000000,0,0,0,sample);
					Marshal.ReleaseComObject(sample);
				}
			}
			catch (Exception e)
			{
				eventLog.WriteEntry("Failed to write script: " + e.ToString(), EventLogEntryType.Error, 1000);
				Debug.WriteLine("Failed to write script: " + e.ToString());
				return false;
			}
			return true;
		}


		#endregion
		#region Private Methods

		/// <summary>
		/// Return the name of a profile.
		/// </summary>
		/// <param name="profile"></param>
		/// <returns></returns>
		private static String GetProfileName(IWMProfile profile)
		{
			try
			{
				uint size = 0;
				profile.GetName(IntPtr.Zero,ref size);
				IntPtr buffer = Marshal.AllocCoTaskMem( (int)(2*(size+1)) );
				profile.GetName(buffer,ref size);
				String name = Marshal.PtrToStringAuto(buffer);
				Marshal.FreeCoTaskMem( buffer );
				return name;
			}
			catch (Exception e)
			{
				Debug.WriteLine("Failed to get profile name: " + e.ToString());
				return "";
			}
		}

		private Guid ProfileIndexToGuid(uint index)
		{
			switch (index)
			{
				case 8:
					return WMGuids.WMProfile_V80_100Video;
				case 9:
					return WMGuids.WMProfile_V80_256Video;
				case 10:
					return WMGuids.WMProfile_V80_384Video;
				case 11:
					return WMGuids.WMProfile_V80_768Video;
				default: 
					return Guid.Empty;
			}
		}
	
		/// <summary>
		/// Load a PRX file as a profile
		/// </summary>
		/// <param name="prxFile"></param>
		/// <returns></returns>
		private IWMProfile LoadCustomProfile(String prxFile)
		{
			IWMProfile pr;
			StreamReader stream;	
			try
			{
				stream = new StreamReader(prxFile);
			}
			catch (Exception e)
			{
				Debug.WriteLine("Failed to open profile file: " + e.ToString());
				return null;
			}
			String s = stream.ReadToEnd();
			try
			{
				IntPtr file = Marshal.StringToCoTaskMemUni(s);
				profileManager.LoadProfileByData(file,out pr);
				Marshal.FreeCoTaskMem(file);
			}
			catch (Exception e)
			{
				eventLog.WriteEntry("Failed to load custom profile: " + e.ToString(), EventLogEntryType.Error, 1000);
				Debug.WriteLine("Failed to load custom profile: " + e.ToString());
				return null;
			}
			return pr;
		}

		/// <summary>
		/// Event handler for MediaBuffer OnSampleReady event
		/// </summary>
		/// <param name="sea"></param>
		private void ReceiveSample(SampleEventArgs sea)
		{
			if (writeFailed)
			{
				return;
			}

			TimeSpan ts = new TimeSpan((long)sea.Time);
			if (sea.Type == PayloadType.dynamicVideo)
			{

				if (!WriteVideo((uint)sea.Buffer.Length,sea.Buffer,sea.Time))
				{
					writeFailed = true;
				}
				//Debug.WriteLine("WMWriter.ReceiveSample len=" + sea.Buffer.Length.ToString() +
				//	" time=" + ts.TotalSeconds + " type=video");
			}
			else if (sea.Type == PayloadType.dynamicAudio)
			{
				if (!WriteAudio((uint)sea.Buffer.Length,sea.Buffer,sea.Time))
				{
					writeFailed = true;
				}
				//Debug.WriteLine("WMWriter.ReceiveSample len=" + sea.Buffer.Length.ToString() +
				//	" time=" + ts.TotalSeconds + " type=audio");
			}
		}

		/// <summary>
		/// Copy the LST managed MediaType to the Windows Media Interop type
		/// </summary>
		/// <param name="mt"></param>
		/// <returns></returns>
		private _WMMediaType ConvertMediaType(UW.CSE.MDShow.MediaType mt)
		{
			_WMMediaType wmt = new _WMMediaType();

			if (mt == null)
				return wmt;

			if (mt.MajorType == UW.CSE.MDShow.MajorType.Video)
			{
				// Basic video settings:
				//int w=320;
				//int h=240;
				//int fps=30;	
	
				// For RGB24:
				//ushort bpp=24;
				//uint comp=0; 
				//GUID stype = WMGuids.ToGUID(WMGuids.WMMEDIASUBTYPE_RGB24);

				// ..or for I420:
				//WORD bpp=12;
				//DWORD comp=0x30323449;
				//GUID stype= WMMEDIASUBTYPE_I420;

				// Settings for the video stream:
				// BITMAPINFOHEADER
				//  DWORD  biSize = size of the struct in bytes.. 40
				//	LONG   biWidth - Frame width
				//	LONG   biHeight	- height could be negative indicating top-down dib.
				//	WORD   biPlanes - must be 1.
				//	WORD   biBitCount 24 in our sample with RGB24
				//	DWORD  biCompression 0 for RGB
				//	DWORD  biSizeImage in bytes.. biWidth*biHeight*biBitCount/8
				//	LONG   biXPelsPerMeter 0
				//	LONG   biYPelsPerMeter 0; 
				//	DWORD  biClrUsed must be 0
				//	DWORD  biClrImportant 0
				//
				//	notes:
				//		biCompression may be a packed 'fourcc' code, for example I420 is 0x30323449, IYUV = 0x56555949...
				//		I420 and IYUV are identical formats.  They use 12 bits per pixel, and are planar,  comprised of
				//		nxm Y plane followed by n/2 x m/2 U and V planes.  Each plane is 8bits deep.
	
				//BitmapInfo bi = new BitmapInfo();
				//bi.Size=(uint)Marshal.SizeOf(bi);
				//bi.Width = w;
				//bi.Height = h;
				//bi.Planes = 1; //always 1.
				//bi.BitCount = bpp;
				//bi.Compression = comp; //RGB is zero.. uncompressed.
				//bi.SizeImage = (uint)(w * h * bpp / 8);
				//bi.XPelsPerMeter = 0;
				//bi.YPelsPerMeter = 0;
				//bi.ClrUsed = 0;
				//bi.ClrImportant = 0;

				// WMVIDEOINFOHEADER
				//  RECT  rcSource;
				//	RECT  rcTarget;
				//	DWORD  dwBitRate.. bps.. Width*Height*BitCount*Rate.. 320*240*24*29.93295=55172414
				//	DWORD  dwBitErrorRate zero in our sample.
				//	LONGLONG  AvgTimePerFrame in 100ns units.. 334080=10000*1000/29.93295
				//	BITMAPINFOHEADER  bmiHeader copy of the above struct.
				//VideoInfo vi = new VideoInfo();
				//vi.Source.left	= 0;
				//vi.Source.top	= 0;
				//vi.Source.bottom = bi.Height;
				//vi.Source.right	= bi.Width;
				//vi.Target		= vi.Source;
				//vi.BitRate		= (uint)(w * h * bpp * fps);
				//vi.BitErrorRate	= 0;
				//vi.AvgTimePerFrame = (UInt64) ((10000 * 1000) / fps);
				//vi.BitmapInfo = bi;
			
				UW.CSE.MDShow.MediaTypeVideoInfo vi = mt.ToMediaTypeVideoInfo();
				IntPtr viPtr = Marshal.AllocCoTaskMem(Marshal.SizeOf(vi.VideoInfo));
				Marshal.StructureToPtr(vi.VideoInfo,viPtr,true);

				// WM_MEDIA_TYPE
				//	GUID  majortype WMMEDIATYPE_Video
				//	GUID  subtype WMMEDIASUBTYPE_RGB24 in our sample
				//	BOOL  bFixedSizeSamples TRUE
				//	BOOL  bTemporalCompression FALSE
				//	ULONG  lSampleSize in bytes This was zero in our sample, but could be 320*240*24/8=230400
				//	GUID  formattype WMFORMAT_VideoInfo
				//	IUnknown*  pUnk NULL
				//	ULONG  cbFormat size of the WMVIDEOINFOHEADER 
				//	[size_is(cbFormat)] BYTE  *pbFormat pointer to the WMVIDEOINFOHEADER 

				//Note WM_MEDIA_TYPE is the same as Directshow's AM_MEDIA_TYPE.
				//WM_MEDIA_TYPE   mt;
				wmt.majortype = WMGuids.ToGUID(mt.MajorTypeAsGuid);
				wmt.subtype = WMGuids.ToGUID(mt.SubTypeAsGuid);
				wmt.bFixedSizeSamples = mt.FixedSizeSamples?1:0;
				wmt.bTemporalCompression = mt.TemporalCompression?1:0;
				//mt.lSampleSize = w * h * bpp / 8;  // this was zero in avinetwrite!
				wmt.lSampleSize = 0; //hmm.  Don't think it matters??
				wmt.formattype = WMGuids.ToGUID(mt.FormatTypeAsGuid);
				wmt.pUnk = null;
				wmt.cbFormat = (uint)Marshal.SizeOf(vi.VideoInfo);
				wmt.pbFormat = viPtr;

				//PRI3: redesign so that this is freed:
				//Marshal.FreeCoTaskMem(viPtr);
			}
			else if (mt.MajorType == UW.CSE.MDShow.MajorType.Audio)
			{
			
				//				WaveFormatEx wfex = new WaveFormatEx();
				//
				//				wfex.FormatTag = 1; //1==WAVE_FORMAT_PCM
				//				wfex.Channels = 1;
				//				wfex.SamplesPerSec = 16000;
				//				wfex.AvgBytesPerSec =  32000;
				//				wfex.BlockAlign = 2;
				//				wfex.BitsPerSample = 16;
				//				wfex.Size = 0;

				UW.CSE.MDShow.MediaTypeWaveFormatEx wfex = mt.ToMediaTypeWaveFormatEx();
				IntPtr wfexPtr = Marshal.AllocCoTaskMem(Marshal.SizeOf(wfex.WaveFormatEx));
				Marshal.StructureToPtr(wfex.WaveFormatEx,wfexPtr,true);

				wmt.majortype			= WMGuids.ToGUID(mt.MajorTypeAsGuid); //WMGuids.ToGUID(WMGuids.WMMEDIATYPE_Audio);
				wmt.subtype				= WMGuids.ToGUID(mt.SubTypeAsGuid); //WMGuids.ToGUID(WMGuids.WMMEDIASUBTYPE_PCM);
				wmt.bFixedSizeSamples	= mt.FixedSizeSamples?1:0;//1; //true
				wmt.bTemporalCompression = mt.TemporalCompression?1:0;//0; //false
				wmt.lSampleSize			= (uint)mt.SampleSize; //2;
				wmt.formattype			= WMGuids.ToGUID(mt.FormatTypeAsGuid);//WMGuids.ToGUID(WMGuids.WMFORMAT_WaveFormatEx);  //This is the only value permitted.
				wmt.pUnk				= null;
				wmt.cbFormat			= (uint)Marshal.SizeOf( wfex.WaveFormatEx ) + wfex.WaveFormatEx.Size;
				wmt.pbFormat			= wfexPtr;

				//try
				//{
				//  Used GetMediaType to sanity check the managed structs:
				//uint size = 0;
				//audioProps.GetMediaType(IntPtr.Zero,ref size);
				//IntPtr mtPtr = Marshal.AllocCoTaskMem((int)size);
				//audioProps.GetMediaType(mtPtr,ref size);
				//_WMMediaType mt2 = (_WMMediaType)Marshal.PtrToStructure(mtPtr,typeof(_WMMediaType));
				//WMMediaType.WaveFormatEx wfex2 = (WMMediaType.WaveFormatEx)Marshal.PtrToStructure(mt2.pbFormat,typeof(WMMediaType.WaveFormatEx));
				//  Examine here.
				//Marshal.StructureToPtr(mt,mtPtr,true);
				//audioProps.SetMediaType( mtPtr );
				//}
				//catch (Exception e)
				//{
				//	Debug.WriteLine("Failed to set audio properties: " + e.ToString());
				//	return wmt;
				//}	
		
				//PRI3: redesign so that this is freed:
				//Marshal.FreeCoTaskMem(wfexPtr);
			}

			return wmt;
		}

		#endregion
	}
}
