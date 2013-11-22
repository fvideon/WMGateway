using System;
using System.Diagnostics;
using System.Threading;
using MSR.LST.MDShow;
using MSR.LST;
using System.Runtime.InteropServices;


namespace UW.CSE.DISC
{
	/// <summary>
	/// Support buffering for one audio stream.
	/// </summary>
	/// 
	/// AudioBuffer
	/// Buffer Data for one audio stream.
	///
	/// Maintain a buffer of audio data.  Permit data to be written
	/// to and read from the buffer.  Writes may use any sample size
	/// but reads will be done in quantum units of one second.
	/// The read protocol is to first QuerySample, and if true is returned,
	/// do the Read.  
	///
	/// The caller must invoke the AdjustSync
	/// method on a regular basis (40 or 50 times per second) 
	/// to permit the AudioBuffer to make adjustments to account for
	/// lost data, and to skip audio data if running ahead of real-time.
	///
	/// Since the filtergraphs which supply data to instances of the class may
	/// start at different times with respect to each other, and since this will vary from
	/// run to run, system to system, etc., we need a way to allow the caller
	/// to query us about whether data has arrived, and to give a global start signal.
	/// Until the start signal is received, we will ignore any incoming data.
	///
	/// Some slightly subtle things to note about how this works:
	/// -The thing that drives the synchronization and output are the calls 
	///  made to AdjustSync, QuerySample and Read.  If these calls are not 
	///  made fast enough, things will fail.  QuerySample should
	///  be returning false (no_sample) some significant percentage of 
	///  the time.  The AdjustSync should probably happen 
	///  no less than 50 times per second.  The QuerySample/Read cycle should probably
	///  be done at least 10 times per second.
	/// -There is only a very weak internal throttling function for audio sync.  Generally speaking,
	///  as soon as samples are available they will be noted by the returned value of QuerySample.
	///  This means that we depend on the buffer filling functions to give us (nearly) exactly the amount of
	///  audio data per second for which the buffer was configured.  Sending the buffer significantly
	///  too much audio data will cause things to break.
	///  

	public class AudioBuffer
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
		/// Consecutive milliseconds of silence we have inserted into the stream.
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
			set{started = value;}
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

		private ulong bytesBuffered = 0;
		/// <summary>
		/// Total audio bytes buffered since we began.  In order to synchronize streams that are
		/// added during an encoding session, we need to preset this value to match existing buffers.
		/// </summary>
		public ulong BytesBuffered
		{
			get
			{
				return bytesBuffered;
			}
			set
			{
				bytesBuffered = value;
			}
		}

		private ulong samplesWritten = 0;	// Total quantized samples since we started.
		/// <summary>
		/// Total one-second audio quanta written since we began.  To synchronize streams which are
		/// added during encoding, we need to preset this value to match an existing buffer.
		/// </summary>
		public ulong SamplesWritten
		{
			get
			{
				return samplesWritten;
			}
			set
			{
				samplesWritten = value;
			}
		}

        public int Channels {
            get { return currentChannels; }
        }

		public ManualResetEvent AudioQuantumResetEvent;

        public UW.CSE.MDShow.MediaType AudioMediaType {
            set { this.myMediaType = value; }
        }

		#endregion
		#region Declarations

		private UW.CSE.MDShow.MediaType myMediaType = null;
		private uint SampleSize = 0;		// Bytes in one second
		private uint SampleCount = 0;		// Number of Samples the buffer can hold
		private uint SamplesReady = 0;		// Number of Samples ready to be consumed.
		private uint WriteOffset = 0;		// Next Sample to write into buffer 
		private uint ReadOffset = 0;		// Next Sample to read from the buffer
		private BufferChunk Buffer = null;		// Base address of the audio buffer.
		private byte[] QuietBuffer = null;		// Silence for adjusting audio sync.
		private ulong[] PresTime = null;	// Array of presentation times for each buffered sample.
		private uint BufferSize = 0;		// Size of the audio buffer in bytes.
		private uint BufferPos	= 0;		// Current byte offset -- next byte to write.
		private uint LeftoverBytes = 0;	// Buffered bytes as yet unquantized.
		private uint AddAudio = 0;				// Determine if we need to add audio to resync with real-time.
		private uint SkipAudio = 0;				// Determine if we need to skip audio sample to resync.
		private uint SilenceSize = 0;			// Size of a buffer of quiet we'll keep around for adjusting sync.
        private int currentChannels = 0;

