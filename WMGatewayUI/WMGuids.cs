using System;
using UW.CSE.ManagedWM;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Utility class to define a few WMFSDK guids, and to convert between 
	/// System.Guid and the WMFSDK GUID struct.
	/// </summary>
	class WMGuids
	{
		/// These Guids and many others are found in wmsysprf.h in the WMFSDK.
		public static Guid WMProfile_V80_100Video = new Guid("A2E300B4-C2D4-4fc0-B5DD-ECBD948DC0DF");
		public static Guid WMProfile_V80_256Video = new Guid("BBC75500-33D2-4466-B86B-122B201CC9AE");
		public static Guid WMProfile_V80_384Video = new Guid("29B00C2B-09A9-48bd-AD09-CDAE117D1DA7");
		public static Guid WMProfile_V80_768Video = new Guid("74D01102-E71A-4820-8F0D-13D2EC1E4872");

		//Stream types as documented in the WMFSDK help file  
		public static Guid WMMEDIATYPE_Script = new Guid("73636D64-0000-0010-8000-00AA00389B71"); 
		public static Guid WMMEDIATYPE_Audio = new Guid("73647561-0000-0010-8000-00AA00389B71");		  
		public static Guid WMMEDIATYPE_Video = new Guid("73646976-0000-0010-8000-00AA00389B71");
		public static Guid WMMEDIASUBTYPE_PCM = new Guid(0x00000001, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xAA, 0x00, 0x38, 0x9B, 0x71); 
		public static Guid WMMEDIASUBTYPE_RGB24 = new Guid("e436eb7d-524f-11ce-9f53-0020af0ba770"); 
		public static Guid WMFORMAT_WaveFormatEx = new Guid("05589f81-c356-11ce-bf01-00aa0055595a"); 
		public static Guid WMFORMAT_VideoInfo = new Guid("05589f80-c356-11ce-bf01-00aa0055595a");

		/// <summary>
		/// Convert System.Guid to the WM GUID struct
		/// </summary>
		/// <param name="guid"></param>
		/// <returns></returns>
		public static GUID ToGUID(Guid guid)
		{
			GUID guidOut;
			byte[] ba = guid.ToByteArray();
			guidOut.Data1 = (uint)((ba[3] << 24) + (ba[2] << 16) + (ba[1] << 8) + ba[0]);
			guidOut.Data2 = (ushort)((ba[5] << 8) + ba[4]);
			guidOut.Data3 = (ushort)((ba[7] << 8) + ba[6]);
			byte[] d4 = { ba[8],ba[9],ba[10],ba[11],ba[12],ba[13],ba[14],ba[15] }; 
			guidOut.Data4 = d4;
			return guidOut;
		}

		/// <summary>
		/// Convert the WM GUID struct to System.Guid
		/// </summary>
		/// <param name="guid"></param>
		/// <returns></returns>
		public static Guid ToGuid(GUID guid)
		{
			return new Guid(guid.Data1,guid.Data2,guid.Data3,guid.Data4[0],guid.Data4[1],guid.Data4[2],guid.Data4[3],guid.Data4[4],guid.Data4[5],guid.Data4[6],guid.Data4[7]);
		}

	}
}
