using System;
using System.Threading;
using System.Collections;
using System.Diagnostics;
using MSR.LST.MDShow;
using MSR.LST;
using MSR.LST.Net.Rtp;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Buffer samples received from DirectShow and feed them to the Windows Media Writer with
	/// the proper ordering and timing.
	/// </summary>
	/// To produce a smooth encoded stream, the 
	/// Windows Media format SDK requires audio and video data
	/// to be properly ordered, and delivered in a timely manner.
	/// The DirectShow sample grabber filters
	/// operate independently, so they are never exactly in sync
	/// The buffer allows us to deliver the 
	/// samples in the order of presentation time,
	/// and in the face of missing data, to fabricate enough dummy
	/// data to keep the Windows Media stream running.
	/// We need to support a variable number of audio streams, so
	/// each stream gets its own buffer.  This is managed by
	/// farming out the work specific to audio to the AudioBuffer
	/// class, and video to VideoBuffer.  The higher-level
	/// management happens here.
	/// 
	/// To start call CreateBufferIndex once for each stream, then call
	/// SetMediaTypes and CreateBuffers.
	/// 
	/// An index is assigned and given to the sample producers so that
	/// they will be able to identify the stream when calling the Write
	/// method.  
	///   
	/// A thread iterates over audio and video buffers to retrieve samples
	/// and to invoke adjust sync methods.  When samples are ready, an event
	/// is raised.  the thread uses sample presentation
	/// times to determine which result to return.  In particular,
	/// it will return video samples up until the presentation
	/// time of the next audio sample.  It will not return a
	/// video sample with a presentation time greater than the end
	/// of the previous audio sample.  Likewise, it will not return
	/// the next audio sample until video samples up to the end
	/// of the previous audio sample have been returned.
	///
	/// Since the graphs may
	/// start at different times with respect to each other, and since this will vary from
	/// run to run, system to system, etc, we need a way to get a reference time
	/// for all graphs.  The approach we take is to ingore input until 
	/// writes have been received from all audio and video graphs.  Only at this
	/// time will we begin buffering data.  
	/// 
	/// It is also possible to add and remove audio buffers and to change video buffers
	/// during an ecoding session.  To make a smooth transition, these operations employ
	/// special temporary buffers and use distinct methods.


	public class MediaBuffer
	{

		#region Properties
		/// <summary>
		/// Video Buffer Overrun occurred in the time since the property was last checked.
		/// </summary>
		public bool VideoBufferOverrun
		{
			get {return videoBuffer.BufferOverrun;}
		}

		/// <summary>
		/// Elapsed time since encoding was started in whole and fractional seconds.
		/// </summary>
		public double EncodeTime
		{
			get 
			{
				if (TimeZero==DateTime.MinValue)
					return 0;
				TimeSpan ts = DateTime.Now - TimeZero;
				return ts.TotalSeconds;
			}
		}

		/// <summary>
		/// Total video frames received
		/// </summary>
		public ulong VideoFramesReceived
		{
			get
			{
				return videoBuffer.FramesReceived;
			}
		}

		/// <summary>
		/// Total video frames copied to fill for missing data
		/// </summary>
		public ulong VideoFramesFaked
		{
			get
			{
				return videoBuffer.FramesFaked;
			}
		}

		/// <summary>
		/// Current video frame count in buffer.
		/// </summary>
		public uint CurrentVideoFramesInBuffer
		{
			get
			{
				return videoBuffer.CurrentFramesInBuffer;
			}
		}
		/// <summary>
		/// Elapsed time the current video buffer has been running in whole and fractional seconds.
		/// </summary>
		public double VideoBufferTime
		{
			get
			{
				TimeSpan bt = DateTime.Now - videoBuffer.BufferStartTime;
				return bt.TotalSeconds;
			}
		}
		#endregion
		#region Declarations
		
		private bool started; //Start method called and SampleWriter thread is running
		private bool writing; //Buffering and writing: only after samples have been received from all sources.
		private bool stopNow; //Signal SampleWriter thread to stop.
		private Thread sampleWriterThread;
		/// <summary>
		/// key is the stream index we assign.  Value is a AudioBuffer.
		/// </summary>
		private Hashtable audioBuffers;
		private VideoBuffer videoBuffer; //This is the main video buffer
		private VideoBuffer tmpVideoBuffer; //A second video buffer which is only in use during a change in video source during encoding.
		private AudioBuffer tmpAudioBuffer;
		private UW.CSE.MDShow.MediaType tmpVideoMediaType;
		private UW.CSE.MDShow.MediaType tmpAudioMediaType;
		private WMWriter wmWriter = null;
		private int nextIndex;
		private uint maxAudioStreams;
		private DateTime TimeZero; //DateTime.Now from the time when 'writing' became true.
		UW.CSE.MDShow.MediaType audioMediaType;
		UW.CSE.MDShow.MediaType videoMediaType;
		private ulong audioEndTime; //the end time of the previously delivered audio sample
		private AudioMixer audioMixer;
		private ManualResetEvent videoSwitchCompletedResetEvent;
		private EventLog		eventLog;
		private String videoSourceChangeError;

		#endregion
		#region Constructor

		public MediaBuffer(uint maxAudioStreams)
		{
			eventLog = new EventLog("WMG",".","WMGCore");
			started = false;
			writing = false;
			stopNow = false;
			nextIndex = 0;
			audioBuffers = new Hashtable();
			audioMediaType = null;
			videoMediaType = null;
			TimeZero = DateTime.MinValue; //indicates unassigned.
			this.maxAudioStreams = maxAudioStreams;
			audioEndTime = 0;
			videoSwitchCompletedResetEvent = new ManualResetEvent(true);
		}

		
		/// <summary>
		/// Stop sampleWriter thread if necessary, then release buffers
		/// </summary>
		public void Dispose()
		{
			if (started)
			{
				Stop();
			}
			videoBuffer = null;
			tmpVideoBuffer = null;
			tmpAudioBuffer = null;
			audioBuffers.Clear();		
		}


		#endregion
		#region Public Methods

		/// <summary>
		/// Allocate storage for all buffers.  This should be called after CreateBufferIndex,
		/// after SetMediaTypes and before Start.  Also create the audio mixer here.
		/// </summary>
		/// <returns></returns>
		public bool CreateBuffers()
		{
			if ((audioMediaType==null) || (videoMediaType==null))
				return false;
			
			UW.CSE.MDShow.MediaTypeWaveFormatEx wf = audioMediaType.ToMediaTypeWaveFormatEx();
			audioMixer = new AudioMixer(wf.WaveFormatEx.BitsPerSample,wf.WaveFormatEx.AvgBytesPerSec, wf.WaveFormatEx.Channels);

			if (videoBuffer!=null)
			{
				if (!videoBuffer.Create(videoMediaType))
					return false;
			}
			else
				return false;

			lock (this)
			{
				foreach (AudioBuffer ab in audioBuffers.Values)
				{
					if (!ab.Create())
						return false;
				}
			}
			return true;
		}

		/// <summary>
		/// Allocate and configure one of the temp buffers.  These are to be used in preparation for 
		/// switching sources while encoding.
		/// </summary>
		/// <param name="index"></param>
		/// <param name="mt"></param>
		public void CreateTempBuffer(int index,UW.CSE.MDShow.MediaType mt)
		{
			if ((tmpVideoBuffer != null) && (tmpVideoBuffer.Index == index))
			{
				tmpVideoMediaType = mt;
				tmpVideoBuffer.Create(mt);
			}
			else if ((tmpAudioBuffer != null) && (tmpAudioBuffer.Index == index))
			{
				tmpAudioMediaType = mt;
                tmpAudioBuffer.AudioMediaType = mt;
				tmpAudioBuffer.Create();	
			}
		}


		/// <summary>
		/// Configure media types.  Must do this before creating buffers.
		/// </summary>
		/// <returns></returns>
		public void SetMediaTypes(UW.CSE.MDShow.MediaType audioType, UW.CSE.MDShow.MediaType videoType)
		{
			audioMediaType = audioType;
			videoMediaType = videoType;
		}

		/// <summary>
		/// Start buffering and delivering samples. 
		/// </summary>
		/// <returns></returns>
		public bool Start()
		{
			if (started)
				return true;

			sampleWriterThread = new Thread(new ThreadStart(SampleWriterThread));
			sampleWriterThread.Name = "Sample Writer Thread";
            sampleWriterThread.TrySetApartmentState(ApartmentState.MTA);//Needed for WM interop
			sampleWriterThread.Start();
			started = true;

			return true;
		}

		/// <summary>
		/// Stop buffering and delivering samples.
		/// </summary>
		/// <returns></returns>
		public bool Stop()
		{
			stopNow = true;
			while (started)
			{
				Thread.Sleep(20);
			}
			stopNow = false;
			//clear the buffers?
			return true;
		}

		/// <summary>
		/// Create a new buffer index associated with the given cname and payload. Note that the
		/// buffer does not exist until SetMediaTypes and CreateBuffers methods have been called.
		/// The index uniquely identifies the stream so that when a sample grabber callback writes
		/// a sample, the sample goes to the correct buffer.  We do not use ssrc to identify the 
		/// stream because the buffer needs to exist for the duration of an encoding session while
		/// the ssrc may change during that time.
		/// </summary>
		/// <param name="cname"></param>
		/// <param name="payload"></param>
		/// <returns>Index, or -1 indicates an error</returns>
		public int CreateBufferIndex(String cname, PayloadType payload)
		{
			int newIndex = -1;
			if (payload == PayloadType.dynamicVideo)
			{
				if (videoBuffer == null)
				{
					videoBuffer = new VideoBuffer((uint)nextIndex,cname);
					newIndex = nextIndex;
					nextIndex++;
				}
				else 
				{
					return -1;
				}
			}
			else if (payload == PayloadType.dynamicAudio)
			{
				if (audioBuffers.Count < maxAudioStreams)
				{
					audioBuffers.Add(nextIndex,new AudioBuffer((uint)nextIndex,cname));
					newIndex = nextIndex;
					nextIndex++;
				}
				else
				{
					return -1;
				}
			}
			return newIndex;

		}

		/// <summary>
		/// The MediaBuffer maintains one temporary buffer each for audio and video.  These are used
		/// during the process of changing sources during an encode session.
		/// </summary>
		/// <param name="cname"></param>
		/// <param name="payload"></param>
		/// <returns></returns>
		public int CreateTempBufferIndex(string cname, PayloadType payload)
		{
			int newIndex = -1;
			if (payload == PayloadType.dynamicVideo)
			{
				tmpVideoBuffer = new VideoBuffer((uint)nextIndex,cname);
				newIndex = nextIndex;
				nextIndex++;
			}
			else if (payload == PayloadType.dynamicAudio)
			{
				tmpAudioBuffer = new AudioBuffer((uint)nextIndex,cname);
				newIndex = nextIndex;
				nextIndex++;
			}
			return newIndex;
		}

		/// <summary>
		/// Wait for the tmpVideoBuffer to receive data, then splice it in place of the main video buffer.
		/// This is to implement changing video source during encoding.  Synchronize with sample writer thread
		/// and WriteSample method.  Reset the video mediaType during the swap.
		/// The old video buffer can be disposed after the swap.
		/// Return the error message if any.
		/// </summary>
		public string ReplaceVideoBuffer(WMWriter wmw)
		{
			string errorMsg = "";
			if (tmpVideoBuffer != null)
			{
				for (int i=0; i<200;i++)
				{
					if (tmpVideoBuffer.SampleReceived)
					{
						Debug.WriteLine("tmpVideoBuffer received sample at i=" + i.ToString());
						break;
					}
					Thread.Sleep(100);
				}
				if (tmpVideoBuffer.SampleReceived)
				{
					//Set the splice time in the near future.
					tmpVideoBuffer.MarkInTime = videoBuffer.MarkOutTime = videoBuffer.LastWriteTime + (ulong)TimeSpan.FromMilliseconds(500).Ticks;
					Debug.WriteLine("ReplaceVideoBuffer: lastWriteTime=" + videoBuffer.LastWriteTime.ToString() +
						" mo="  + videoBuffer.MarkOutTime.ToString());
					tmpVideoBuffer.TimeZero = videoBuffer.TimeZero;
					tmpVideoBuffer.Started = true;
					//Wait for swap to be done by the sample writer thread.
					wmWriter = wmw; //Needed to reset media type.
					videoSwitchCompletedResetEvent.Reset();
					if (!videoSwitchCompletedResetEvent.WaitOne(20000,false))
					{
						errorMsg = "MediaBuffer timed out waiting for video source switch.";
						Debug.WriteLine("MediaBuffer: timed out waiting for video source switch.");
					}
					else
					{
						errorMsg = videoSourceChangeError;
					}
					wmWriter = null;
				}
				else
				{
					errorMsg = "VideoBuffer timed out waiting for samples.";
					Debug.WriteLine("VideoBuffer timed out waiting for samples.");
				}
			}
			return errorMsg;
		}

		public bool RemoveAudioBuffer(string cname)
		{
			int index = -1;
			lock (this)
			{
				foreach (AudioBuffer ab in audioBuffers.Values)
				{
					if (ab.Cname == cname)
					{
						index = (int)ab.Index;
						break;
					}
				}
				if (index != -1)
				{
					audioBuffers.Remove(index);
					return true;
				}
			}
			return false;
		}

		/// <summary>
		/// Support adding an audio stream during an encoding session.
		/// Wait for tmpAudioBuffer to receive data, then start it.
		/// To synchronize with existing streams, pick an existing buffer and wait for the reception of
		/// the next one-second quantum of audio data to be completed.  At that point in time the new
		/// buffer starts buffering samples.  Only after the next read has taken place in the 
		/// SampleWriterThread does the new buffer become a member of the audioBuffers collection.
		/// </summary>
		/// <returns>error message or null string</returns>
		public string AddAudioBuffer()
		{
			if (tmpAudioBuffer == null)
			{
				return "Audio buffer not found.";
			}

			for (int i=0; i<400;i++)
			{
				if (tmpAudioBuffer.SampleReceived)
				{
					Debug.WriteLine("tmpAudioBuffer received sample at i=" + i.ToString());
					break;
				}
				Thread.Sleep(50);
			}
			if (!tmpAudioBuffer.SampleReceived)
			{
				return "Audio buffer timed out waiting for sample.";
			}
			
			//Here we want to wait for one of the existing buffers to reach the point where it has
			//just packed up a quantum of audio.  At that time we set the new buffer's BytesBuffered and
			//SamplesWritten properties to match the existing buffer, and start the new buffer.

			AudioBuffer modelBuffer = null;
			lock (this)
			{
				//Pick an arbitrary existing buffer.
				foreach (AudioBuffer ab in audioBuffers.Values)
				{
					modelBuffer = ab;
					break;
				}
			}
			
			//Wait for quantum boundary.
			modelBuffer.AudioQuantumResetEvent.Reset();
			if (!modelBuffer.AudioQuantumResetEvent.WaitOne(20000,false))
			{
				Debug.WriteLine("MediaBuffer: timed out waiting for audio source switch.");
				return "MediaBuffer timed out waiting for audio source switch.";
			}

			lock (this)
			{
                tmpAudioBuffer.SamplesWritten = modelBuffer.SamplesWritten;
                if (tmpAudioBuffer.Channels == modelBuffer.Channels) {
                    tmpAudioBuffer.BytesBuffered = modelBuffer.BytesBuffered;
                }
                else {
                    if (tmpAudioBuffer.Channels == 1) {
                        tmpAudioBuffer.BytesBuffered = modelBuffer.BytesBuffered / 2;
                    }
                    else {
                        tmpAudioBuffer.BytesBuffered = modelBuffer.BytesBuffered * 2;
                    }
                }
				//set the new buffer running..
				tmpAudioBuffer.Started = true;
			}

			// Let the SampleWriterThread add the new buffer to the
			// collection after the next read.  In the mean time AdjustSync will be called on the
			// new buffer.

			return "";
		}


		/// <summary>
		/// Retreive the media buffer index for the given cname and payload.  Returns -1 if the 
		/// buffer does not exist.
		/// </summary>
		/// <param name="cname"></param>
		/// <param name="payload"></param>
		/// <returns></returns>
		public int GetBufferIndex(String cname, PayloadType payload)
		{
			if (payload == PayloadType.dynamicVideo)
			{
				if ((videoBuffer!=null) && (videoBuffer.Cname == cname))
				{
					return (int)videoBuffer.Index;
				}
			}
			else if (payload == PayloadType.dynamicAudio)
			{
				lock (this)
				{
					foreach (AudioBuffer ab in audioBuffers.Values)
					{
						if (ab.Cname == cname)
						{
							return (int)ab.Index;
						}
					}
				}
			}
			return -1;
		}

		/// <summary>
		/// Accept new inbound sample from the SampleGrabber Callback
		/// </summary>
		public void WriteSample(IntPtr buf, int blen, int index)
		{
			if (index < 0)
				return;
			
			long time = DateTime.Now.Ticks;

			lock (this)
			{
				if (started)
				{
					if ((videoBuffer!=null) && (index == videoBuffer.Index))
					{
						videoBuffer.Write(buf,(ulong)time);
					}
					else if (audioBuffers.ContainsKey(index))
					{
						((AudioBuffer)(audioBuffers[index])).Write(buf,(uint)blen);
					} 
					else if ((tmpVideoBuffer != null) && (index == tmpVideoBuffer.Index))
					{
						tmpVideoBuffer.Write(buf,(ulong)time);				
					}
					else if((tmpAudioBuffer != null) && (index == tmpAudioBuffer.Index))
					{
						tmpAudioBuffer.Write(buf,(uint)blen);
					}
					else
					{
						Debug.WriteLine("MediaBuffer received sample for unknown index=" + index.ToString());
					}

					//see if it is time to send the global start signal to all the buffers now.
					if (!writing)
					{
						if (videoBuffer.SampleReceived)
						{
							foreach (AudioBuffer ab in audioBuffers.Values)
							{
								if (!ab.SampleReceived)
								{
									return;
								}
							}
							writing = true;
							TimeZero = DateTime.Now;
							Debug.WriteLine("MediaBuffer TimeZero set to:" + TimeZero.Ticks.ToString());
							videoBuffer.TimeZero = (ulong)TimeZero.Ticks;
							videoBuffer.Started = true;
							foreach (AudioBuffer ab in audioBuffers.Values)
							{
								//PRI2: should we be syncing TimeZero for audio buffers too?  Probably doesn't matter
								ab.Started = true;
							}
						}
					}
				}
			}
		}



		/// <summary>
		/// Return the number of consecutive milliseconds this stream has been stuck.  
		/// Return 0 if the stream is not found.
		/// </summary>
		/// <param name="cname"></param>
		/// <param name="payload"></param>
		/// <returns></returns>
		public ulong GetStreamStopTime(String cname,PayloadType payload)
		{
			if (payload == PayloadType.dynamicVideo)
			{
				if (cname == videoBuffer.Cname)
					return videoBuffer.StreamStopTime;
			}
			else if (payload == PayloadType.dynamicAudio)
			{
				lock (this)
				{
					foreach (AudioBuffer ab in audioBuffers.Values)
					{
						if (cname == ab.Cname)
						{
							return ab.StreamStopTime;
						}
					}
				}
			}
			return 0;
		}

		/// <summary>
		/// Return audio bytes buffered for the given cname
		/// </summary>
		/// <param name="cname"></param>
		/// <returns></returns>
		public ulong GetBytesBuffered(String cname)
		{
			lock (this)
			{
				foreach (AudioBuffer ab in audioBuffers.Values)
				{
					if (cname == ab.Cname)
					{
						return ab.BytesBuffered;
					}
				}
			}
			return 0;
		}

        public string GetAudioStreamStats(string cname) { 
			lock (this)
			{
				foreach (AudioBuffer ab in audioBuffers.Values)
				{
					if (cname == ab.Cname)
					{
                        return "bytes=" + ab.BytesBuffered.ToString() + ";channels=" + ab.Channels.ToString();
					}
				}
			}
			return "";       
        }

        internal void RegisterAudioMediaType(UW.CSE.MDShow.MediaType mt, int index) {
            if (audioBuffers.ContainsKey(index)) {
                ((AudioBuffer)audioBuffers[index]).AudioMediaType = mt;
            }
        }

		#endregion
		#region Private Methods

		/// <summary>
		/// Thread procedure to raise events at appropriate times to keep samples running smoothly.
		/// </summary>
		private void SampleWriterThread()
		{
			while (!stopNow)
			{
				ulong time;
				SampleType st = QuerySample(out time);
				BufferChunk buf;
				if (st == SampleType.AudioSample)
				{
					lock (this)
					{
						buf = audioMixer.Mix(audioBuffers,out time);
					}
					if (buf!=null)
					{
						//Debug.WriteLine("SampleWriterThread: audio bytes " + buf[345].ToString() + " " +
						//	buf[346].ToString() + " " + buf[347].ToString() + " " + buf[348].ToString());

						//Check if there is a new audio stream ready to be added:
						if ((tmpAudioBuffer != null) && (tmpAudioBuffer.Started))
						{
							audioBuffers.Add((int)tmpAudioBuffer.Index,tmpAudioBuffer);
							tmpAudioBuffer = null;
						}
						
						if (OnSampleReady != null)
						{
							OnSampleReady(new SampleEventArgs(buf,PayloadType.dynamicAudio,time));
						}
						audioEndTime = time + (10000 * 1000) - 1;
					}
				}
				else if (st == SampleType.VideoSample)
				{
					if (videoBuffer.Read(out buf, out time))
					{
						//Debug.WriteLine("SampleWriterThread: video bytes " + buf[345].ToString() + " " +
						//	buf[346].ToString() + " " + buf[347].ToString() + " " + buf[348].ToString());

						if (OnSampleReady != null)
						{
							OnSampleReady(new SampleEventArgs(buf,PayloadType.dynamicVideo,time));
						}					
					}
				}
				else
				{
					//Debug.WriteLine ("No Sample this time.");
				}

				AdjustSync();

				CheckVideoSourceChange();

				//We may improve reliability/perf if we can adjust sleep time dynamically.
				Thread.Sleep(10);
			}
			writing = false;
			started = false;
		}


		/// <summary>
		/// Query the videobuffer to find out if the last sample at or after markOutTime has been read.
		/// If it has, swap the tmpVideoBuffer in place of videobuffer.
		/// </summary>
		private void CheckVideoSourceChange()
		{
			if (videoBuffer.MarkOutTime == 0)
				return;

			Debug.WriteLine("CheckVideoSourceChange: mo=" + videoBuffer.MarkOutTime.ToString() + 
				" lastRead=" + videoBuffer.LastReadTime.ToString()
				+ " now=" + DateTime.Now.Ticks.ToString());

			//Here we wait for up to 5 seconds for the old video buffer to finish writing up through the mark out time.
			//If we have ultra-low frame rate video (such as screen streaming) the timeout does get used.
			//The impact of not using the timeout is that we have potential for buffer overruns in the new buffer.
			if ((videoBuffer.LastReadTime >= videoBuffer.MarkOutTime) ||
				(DateTime.Now.Ticks > (long)(videoBuffer.MarkOutTime) + TimeSpan.FromSeconds(5).Ticks))
			{
				videoSourceChangeError = "";
				lock (this)
				{
					videoBuffer = tmpVideoBuffer;
					tmpVideoBuffer = null;

					if ((wmWriter!=null) && (wmWriter.ConfigVideo(tmpVideoMediaType)))
					{
						videoMediaType = tmpVideoMediaType;
						//success.
					}
					else
					{
						videoSourceChangeError = "Failed to reset video media type.";
						Debug.WriteLine("Failed to reset video media type.");
					}
				}
				videoSwitchCompletedResetEvent.Set();
			}
		
		}

		/// <summary>
		/// Query buffers to find out if samples are ready to read.
		/// </summary>
		/// <returns></returns>
		private SampleType QuerySample(out ulong time)
		{
			ulong atime, vtime;
			bool audioReady = QueryAudioSamples(out atime);
			bool videoReady = videoBuffer.QuerySample(out vtime);
			time = 0;

			// If both audio and video samples are ready, 
			// report the one with the lesser presentation time.
			if (audioReady && videoReady)
			{
				if (atime <= vtime) 
				{
					time = atime;
					return SampleType.AudioSample;
				} 
				else 
				{
					time = vtime;
					return SampleType.VideoSample;
				}
			}
	
			// If there are no available audio samples, and 
			// the next video sample presentation
			// time is still less or equal to the time of the
			// end of the previous audio sample, report it.
			if (videoReady) 
			{
				if (vtime <= audioEndTime)
				{
					time = vtime;
					return SampleType.VideoSample;
				}
			}

			return SampleType.NoSample;		
		}

		
		private void AdjustSync()
		{
			//Don't do anything unless we are underway
			if ((!writing) || (TimeZero == DateTime.MinValue)) 
			{
				return;
			}

			TimeSpan ElapsedTime = DateTime.Now - TimeZero;
			videoBuffer.AdjustSync((ulong)ElapsedTime.TotalMilliseconds);
			lock (this)
			{
				foreach (AudioBuffer ab in audioBuffers.Values)
				{
					ab.AdjustSync((ulong)ElapsedTime.TotalMilliseconds);
				}
				if (tmpAudioBuffer != null)
				{
					tmpAudioBuffer.AdjustSync((ulong)ElapsedTime.TotalMilliseconds);
				}
			}
		}


		private bool QueryAudioSamples(out ulong audioTime)
		{
			audioTime = 0;
			ulong lastAudioTime = 0;
			bool ret = true;
			// find out if all audio buffers are ready to deliver a sample
			// and make sure the times all match.
			lock (this)
			{
				foreach (AudioBuffer ab in audioBuffers.Values) 
				{
					if (!ab.QuerySample(out audioTime))
					{
						ret = false;
					}
					else
					{
						if ((lastAudioTime != 0) && (audioTime != lastAudioTime))
						{
							Debug.WriteLine("**Warning: Audio buffer times do not match in QueryAudioSamples");
							eventLog.WriteEntry("Audio buffer times do not match in QueryAudioSamples: current=" +
								audioTime.ToString() + " last=" + lastAudioTime.ToString(), EventLogEntryType.Warning, 1004);
						}
						lastAudioTime = audioTime;
					}
				}
			}

			return ret;
		}

		#endregion
		#region Events

		/// <summary>
		/// Tell the sample consumer that a sample is ready.
		/// </summary>
		public event sampleReadyHandler OnSampleReady;
		public delegate void sampleReadyHandler(SampleEventArgs ea);
		#endregion

    }

    #region Utility
    public class SampleEventArgs : EventArgs
	{
		public BufferChunk Buffer;
		public PayloadType Type;
		public ulong Time;
		public SampleEventArgs(BufferChunk buf, PayloadType payload, ulong time)
		{
			Buffer = buf;
			Type = payload;
			Time = time;
		}
	}

	public enum SampleType
	{
		AudioSample,
		VideoSample,
		NoSample
	}

    #endregion Utility
}
