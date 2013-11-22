using System;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;
using ArchiveRTNav;
using System.Diagnostics;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Some utility functions
	/// </summary>
	public class Helpers
	{
		public Helpers()
		{
		}
		public static byte[] ObjectToByteArray(Object b)
		{
			if (b==null)
				return new byte[0];
			BinaryFormatter bf = new BinaryFormatter();
			MemoryStream ms = new MemoryStream();
			bf.Serialize(ms,b);
			ms.Position = 0;//rewind
			byte[] ba = new byte[ms.Length];
			ms.Read(ba,0,(int)ms.Length);
			return ba;
		}
	
		public static Object ByteArrayToObject(byte[] ba)
		{
			BinaryFormatter bf = new BinaryFormatter();
			MemoryStream ms = new MemoryStream(ba);
			ms.Position = 0;
			try
			{
				return (Object) bf.Deserialize(ms);
			}
			catch(Exception e)
			{
				Debug.WriteLine(e.ToString());
				return null;
			}
		}

		public static bool RtUpdatesEqual(RTUpdate rtu1, RTUpdate rtu2)
		{
			if ((rtu1 == null) || (rtu2 == null))
				return false;

			if ((rtu1.BackgroundColor != rtu2.BackgroundColor) ||
				(rtu1.BaseUrl != rtu2.BaseUrl) ||
				(rtu1.DeckAssociation != rtu2.DeckAssociation) ||
				(rtu1.DeckGuid != rtu2.DeckGuid) ||
				(rtu1.DeckType != rtu2.DeckType) || 
				(rtu1.Extent != rtu2.Extent) ||
				(rtu1.ScrollExtent != rtu2.ScrollExtent) ||
				(rtu1.ScrollPosition != rtu2.ScrollPosition) ||
				(rtu1.SlideAssociation != rtu2.SlideAssociation) ||
				(rtu1.SlideIndex != rtu2.SlideIndex) ||
				(rtu1.SlideSize != rtu2.SlideSize))
				return false;
			
			return true;
		}

		public static void CopyRtUpdate(RTUpdate from, ref RTUpdate to)
		{
			if (from == null)
				return;

			if (to == null)
				return;

			to.BackgroundColor = from.BackgroundColor;
			to.BaseUrl = from.BaseUrl;
			to.DeckAssociation = from.DeckAssociation;
			to.DeckGuid = from.DeckGuid;
			to.DeckType = from.DeckType; 
			to.Extent = from.Extent;
			to.ScrollExtent = from.ScrollExtent;
			to.ScrollPosition = from.ScrollPosition;
			to.SlideAssociation = from.SlideAssociation;
			to.SlideIndex = from.SlideIndex;
			to.SlideSize = from.SlideSize;

		}

		public static bool isSet(String s)
		{
			if ((s!=null) && (s != ""))
				return true;
			return false;
		}
	}
}
