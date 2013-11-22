using System;
using System.Collections;
using System.Diagnostics;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Simple class to track timing of per-stream events/warnings for reporting.
	/// </summary>
	public class ReportTimer
	{
		private Hashtable timerHT;

		public static TimeSpan ReportThreshold = TimeSpan.FromSeconds(60);

		public ReportTimer()
		{
			timerHT = new Hashtable();
		}

		/// <summary>
		/// Return the time of last SetReportTime for this cname/payload, 
		/// or if never set return DateTime.MinValue.
		/// </summary>
		/// <param name="cname"></param>
		/// <param name="payload"></param>
		/// <returns></returns>
		public DateTime GetReportTime(String cname, String payload)
		{

			if (timerHT.ContainsKey(cname+payload))
			{
				return ((DateTime)timerHT[cname+payload]);
			}
			else
			{
				timerHT.Add(cname+payload,DateTime.MinValue);
				return DateTime.MinValue;
			}
		}

		/// <summary>
		/// Set report time to DatTime.Now for this cname/payload.
		/// </summary>
		/// <param name="cname"></param>
		/// <param name="payload"></param>
		public void SetReportTime(String cname, String payload)
		{
			if (timerHT.ContainsKey(cname+payload))
			{
				timerHT[cname+payload] = DateTime.Now;
			}
			else
			{
				timerHT.Add(cname+payload,DateTime.Now);
			}
		}

		/// <summary>
		/// Set report time to DateTime.MinValue for this cname/payload
		/// </summary>
		/// <param name="cname"></param>
		/// <param name="payload"></param>
		public void ResetReportTime(String cname, String payload)
		{
			if (timerHT.ContainsKey(cname+payload))
			{
				timerHT[cname+payload] = DateTime.MinValue;
			}
			else
			{
				timerHT.Add(cname+payload,DateTime.MinValue);
			}		
		}

	}
}
