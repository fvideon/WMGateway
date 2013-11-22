using System;
using System.Diagnostics;
using MSR.LST.MDShow;
using MSR.LST;
using System.Runtime.InteropServices;
using System.Configuration;


namespace UW.CSE.DISC
{
	/// <summary>
	///	Handle buffering for a video stream.
	/// </summary>
	/// QuerySample method indicates whether a frame is ready to
	/// be read. The sample consumer should use QuerySample to determine sample status
	/// then if a sample is ready, call Read to get the sample.  It is the 
	/// caller's responsibility to QuerySample and ReadAudio/ReadVideo
	/// often enough.  About 50 times per second should be plenty.
	///
	/// One problem with video is that we don't at the outset know how many video
	/// samples per second will be delivered.  The working solution is to begin with
	/// our configured value for video frame duration, then after five seconds of operation,
	/// calculate a new average, and use that one going forward.
	///
	/// The caller must also call AdjustSync regularly.  This allows the buffer to fill in dummy
	/// frames in case the buffer is not being filled rapidly enough.
	///  
	/// It may be necessary to detect
	/// and recover from buffer overrun conditions that would arise from not reading samples
	/// often enough.  This is not currently done.

	public class VideoBuffer
	{
		#region Properties
		private bool sampleReceived;
		/// <summary>
		/// Indicates that at least one sample has been received.
		/// </summary>
		public bool SampleReceived
		{
			get{return sampleReceived;}
		}	
		
		private ulong streamStopTime;
		/// <summary>
		/// Consecutive milliseconds of dummy data we have inserted into the stream.
		/// </summary>
		public ulong StreamStopTime
		{
			get{return streamStopTime;}
		} 

		private bool started = false;
		/// <summary>
		/// Indicates that the caller thinks it's ok to begin.
		/// </summary>
		public bool Started
		{
			get{return started;}
			set
			{
				if ((!started) && (value))
				{
					bufferStartTime = DateTime.Now; //Set on transition to true.
				}
				started = value;
			}
		}

		private bool bufferOverrun;
		/// <summary>
		/// Buffer overrun occurred since the last time this property was checked.
		/// </summary>
		public bool BufferOverrun
		{
			get
			{
				if (bufferOverrun)
				{
					bufferOverrun = false;
					return true;
				}
				return false;
			}
		}

		private String cname;
		/// <summary>
		/// cname corresponding to this buffer
		/// </summary>
		public String Cname
		{
			get{return cname;}
		}

		private uint index;
		/// <summary>
		/// Buffer index corresponding to this buffer
		/// </summary>
		public uint Index
		{
			get{return index;}
		}

		/// <summary>
		/// Frames received from callback
		/// </summary>
		public ulong FramesReceived
		{
			get
			{
				return TotalFrames;
			}
		}

		/// <summary>
		/// Frames fabricated to fill for expected frames
		/// </summary>
		public ulong FramesFaked
		{
			get
			{
				return framesFaked;
			}
		}

		/// <summary>
		/// Current frames ready to be consumed.
		/// </summary>
		public uint CurrentFramesInBuffer
		{
			get 
			{
				return FramesReady;
			}
		}

		private ulong lastWriteTime = 0;
		/// <summary>
		/// Time when the most recent sample was written to buffer, or zero if none.
		/// This is an absolute time in ticks (DateTime.Now.Ticks)
		/// </summary>
		public ulong LastWriteTime
		{
			get
			{
				return lastWriteTime;
			}
		}

		private ulong markInTime = 0;
		/// <summary>
		/// Absolute time in Ticks before which any Writes are ignored.
		/// Zero value disables mark-in.
		/// </summary>
		public ulong MarkInTime
		{
			set
			{
				markInTime = value;	
			}
		}

		private ulong markOutTime = 0;
		/// <summary>
		/// Absolute time in Ticks after which any Writes are ignored.
		/// Zero value disables mark-out.
		/// </summary>
		public ulong MarkOutTime
		{
			set
			{
				markOutTime = value;	
			}
			get
			{
				return markOutTime;
			}
		}

		private ulong lastReadTime = 0;
		/// <summary>
		/// Indicates to the caller that the final sample received before MarkOutTime has been
		/// consumed.
		/// </summary>
		public ulong LastReadTime
		{
			get
			{
				return lastReadTime;
			}
		}

		public ulong TimeZero
		{
			get
			{
				return timeZero;
			}
			set
			{
				timeZero = value;
			}
		}

