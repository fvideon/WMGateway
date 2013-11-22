using System;
using MSR.LST.MDShow;
using UW.CSE.MDShow;
using System.Diagnostics;
using System.Runtime.InteropServices;


namespace UW.CSE.DISC
{
	/// <summary>
	/// Callback class for DirectShow sampleGrabber filters.
	/// </summary>
	public class SGCallback : ISampleGrabberCB
	{
		private MediaBuffer mediaBuffer;
		private int index;

		public SGCallback(MediaBuffer buf, int index)
		{
			mediaBuffer = buf;
			this.index = index;
		}
		public SGCallback()
		{}

		public void Init()
		{}

		//hacked the idl to try to make this one return IMediaSample, but failed.
		//public void SampleCB(double time, ref IMediaSample samp)
		public void SampleCB(double time, IntPtr samp)
		{			
			return;
		}

		//This one eventually did work if I passed a IntPtr to the unmanaged buffer.
		// BYTE ** in the idl file translates to IntPtr.  
		public void BufferCB(double time, System.IntPtr mybuf, int blen)
		{
			//time is as a number of whole and fractional seconds.  It only works for audio. 
			mediaBuffer.WriteSample(mybuf,blen,index);
		}

	}
	
}
