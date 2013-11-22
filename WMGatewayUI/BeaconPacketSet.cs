
using System;
using System.Collections;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Keep track of the live viewers and presenters.  Keep track of most recent time a message has been 
	/// received from each viewer/presenter
	/// </summary>
	public class BeaconPacketSet
	{
		ArrayList packets;

		public BeaconPacketSet()
		{
			packets = new ArrayList();
		}

		public void Add(BeaconPacket bp, DateTime time)
		{
			BeaconPacket newPacket = new BeaconPacket(bp.Name, bp.ID, bp.FriendlyName, bp.Role, time, bp.BGColor);

			int index = Lookup(bp);
			if (index != -1)
				packets[index] = newPacket;
			else 
				packets.Add(newPacket);

		}

		// Find index of a packet with a matching name.  Return -1 if not found
		public int Lookup(BeaconPacket bp)
		{
			for (int index = 0; index < packets.Count; index++)
			{
				BeaconPacket bp1 = (BeaconPacket) packets[index];
				if (bp1.Name == bp.Name)
					return index;
			}
			return -1;
		}

		// Count the viewers and presenters since a given time.
		public int LivePackets(DateTime time, bool isPresenter)
		{
			int count = 0;

			ViewerFormControl.RoleType role;
			if (isPresenter)
				role = ViewerFormControl.RoleType.Presenter;
			else
				role = ViewerFormControl.RoleType.Viewer;

			for (int i = 0; i < packets.Count; i++)
			{
				BeaconPacket bp = (BeaconPacket) packets[i];
				if ((bp.Time >= time) && (bp.Role == role))
					count++;
			}
			return count;
		}

		public int LiveViewers(DateTime time)
		{
			return LivePackets(time, false);
		}

		public int LivePresenters(DateTime time)
		{
			return LivePackets(time, true);
		}
	}

}
