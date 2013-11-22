using System;
using System.IO;
using System.Collections;
using System.ComponentModel;
using System.Configuration.Install;
using System.Windows.Forms;
using System.Diagnostics;
using System.Security.Principal;
using System.Runtime.InteropServices;
using System.Reflection;
using Microsoft.Win32;


namespace UW.CSE.DISC
{
	/// <summary>
	/// Summary description for Installation.
	/// </summary>
	[RunInstaller(true)]
	public class Installation : System.Configuration.Install.Installer
	{
		public Installation() : base() {}


		public override void Install (IDictionary savedState)
		{
			// Check to make sure we're in an Administrator role
			WindowsPrincipal wp = new WindowsPrincipal(WindowsIdentity.GetCurrent());
			if (wp.IsInRole(WindowsBuiltInRole.Administrator) == false)
			{
				MessageBox.Show("You must be an Administrator to install this application or to run it for the first time.", "Administrator Privileges Required", MessageBoxButtons.OK, MessageBoxIcon.Stop);
				Application.Exit();
			}

			if(!EventLog.SourceExists("WMGCore"))
			{
				EventLog.CreateEventSource("WMGCore", "WMG");
			}
			RegistryKey el = Registry.LocalMachine.CreateSubKey("SYSTEM\\CurrentControlSet\\Services\\EventLog\\WMG");
			el.SetValue("MaxSize", 524288);
			el.SetValue("Retention", 0);

			base.Install(savedState);

			// Prepare the objects used to call Install on dependency assemblies
			AssemblyInstaller ai = new AssemblyInstaller();
			ai.UseNewContext = true;
			IDictionary state = new Hashtable();

			// Call Installer on MSR.LST.Net.RTP
			try 
			{
				ai.Path = "MSR.LST.Net.RTP.dll";
				state.Clear();
				ai.Install(state);
				ai.Commit(state);
			}
			catch (Exception e) {
				MessageBox.Show("Failed to install RTP: " + e.ToString());
			}

			string oldDirectory = Directory.GetCurrentDirectory();
			FileInfo fi = new FileInfo(Assembly.GetExecutingAssembly().Location);
			Directory.SetCurrentDirectory(fi.Directory.FullName);
			try
			{
				RegisterCxpRtpFilters();
			}
			catch (DllNotFoundException)
			{
				MessageBox.Show("DllNotFound Exception while attempting to register CxpRtpFilters.ax.  This can happen if the set of C runtime merge modules in the msi does not match the libraries against which CxpRtpFilters.ax was built.", "Failed to Register CxpRtpFilters.ax");
			}
			Directory.SetCurrentDirectory(oldDirectory);


			// Save the fact that we're installed
			RegistryKey disc = Registry.LocalMachine.CreateSubKey("SOFTWARE\\UWCSE\\WMGATEWAY");
			disc.SetValue("WMGatewayInstalled", true);

		}

		// this can be invoked with "installutil /u wmgateway.exe"
		public override void Uninstall (IDictionary savedState)
		{

			WindowsPrincipal wp = new WindowsPrincipal(WindowsIdentity.GetCurrent());
			if (wp.IsInRole(WindowsBuiltInRole.Administrator) == false)
			{
				MessageBox.Show("You must be an Administrator to uninstall this application.", "Administrator Privileges Required", MessageBoxButtons.OK, MessageBoxIcon.Stop);
				Application.Exit();
			}

			if (savedState != null)
			{
				base.Uninstall(savedState);
			}

			// Prepare the objects used to call Uninstall on dependency assemblies
			AssemblyInstaller ai = new AssemblyInstaller();
			ai.UseNewContext = true;
			IDictionary state = new Hashtable();

			// Call Uninstall on MSR.LST.Net.RTP
			try
			{
				state.Clear();
				ai.Path = "MSR.LST.Net.RTP.dll";
				ai.Uninstall(state);
			}
			catch {}

			string oldDirectory = Directory.GetCurrentDirectory();
			FileInfo fi = new FileInfo(Assembly.GetExecutingAssembly().Location);
			Directory.SetCurrentDirectory(fi.Directory.FullName);
			try
			{
				UnregisterCxpRtpFilters();
			}
			catch (DllNotFoundException)
			{
				MessageBox.Show("Unable to find CxpRtpFilters.ax in the local directory.","File not found");
			}
			Directory.SetCurrentDirectory(oldDirectory);

			if (EventLog.SourceExists("WMGCore"))
				EventLog.DeleteEventSource("WMGCore");

			if (EventLog.Exists("WMG"))
				EventLog.Delete("WMG");


			// Whack registry entries
			try
			{
				RegistryKey pcaKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\\UWCSE", true);
				pcaKey.DeleteSubKeyTree("WMGATEWAY");
			}
			catch {}

		}

		[DllImport("CxpRtpFilters.ax", EntryPoint="DllRegisterServer")]
		private static extern void RegisterCxpRtpFilters();

		[DllImport("CxpRtpFilters.ax", EntryPoint="DllUnregisterServer")]
		private static extern void UnregisterCxpRtpFilters();

	}
}