		/// <summary>
		/// The time at which this video buffer's Start property was set to true.
		/// </summary>
		public DateTime BufferStartTime
		{
			get
			{
				return bufferStartTime;
			}
		}

		#endregion
		#region Declarations

		private UW.CSE.MDShow.MediaType myMediaType;

		private uint FrameSize = 0;			// Bytes in one video frame
		private uint FrameCount = 0;		// Number of Frames the buffer can hold
		private uint FramesReady = 0;		// Number of frames ready to be consumed.
		private uint WriteOffset = 0;		// Next frame to write into buffer
		private uint ReadOffset = 0;		// Next frame to read from the buffer
		private BufferChunk Buffer = null;	// The video buffer.
		private ulong[] PresTime = null;	// Array of presentation times for each frame.
		private uint FrameDuration = 0;		// How many 100 nanosecond units one video frame represents.
		private ulong TotalFrames = 0;		// Count total video frames received since we started.
		private ulong timeZero = 0;			// Reference time for calculating elapsed time in async mode.
		private bool GotVideoPeriod = false;// Indicates that we have made an emperical estimate of the actual video frame duration
		private ulong framesFaked = 0;
		private DateTime bufferStartTime = DateTime.MinValue;

		private const int SIZE_IN_SECONDS = 10; // Buffer size in seconds, given the media type.
        private const uint MAX_FPS = 60;
        private const int MAX_BUFFER = 350000000; // 350MB
        private uint estimatedFps;

		#endregion
		#region Constructor

		public VideoBuffer(uint index, string cname)
		{
			this.index = index;
			this.cname = cname;

			FrameSize = 0;
			FrameDuration = 0; 
			FrameCount = 0;
			Buffer = null;
			PresTime = null;
			WriteOffset = 0;
			ReadOffset = 0;
			FramesReady = 0;
			streamStopTime = 0;
			TotalFrames =0;
			framesFaked = 0;
            estimatedFps = MAX_FPS;
			started = false;
			sampleReceived = false;
			GotVideoPeriod = false;
			bufferOverrun = false;
		}

		#endregion
		#region Public Methods

		/// <summary>
		/// Allocates the storage used by the buffer.  After this method call
		/// the buffer is ready to be started.
		/// </summary>
		/// <param name="mt"></param>
		/// <returns></returns>
		/// Can throw OutOfMemoryException.
		public bool Create(UW.CSE.MDShow.MediaType mt)
		{
			myMediaType = mt;

			UW.CSE.MDShow.MediaTypeVideoInfo vi = myMediaType.ToMediaTypeVideoInfo();
			FrameSize = vi.VideoInfo.BitmapInfo.SizeImage;
			FrameDuration = (uint)vi.VideoInfo.AvgTimePerFrame; 

			Debug.Assert(FrameSize>0,"VideoBuffer received bogus media type");
		
			//Come up with an integer number of frames per second.  There will be some
			// round-off error which should be ignored, Then we'll ceil up to the next int.
			// In fact it turns out we can't really trust the VideoFrameDuration value provided
			// by the filter graph.  We will just do this as a sanity check, but to get the 
			// actual frame rate, we will need to count samples we receive.  

			double numerator = 10000000;
			double denom = FrameDuration;
			double fps = numerator/denom;
			int ifps = (int)fps*10000; // throw away an estimated roundoff error
			fps = ifps/10000.0;
			ifps = (int)Math.Ceiling(fps); // if it's still not an integer, err on the high side.
			
			Debug.Assert(ifps<=MAX_FPS,"VideoBuffer assumes " + MAX_FPS.ToString() + "fps or less");
			Debug.WriteLine("VideoBuffer.Create calculated fps=" + ifps.ToString() + " framesize=" + FrameSize.ToString());

            this.estimatedFps = (ifps <= 30) ? 30 : MAX_FPS;

            // Start assuming we'll use the maximum buffer size
            FrameCount = MAX_BUFFER / FrameSize;
            if (FrameCount > (this.estimatedFps * SIZE_IN_SECONDS)) {
                // Scale it back so as not to overkill if framesize is small enough 
                FrameCount = this.estimatedFps * SIZE_IN_SECONDS;
            }

            //If we can't get as much memory as we initially request, try scaling back up to a point.
            while (true) {
                try {
                    Buffer = new BufferChunk((int)(FrameSize * FrameCount));
                    break;
                }
                catch (OutOfMemoryException) {
                    if (FrameCount <= this.estimatedFps) {
                        throw;
                    }
                    FrameCount = (uint)((double)FrameCount * 0.7);
                    Debug.WriteLine("Warning: VideoBuffer failed to get requested memory.  Scaling buffer down to " + FrameCount.ToString() + " frames.");
                }
            }

			Buffer.Length = (int)(FrameSize * FrameCount);
			PresTime = new ulong[FrameCount];

			WriteOffset = 0;
			ReadOffset = 0;
			FramesReady = 0;
			streamStopTime = 0;
			TotalFrames =0;
			started = false;
			sampleReceived = false;
			GotVideoPeriod = false;
			bufferOverrun = false;
			return true;
		}


