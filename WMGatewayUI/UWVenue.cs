using System;
using System.Net;
//using UW.CSE.DISC.edu.washington.cs.disc1;
using UW.CSE.DISC.net.pnw_gigapop.confxp.venues;

namespace UW.CSE.DISC
{
	/// <summary>
	/// Give the Venue class a ToString method that works the way we want for use in ComboBoxes.
	/// </summary>
	public class UWVenue
	{
		private IPEndPoint ipEndpoint;
		public IPEndPoint IpEndpoint
		{
			get {return ipEndpoint;}
            set { ipEndpoint = value; }
		}

        private bool passwordResolved;
        public bool PasswordResolved {
            get { return passwordResolved; }
            set { passwordResolved = value; }
        }

        private string identifier;
        public string Identifier {
            get { return identifier; }
        }

		private String name;
		public String Name
		{
			get{return name;}
		}

        private PasswordStatus passwordStatus;
        public PasswordStatus PWStatus { 
            get {return passwordStatus;}
            set { passwordStatus = value; }
        }

		public UWVenue(Venue v)
		{
            this.passwordResolved = false;
			this.name = v.Name;
            this.passwordStatus = v.PWStatus;
			this.ipEndpoint = new IPEndPoint(IPAddress.Parse(v.IPAddress.Trim()),v.Port);
            this.identifier = v.Identifier;
		}

		public UWVenue(String name, IPEndPoint endpoint)
		{
			this.name = name;
			this.ipEndpoint = new IPEndPoint(endpoint.Address,endpoint.Port);
            this.passwordStatus = PasswordStatus.NO_PASSWORD;
		}

		public override string ToString()
		{
			return this.Name;
		}
		
		public string ToAddrPort()
		{
			return this.ipEndpoint.Address.ToString() + ":" + this.ipEndpoint.Port.ToString();
		}

		public bool Equals(UWVenue uwv)
		{
			if (uwv == null)
				return false;

			if ((this.ipEndpoint.Address.Equals(uwv.IpEndpoint.Address)) &&
				(this.ipEndpoint.Port == uwv.IpEndpoint.Port))
				return true;
			return false;
		}
	}
}