		private const int SIZE_IN_SECONDS = 10; // Buffer size in seconds, given the media type.

		#endregion
		#region Constructor

		public AudioBuffer(uint index, String cname)
		{
			this.index = index;
			this.cname = cname;

			myMediaType = null;
			SilenceSize = 0;
			Buffer = null;
			PresTime = null;
			QuietBuffer = null;			
			AddAudio = 0;				
			SkipAudio = 0;				
			SampleSize = 0;
			SampleCount = 0;
			WriteOffset = 0;
			ReadOffset = 0;
			SamplesReady = 0;
			BufferSize = 0;
			BufferPos	= 0;		
			LeftoverBytes = 0;	
			samplesWritten = 0;
			streamStopTime = 0;
			bytesBuffered = 0;
			started = false;
			sampleReceived = false;
			AudioQuantumResetEvent = new ManualResetEvent(false);
		}
		
		#endregion
		#region Public Methods

		/// <summary>
		/// Allocates the storage used by the buffer.  After this method call
		/// the buffer is ready to be started.
		/// </summary>
		/// <param name="mt"></param>
		/// <returns></returns>
		public bool Create()
		{
            Debug.Assert(myMediaType != null);

            UW.CSE.MDShow.MediaTypeWaveFormatEx wf = myMediaType.ToMediaTypeWaveFormatEx();
			uint bytesPerSec = wf.WaveFormatEx.AvgBytesPerSec;
            currentChannels = wf.WaveFormatEx.Channels;

			if ((bytesPerSec == 0) || (SIZE_IN_SECONDS == 0)) 
			{
				return false;
			}

			//Use about 1/4 second dummy audio sample to correct for lost audio data, or to resync.
			// This has to be evenly divisible by the BlockAlign value which we assume to be 2 or 4.
			// If we assume 4, it works for 2 as well.
			SilenceSize = (uint)(bytesPerSec/16) * 4;

			Buffer = new BufferChunk((int)bytesPerSec * SIZE_IN_SECONDS);
			Buffer.Length = (int)bytesPerSec * SIZE_IN_SECONDS;

			PresTime = new ulong[SIZE_IN_SECONDS];
			QuietBuffer = new byte[SilenceSize];
			
			AddAudio = 0;				
			SkipAudio = 0;				
			SampleSize = bytesPerSec;
			SampleCount = SIZE_IN_SECONDS;
			WriteOffset = 0;
			ReadOffset = 0;
			SamplesReady = 0;
			BufferSize = (uint)bytesPerSec * SIZE_IN_SECONDS;
			BufferPos	= 0;		
			LeftoverBytes = 0;	
			samplesWritten = 0;
			streamStopTime = 0;
			bytesBuffered = 0;
			started = false;
			sampleReceived = false;
			return true;
		}

		/// <summary>
		/// Return true if there is a sample ready, and if 
		/// so, supply the presentation time.
		/// </summary>
		public bool QuerySample(out ulong time)
		{
			time = 0;
			lock (this)
			{
				if (SamplesReady > 0)
				{
					time = PresTime[ReadOffset];
					//Debug.WriteLine("AudioBuffer.QuerySample returning true. cname=" + cname + " time=" + time.ToString());
					return true;
				}
			}
			return false;
		}


