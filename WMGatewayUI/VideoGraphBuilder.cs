using System;
using System.Diagnostics;
using MSR.LST.Net.Rtp;
using MSR.LST.MDShow;
//using MSR_LST_MDShow;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Manage one video graph
	/// </summary>
	public class VideoGraphBuilder : GraphBuilder
	{

		private bool visible;
		private const int VISIBLE = -1;
		private const int INVISIBLE = 0;
		private const int WS_MINIMIZEBOX = 0x00020000;
		private const int WS_MAXIMIZEBOX = 0x00010000;
		private const int WS_SYSMENU = 0x00080000;

		public VideoGraphBuilder(MediaBuffer mb,int index, bool visible):
			base(mb,index)
		{
			this.visible = visible;
		}

		#region Public Methods
		
		public bool Build(RtpStream stream)
		{
			if (base.Build(PayloadType.dynamicVideo,stream))
			{
				try
				{
					IVideoWindow ivw = (IVideoWindow)fgm;
					ivw.Caption = "Windows Media Gateway Preview";
					int ws = ivw.WindowStyle;
					ws = ws & ~(0x00080000); // Remove WS_SYSMENU
					ivw.WindowStyle = ws;
					ivw.AutoShow = 0;
					if (visible)
					{
						ivw.Visible = VISIBLE; //0 is hidden, -1 is showing.
					}
					else
					{
						ivw.Visible = INVISIBLE; //0 is hidden, -1 is showing.
					}

				}
				catch (Exception e)
				{
					Debug.WriteLine("Failed to set video window properties: " +e.ToString());
					eventLog.WriteEntry("Failed to set video window properties: " +e.ToString(), EventLogEntryType.Error, 1001);
					return false;
				}
				return true;
			}
			return false;
		}

		public new bool Stop()
		{
			SetVisible(false);
			return base.Stop();
		}

		public bool Restart(RtpStream newStream)
		{
			Debug.WriteLine("VideoGraphBuilder.Restart");
			Stop();
			Teardown();
			
			//Ugly hack:  Without this delay the graph fails to render when running over Remote Desktop 
			// as of CXP 3.0 RC5.  
			System.Threading.Thread.Sleep(1000);

			if (!Build(newStream))
			{
				errorMsg = "Failed to rebuild graph.";
				return false;
			}

			if (!Run())
			{
				errorMsg = "Failed to start graph.";
				return false;
			}

			return true;
		}


		/// <summary>
		/// Show/hide the video window.
		/// </summary>
		/// <param name="mute"></param>
		/// <returns></returns>
		public bool SetVisible(bool visible)
		{
			if (this.visible == visible)
				return true;

			this.visible = visible;
			try
			{
				IVideoWindow ivw = (IVideoWindow)fgm;
				if (visible)
					ivw.Visible = VISIBLE;
				else
					ivw.Visible = INVISIBLE;
			}
			catch (Exception e)
			{
				eventLog.WriteEntry("Failed to set video visibility: " + e.ToString(), EventLogEntryType.Error, 1001);
				Debug.WriteLine("Failed to set video visibility: " + e.ToString());
				return false;
			}
			return true;
		}

		#endregion

	}
}
