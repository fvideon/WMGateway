using System;
using System.Runtime.InteropServices;
using UW.CSE.ManagedWM;


namespace UW.CSE.DISC
{
	/// <summary>
	/// Define the DllImports for a subset of WMFSDK functions
	/// </summary>
	public class WMFSDKFunctions
	{
		[DllImport("WMVCore.dll", EntryPoint="WMCreateEditor",  SetLastError=true,
			 CharSet=CharSet.Unicode, ExactSpelling=true,
			 CallingConvention=CallingConvention.StdCall)]
		public static extern uint WMCreateEditor(
			[Out, MarshalAs(UnmanagedType.Interface)]	out IWMMetadataEditor  ppMetadataEditor );

		[DllImport( "WMVCore.dll",
			 EntryPoint="WMCreateReader",
			 SetLastError=true,
			 CharSet=CharSet.Unicode,
			 ExactSpelling=true,
			 CallingConvention=CallingConvention.StdCall )]
		public static extern uint WMCreateReader(
			[In, MarshalAs( UnmanagedType.Interface )] object
			pUnkReserved, // Always null.
			[In] uint dwRights,
			[Out, MarshalAs( UnmanagedType.Interface )] out IWMReader
			ppReader) ;

		[DllImport( "WMVCore.dll",
			 EntryPoint="WMCreateProfileManager",
			 SetLastError=true,
			 CharSet=CharSet.Unicode,
			 ExactSpelling=true,
			 CallingConvention=CallingConvention.StdCall )]
		public static extern uint WMCreateProfileManager ( 
			[Out, MarshalAs( UnmanagedType.Interface )]
			out IWMProfileManager ppProfileManager); 

		[DllImport( "WMVCore.dll",
			 EntryPoint="WMCreateWriter",
			 SetLastError=true,
			 CharSet=CharSet.Unicode,
			 ExactSpelling=true,
			 CallingConvention=CallingConvention.StdCall )]
		public static extern uint WMCreateWriter(
			[In, MarshalAs( UnmanagedType.Interface )] object
			pUnkReserved, // Always null.
			[Out, MarshalAs( UnmanagedType.Interface )] out IWMWriter
			ppWriter) ;

		[DllImport( "WMVCore.dll",
			 EntryPoint="WMCreateWriterNetworkSink",
			 SetLastError=true,
			 CharSet=CharSet.Unicode,
			 ExactSpelling=true,
			 CallingConvention=CallingConvention.StdCall )]
		public static extern uint WMCreateWriterNetworkSink(
			[Out, MarshalAs( UnmanagedType.Interface )] out IWMWriterNetworkSink
			ppWriterNetworkSink) ;

		[DllImport( "WMVCore.dll",
			 EntryPoint="WMCreateWriterFileSink",
			 SetLastError=true,
			 CharSet=CharSet.Unicode,
			 ExactSpelling=true,
			 CallingConvention=CallingConvention.StdCall )]
		public static extern uint WMCreateWriterFileSink(
			[Out, MarshalAs( UnmanagedType.Interface )] out IWMWriterFileSink
			ppWriterFileSink) ;


		public WMFSDKFunctions()
		{
		}
	}

}