		/// <summary>
		/// Find out if a frame is available to be read.
		/// </summary>
		public bool QuerySample(out ulong time)
		{
			time = 0;
			lock (this)
			{
				if (FramesReady > 0)
				{
					time = PresTime[ReadOffset];
					return true;
				}
			}
			return false;
		}


		/// <summary>
		/// This needs to be called regularly.  ElapsedTime is in milliseconds.
		/// </summary>
		public void AdjustSync(ulong ElapsedTime)
		{
			//Don't do anything unless we are underway, and have received at least one sample.
			if ((!started) || (timeZero == 0) || (bufferStartTime==DateTime.MinValue))
			{
				return;
			}

			lock(this)
			{
				//If the video source was switched, this buffer will not have been running for all of ElapsedTime
				TimeSpan localElapsedTime = DateTime.Now - bufferStartTime;
				//Debug.WriteLine("VideoBuffer: localElapsedTime = " + localElapsedTime.TotalMilliseconds.ToString());
				// Adjust the FrameDuration.  This is currently a one shot operation
				// which we will carry out after this buffer has been active for 5 seconds.
				if (!GotVideoPeriod)
				{
					if (localElapsedTime.TotalMilliseconds >= 5000) 
					{
						Debug.WriteLine("VideoBuffer.AdjustSync  Original FrameDuration=" + FrameDuration.ToString());
						FrameDuration = (uint)(10000 * localElapsedTime.TotalMilliseconds/TotalFrames);
						Debug.WriteLine("VideoBuffer.AdjustSync  Calculated FrameDuration=" + FrameDuration.ToString());
						if (FrameDuration < TimeSpan.FromSeconds(1).Ticks/this.estimatedFps)
						{
							FrameDuration = (uint)TimeSpan.FromSeconds(1).Ticks/this.estimatedFps;
							Debug.WriteLine("  Overriding Calculated FrameDuration=" + FrameDuration.ToString());
						}
						GotVideoPeriod = true;
					}
				}

				// Check the state of video reception.  In the case of a lost
				// video stream, we would expect: 
				//   PresTime[WriteOffset-1]/10000
				// to become significanly less than ElapsedTime.
				// To start with, fake enough frames to get the difference 
				// back under a threshold determined by the observed 
				// frame duration.  Use FrameDuration 
				// to make up presentation times for the fake frames.
				uint LastIndex;
				ulong LastFrameTime;
				if (localElapsedTime.TotalMilliseconds > 5500) 
				{  
					if (WriteOffset == 0) 
					{
						LastIndex = FrameCount - 1;
					} 
					else 
					{
						LastIndex = WriteOffset - 1;
					}
					LastFrameTime = PresTime[LastIndex]/10000; 
					//Debug.WriteLine("LastFrameTime: " + LastFrameTime.ToString());
					//printf("lastprestime: %I64u, lastframe: %lu\n", m_pqwVideoPresTime[WriteOffset-1], LastFrameTime);
					if (ElapsedTime > LastFrameTime) 
					{
						//Debug.WriteLine("elapsed time less lastframetime == " + (ElapsedTime - LastFrameTime).ToString());
						while ((ElapsedTime - LastFrameTime) > (FrameDuration*4/10000)) 
						{
							Debug.WriteLine("Inserting a fake frame: lastframe=" + LastFrameTime.ToString() + " elapsedTime=" +  ElapsedTime.ToString() 
								+ " expected frame duration=" + FrameDuration.ToString());
							LastFrameTime += FrameDuration/10000;
							FakeVideoFrame(LastFrameTime);
							streamStopTime += FrameDuration/10000;
						}
					}
				}

			}
		}


