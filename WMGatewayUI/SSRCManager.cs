using System;
using System.Threading;
using System.Collections;
using System.Diagnostics;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Manage a set of attributes associated with SSRCs.  
	/// Use one instance of this class per payload type.
	/// Permit the client to make a snapshot of a set of cnames,
	/// then raise a restored event if the stream with that cname
	/// is later added again.  This is how we implement the auto-restart function.
	/// 
	/// Facilitate the verification of all streams after a listener restart.
	/// 
	/// Track restart times so that rapidly toggling streams don't cause problems, and in
	/// order to support the needs of a stream status monitoring thread.
	/// </summary>
	public class SSRCManager
	{
		#region Properties
		private bool raiseSourceRestored;
		/// <summary>
		/// Get/set value indicating whether streams added can result in OnSourceRestored events 
		/// being raised.  Note that there may be a built-in delay between the arrival of the 
		/// stream and the raising of the event.  For the event to be raised, this has to be true
		/// both when the stream arrives, and after the delay.  Default is false (disabled).
		/// </summary>
		public bool RaiseSourceRestored
		{
			get{return raiseSourceRestored;}
			set{raiseSourceRestored = value;}
		}

		#endregion
		#region Declarations
		private Hashtable ActiveStreams, RunningSet, RestartTimes, AddedFlags;
		private MSR.LST.Net.Rtp.PayloadType payload;
		private EventLog eventLog;
		#endregion
		#region Events
		
		//Event tells the subscriber that a cname in the running set snapshot
		//was added.  Client uses this to facilitate automatic restart when lost
		//streams reappear, and to rebuild graphs when a listener is manually restarted.
		public delegate void SourceRestoredHandler(StreamRestoredEventArgs ea);
		public event SourceRestoredHandler OnSourceRestored;
		#endregion
		#region Constructor
		// constructor:
		public SSRCManager(MSR.LST.Net.Rtp.PayloadType payload)
		{
			eventLog = new EventLog("WMG",".","WMGCore");
			raiseSourceRestored = false;
			ActiveStreams = new Hashtable();//All Cnames currently active with latest ssrc. key: cname, value: SSRC
											//This is used to validate stream and obtain SSRC when running set snapshot occurs.
			RunningSet = new Hashtable();	//The set of Cnames/SSRCs currently encoding.  
											//Note these may not be in ActiveStreams in the case where the stream was lost after encoding started.
											//Also used to support various public methods which return data about encoding streams.
			RestartTimes = new Hashtable();	//Time of last start/restart for each cname. Cname/datetime. This is used
											//to help determine when to try restarting (maintenance thread) to clear a stuck stream.
			AddedFlags = new Hashtable();	//SSRC/bool: Flag to indicate a stream was added after an event such as listener restart.
											//Used to verify streams right before start encoding.
			this.payload = payload;			//The payload type for this instance
		}
		#endregion
		#region Public Methods
		/// <summary>
		/// Add a source to hashtables, and possibly raise a SourceRestored event
		/// </summary>
		/// <param name="ssrc"></param>
		/// <param name="cname"></param>
		public void Add(uint ssrc, string cname)
		{
			String cnamekey = cname; // + " " + name;
			lock(this)
			{
				if (!AddedFlags.ContainsKey(ssrc))
					AddedFlags.Add(ssrc,"true");

				if (ActiveStreams.ContainsKey(cnamekey)) 
				{  
					ActiveStreams[cnamekey] = ssrc;
				} 
				else
				{  
					ActiveStreams.Add(cnamekey,ssrc);
				}

				DateTime previousAddForCname = DateTime.Now;
				if (RestartTimes.ContainsKey(cnamekey))
				{
					Debug.WriteLine("found previous restart time");
					previousAddForCname = (DateTime) RestartTimes[cnamekey];
					RestartTimes.Remove(cnamekey);
				} 
				RestartTimes.Add(cnamekey,DateTime.Now);

				//Debug.WriteLine("SSRCManager.Add: " + cname +" "+Convert.ToString(ssrc));
				
				//if it was in our running set, update the RtpStream and raise event.
				if (RunningSet.ContainsKey(cnamekey)) 
				{
					Debug.WriteLine("found item in running set:" + cnamekey);

					uint old_ssrc = Convert.ToUInt32(RunningSet[cnamekey]);
					RunningSet[cnamekey] = ssrc;

					//Don't raise source restored if the last add came less then 3 seconds ago.
					if (DateTime.Now - previousAddForCname > new TimeSpan(0,0,0,3,0))
					{			
						//Debug.WriteLine("time qualifies stream for source restored:" + cname);
						if ((raiseSourceRestored) && (OnSourceRestored != null))
						{
							//Debug.WriteLine("Ready to enqueue sourceRestored");
							SourceData sd = new SourceData();
							sd.old_ssrc = old_ssrc;
							sd.new_ssrc = ssrc;
							sd.cname = cnamekey;
							ThreadPool.QueueUserWorkItem(new WaitCallback(queueSourceRestored),sd);
						}
					}
				}
			}
		}
		
		/// <summary>
		///  Remove a source from hashtable and UI.  This corresponds to the RtpStreamRemoved event.
		///  Note that we do not remove the item from the running set or from the RestartTimes list.
		/// </summary>
		/// <param name="cname"></param>
		public void Remove(string cname)
		{
			lock (this)
			{
				if (ActiveStreams.ContainsKey(cname))
				{
					ActiveStreams.Remove(cname);
				}
			}
		}

		/// <summary>
		/// Clear all the hashtables
		/// </summary>
		public void Clear()
		{
			lock (this)
			{
				ActiveStreams.Clear();
				RunningSet.Clear();
				RestartTimes.Clear();
				AddedFlags.Clear();
			}
		}
		

		public bool IsChecked(String cname)
		{
			if (RunningSet.ContainsKey(cname))
				return true;
			return false;
		}


		/// <summary>
		/// Returns the set of encoding sources.  Key is cname, value is ssrc.
		/// </summary>
		/// <returns></returns>
		public Hashtable GetRunningSetSSRCs()
		{
			lock (this)
			{
				return (Hashtable)RunningSet.Clone();
			}
		}


		/// <summary>
		/// Store the current checked items list in a new running set hash.
		/// Return false if one of the streams is gone.
		/// </summary>
		/// <param name="cnameList"></param>
		/// <returns></returns>
		public bool SnapshotRunningSet(ArrayList cnameList)
		{
			lock (this)
			{
				RunningSet.Clear();
				foreach(String cname in cnameList)
				{
					if (ActiveStreams.ContainsKey(cname))
					{
						RunningSet.Add(cname,ActiveStreams[cname]);
					}
					else
					{
						RunningSet.Clear();
						return false;
					}
				}
			}
			return true;
		}

		/// <summary>
		/// Store one cname as the current running set.
		/// Return false if the stream is not there.
		/// In case of a problem, leave the existing running set alone.
		/// </summary>
		/// <param name="cname"></param>
		/// <returns></returns>
		public bool ReplaceRunningSet(string cname)
		{
			lock (this)
			{
				if (ActiveStreams.ContainsKey(cname))
				{
					RunningSet.Clear();
					RunningSet.Add(cname,ActiveStreams[cname]);
				}
				else
				{
					return false;
				}
			}
			return true;
		}


		/// <summary>
		/// Add cname to running set.  To support change to audio source while encoding.
		/// </summary>
		/// <param name="cname"></param>
		/// <returns></returns>
		public bool AddToSnapshot(string cname)
		{
			lock (this)
			{
				if (ActiveStreams.ContainsKey(cname))
				{
					RunningSet.Add(cname,ActiveStreams[cname]);
				}
				else
				{
					return false;
				}
			}
			return true;
		}

		/// <summary>
		/// Remove cname from running set.  To support change to audio source while encoding.
		/// </summary>
		/// <param name="cname"></param>
		/// <returns></returns>
		public bool RemoveFromSnapshot(string cname)
		{
			lock (this)
			{
				if (RunningSet.ContainsKey(cname))
					RunningSet.Remove(cname);
				else
					return false;
			}
			return true;
		}

		public void ClearRunningSet()
		{
			RunningSet.Clear();
		}

		/// <summary>
		/// given a cname, return the last time it was restarted
		/// </summary>
		/// <param name="cname"></param>
		/// <returns></returns>
		public DateTime GetRestartTime(string cname)
		{
			if (RestartTimes.Contains(cname))
			{
				return (DateTime) RestartTimes[cname];
			}
			else
			{
				return DateTime.Now;
			}
		}


		public void SetRestartTime(string cname)
		{
			if (RestartTimes.ContainsKey(cname))
			{
				RestartTimes[cname] = DateTime.Now;
			}
			else
			{
				eventLog.WriteEntry("Restart Time does not exist for cname: " + cname, EventLogEntryType.Error, 1003);
				//shouldn't happen?
			}
		}

		/// <summary>
		/// Clear all "Added" flags.
		/// </summary>
		public void ClearStreamAddedFlags()
		{
			AddedFlags.Clear();
		}


		/// <summary>
		/// Indicate whether stream added flags are set for all items in the running set.
		/// </summary>
		/// <returns></returns>
		public bool RunningSetAdded()
		{
			lock (this)
			{
				foreach (uint ssrc in RunningSet.Values)
				{
					if (!AddedFlags.ContainsKey(ssrc))
					{
						return false;
					}
				}
				return true;
			}
		}
		#endregion
		#region Private Methods
		/// <summary>
		/// verify that a ssrc seems stable before raising OnSourceRestored
		/// This was to work around a pathological analog video driver issue
		/// which caused sources to toggle on and off.  We think the issue has
		/// been fixed now, so the wait time has been removed.
		/// We'll leave it on the thread pool since the restart does take some
		/// time to complete.
		/// </summary>
		/// <param name="o"></param>
		private void queueSourceRestored (object o)
		{
			string cname = ((SourceData)o).cname;
			uint old_ssrc = ((SourceData)o).old_ssrc;
			uint new_ssrc = ((SourceData)o).new_ssrc;
			
			if ((!RunningSet.Contains(cname)) || (!RestartTimes.Contains(cname))) 
			{
				return;
			}

			if (Convert.ToUInt32(RunningSet[cname]) != new_ssrc)
			{
				return;
			}

			if ((raiseSourceRestored) && (OnSourceRestored != null))
			{
				StreamRestoredEventArgs ea = new StreamRestoredEventArgs(new_ssrc, old_ssrc, cname, payload);
				OnSourceRestored(ea); //raise event
			}
		}

		private struct SourceData 
		{
			public string cname;
			public uint old_ssrc;
			public uint new_ssrc;
		}

		#endregion
	}
}