		/// <summary>
		///AdjustSync has two functions:
		///1. Make minor adjustments to the audio stream if it seems to be lagging or 
		///   running ahead of real-time.  The purpose is to keep the audio and video
		///   streams in sync.
		///2. Detect the case of audio inputs running behind real-time.
		///   In this case, add enough dummy data to cover the gap.  This is intended
		///   to keep streaming smoothly over an outage.
		/// ElapsedTime is in milliseconds.
		/// </summary>
		public void AdjustSync(ulong ElapsedTime)
		{
			//Don't do anything unless we are underway
			if (!started) 
			{
				return;
			}

			lock(this)
			{
				ulong AudioTime = (bytesBuffered * 1000)/SampleSize; //in milliseconds

				//printf ("AdjustSync: audio time: %I64u, elapsed time: %I64u\n", AudioTime, ElapsedTime);
				if (AudioTime > ElapsedTime) 
				{ 
					if ((AudioTime-ElapsedTime) > 250) 
					{
						Debug.WriteLine("AudioBuffer.AdjustSync: AudioTime="+AudioTime.ToString() + " ElapsedTime=" + ElapsedTime.ToString() +
							" bytesBuffered=" + bytesBuffered.ToString());
						SkipAudio++;
					} 
					else 
					{
						SkipAudio = 0;
					}
					// if SkipAudio exceeds some value (10) Write will ignore the next incoming audio sample.
				} 
				else 
				{ // consider adding audio
					// if it is over by more than 1/4 second for n consecutive times
					// then add about 1/4 second of silence.  Assume we will be called min. 40 times/sec.
					// Possibly make this adaptive based on how far behind we are. 
					if ((ElapsedTime - AudioTime) > 250) 
					{
						AddAudio++;
					} 
					else 
					{
						AddAudio = 0;
					}
					if (AddAudio >= 5) 
					{
						Debug.WriteLine("AdjustSync: Adding audio sample. ElapsedTime=" + ElapsedTime.ToString() +
							" AudioTime=" + AudioTime.ToString() + " for cname=" + cname);
						AddAudio = 0;
						Write(QuietBuffer,SilenceSize,true);
						streamStopTime += 250;
					}
				}
			}
		}

		public override string ToString()
		{
			String ret = "AudioBuffer cname=" + cname + " SamplesReady=" + SamplesReady.ToString() +
				" Unquantized bytes=" + LeftoverBytes.ToString();
			if (SamplesReady != 0)
			{
				ret = ret + " Next ReadTime=" + PresTime[ReadOffset].ToString();
			}
			return ret;
		}

		/// <summary>
		/// Give the caller a reference to the next audio sample.
		/// </summary>
		public bool Read(out BufferChunk Sample, out ulong Time)
		{
			Time = 0;
			Sample = null;

			lock (this)
			{
				if (SamplesReady == 0) 
				{
					return false;
				}
				if ((Buffer == null) || (PresTime == null) ||
					(SampleSize == 0) || (SampleCount == 0)) 
				{
					return false;
				}
				Sample = Buffer.Peek((int)(ReadOffset * SampleSize),(int)SampleSize);
				Time = PresTime[ReadOffset];
				ReadOffset++;
				if (ReadOffset == SampleCount) 
				{
					ReadOffset = 0;
				}
				SamplesReady--;
				//Debug.WriteLine("AudioBuffer:Read for " + cname + ". Remaining samples ready=" + SamplesReady.ToString());
				return true;
			}
		}