		/// <summary>
		/// Read a video frame from the buffer.
		/// </summary>
		public bool Read(out BufferChunk Frame, out ulong Time)
		{
			Time = 0;
			Frame = null;

			lock (this)
			{
				if (FramesReady == 0) 
				{
					return false;
				}
				if ((Buffer == null) || (PresTime == null) ||
					(FrameSize == 0) || (FrameCount== 0)) 
				{
					return false;
				}
				//Debug.WriteLine("VideoBuffer.Read: ReadOffset=" +ReadOffset.ToString());
				Frame = Buffer.Peek((int)(ReadOffset * FrameSize),(int)FrameSize);
				Time = PresTime[ReadOffset];
				lastReadTime = Time + timeZero;
				ReadOffset++;
				if (ReadOffset == FrameCount) 
				{
					ReadOffset = 0;
				}
				FramesReady--;
				return true;
			}
		}

		/// <summary>
		/// Write a video frame into the buffer.
		/// </summary>
		public void Write(IntPtr buf, ulong Time)
		{
			sampleReceived = true;

			// not started yet.
			if (!started) 
				return;

			if ((markInTime != 0) && (Time <= markInTime))
				return;

			if ((markOutTime != 0) && (Time > markOutTime))
				return;

			if ((Buffer == null) || (PresTime == null) ||
				(FrameSize == 0) || (FrameCount== 0)) 
			{
				return;
			}

			lock (this)
			{
				TotalFrames++;
				streamStopTime = 0;

				Debug.Assert(WriteOffset < FrameCount);


				//This can happen under high cpu load conditions, and for now we don't recover:
				if (FramesReady >= FrameCount) 
				{
					Debug.WriteLine("Video buffer overrun detected in VideoBuffer.Write.  Ignoring frame.");
					bufferOverrun = true;
					return;
				} 

				Marshal.Copy(buf, Buffer.Buffer, (int)(WriteOffset * FrameSize), (int)FrameSize);			
				if (timeZero == 0)  // If this is the first, set a reference time.
				{
					timeZero = Time;
					Debug.WriteLine("VideoBuffer.Write setting timeZero: " + timeZero.ToString());
				}

				ulong presTime = Time - timeZero;
				PresTime[WriteOffset] = presTime;
				lastWriteTime = Time;
				//Debug.WriteLine("VideoBuffer.Write PresentationTime=" + PresTime[WriteOffset].ToString());

				WriteOffset++;
				if (WriteOffset == FrameCount) 
				{
					WriteOffset = 0;
				}
				FramesReady++;
				//Debug.WriteLine("VideoBuffer.Write complete. fr=" + FramesReady.ToString() + 
				//	";time=" + presTime.ToString() + ";timeZero=" + timeZero.ToString());

				return;
			}
		}


		#endregion
		#region Private Methods

		/// <summary>
		/// Update arrays and counters to fabricate a dummy frame.
		/// </summary>
		private void FakeVideoFrame(ulong Time)
		{
			if ((!started) || (timeZero == 0))
				return;

			if ((Buffer == null) || (PresTime == null) ||
				(FrameSize == 0) || (FrameCount== 0)) 
			{
				return;
			}
			
			Debug.Assert(WriteOffset < FrameCount);

			if (FramesReady > FrameCount) 
			{
				Debug.WriteLine("Video buffer overrun detected in VideoBuffer.FakeVideoFrame fc=" + FrameCount.ToString() + 
					"fr=" + FramesReady.ToString()); 
				bufferOverrun = true;
				return;
			} 

			PresTime[WriteOffset] = Time*10000;

			//Debug.WriteLine("FakeVideoFrame: new presentation time==" + (PresTime[WriteOffset]).ToString());
			
			uint lastWriteOffset;
			if (WriteOffset == 0)
			{
				lastWriteOffset = FrameCount - 1;
			}
			else
			{
				lastWriteOffset = WriteOffset - 1;
			}

			// Get 10 seconds of identical frames in the buffer to make the video freeze:
			//if ((WriteOffset != 0) && (streamStopTime<10000)) 
			if (streamStopTime<10000)
			{
				Array.Copy(Buffer.Buffer,(lastWriteOffset * FrameSize),
					Buffer.Buffer,(WriteOffset * FrameSize), FrameSize);
			}

			WriteOffset++;
			if (WriteOffset == FrameCount) 
			{
				WriteOffset = 0;
			}
			FramesReady++;
			Debug.WriteLine("Faked frame: fr=" + FramesReady.ToString());
			framesFaked++;
			return;
		}
		#endregion
	}
}
