using System;
using System.Diagnostics;
using MSR.LST.Net.Rtp;
using MSR.LST.MDShow;
//using MSR_LST_MDShow;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Manage one audio graph
	/// </summary>
	public class AudioGraphBuilder : GraphBuilder
	{
		private bool muted;
		private int volume;
		private const int SILENCE = -10000;
		private const int FULL_VOLUME = 0;

		public AudioGraphBuilder(MediaBuffer mb,int index,bool muted):
			base(mb,index)
		{
			this.muted = muted;
			if (muted)
				volume = SILENCE;
			else
				volume = FULL_VOLUME;
		}

        public int Index {
            get { return base.index; }
        }

		#region Public Methods
		
		public bool Build(RtpStream stream)
		{
			if (base.Build(PayloadType.dynamicAudio,stream))
			{
				if (SetMute(this.muted))
					return true;
			}
			return false;
		}		

		public bool Restart(RtpStream newStream)
		{
			Stop();
			Teardown();

			System.Threading.Thread.Sleep(500); // This is an attempt to work around an occasional render failure that occurs only when running over remote desktop.

			if (!Build(newStream))
			{
				Teardown();
				errorMsg = "Failed to rebuild graph.";
				return false;
			}

			if (!Run())
			{
				Stop();
				Teardown();
				errorMsg = "Failed to start graph.";
				return false;
			}

			return true;
		}

		/// <summary>
		/// Mute or unmute audio.
		/// </summary>
		/// <param name="muted"></param>
		/// <returns></returns>
		public bool SetMute(bool muted)
		{
			IBasicAudio iBA = (IBasicAudio)fgm;            

			this.muted = muted;
			if (muted)
				volume = SILENCE;
			else
				volume = FULL_VOLUME;

			try
			{
				iBA.Volume = volume;
			}
			catch (Exception e)
			{
				eventLog.WriteEntry("AudioGraphManager failed to set mute: " + e.ToString(), EventLogEntryType.Error, 1001);
				Debug.WriteLine("AudioGraphManager failed to set mute: " + e.ToString());
				return false;
			}
			return true;
		}

		#endregion


	}
}
