using System;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Class for creating the RtpSource DShow filter
	/// 
	/// Guid was taken from RtpSource.idl in the DShow\CxpRtpFilters folder
	/// </summary>
	public abstract class RtpSourceClass
	{
		private static Guid CLSID_RtpSource = new Guid("158C4421-945F-4826-8851-2459D92CCF07");

		public static MSR.LST.MDShow.IBaseFilter CreateInstance()
		{
			return (MSR.LST.MDShow.IBaseFilter)Activator.CreateInstance(Type.GetTypeFromCLSID(CLSID_RtpSource, true));
		}
	}

	/// <summary>
	/// Class for creating the SampleGrabber filter
	/// 
	/// </summary>
	public abstract class SampleGrabberClass
	{
		private static Guid CLSID_SampleGrabber = new Guid("C1F400A0-3F08-11d3-9F0B-006008039E37");

		public static MSR.LST.MDShow.IBaseFilter CreateInstance()
		{
			return (MSR.LST.MDShow.IBaseFilter)Activator.CreateInstance(Type.GetTypeFromCLSID(CLSID_SampleGrabber, true));
		}
	}

}