		/// <summary>
		/// Write an audio sample from byte[] into the buffer.
		/// Audio samples may come in various sized units, so in addition to 
		/// buffering bytes, we need to update the pointers that track 
		/// the one second quanta that the read operation will use.
		/// </summary>
		private void Write(byte[] Sample, uint Size, bool fake)
		{
			//Debug.WriteLine("AudioBuffer.Write(byte[]... index=" + index.ToString());
			sampleReceived = true;

			// not started yet.
			if (!started) 
				return;

			// This is a simple sync adjustment scheme.
			if (SkipAudio > 10) 
			{
				SkipAudio = 0;
				Debug.WriteLine("Skipping audio sample to readjust sync for cname=" + cname);
				return;
			}

			uint cbBuf, cbWrite, cbWrote, cbNewPos;
			cbBuf = Size;
			cbWrote = 0; 

			if (!fake) 
			{
				streamStopTime = 0;
			}

			lock (this)
			{
				bytesBuffered += Size;

				//Write the bytes into the audio buffer, keeping in mind
				// that it could wrap around.
				while (cbBuf > 0) 
				{
					if ((BufferSize - BufferPos) > cbBuf) 
					{ //write it all
						cbWrite = cbBuf;
						cbNewPos =  BufferPos + cbBuf;
					} 
					else 
					{ //write first part
						cbWrite = BufferSize - BufferPos; 
						cbNewPos = 0;
					}
					Array.Copy(Sample,0,Buffer.Buffer,BufferPos,cbWrite);
					BufferPos=cbNewPos;
					cbBuf -= cbWrite;
					cbWrote +=  cbWrite;
				}

				// Quantize newly buffered and previously unused bytes.
				cbBuf = LeftoverBytes + Size;
				while (cbBuf >= SampleSize) 
				{
					PresTime[WriteOffset] = samplesWritten * 10000 * 1000;
					samplesWritten++;
					WriteOffset++;
					if (WriteOffset == SampleCount) 
					{
						WriteOffset = 0;
					}
					cbBuf -= SampleSize;
					SamplesReady++;
					AudioQuantumResetEvent.Set();
				}
				LeftoverBytes = cbBuf;
			}
		}

		/// <summary>
		/// Write an audio sample from IntPtr into the buffer.
		/// This is not very cleverly overloaded.  The only difference is the Marshal.Copy.
		/// </summary>
		public void Write(IntPtr Sample, uint Size)
		{
			//Debug.WriteLine("AudioBuffer.Write(IntPtr... index=" + index.ToString());
			sampleReceived = true;
			bool fake = false;
			// not started yet.
			if (!started) 
				return;

			// This is a simple sync adjustment scheme.
			if (SkipAudio > 10) 
			{
				SkipAudio = 0;
				Debug.WriteLine("Skipping audio sample to readjust sync for cname=" + cname);
				return;
			}

			uint cbBuf, cbWrite, cbWrote, cbNewPos;
			cbBuf = Size;
			cbWrote = 0; 

			if (!fake) 
			{
				streamStopTime = 0;
			}

			lock (this)
			{
				bytesBuffered += Size;

				//Write the bytes into the audio buffer, keeping in mind
				// that it could wrap around.
				while (cbBuf > 0) 
				{
					if ((BufferSize - BufferPos) > cbBuf) 
					{ //write it all
						cbWrite = cbBuf;
						cbNewPos =  BufferPos + cbBuf;
					} 
					else 
					{ //write first part
						cbWrite = BufferSize - BufferPos; 
						cbNewPos = 0;
					}
					Marshal.Copy(Sample,Buffer.Buffer,(int)BufferPos,(int)cbWrite);
					//Array.Copy(Sample,0,Buffer.Buffer,BufferPos,cbWrite);
					BufferPos=cbNewPos;
					cbBuf -= cbWrite;
					cbWrote +=  cbWrite;
				}

				// Quantize newly buffered and previously unused bytes.
				cbBuf = LeftoverBytes + Size;
				while (cbBuf >= SampleSize) 
				{
					PresTime[WriteOffset] = samplesWritten * 10000 * 1000;
					samplesWritten++;
					WriteOffset++;
					if (WriteOffset == SampleCount) 
					{
						WriteOffset = 0;
					}
					cbBuf -= SampleSize;
					SamplesReady++;
					AudioQuantumResetEvent.Set();
				}
				LeftoverBytes = cbBuf;
			}
		}

		#endregion
	}
}
