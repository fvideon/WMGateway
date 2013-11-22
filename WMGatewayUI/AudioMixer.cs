using System;
using System.Collections;
using System.Diagnostics;
using MSR.LST;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Basic PCM Audio Mixer.
	/// </summary>
	/// Assume all sources have the same media type.
	public class AudioMixer
	{
		private uint bitsPerSample;
		private uint bufferLength;
		private uint bytesPerSample;
		private byte[] outBuf;
		private long limit;
		private uint sampleCount;
        private int targetChannels;

		public AudioMixer(uint bitsPerSample, uint bufferLength, int targetChannels)
		{
			this.bitsPerSample = bitsPerSample;
			this.bufferLength = bufferLength;
			this.bytesPerSample = bitsPerSample/8;
			this.sampleCount = bufferLength/bytesPerSample;
            this.targetChannels = targetChannels;
			limit = (long)((ulong)1 << (int)bitsPerSample) / 2 - 1; //clip level
		}

        private class BufferAndChannelInfo {
            public BufferChunk BC;

            public ConvertChannelAction Action;

            public long PreviousSample;
            public int SampleCounter;

            public enum ConvertChannelAction {
                ConvertToStereo,
                ConvertToMono,
                None
            }

            public BufferAndChannelInfo(BufferChunk bc, ConvertChannelAction action) {
                BC = bc;
                Action = action;
                SampleCounter = 0;
                PreviousSample = 0;
            }
        }

		public BufferChunk Mix(Hashtable audioBuffers, out ulong time)
		{
			outBuf = new byte[bufferLength];
			ArrayList inbufs = new ArrayList(audioBuffers.Count);
			time = 0;
			foreach (AudioBuffer ab in audioBuffers.Values)
			{
				BufferChunk bc;
				//Note: the Read method uses BufferChunk.Peek, so bc.Index is where the data we want begins.
				if (!ab.Read(out bc,out time)) 
				{
					//should never happen.
					return null;
				}

                BufferAndChannelInfo.ConvertChannelAction channelAction = BufferAndChannelInfo.ConvertChannelAction.None;
                if (ab.Channels != this.targetChannels) {
                    if (this.targetChannels == 2) {
                        channelAction = BufferAndChannelInfo.ConvertChannelAction.ConvertToStereo;
                    }
                    else {
                        channelAction = BufferAndChannelInfo.ConvertChannelAction.ConvertToMono;
                    }
                }

                inbufs.Add(new BufferAndChannelInfo(bc, channelAction));       

			}

			long MixedSample;
			for (int i = 0; i < sampleCount; i++) 
			{	
				MixedSample = 0;

				foreach (BufferAndChannelInfo baci in inbufs) 
				{
                    BufferChunk bc = baci.BC;
                    int offset = i * (int)bytesPerSample;
                    if (baci.Action == BufferAndChannelInfo.ConvertChannelAction.ConvertToMono) {
                       //multiply base offset by 2.  In each of the cases below we want to read 
                       //two samples and average them: i*2 and i*2+1.
                       offset = offset * 2;
                    }
                    if (baci.Action == BufferAndChannelInfo.ConvertChannelAction.ConvertToStereo) {
                        //divide offset by 2 so samples 0 and 1 read from 0, 2 and 3 read from 1, 4 & 5 from 2, etc.
                        offset = (i / 2) * (int)bytesPerSample;
                    }
                    long thisSample = 0;
                    switch (bitsPerSample) {
                        case 8:
                            thisSample = bc.Buffer[offset + bc.Index];
                            if (baci.Action == BufferAndChannelInfo.ConvertChannelAction.ConvertToMono) {
                                thisSample += bc.Buffer[offset + bc.Index + bytesPerSample];
                                thisSample = thisSample / 2;
                            }
                            MixedSample += thisSample;
                            break;
                        case 16:
                            thisSample = BitConverter.ToInt16(bc.Buffer, offset + bc.Index);
                            if (baci.Action == BufferAndChannelInfo.ConvertChannelAction.ConvertToMono) {
                                thisSample += BitConverter.ToInt16(bc.Buffer, offset + bc.Index + (int)bytesPerSample);
                                thisSample = thisSample / 2;
                            }
                            MixedSample += thisSample;
                            break;
                        case 32:
                            thisSample = BitConverter.ToInt32(bc.Buffer, offset + bc.Index);
                            if (baci.Action == BufferAndChannelInfo.ConvertChannelAction.ConvertToMono) {
                                thisSample += BitConverter.ToInt32(bc.Buffer, offset + bc.Index + (int)bytesPerSample);
                                thisSample = thisSample / 2;
                            }
                            MixedSample += thisSample;
                            break;
                        default:
                            break;
                    }
				}

				if (MixedSample > limit) MixedSample = limit;
				if (MixedSample < -limit) MixedSample = -limit;

                int outOffset = i * (int)bytesPerSample;
				switch(bitsPerSample) 
				{
					case  8 : 
						outBuf[outOffset] = (byte)MixedSample; 
						break;
					case 16 :
                        outBuf[outOffset + 1] = (byte)(MixedSample >> 8);
                        outBuf[outOffset] = (byte)(MixedSample); 
						break;
					case 32 :
                        outBuf[outOffset + 3] = (byte)(MixedSample >> 24);
                        outBuf[outOffset + 2] = (byte)(MixedSample >> 16);
                        outBuf[outOffset + 1] = (byte)(MixedSample >> 8);
                        outBuf[outOffset] = (byte)(MixedSample); 
						break;
					default :
                        break;
				}
			}

			return new BufferChunk(outBuf);
		}
	}
}
