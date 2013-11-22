
//  Microsoft (R) .NET Framework IL Disassembler.  Version 1.0.3705.0
//  Copyright (C) Microsoft Corporation 1998-2001. All rights reserved.

.assembly extern mscorlib
{
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 )                         // .z\V.4..
  .ver 1:0:3300:0
}
.assembly ManagedWM
{
  .custom instance void [mscorlib]System.Runtime.InteropServices.ImportedFromTypeLibAttribute::.ctor(string) = ( 01 00 09 4D 61 6E 61 67 65 64 57 4D 00 00 )       // ...ManagedWM..
  .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 34 38 36 63 37 63 62 64 2D 36 66 65 39   // ..$486c7cbd-6fe9
                                                                                                  2D 34 63 31 31 2D 38 36 64 32 2D 32 32 65 64 34   // -4c11-86d2-22ed4
                                                                                                  61 36 34 34 35 62 64 00 00 )                      // a6445bd..
  .hash algorithm 0x00008004
  .ver 1:0:0:0
}
.module ManagedWM.dll
// MVID: {AB793740-8CBA-4D57-B84D-69A78B3F96A5}
.imagebase 0x00400000
.subsystem 0x00000003
.file alignment 4096
.corflags 0x00000001
// Image base: 0x02db0000
//
// ============== CLASS STRUCTURE DECLARATION ==================
//
.namespace UW.CSE.ManagedWM
{
  .class interface public abstract auto ansi import IWMMediaProps
  {
  } // end of class IWMMediaProps

  .class interface public abstract auto ansi import IUnknown
  {
  } // end of class IUnknown

  .class public sequential ansi sealed beforefieldinit GUID
         extends [mscorlib]System.ValueType
  {
  } // end of class GUID

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_ManagedWM_0006_0001
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL___MIDL_itf_ManagedWM_0006_0001

  .class public sequential ansi sealed beforefieldinit _WMMediaType
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMMediaType

  .class interface public abstract auto ansi import IWMVideoMediaProps
         implements UW.CSE.ManagedWM.IWMMediaProps
  {
  } // end of class IWMVideoMediaProps

  .class interface public abstract auto ansi import IWMWriter
  {
  } // end of class IWMWriter

  .class interface public abstract auto ansi import IWMProfile
  {
  } // end of class IWMProfile

  .class public auto ansi sealed WMT_VERSION
         extends [mscorlib]System.Enum
  {
  } // end of class WMT_VERSION

  .class interface public abstract auto ansi import IWMStreamConfig
  {
  } // end of class IWMStreamConfig

  .class interface public abstract auto ansi import IWMMutualExclusion
         implements UW.CSE.ManagedWM.IWMStreamList
  {
  } // end of class IWMMutualExclusion

  .class interface public abstract auto ansi import IWMStreamList
  {
  } // end of class IWMStreamList

  .class interface public abstract auto ansi import IWMInputMediaProps
         implements UW.CSE.ManagedWM.IWMMediaProps
  {
  } // end of class IWMInputMediaProps

  .class interface public abstract auto ansi import INSSBuffer
  {
  } // end of class INSSBuffer

  .class interface public abstract auto ansi import IWMReader
  {
  } // end of class IWMReader

  .class interface public abstract auto ansi import IWMReaderCallback
         implements UW.CSE.ManagedWM.IWMStatusCallback
  {
  } // end of class IWMReaderCallback

  .class interface public abstract auto ansi import IWMStatusCallback
  {
  } // end of class IWMStatusCallback

  .class public auto ansi sealed WMT_STATUS
         extends [mscorlib]System.Enum
  {
  } // end of class WMT_STATUS

  .class public auto ansi sealed WMT_ATTR_DATATYPE
         extends [mscorlib]System.Enum
  {
  } // end of class WMT_ATTR_DATATYPE

  .class interface public abstract auto ansi import IWMOutputMediaProps
         implements UW.CSE.ManagedWM.IWMMediaProps
  {
  } // end of class IWMOutputMediaProps

  .class interface public abstract auto ansi import IWMMetadataEditor
  {
  } // end of class IWMMetadataEditor

  .class interface public abstract auto ansi import IWMMetadataEditor2
         implements UW.CSE.ManagedWM.IWMMetadataEditor
  {
  } // end of class IWMMetadataEditor2

  .class interface public abstract auto ansi import IWMDRMEditor
  {
  } // end of class IWMDRMEditor

  .class interface public abstract auto ansi import IWMHeaderInfo
  {
  } // end of class IWMHeaderInfo

  .class interface public abstract auto ansi import IWMProfileManager
  {
  } // end of class IWMProfileManager

  .class interface public abstract auto ansi import IWMBandwidthSharing
         implements UW.CSE.ManagedWM.IWMStreamList
  {
  } // end of class IWMBandwidthSharing

  .class interface public abstract auto ansi import IWMStreamPrioritization
  {
  } // end of class IWMStreamPrioritization

  .class public sequential ansi sealed beforefieldinit _WMStreamPrioritizationRecord
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMStreamPrioritizationRecord

  .class interface public abstract auto ansi import IWMPacketSize
  {
  } // end of class IWMPacketSize

  .class interface public abstract auto ansi import IWMPacketSize2
         implements UW.CSE.ManagedWM.IWMPacketSize
  {
  } // end of class IWMPacketSize2

  .class interface public abstract auto ansi import IWMWriterAdvanced
  {
  } // end of class IWMWriterAdvanced

  .class interface public abstract auto ansi import IWMWriterSink
  {
  } // end of class IWMWriterSink

  .class public sequential ansi sealed beforefieldinit _WMWriterStatistics
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMWriterStatistics

  .class interface public abstract auto ansi import IWMWriterAdvanced2
         implements UW.CSE.ManagedWM.IWMWriterAdvanced
  {
  } // end of class IWMWriterAdvanced2

  .class interface public abstract auto ansi import IWMWriterAdvanced3
         implements UW.CSE.ManagedWM.IWMWriterAdvanced2
  {
  } // end of class IWMWriterAdvanced3

  .class public sequential ansi sealed beforefieldinit _WMWriterStatisticsEx
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMWriterStatisticsEx

  .class interface public abstract auto ansi import IWMWriterPreprocess
  {
  } // end of class IWMWriterPreprocess

  .class interface public abstract auto ansi import IWMWriterFileSink
         implements UW.CSE.ManagedWM.IWMWriterSink
  {
  } // end of class IWMWriterFileSink

  .class interface public abstract auto ansi import IWMWriterNetworkSink
         implements UW.CSE.ManagedWM.IWMWriterSink
  {
  } // end of class IWMWriterNetworkSink

  .class public auto ansi sealed WMT_NET_PROTOCOL
         extends [mscorlib]System.Enum
  {
  } // end of class WMT_NET_PROTOCOL

  .class interface public abstract auto ansi import IWMDRMWriter
  {
  } // end of class IWMDRMWriter

  .class interface public abstract auto ansi import IWMReaderAdvanced
  {
  } // end of class IWMReaderAdvanced

  .class public auto ansi sealed WMT_STREAM_SELECTION
         extends [mscorlib]System.Enum
  {
  } // end of class WMT_STREAM_SELECTION

  .class public sequential ansi sealed beforefieldinit _WMReaderStatistics
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMReaderStatistics

  .class public sequential ansi sealed beforefieldinit _WMReaderClientInfo
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMReaderClientInfo

  .class interface public abstract auto ansi import IWMReaderAdvanced2
         implements UW.CSE.ManagedWM.IWMReaderAdvanced
  {
  } // end of class IWMReaderAdvanced2

  .class public auto ansi sealed WMT_PLAY_MODE
         extends [mscorlib]System.Enum
  {
  } // end of class WMT_PLAY_MODE

  .class interface public abstract auto ansi import IStream
         implements UW.CSE.ManagedWM.ISequentialStream
  {
  } // end of class IStream

  .class interface public abstract auto ansi import ISequentialStream
  {
  } // end of class ISequentialStream

  .class public sequential ansi sealed beforefieldinit _LARGE_INTEGER
         extends [mscorlib]System.ValueType
  {
  } // end of class _LARGE_INTEGER

  .class public sequential ansi sealed beforefieldinit _ULARGE_INTEGER
         extends [mscorlib]System.ValueType
  {
  } // end of class _ULARGE_INTEGER

  .class public sequential ansi sealed beforefieldinit tagSTATSTG
         extends [mscorlib]System.ValueType
  {
  } // end of class tagSTATSTG

  .class public sequential ansi sealed beforefieldinit _FILETIME
         extends [mscorlib]System.ValueType
  {
  } // end of class _FILETIME

  .class interface public abstract auto ansi import IWMReaderAdvanced3
         implements UW.CSE.ManagedWM.IWMReaderAdvanced2
  {
  } // end of class IWMReaderAdvanced3

  .class public auto ansi sealed tagWMT_OFFSET_FORMAT
         extends [mscorlib]System.Enum
  {
  } // end of class tagWMT_OFFSET_FORMAT

  .class interface public abstract auto ansi import IWMReaderAdvanced4
         implements UW.CSE.ManagedWM.IWMReaderAdvanced3
  {
  } // end of class IWMReaderAdvanced4

  .class interface public abstract auto ansi import IWMReaderCallbackAdvanced
  {
  } // end of class IWMReaderCallbackAdvanced

  .class interface public abstract auto ansi import IWMDRMReader
  {
  } // end of class IWMDRMReader

  .class interface public abstract auto ansi import IWMReaderAllocatorEx
  {
  } // end of class IWMReaderAllocatorEx

  .class interface public abstract auto ansi import IWMReaderNetworkConfig
  {
  } // end of class IWMReaderNetworkConfig

  .class public sequential ansi sealed beforefieldinit _WMPortNumberRange
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMPortNumberRange

  .class public auto ansi sealed WMT_PROXY_SETTINGS
         extends [mscorlib]System.Enum
  {
  } // end of class WMT_PROXY_SETTINGS

  .class interface public abstract auto ansi import IWMReaderNetworkConfig2
         implements UW.CSE.ManagedWM.IWMReaderNetworkConfig
  {
  } // end of class IWMReaderNetworkConfig2

  .class interface public abstract auto ansi import IWMLicenseBackup
  {
  } // end of class IWMLicenseBackup

  .class interface public abstract auto ansi import IWMLicenseRestore
  {
  } // end of class IWMLicenseRestore

  .class interface public abstract auto ansi import IWMBackupRestoreProps
  {
  } // end of class IWMBackupRestoreProps

  .class interface public abstract auto ansi import IWMCodecInfo
  {
  } // end of class IWMCodecInfo

  .class interface public abstract auto ansi import IWMCodecInfo2
         implements UW.CSE.ManagedWM.IWMCodecInfo
  {
  } // end of class IWMCodecInfo2

  .class interface public abstract auto ansi import IWMCodecInfo3
         implements UW.CSE.ManagedWM.IWMCodecInfo2
  {
  } // end of class IWMCodecInfo3

  .class interface public abstract auto ansi import IWMSyncReader
  {
  } // end of class IWMSyncReader

  .class interface public abstract auto ansi import IWMLanguageList
  {
  } // end of class IWMLanguageList

  .class interface public abstract auto ansi import IWMImageInfo
  {
  } // end of class IWMImageInfo

  .class interface public abstract auto ansi import IWMAddressAccess
  {
  } // end of class IWMAddressAccess

  .class public auto ansi sealed WM_AETYPE
         extends [mscorlib]System.Enum
  {
  } // end of class WM_AETYPE

  .class public sequential ansi sealed beforefieldinit _WMAddressAccessEntry
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMAddressAccessEntry

  .class interface public abstract auto ansi import IWMAddressAccess2
         implements UW.CSE.ManagedWM.IWMAddressAccess
  {
  } // end of class IWMAddressAccess2

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0001
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0001

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0002
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0002

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0003
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0003

  .class public auto ansi sealed WMT_RIGHTS
         extends [mscorlib]System.Enum
  {
  } // end of class WMT_RIGHTS

  .class public auto ansi sealed WMT_IMAGE_TYPE
         extends [mscorlib]System.Enum
  {
  } // end of class WMT_IMAGE_TYPE

  .class public auto ansi sealed WMT_ATTR_IMAGETYPE
         extends [mscorlib]System.Enum
  {
  } // end of class WMT_ATTR_IMAGETYPE

  .class public auto ansi sealed tagWMT_STORAGE_FORMAT
         extends [mscorlib]System.Enum
  {
  } // end of class tagWMT_STORAGE_FORMAT

  .class public auto ansi sealed tagWMT_DRMLA_TRUST
         extends [mscorlib]System.Enum
  {
  } // end of class tagWMT_DRMLA_TRUST

  .class public auto ansi sealed tagWMT_TRANSPORT_TYPE
         extends [mscorlib]System.Enum
  {
  } // end of class tagWMT_TRANSPORT_TYPE

  .class public auto ansi sealed WMT_CODEC_INFO_TYPE
         extends [mscorlib]System.Enum
  {
  } // end of class WMT_CODEC_INFO_TYPE

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0004
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0004

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0005
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0005

  .class public auto ansi sealed tagWMT_INDEXER_TYPE
         extends [mscorlib]System.Enum
  {
  } // end of class tagWMT_INDEXER_TYPE

  .class public auto ansi sealed tagWMT_INDEX_TYPE
         extends [mscorlib]System.Enum
  {
  } // end of class tagWMT_INDEX_TYPE

  .class public auto ansi sealed tagWMT_FILESINK_MODE
         extends [mscorlib]System.Enum
  {
  } // end of class tagWMT_FILESINK_MODE

  .class public auto ansi sealed tagWMT_MUSICSPEECH_CLASS_MODE
         extends [mscorlib]System.Enum
  {
  } // end of class tagWMT_MUSICSPEECH_CLASS_MODE

  .class public auto ansi sealed tagWMT_WATERMARK_ENTRY_TYPE
         extends [mscorlib]System.Enum
  {
  } // end of class tagWMT_WATERMARK_ENTRY_TYPE

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0006
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0006

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0007
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0007

  .class public auto ansi sealed WMT_CREDENTIAL_FLAGS
         extends [mscorlib]System.Enum
  {
  } // end of class WMT_CREDENTIAL_FLAGS

  .class public sequential ansi sealed beforefieldinit _WMClientProperties
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMClientProperties

  .class public sequential ansi sealed beforefieldinit _WMClientPropertiesEx
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMClientPropertiesEx

  .class public sequential ansi sealed beforefieldinit _WMT_BUFFER_SEGMENT
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMT_BUFFER_SEGMENT

  .class public sequential ansi sealed beforefieldinit _WMT_PAYLOAD_FRAGMENT
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMT_PAYLOAD_FRAGMENT

  .class public sequential ansi sealed beforefieldinit _WMT_FILESINK_DATA_UNIT
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMT_FILESINK_DATA_UNIT

  .class public sequential ansi sealed beforefieldinit _WMT_WEBSTREAM_FORMAT
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMT_WEBSTREAM_FORMAT

  .class public sequential ansi sealed beforefieldinit _WMT_WEBSTREAM_SAMPLE_HEADER
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMT_WEBSTREAM_SAMPLE_HEADER

  .class public sequential ansi sealed beforefieldinit _WMPicture
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMPicture

  .class public sequential ansi sealed beforefieldinit _WMSynchronisedLyrics
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMSynchronisedLyrics

  .class public sequential ansi sealed beforefieldinit _WMUserWebURL
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMUserWebURL

  .class public sequential ansi sealed beforefieldinit _WMUserText
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMUserText

  .class public sequential ansi sealed beforefieldinit _WMLeakyBucketPair
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMLeakyBucketPair

  .class public sequential ansi sealed beforefieldinit _WM_LICENSE_STATE_DATA
         extends [mscorlib]System.ValueType
  {
  } // end of class _WM_LICENSE_STATE_DATA

  .class public sequential ansi sealed beforefieldinit _DRM_LICENSE_STATE_DATA
         extends [mscorlib]System.ValueType
  {
  } // end of class _DRM_LICENSE_STATE_DATA

  .class public auto ansi sealed DRM_LICENSE_STATE_CATEGORY
         extends [mscorlib]System.Enum
  {
  } // end of class DRM_LICENSE_STATE_CATEGORY

  .class public sequential ansi sealed beforefieldinit __WMT_WATERMARK_ENTRY
         extends [mscorlib]System.ValueType
  {
  } // end of class __WMT_WATERMARK_ENTRY

  .class public sequential ansi sealed beforefieldinit __WMT_VIDEOIMAGE_SAMPLE
         extends [mscorlib]System.ValueType
  {
  } // end of class __WMT_VIDEOIMAGE_SAMPLE

  .class public sequential ansi sealed beforefieldinit _WMT_TIMECODE_EXTENSION_DATA
         extends [mscorlib]System.ValueType
  {
  } // end of class _WMT_TIMECODE_EXTENSION_DATA

  .class interface public abstract auto ansi import IWMPropertyVault
  {
  } // end of class IWMPropertyVault

  .class interface public abstract auto ansi import IWMIStreamProps
  {
  } // end of class IWMIStreamProps

  .class interface public abstract auto ansi import IWMSyncReader2
         implements UW.CSE.ManagedWM.IWMSyncReader
  {
  } // end of class IWMSyncReader2

  .class interface public abstract auto ansi import IWMCredentialCallback
  {
  } // end of class IWMCredentialCallback

  .class interface public abstract auto ansi import IWMHeaderInfo2
         implements UW.CSE.ManagedWM.IWMHeaderInfo
  {
  } // end of class IWMHeaderInfo2

  .class interface public abstract auto ansi import IWMHeaderInfo3
         implements UW.CSE.ManagedWM.IWMHeaderInfo2
  {
  } // end of class IWMHeaderInfo3

  .class interface public abstract auto ansi import IWMProfileManager2
         implements UW.CSE.ManagedWM.IWMProfileManager
  {
  } // end of class IWMProfileManager2

  .class interface public abstract auto ansi import IWMProfileManagerLanguage
  {
  } // end of class IWMProfileManagerLanguage

  .class interface public abstract auto ansi import IWMProfile2
         implements UW.CSE.ManagedWM.IWMProfile
  {
  } // end of class IWMProfile2

  .class interface public abstract auto ansi import IWMProfile3
         implements UW.CSE.ManagedWM.IWMProfile2
  {
  } // end of class IWMProfile3

  .class interface public abstract auto ansi import IWMStreamConfig2
         implements UW.CSE.ManagedWM.IWMStreamConfig
  {
  } // end of class IWMStreamConfig2

  .class interface public abstract auto ansi import IWMStreamConfig3
         implements UW.CSE.ManagedWM.IWMStreamConfig2
  {
  } // end of class IWMStreamConfig3

  .class interface public abstract auto ansi import IWMMutualExclusion2
         implements UW.CSE.ManagedWM.IWMMutualExclusion
  {
  } // end of class IWMMutualExclusion2

  .class interface public abstract auto ansi import IWMWriterPostViewCallback
         implements UW.CSE.ManagedWM.IWMStatusCallback
  {
  } // end of class IWMWriterPostViewCallback

  .class interface public abstract auto ansi import IWMWriterPostView
  {
  } // end of class IWMWriterPostView

  .class interface public abstract auto ansi import IWMRegisterCallback
  {
  } // end of class IWMRegisterCallback

  .class interface public abstract auto ansi import IWMWriterFileSink2
         implements UW.CSE.ManagedWM.IWMWriterFileSink
  {
  } // end of class IWMWriterFileSink2

  .class interface public abstract auto ansi import IWMWriterFileSink3
         implements UW.CSE.ManagedWM.IWMWriterFileSink2
  {
  } // end of class IWMWriterFileSink3

  .class interface public abstract auto ansi import IWMClientConnections
  {
  } // end of class IWMClientConnections

  .class interface public abstract auto ansi import IWMClientConnections2
         implements UW.CSE.ManagedWM.IWMClientConnections
  {
  } // end of class IWMClientConnections2

  .class interface public abstract auto ansi import IWMReaderTypeNegotiation
  {
  } // end of class IWMReaderTypeNegotiation

  .class interface public abstract auto ansi import IWMReaderStreamClock
  {
  } // end of class IWMReaderStreamClock

  .class interface public abstract auto ansi import IWMIndexer
  {
  } // end of class IWMIndexer

  .class interface public abstract auto ansi import IWMIndexer2
         implements UW.CSE.ManagedWM.IWMIndexer
  {
  } // end of class IWMIndexer2

  .class interface public abstract auto ansi import IWMWriterPushSink
         implements UW.CSE.ManagedWM.IWMWriterSink
  {
  } // end of class IWMWriterPushSink

  .class interface public abstract auto ansi import IWMWatermarkInfo
  {
  } // end of class IWMWatermarkInfo

  .class interface public abstract auto ansi import IWMReaderAccelerator
  {
  } // end of class IWMReaderAccelerator

  .class interface public abstract auto ansi import IWMReaderTimecode
  {
  } // end of class IWMReaderTimecode

} // end of namespace UW.CSE.ManagedWM


// =============================================================


// =============== GLOBAL FIELDS AND METHODS ===================


// =============================================================


// =============== CLASS MEMBERS DECLARATION ===================
//   note that class flags, 'extends' and 'implements' clauses
//          are provided here for information only

.namespace UW.CSE.ManagedWM
{
  .class interface public abstract auto ansi import IWMMediaProps
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 43 45 2D 32 42 32 42   // ..$96406BCE-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .method public hidebysig newslot virtual abstract 
            instance void  GetType([out] valuetype UW.CSE.ManagedWM.GUID& pguidType) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMMediaProps::GetType

    .method public hidebysig newslot virtual abstract 
            instance void  GetMediaType([out] valuetype UW.CSE.ManagedWM._WMMediaType& pType,
                                        [in][out] unsigned int32& pcbType) runtime managed internalcall
    {
    } // end of method IWMMediaProps::GetMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  SetMediaType([in] valuetype UW.CSE.ManagedWM._WMMediaType& pType) runtime managed internalcall
    {
    } // end of method IWMMediaProps::SetMediaType

  } // end of class IWMMediaProps

  .class interface public abstract auto ansi import IUnknown
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 30 30 30 30 30 30 30 2D 30 30 30 30   // ..$00000000-0000
                                                                                                    2D 30 30 30 30 2D 43 30 30 30 2D 30 30 30 30 30   // -0000-C000-00000
                                                                                                    30 30 30 30 30 34 36 00 00 )                      // 0000046..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
  } // end of class IUnknown

  .class public sequential ansi sealed beforefieldinit GUID
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 Data1
    .field public unsigned int16 Data2
    .field public unsigned int16 Data3
    .field public  marshal( fixed array [8]) unsigned int8[] Data4
  } // end of class GUID

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_ManagedWM_0006_0001
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 Data1
    .field public unsigned int16 Data2
    .field public unsigned int16 Data3
    .field public  marshal( fixed array [8]) unsigned int8[] Data4
  } // end of class __MIDL___MIDL_itf_ManagedWM_0006_0001

  .class public sequential ansi sealed beforefieldinit _WMMediaType
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public valuetype UW.CSE.ManagedWM.GUID majortype
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                            64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    .field public valuetype UW.CSE.ManagedWM.GUID subtype
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                            64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    .field public int32 bFixedSizeSamples
    .field public int32 bTemporalCompression
    .field public unsigned int32 lSampleSize
    .field public valuetype UW.CSE.ManagedWM.GUID formattype
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                            64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    .field public  marshal( iunknown) object pUnk
    .field public unsigned int32 cbFormat
    .field public native int pbFormat
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
  } // end of class _WMMediaType

  .class interface public abstract auto ansi import IWMVideoMediaProps
         implements UW.CSE.ManagedWM.IWMMediaProps
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 43 46 2D 32 42 32 42   // ..$96406BCF-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .method public hidebysig newslot virtual abstract 
            instance void  GetType([out] valuetype UW.CSE.ManagedWM.GUID& pguidType) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMVideoMediaProps::GetType

    .method public hidebysig newslot virtual abstract 
            instance void  GetMediaType([out] valuetype UW.CSE.ManagedWM._WMMediaType& pType,
                                        [in][out] unsigned int32& pcbType) runtime managed internalcall
    {
    } // end of method IWMVideoMediaProps::GetMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  SetMediaType([in] valuetype UW.CSE.ManagedWM._WMMediaType& pType) runtime managed internalcall
    {
    } // end of method IWMVideoMediaProps::SetMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxKeyFrameSpacing([out] int64& pllTime) runtime managed internalcall
    {
    } // end of method IWMVideoMediaProps::GetMaxKeyFrameSpacing

    .method public hidebysig newslot virtual abstract 
            instance void  SetMaxKeyFrameSpacing([in] int64 llTime) runtime managed internalcall
    {
    } // end of method IWMVideoMediaProps::SetMaxKeyFrameSpacing

    .method public hidebysig newslot virtual abstract 
            instance void  GetQuality([out] unsigned int32& pdwQuality) runtime managed internalcall
    {
    } // end of method IWMVideoMediaProps::GetQuality

    .method public hidebysig newslot virtual abstract 
            instance void  SetQuality([in] unsigned int32 dwQuality) runtime managed internalcall
    {
    } // end of method IWMVideoMediaProps::SetQuality

  } // end of class IWMVideoMediaProps

  .class interface public abstract auto ansi import IWMWriter
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 44 34 2D 32 42 32 42   // ..$96406BD4-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetProfileByID([in] valuetype UW.CSE.ManagedWM.GUID& guidProfile) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMWriter::SetProfileByID

    .method public hidebysig newslot virtual abstract 
            instance void  SetProfile([in] class UW.CSE.ManagedWM.IWMProfile  marshal( interface) pProfile) runtime managed internalcall
    {
    } // end of method IWMWriter::SetProfile

    .method public hidebysig newslot virtual abstract 
            instance void  SetOutputFilename([in] unsigned int16& pwszFilename) runtime managed internalcall
    {
    } // end of method IWMWriter::SetOutputFilename

    .method public hidebysig newslot virtual abstract 
            instance void  GetInputCount([out] unsigned int32& pcInputs) runtime managed internalcall
    {
    } // end of method IWMWriter::GetInputCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetInputProps([in] unsigned int32 dwInputNum,
                                         [out] class UW.CSE.ManagedWM.IWMInputMediaProps&  marshal( interface) ppInput) runtime managed internalcall
    {
    } // end of method IWMWriter::GetInputProps

    .method public hidebysig newslot virtual abstract 
            instance void  SetInputProps([in] unsigned int32 dwInputNum,
                                         [in] class UW.CSE.ManagedWM.IWMInputMediaProps  marshal( interface) pInput) runtime managed internalcall
    {
    } // end of method IWMWriter::SetInputProps

    .method public hidebysig newslot virtual abstract 
            instance void  GetInputFormatCount([in] unsigned int32 dwInputNumber,
                                               [out] unsigned int32& pcFormats) runtime managed internalcall
    {
    } // end of method IWMWriter::GetInputFormatCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetInputFormat([in] unsigned int32 dwInputNumber,
                                          [in] unsigned int32 dwFormatNumber,
                                          [out] class UW.CSE.ManagedWM.IWMInputMediaProps&  marshal( interface) pProps) runtime managed internalcall
    {
    } // end of method IWMWriter::GetInputFormat

    .method public hidebysig newslot virtual abstract 
            instance void  BeginWriting() runtime managed internalcall
    {
    } // end of method IWMWriter::BeginWriting

    .method public hidebysig newslot virtual abstract 
            instance void  EndWriting() runtime managed internalcall
    {
    } // end of method IWMWriter::EndWriting

    .method public hidebysig newslot virtual abstract 
            instance void  AllocateSample([in] unsigned int32 dwSampleSize,
                                          [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppSample) runtime managed internalcall
    //.method public hidebysig newslot virtual abstract 
    //       instance void  AllocateSample([in] unsigned int32 dwSampleSize,
    //                                      [out] native int ppSample) runtime managed internalcall
    {
    } // end of method IWMWriter::AllocateSample

    .method public hidebysig newslot virtual abstract 
            instance void  WriteSample([in] unsigned int32 dwInputNum,
                                       [in] unsigned int64 cnsSampleTime,
                                       [in] unsigned int32 dwFlags,
                                       [in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pSample) runtime managed internalcall
    {
    } // end of method IWMWriter::WriteSample

    .method public hidebysig newslot virtual abstract 
            instance void  Flush() runtime managed internalcall
    {
    } // end of method IWMWriter::Flush

  } // end of class IWMWriter

  .class interface public abstract auto ansi import IWMProfile
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 44 42 2D 32 42 32 42   // ..$96406BDB-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetVersion([out] valuetype UW.CSE.ManagedWM.WMT_VERSION& pdwVersion) runtime managed internalcall
    {
    } // end of method IWMProfile::GetVersion

    //.method public hidebysig newslot virtual abstract 
    //        instance void  GetName([out] unsigned int16& pwszName,
    //                               [in][out] unsigned int32& pcchName) runtime managed internalcall
    .method public hidebysig newslot virtual abstract 
            instance void  GetName([in][out] native int pwszName,
                                   [in][out] unsigned int32& pcchName) runtime managed internalcall
    {
    } // end of method IWMProfile::GetName

    .method public hidebysig newslot virtual abstract 
            instance void  SetName([in] native int pwszName) runtime managed internalcall
    {
    } // end of method IWMProfile::SetName

    .method public hidebysig newslot virtual abstract 
            instance void  GetDescription([out] unsigned int16& pwszDescription,
                                          [in][out] unsigned int32& pcchDescription) runtime managed internalcall
    {
    } // end of method IWMProfile::GetDescription

    .method public hidebysig newslot virtual abstract 
            instance void  SetDescription([in] unsigned int16& pwszDescription) runtime managed internalcall
    {
    } // end of method IWMProfile::SetDescription

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamCount([out] unsigned int32& pcStreams) runtime managed internalcall
    {
    } // end of method IWMProfile::GetStreamCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetStream([in] unsigned int32 dwStreamIndex,
                                     [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppConfig) runtime managed internalcall
    {
    } // end of method IWMProfile::GetStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamByNumber([in] unsigned int16 wStreamNum,
                                             [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppConfig) runtime managed internalcall
    {
    } // end of method IWMProfile::GetStreamByNumber

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveStream([in] class UW.CSE.ManagedWM.IWMStreamConfig  marshal( interface) pConfig) runtime managed internalcall
    {
    } // end of method IWMProfile::RemoveStream

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveStreamByNumber([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMProfile::RemoveStreamByNumber

    .method public hidebysig newslot virtual abstract 
            instance void  AddStream([in] class UW.CSE.ManagedWM.IWMStreamConfig  marshal( interface) pConfig) runtime managed internalcall
    {
    } // end of method IWMProfile::AddStream

    .method public hidebysig newslot virtual abstract 
            instance void  ReconfigStream([in] class UW.CSE.ManagedWM.IWMStreamConfig  marshal( interface) pConfig) runtime managed internalcall
    {
    } // end of method IWMProfile::ReconfigStream

    .method public hidebysig newslot virtual abstract 
            instance void  CreateNewStream([in] valuetype UW.CSE.ManagedWM.GUID& guidStreamType,
                                           [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppConfig) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMProfile::CreateNewStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetMutualExclusionCount([out] unsigned int32& pcME) runtime managed internalcall
    {
    } // end of method IWMProfile::GetMutualExclusionCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetMutualExclusion([in] unsigned int32 dwMEIndex,
                                              [out] class UW.CSE.ManagedWM.IWMMutualExclusion&  marshal( interface) ppME) runtime managed internalcall
    {
    } // end of method IWMProfile::GetMutualExclusion

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveMutualExclusion([in] class UW.CSE.ManagedWM.IWMMutualExclusion  marshal( interface) pME) runtime managed internalcall
    {
    } // end of method IWMProfile::RemoveMutualExclusion

    .method public hidebysig newslot virtual abstract 
            instance void  AddMutualExclusion([in] class UW.CSE.ManagedWM.IWMMutualExclusion  marshal( interface) pME) runtime managed internalcall
    {
    } // end of method IWMProfile::AddMutualExclusion

    .method public hidebysig newslot virtual abstract 
            instance void  CreateNewMutualExclusion([out] class UW.CSE.ManagedWM.IWMMutualExclusion&  marshal( interface) ppME) runtime managed internalcall
    {
    } // end of method IWMProfile::CreateNewMutualExclusion

  } // end of class IWMProfile

  .class public auto ansi sealed WMT_VERSION
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_VERSION WMT_VER_4_0 = int32(0x00040000)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_VERSION WMT_VER_7_0 = int32(0x00070000)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_VERSION WMT_VER_8_0 = int32(0x00080000)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_VERSION WMT_VER_9_0 = int32(0x00090000)
  } // end of class WMT_VERSION

  .class interface public abstract auto ansi import IWMStreamConfig
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 44 43 2D 32 42 32 42   // ..$96406BDC-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamType([out] valuetype UW.CSE.ManagedWM.GUID& pguidStreamType) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMStreamConfig::GetStreamType

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamNumber([out] unsigned int16& pwStreamNum) runtime managed internalcall
    {
    } // end of method IWMStreamConfig::GetStreamNumber

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamNumber([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMStreamConfig::SetStreamNumber

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamName([out] unsigned int16& pwszStreamName,
                                         [in][out] unsigned int16& pcchStreamName) runtime managed internalcall
    {
    } // end of method IWMStreamConfig::GetStreamName

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamName([in] unsigned int16& pwszStreamName) runtime managed internalcall
    {
    } // end of method IWMStreamConfig::SetStreamName

    .method public hidebysig newslot virtual abstract 
            instance void  GetConnectionName([out] unsigned int16& pwszInputName,
                                             [in][out] unsigned int16& pcchInputName) runtime managed internalcall
    {
    } // end of method IWMStreamConfig::GetConnectionName

    .method public hidebysig newslot virtual abstract 
            instance void  SetConnectionName([in] unsigned int16& pwszInputName) runtime managed internalcall
    {
    } // end of method IWMStreamConfig::SetConnectionName

    .method public hidebysig newslot virtual abstract 
            instance void  GetBitrate([out] unsigned int32& pdwBitrate) runtime managed internalcall
    {
    } // end of method IWMStreamConfig::GetBitrate

    .method public hidebysig newslot virtual abstract 
            instance void  SetBitrate([in] unsigned int32 pdwBitrate) runtime managed internalcall
    {
    } // end of method IWMStreamConfig::SetBitrate

    .method public hidebysig newslot virtual abstract 
            instance void  GetBufferWindow([out] unsigned int32& pmsBufferWindow) runtime managed internalcall
    {
    } // end of method IWMStreamConfig::GetBufferWindow

    .method public hidebysig newslot virtual abstract 
            instance void  SetBufferWindow([in] unsigned int32 msBufferWindow) runtime managed internalcall
    {
    } // end of method IWMStreamConfig::SetBufferWindow

  } // end of class IWMStreamConfig

  .class interface public abstract auto ansi import IWMMutualExclusion
         implements UW.CSE.ManagedWM.IWMStreamList
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 44 45 2D 32 42 32 42   // ..$96406BDE-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetStreams([out] unsigned int16& pwStreamNumArray,
                                      [in][out] unsigned int16& pcStreams) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion::GetStreams

    .method public hidebysig newslot virtual abstract 
            instance void  AddStream([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion::AddStream

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveStream([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion::RemoveStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetType([out] valuetype UW.CSE.ManagedWM.GUID& pguidType) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMMutualExclusion::GetType

    .method public hidebysig newslot virtual abstract 
            instance void  SetType([in] valuetype UW.CSE.ManagedWM.GUID& guidType) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMMutualExclusion::SetType

  } // end of class IWMMutualExclusion

  .class interface public abstract auto ansi import IWMStreamList
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 44 44 2D 32 42 32 42   // ..$96406BDD-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetStreams([out] unsigned int16& pwStreamNumArray,
                                      [in][out] unsigned int16& pcStreams) runtime managed internalcall
    {
    } // end of method IWMStreamList::GetStreams

    .method public hidebysig newslot virtual abstract 
            instance void  AddStream([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMStreamList::AddStream

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveStream([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMStreamList::RemoveStream

  } // end of class IWMStreamList

  .class interface public abstract auto ansi import IWMInputMediaProps
         implements UW.CSE.ManagedWM.IWMMediaProps
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 44 35 2D 32 42 32 42   // ..$96406BD5-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .method public hidebysig newslot virtual abstract 
            instance void  GetType([out] valuetype UW.CSE.ManagedWM.GUID& pguidType) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMInputMediaProps::GetType

    //.method public hidebysig newslot virtual abstract 
    //       instance void  GetMediaType([out] valuetype UW.CSE.ManagedWM._WMMediaType& pType,
    //                                    [in][out] unsigned int32& pcbType) runtime managed internalcall
    .method public hidebysig newslot virtual abstract 
            instance void  GetMediaType([out] native int pType,
                                        [in][out] unsigned int32& pcbType) runtime managed internalcall
    {
    } // end of method IWMInputMediaProps::GetMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  SetMediaType([in] valuetype UW.CSE.ManagedWM._WMMediaType& pType) runtime managed internalcall
    //.method public hidebysig newslot virtual abstract 
    //        instance void  SetMediaType([in] native int pType) runtime managed internalcall
    {
    } // end of method IWMInputMediaProps::SetMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  GetConnectionName([out] unsigned int16& pwszName,
                                             [in][out] unsigned int16& pcchName) runtime managed internalcall
    {
    } // end of method IWMInputMediaProps::GetConnectionName

    .method public hidebysig newslot virtual abstract 
            instance void  GetGroupName([out] unsigned int16& pwszName,
                                        [in][out] unsigned int16& pcchName) runtime managed internalcall
    {
    } // end of method IWMInputMediaProps::GetGroupName

  } // end of class IWMInputMediaProps

  .class interface public abstract auto ansi import INSSBuffer
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 45 31 43 44 33 35 32 34 2D 30 33 44 37   // ..$E1CD3524-03D7
                                                                                                    2D 31 31 44 32 2D 39 45 45 44 2D 30 30 36 30 39   // -11D2-9EED-00609
                                                                                                    37 44 32 44 37 43 46 00 00 )                      // 7D2D7CF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetLength([out] unsigned int32& pdwLength) runtime managed internalcall
    {
    } // end of method INSSBuffer::GetLength

    .method public hidebysig newslot virtual abstract 
            instance void  SetLength([in] unsigned int32 dwLength) runtime managed internalcall
    {
    } // end of method INSSBuffer::SetLength

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxLength([out] unsigned int32& pdwLength) runtime managed internalcall
    {
    } // end of method INSSBuffer::GetMaxLength

    //.method public hidebysig newslot virtual abstract 
    //        instance void  GetBuffer([out] native int ppdwBuffer) runtime managed internalcall
    .method public hidebysig newslot virtual abstract 
            instance void  GetBuffer([out] native int& ppdwBuffer) runtime managed internalcall
    {
    } // end of method INSSBuffer::GetBuffer

    .method public hidebysig newslot virtual abstract 
            instance void  GetBufferAndLength([out] native int ppdwBuffer,
                                              [out] unsigned int32& pdwLength) runtime managed internalcall
    {
    } // end of method INSSBuffer::GetBufferAndLength

  } // end of class INSSBuffer

  .class interface public abstract auto ansi import IWMReader
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 44 36 2D 32 42 32 42   // ..$96406BD6-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  Open([in] unsigned int16& pwszURL,
                                [in] class UW.CSE.ManagedWM.IWMReaderCallback  marshal( interface) pCallback,
                                [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReader::Open

    .method public hidebysig newslot virtual abstract 
            instance void  Close() runtime managed internalcall
    {
    } // end of method IWMReader::Close

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputCount([out] unsigned int32& pcOutputs) runtime managed internalcall
    {
    } // end of method IWMReader::GetOutputCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputProps([in] unsigned int32 dwOutputNum,
                                          [out] class UW.CSE.ManagedWM.IWMOutputMediaProps&  marshal( interface) ppOutput) runtime managed internalcall
    {
    } // end of method IWMReader::GetOutputProps

    .method public hidebysig newslot virtual abstract 
            instance void  SetOutputProps([in] unsigned int32 dwOutputNum,
                                          [in] class UW.CSE.ManagedWM.IWMOutputMediaProps  marshal( interface) pOutput) runtime managed internalcall
    {
    } // end of method IWMReader::SetOutputProps

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputFormatCount([in] unsigned int32 dwOutputNumber,
                                                [out] unsigned int32& pcFormats) runtime managed internalcall
    {
    } // end of method IWMReader::GetOutputFormatCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputFormat([in] unsigned int32 dwOutputNumber,
                                           [in] unsigned int32 dwFormatNumber,
                                           [out] class UW.CSE.ManagedWM.IWMOutputMediaProps&  marshal( interface) ppProps) runtime managed internalcall
    {
    } // end of method IWMReader::GetOutputFormat

    .method public hidebysig newslot virtual abstract 
            instance void  Start([in] unsigned int64 cnsStart,
                                 [in] unsigned int64 cnsDuration,
                                 [in] float32 fRate,
                                 [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReader::Start

    .method public hidebysig newslot virtual abstract 
            instance void  Stop() runtime managed internalcall
    {
    } // end of method IWMReader::Stop

    .method public hidebysig newslot virtual abstract 
            instance void  Pause() runtime managed internalcall
    {
    } // end of method IWMReader::Pause

    .method public hidebysig newslot virtual abstract 
            instance void  Resume() runtime managed internalcall
    {
    } // end of method IWMReader::Resume

  } // end of class IWMReader

  .class interface public abstract auto ansi import IWMReaderCallback
         implements UW.CSE.ManagedWM.IWMStatusCallback
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 44 38 2D 32 42 32 42   // ..$96406BD8-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  OnStatus([in] valuetype UW.CSE.ManagedWM.WMT_STATUS Status,
                                    [in] int32  marshal( error) hr,
                                    [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE dwType,
                                    [in] unsigned int8& pValue,
                                    [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderCallback::OnStatus

    .method public hidebysig newslot virtual abstract 
            instance void  OnSample([in] unsigned int32 dwOutputNum,
                                    [in] unsigned int64 cnsSampleTime,
                                    [in] unsigned int64 cnsSampleDuration,
                                    [in] unsigned int32 dwFlags,
                                    [in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pSample,
                                    [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderCallback::OnSample

  } // end of class IWMReaderCallback

  .class interface public abstract auto ansi import IWMStatusCallback
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 44 37 43 44 43 37 30 2D 39 38 38 38   // ..$6D7CDC70-9888
                                                                                                    2D 31 31 44 33 2D 38 45 44 43 2D 30 30 43 30 34   // -11D3-8EDC-00C04
                                                                                                    46 36 31 30 39 43 46 00 00 )                      // F6109CF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  OnStatus([in] valuetype UW.CSE.ManagedWM.WMT_STATUS Status,
                                    [in] int32  marshal( error) hr,
                                    [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE dwType,
                                    [in] unsigned int8& pValue,
                                    [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMStatusCallback::OnStatus

  } // end of class IWMStatusCallback

  .class public auto ansi sealed WMT_STATUS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_ERROR = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_OPENED = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_BUFFERING_START = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_BUFFERING_STOP = int32(0x00000003)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_EOF = int32(0x00000004)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_END_OF_FILE = int32(0x00000004)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_END_OF_SEGMENT = int32(0x00000005)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_END_OF_STREAMING = int32(0x00000006)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_LOCATING = int32(0x00000007)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_CONNECTING = int32(0x00000008)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_NO_RIGHTS = int32(0x00000009)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_MISSING_CODEC = int32(0x0000000A)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_STARTED = int32(0x0000000B)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_STOPPED = int32(0x0000000C)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_CLOSED = int32(0x0000000D)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_STRIDING = int32(0x0000000E)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_TIMER = int32(0x0000000F)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_INDEX_PROGRESS = int32(0x00000010)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_SAVEAS_START = int32(0x00000011)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_SAVEAS_STOP = int32(0x00000012)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_NEW_SOURCEFLAGS = int32(0x00000013)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_NEW_METADATA = int32(0x00000014)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_BACKUPRESTORE_BEGIN = int32(0x00000015)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_SOURCE_SWITCH = int32(0x00000016)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_ACQUIRE_LICENSE = int32(0x00000017)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_INDIVIDUALIZE = int32(0x00000018)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_NEEDS_INDIVIDUALIZATION = int32(0x00000019)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_NO_RIGHTS_EX = int32(0x0000001A)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_BACKUPRESTORE_END = int32(0x0000001B)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_BACKUPRESTORE_CONNECTING = int32(0x0000001C)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_BACKUPRESTORE_DISCONNECTING = int32(0x0000001D)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_ERROR_WITHURL = int32(0x0000001E)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_RESTRICTED_LICENSE = int32(0x0000001F)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_CLIENT_CONNECT = int32(0x00000020)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_CLIENT_DISCONNECT = int32(0x00000021)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_NATIVE_OUTPUT_PROPS_CHANGED = int32(0x00000022)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_RECONNECT_START = int32(0x00000023)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_RECONNECT_END = int32(0x00000024)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_CLIENT_CONNECT_EX = int32(0x00000025)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_CLIENT_DISCONNECT_EX = int32(0x00000026)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_SET_FEC_SPAN = int32(0x00000027)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_PREROLL_READY = int32(0x00000028)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_PREROLL_COMPLETE = int32(0x00000029)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_CLIENT_PROPERTIES = int32(0x0000002A)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STATUS WMT_LICENSEURL_SIGNATURE_STATE = int32(0x0000002B)
  } // end of class WMT_STATUS

  .class public auto ansi sealed WMT_ATTR_DATATYPE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE WMT_TYPE_DWORD = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE WMT_TYPE_STRING = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE WMT_TYPE_BINARY = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE WMT_TYPE_BOOL = int32(0x00000003)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE WMT_TYPE_QWORD = int32(0x00000004)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE WMT_TYPE_WORD = int32(0x00000005)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE WMT_TYPE_GUID = int32(0x00000006)
  } // end of class WMT_ATTR_DATATYPE

  .class interface public abstract auto ansi import IWMOutputMediaProps
         implements UW.CSE.ManagedWM.IWMMediaProps
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 44 37 2D 32 42 32 42   // ..$96406BD7-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetType([out] valuetype UW.CSE.ManagedWM.GUID& pguidType) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMOutputMediaProps::GetType

    .method public hidebysig newslot virtual abstract 
            instance void  GetMediaType([out] valuetype UW.CSE.ManagedWM._WMMediaType& pType,
                                        [in][out] unsigned int32& pcbType) runtime managed internalcall
    {
    } // end of method IWMOutputMediaProps::GetMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  SetMediaType([in] valuetype UW.CSE.ManagedWM._WMMediaType& pType) runtime managed internalcall
    {
    } // end of method IWMOutputMediaProps::SetMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamGroupName([out] unsigned int16& pwszName,
                                              [in][out] unsigned int16& pcchName) runtime managed internalcall
    {
    } // end of method IWMOutputMediaProps::GetStreamGroupName

    .method public hidebysig newslot virtual abstract 
            instance void  GetConnectionName([out] unsigned int16& pwszName,
                                             [in][out] unsigned int16& pcchName) runtime managed internalcall
    {
    } // end of method IWMOutputMediaProps::GetConnectionName

  } // end of class IWMOutputMediaProps

  .class interface public abstract auto ansi import IWMMetadataEditor
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 44 39 2D 32 42 32 42   // ..$96406BD9-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .method public hidebysig newslot virtual abstract 
            instance void  Open([in] unsigned int16& pwszFilename) runtime managed internalcall
    {
    } // end of method IWMMetadataEditor::Open

    .method public hidebysig newslot virtual abstract 
            instance void  Close() runtime managed internalcall
    {
    } // end of method IWMMetadataEditor::Close

    .method public hidebysig newslot virtual abstract 
            instance void  Flush() runtime managed internalcall
    {
    } // end of method IWMMetadataEditor::Flush

  } // end of class IWMMetadataEditor

  .class interface public abstract auto ansi import IWMMetadataEditor2
         implements UW.CSE.ManagedWM.IWMMetadataEditor
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 32 30 33 43 46 46 45 33 2D 32 45 31 38   // ..$203CFFE3-2E18
                                                                                                    2D 34 46 44 46 2D 42 35 39 44 2D 36 45 37 31 35   // -4FDF-B59D-6E715
                                                                                                    33 30 35 33 34 43 46 00 00 )                      // 30534CF..
    .method public hidebysig newslot virtual abstract 
            instance void  Open([in] unsigned int16& pwszFilename) runtime managed internalcall
    {
    } // end of method IWMMetadataEditor2::Open

    .method public hidebysig newslot virtual abstract 
            instance void  Close() runtime managed internalcall
    {
    } // end of method IWMMetadataEditor2::Close

    .method public hidebysig newslot virtual abstract 
            instance void  Flush() runtime managed internalcall
    {
    } // end of method IWMMetadataEditor2::Flush

    .method public hidebysig newslot virtual abstract 
            instance void  OpenEx([in] unsigned int16& pwszFilename,
                                  [in] unsigned int32 dwDesiredAccess,
                                  [in] unsigned int32 dwShareMode) runtime managed internalcall
    {
    } // end of method IWMMetadataEditor2::OpenEx

  } // end of class IWMMetadataEditor2

  .class interface public abstract auto ansi import IWMDRMEditor
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 46 46 31 33 30 45 42 43 2D 41 36 43 33   // ..$FF130EBC-A6C3
                                                                                                    2D 34 32 41 36 2D 42 34 30 31 2D 43 33 33 38 32   // -42A6-B401-C3382
                                                                                                    43 33 45 30 38 42 33 00 00 )                      // C3E08B3..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetDRMProperty([in] string  marshal( lpwstr) pwstrName,
                                          [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pdwType,
                                          [out] unsigned int8& pValue,
                                          [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMDRMEditor::GetDRMProperty

  } // end of class IWMDRMEditor

  .class interface public abstract auto ansi import IWMHeaderInfo
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 44 41 2D 32 42 32 42   // ..$96406BDA-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetAttributeCount([in] unsigned int16 wStreamNum,
                                             [out] unsigned int16& pcAttributes) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo::GetAttributeCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetAttributeByIndex([in] unsigned int16 wIndex,
                                               [in][out] unsigned int16& pwStreamNum,
                                               [out] unsigned int16& pwszName,
                                               [in][out] unsigned int16& pcchNameLen,
                                               [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                               [out] unsigned int8& pValue,
                                               [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo::GetAttributeByIndex

    .method public hidebysig newslot virtual abstract 
            instance void  GetAttributeByName([in][out] unsigned int16& pwStreamNum,
                                              [in] string  marshal( lpwstr) pszName,
                                              [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                              [out] unsigned int8& pValue,
                                              [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo::GetAttributeByName

    .method public hidebysig newslot virtual abstract 
            instance void  SetAttribute([in] unsigned int16 wStreamNum,
                                        [in] string  marshal( lpwstr) pszName,
                                        [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                        [in] unsigned int8& pValue,
                                        [in] unsigned int16 cbLength) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo::SetAttribute

    .method public hidebysig newslot virtual abstract 
            instance void  GetMarkerCount([out] unsigned int16& pcMarkers) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo::GetMarkerCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetMarker([in] unsigned int16 wIndex,
                                     [out] unsigned int16& pwszMarkerName,
                                     [in][out] unsigned int16& pcchMarkerNameLen,
                                     [out] unsigned int64& pcnsMarkerTime) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo::GetMarker

    .method public hidebysig newslot virtual abstract 
            instance void  AddMarker([in] unsigned int16& pwszMarkerName,
                                     [in] unsigned int64 cnsMarkerTime) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo::AddMarker

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveMarker([in] unsigned int16 wIndex) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo::RemoveMarker

    .method public hidebysig newslot virtual abstract 
            instance void  GetScriptCount([out] unsigned int16& pcScripts) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo::GetScriptCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetScript([in] unsigned int16 wIndex,
                                     [out] unsigned int16& pwszType,
                                     [in][out] unsigned int16& pcchTypeLen,
                                     [out] unsigned int16& pwszCommand,
                                     [in][out] unsigned int16& pcchCommandLen,
                                     [out] unsigned int64& pcnsScriptTime) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo::GetScript

    .method public hidebysig newslot virtual abstract 
            instance void  AddScript([in] unsigned int16& pwszType,
                                     [in] unsigned int16& pwszCommand,
                                     [in] unsigned int64 cnsScriptTime) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo::AddScript

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveScript([in] unsigned int16 wIndex) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo::RemoveScript

  } // end of class IWMHeaderInfo

  .class interface public abstract auto ansi import IWMProfileManager
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 31 36 36 37 39 46 32 2D 36 43 41 30   // ..$D16679F2-6CA0
                                                                                                    2D 34 37 32 44 2D 38 44 33 31 2D 32 46 35 44 35   // -472D-8D31-2F5D5
                                                                                                    35 41 45 45 31 35 35 00 00 )                      // 5AEE155..
    .method public hidebysig newslot virtual abstract 
            instance void  CreateEmptyProfile([in] valuetype UW.CSE.ManagedWM.WMT_VERSION dwVersion,
                                              [out] class UW.CSE.ManagedWM.IWMProfile&  marshal( interface) ppProfile) runtime managed internalcall
    {
    } // end of method IWMProfileManager::CreateEmptyProfile

    .method public hidebysig newslot virtual abstract 
            instance void  LoadProfileByID([in] valuetype UW.CSE.ManagedWM.GUID& guidProfile,
                                           [out] class UW.CSE.ManagedWM.IWMProfile&  marshal( interface) ppProfile) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMProfileManager::LoadProfileByID

    .method public hidebysig newslot virtual abstract 
            instance void  LoadProfileByData([in][out] native int pwszProfile,
                                             [out] class UW.CSE.ManagedWM.IWMProfile&  marshal( interface) ppProfile) runtime managed internalcall
    {
    } // end of method IWMProfileManager::LoadProfileByData

    .method public hidebysig newslot virtual abstract 
            instance void  SaveProfile([in] class UW.CSE.ManagedWM.IWMProfile  marshal( interface) pIWMProfile,
                                       [in] unsigned int16& pwszProfile,
                                       [in][out] unsigned int32& pdwLength) runtime managed internalcall
    {
    } // end of method IWMProfileManager::SaveProfile

    .method public hidebysig newslot virtual abstract 
            instance void  GetSystemProfileCount([out] unsigned int32& pcProfiles) runtime managed internalcall
    {
    } // end of method IWMProfileManager::GetSystemProfileCount

    .method public hidebysig newslot virtual abstract 
            instance void  LoadSystemProfile([in] unsigned int32 dwProfileIndex,
                                             [out] class UW.CSE.ManagedWM.IWMProfile&  marshal( interface) ppProfile) runtime managed internalcall
    {
    } // end of method IWMProfileManager::LoadSystemProfile

  } // end of class IWMProfileManager

  .class interface public abstract auto ansi import IWMBandwidthSharing
         implements UW.CSE.ManagedWM.IWMStreamList
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 41 44 36 39 34 41 46 31 2D 46 38 44 39   // ..$AD694AF1-F8D9
                                                                                                    2D 34 32 46 38 2D 42 43 34 37 2D 37 30 33 31 31   // -42F8-BC47-70311
                                                                                                    42 30 43 34 46 39 45 00 00 )                      // B0C4F9E..
    .method public hidebysig newslot virtual abstract 
            instance void  GetStreams([out] unsigned int16& pwStreamNumArray,
                                      [in][out] unsigned int16& pcStreams) runtime managed internalcall
    {
    } // end of method IWMBandwidthSharing::GetStreams

    .method public hidebysig newslot virtual abstract 
            instance void  AddStream([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMBandwidthSharing::AddStream

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveStream([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMBandwidthSharing::RemoveStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetType([out] valuetype UW.CSE.ManagedWM.GUID& pguidType) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMBandwidthSharing::GetType

    .method public hidebysig newslot virtual abstract 
            instance void  SetType([in] valuetype UW.CSE.ManagedWM.GUID& guidType) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMBandwidthSharing::SetType

    .method public hidebysig newslot virtual abstract 
            instance void  GetBandwidth([out] unsigned int32& pdwBitrate,
                                        [out] unsigned int32& pmsBufferWindow) runtime managed internalcall
    {
    } // end of method IWMBandwidthSharing::GetBandwidth

    .method public hidebysig newslot virtual abstract 
            instance void  SetBandwidth([in] unsigned int32 dwBitrate,
                                        [in] unsigned int32 msBufferWindow) runtime managed internalcall
    {
    } // end of method IWMBandwidthSharing::SetBandwidth

  } // end of class IWMBandwidthSharing

  .class interface public abstract auto ansi import IWMStreamPrioritization
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 43 31 43 36 30 39 30 2D 46 39 41 38   // ..$8C1C6090-F9A8
                                                                                                    2D 34 37 34 38 2D 38 45 43 33 2D 44 44 31 31 30   // -4748-8EC3-DD110
                                                                                                    38 42 41 31 45 37 37 00 00 )                      // 8BA1E77..
    .method public hidebysig newslot virtual abstract 
            instance void  GetPriorityRecords([out] valuetype UW.CSE.ManagedWM._WMStreamPrioritizationRecord& pRecordArray,
                                              [in][out] unsigned int16& pcRecords) runtime managed internalcall
    {
    } // end of method IWMStreamPrioritization::GetPriorityRecords

    .method public hidebysig newslot virtual abstract 
            instance void  SetPriorityRecords([in] valuetype UW.CSE.ManagedWM._WMStreamPrioritizationRecord& pRecordArray,
                                              [in] unsigned int16 cRecords) runtime managed internalcall
    {
    } // end of method IWMStreamPrioritization::SetPriorityRecords

  } // end of class IWMStreamPrioritization

  .class public sequential ansi sealed beforefieldinit _WMStreamPrioritizationRecord
         extends [mscorlib]System.ValueType
  {
    .pack 2
    .size 0
    .field public unsigned int16 wStreamNumber
    .field public int32 fMandatory
  } // end of class _WMStreamPrioritizationRecord

  .class interface public abstract auto ansi import IWMPacketSize
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 44 46 42 39 37 41 42 2D 31 38 38 46   // ..$CDFB97AB-188F
                                                                                                    2D 34 30 42 33 2D 42 36 34 33 2D 35 42 37 39 30   // -40B3-B643-5B790
                                                                                                    33 39 37 35 43 35 39 00 00 )                      // 3975C59..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxPacketSize([out] unsigned int32& pdwMaxPacketSize) runtime managed internalcall
    {
    } // end of method IWMPacketSize::GetMaxPacketSize

    .method public hidebysig newslot virtual abstract 
            instance void  SetMaxPacketSize([in] unsigned int32 dwMaxPacketSize) runtime managed internalcall
    {
    } // end of method IWMPacketSize::SetMaxPacketSize

  } // end of class IWMPacketSize

  .class interface public abstract auto ansi import IWMPacketSize2
         implements UW.CSE.ManagedWM.IWMPacketSize
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 42 46 43 32 42 39 45 2D 42 36 34 36   // ..$8BFC2B9E-B646
                                                                                                    2D 34 32 33 33 2D 41 38 37 37 2D 31 43 36 41 30   // -4233-A877-1C6A0
                                                                                                    37 39 36 36 39 44 43 00 00 )                      // 79669DC..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxPacketSize([out] unsigned int32& pdwMaxPacketSize) runtime managed internalcall
    {
    } // end of method IWMPacketSize2::GetMaxPacketSize

    .method public hidebysig newslot virtual abstract 
            instance void  SetMaxPacketSize([in] unsigned int32 dwMaxPacketSize) runtime managed internalcall
    {
    } // end of method IWMPacketSize2::SetMaxPacketSize

    .method public hidebysig newslot virtual abstract 
            instance void  GetMinPacketSize([out] unsigned int32& pdwMinPacketSize) runtime managed internalcall
    {
    } // end of method IWMPacketSize2::GetMinPacketSize

    .method public hidebysig newslot virtual abstract 
            instance void  SetMinPacketSize([in] unsigned int32 dwMinPacketSize) runtime managed internalcall
    {
    } // end of method IWMPacketSize2::SetMinPacketSize

  } // end of class IWMPacketSize2

  .class interface public abstract auto ansi import IWMWriterAdvanced
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 45 33 2D 32 42 32 42   // ..$96406BE3-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .method public hidebysig newslot virtual abstract 
            instance void  GetSinkCount([out] unsigned int32& pcSinks) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced::GetSinkCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetSink([in] unsigned int32 dwSinkNum,
                                   [out] class UW.CSE.ManagedWM.IWMWriterSink&  marshal( interface) ppSink) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced::GetSink

    .method public hidebysig newslot virtual abstract 
            instance void  AddSink([in] class UW.CSE.ManagedWM.IWMWriterSink  marshal( interface) pSink) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced::AddSink

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveSink([in] class UW.CSE.ManagedWM.IWMWriterSink  marshal( interface) pSink) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced::RemoveSink

    .method public hidebysig newslot virtual abstract 
            instance void  WriteStreamSample([in] unsigned int16 wStreamNum,
                                             [in] unsigned int64 cnsSampleTime,
                                             [in] unsigned int32 msSampleSendTime,
                                             [in] unsigned int64 cnsSampleDuration,
                                             [in] unsigned int32 dwFlags,
                                             [in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pSample) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced::WriteStreamSample

    .method public hidebysig newslot virtual abstract 
            instance void  SetLiveSource(int32 fIsLiveSource) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced::SetLiveSource

    .method public hidebysig newslot virtual abstract 
            instance void  IsRealTime([out] int32& pfRealTime) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced::IsRealTime

    .method public hidebysig newslot virtual abstract 
            instance void  GetWriterTime([out] unsigned int64& pcnsCurrentTime) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced::GetWriterTime

    .method public hidebysig newslot virtual abstract 
            instance void  GetStatistics([in] unsigned int16 wStreamNum,
                                         [out] valuetype UW.CSE.ManagedWM._WMWriterStatistics& pStats) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced::GetStatistics

    .method public hidebysig newslot virtual abstract 
            instance void  SetSyncTolerance([in] unsigned int32 msWindow) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced::SetSyncTolerance

    .method public hidebysig newslot virtual abstract 
            instance void  GetSyncTolerance([out] unsigned int32& pmsWindow) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced::GetSyncTolerance

  } // end of class IWMWriterAdvanced

  .class interface public abstract auto ansi import IWMWriterSink
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 45 34 2D 32 42 32 42   // ..$96406BE4-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  OnHeader([in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pHeader) runtime managed internalcall
    {
    } // end of method IWMWriterSink::OnHeader

    .method public hidebysig newslot virtual abstract 
            instance void  IsRealTime([out] int32& pfRealTime) runtime managed internalcall
    {
    } // end of method IWMWriterSink::IsRealTime

    .method public hidebysig newslot virtual abstract 
            instance void  AllocateDataUnit([in] unsigned int32 cbDataUnit,
                                            [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppDataUnit) runtime managed internalcall
    {
    } // end of method IWMWriterSink::AllocateDataUnit

    .method public hidebysig newslot virtual abstract 
            instance void  OnDataUnit([in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pDataUnit) runtime managed internalcall
    {
    } // end of method IWMWriterSink::OnDataUnit

    .method public hidebysig newslot virtual abstract 
            instance void  OnEndWriting() runtime managed internalcall
    {
    } // end of method IWMWriterSink::OnEndWriting

  } // end of class IWMWriterSink

  .class public sequential ansi sealed beforefieldinit _WMWriterStatistics
         extends [mscorlib]System.ValueType
  {
    .pack 8
    .size 0
    .field public unsigned int64 qwSampleCount
    .field public unsigned int64 qwByteCount
    .field public unsigned int64 qwDroppedSampleCount
    .field public unsigned int64 qwDroppedByteCount
    .field public unsigned int32 dwCurrentBitrate
    .field public unsigned int32 dwAverageBitrate
    .field public unsigned int32 dwExpectedBitrate
    .field public unsigned int32 dwCurrentSampleRate
    .field public unsigned int32 dwAverageSampleRate
    .field public unsigned int32 dwExpectedSampleRate
  } // end of class _WMWriterStatistics

  .class interface public abstract auto ansi import IWMWriterAdvanced2
         implements UW.CSE.ManagedWM.IWMWriterAdvanced
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 32 44 43 31 45 43 2D 43 30 34 36   // ..$962DC1EC-C046
                                                                                                    2D 34 44 42 38 2D 39 43 43 37 2D 32 36 43 45 41   // -4DB8-9CC7-26CEA
                                                                                                    45 35 30 30 38 31 37 00 00 )                      // E500817..
    .method public hidebysig newslot virtual abstract 
            instance void  GetSinkCount([out] unsigned int32& pcSinks) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced2::GetSinkCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetSink([in] unsigned int32 dwSinkNum,
                                   [out] class UW.CSE.ManagedWM.IWMWriterSink&  marshal( interface) ppSink) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced2::GetSink

    .method public hidebysig newslot virtual abstract 
            instance void  AddSink([in] class UW.CSE.ManagedWM.IWMWriterSink  marshal( interface) pSink) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced2::AddSink

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveSink([in] class UW.CSE.ManagedWM.IWMWriterSink  marshal( interface) pSink) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced2::RemoveSink

    .method public hidebysig newslot virtual abstract 
            instance void  WriteStreamSample([in] unsigned int16 wStreamNum,
                                             [in] unsigned int64 cnsSampleTime,
                                             [in] unsigned int32 msSampleSendTime,
                                             [in] unsigned int64 cnsSampleDuration,
                                             [in] unsigned int32 dwFlags,
                                             [in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pSample) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced2::WriteStreamSample

    .method public hidebysig newslot virtual abstract 
            instance void  SetLiveSource(int32 fIsLiveSource) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced2::SetLiveSource

    .method public hidebysig newslot virtual abstract 
            instance void  IsRealTime([out] int32& pfRealTime) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced2::IsRealTime

    .method public hidebysig newslot virtual abstract 
            instance void  GetWriterTime([out] unsigned int64& pcnsCurrentTime) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced2::GetWriterTime

    .method public hidebysig newslot virtual abstract 
            instance void  GetStatistics([in] unsigned int16 wStreamNum,
                                         [out] valuetype UW.CSE.ManagedWM._WMWriterStatistics& pStats) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced2::GetStatistics

    .method public hidebysig newslot virtual abstract 
            instance void  SetSyncTolerance([in] unsigned int32 msWindow) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced2::SetSyncTolerance

    .method public hidebysig newslot virtual abstract 
            instance void  GetSyncTolerance([out] unsigned int32& pmsWindow) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced2::GetSyncTolerance

    .method public hidebysig newslot virtual abstract 
            instance void  GetInputSetting([in] unsigned int32 dwInputNum,
                                           [in] string  marshal( lpwstr) pszName,
                                           [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                           [out] unsigned int8& pValue,
                                           [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced2::GetInputSetting

    .method public hidebysig newslot virtual abstract 
            instance void  SetInputSetting([in] unsigned int32 dwInputNum,
                                           [in] string  marshal( lpwstr) pszName,
                                           [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                           [in] unsigned int8& pValue,
                                           [in] unsigned int16 cbLength) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced2::SetInputSetting

  } // end of class IWMWriterAdvanced2

  .class interface public abstract auto ansi import IWMWriterAdvanced3
         implements UW.CSE.ManagedWM.IWMWriterAdvanced2
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 32 43 44 36 34 39 32 44 2D 37 43 33 37   // ..$2CD6492D-7C37
                                                                                                    2D 34 45 37 36 2D 39 44 33 42 2D 35 39 32 36 31   // -4E76-9D3B-59261
                                                                                                    31 38 33 41 32 32 45 00 00 )                      // 183A22E..
    .method public hidebysig newslot virtual abstract 
            instance void  GetSinkCount([out] unsigned int32& pcSinks) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::GetSinkCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetSink([in] unsigned int32 dwSinkNum,
                                   [out] class UW.CSE.ManagedWM.IWMWriterSink&  marshal( interface) ppSink) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::GetSink

    .method public hidebysig newslot virtual abstract 
            instance void  AddSink([in] class UW.CSE.ManagedWM.IWMWriterSink  marshal( interface) pSink) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::AddSink

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveSink([in] class UW.CSE.ManagedWM.IWMWriterSink  marshal( interface) pSink) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::RemoveSink

    .method public hidebysig newslot virtual abstract 
            instance void  WriteStreamSample([in] unsigned int16 wStreamNum,
                                             [in] unsigned int64 cnsSampleTime,
                                             [in] unsigned int32 msSampleSendTime,
                                             [in] unsigned int64 cnsSampleDuration,
                                             [in] unsigned int32 dwFlags,
                                             [in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pSample) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::WriteStreamSample

    .method public hidebysig newslot virtual abstract 
            instance void  SetLiveSource(int32 fIsLiveSource) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::SetLiveSource

    .method public hidebysig newslot virtual abstract 
            instance void  IsRealTime([out] int32& pfRealTime) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::IsRealTime

    .method public hidebysig newslot virtual abstract 
            instance void  GetWriterTime([out] unsigned int64& pcnsCurrentTime) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::GetWriterTime

    .method public hidebysig newslot virtual abstract 
            instance void  GetStatistics([in] unsigned int16 wStreamNum,
                                         [out] valuetype UW.CSE.ManagedWM._WMWriterStatistics& pStats) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::GetStatistics

    .method public hidebysig newslot virtual abstract 
            instance void  SetSyncTolerance([in] unsigned int32 msWindow) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::SetSyncTolerance

    .method public hidebysig newslot virtual abstract 
            instance void  GetSyncTolerance([out] unsigned int32& pmsWindow) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::GetSyncTolerance

    .method public hidebysig newslot virtual abstract 
            instance void  GetInputSetting([in] unsigned int32 dwInputNum,
                                           [in] string  marshal( lpwstr) pszName,
                                           [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                           [out] unsigned int8& pValue,
                                           [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::GetInputSetting

    .method public hidebysig newslot virtual abstract 
            instance void  SetInputSetting([in] unsigned int32 dwInputNum,
                                           [in] string  marshal( lpwstr) pszName,
                                           [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                           [in] unsigned int8& pValue,
                                           [in] unsigned int16 cbLength) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::SetInputSetting

    .method public hidebysig newslot virtual abstract 
            instance void  GetStatisticsEx([in] unsigned int16 wStreamNum,
                                           [out] valuetype UW.CSE.ManagedWM._WMWriterStatisticsEx& pStats) runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::GetStatisticsEx

    .method public hidebysig newslot virtual abstract 
            instance void  SetNonBlocking() runtime managed internalcall
    {
    } // end of method IWMWriterAdvanced3::SetNonBlocking

  } // end of class IWMWriterAdvanced3

  .class public sequential ansi sealed beforefieldinit _WMWriterStatisticsEx
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 dwBitratePlusOverhead
    .field public unsigned int32 dwCurrentSampleDropRateInQueue
    .field public unsigned int32 dwCurrentSampleDropRateInCodec
    .field public unsigned int32 dwCurrentSampleDropRateInMultiplexer
    .field public unsigned int32 dwTotalSampleDropsInQueue
    .field public unsigned int32 dwTotalSampleDropsInCodec
    .field public unsigned int32 dwTotalSampleDropsInMultiplexer
  } // end of class _WMWriterStatisticsEx

  .class interface public abstract auto ansi import IWMWriterPreprocess
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 46 43 35 34 41 32 38 35 2D 33 38 43 34   // ..$FC54A285-38C4
                                                                                                    2D 34 35 42 35 2D 41 41 32 33 2D 38 35 42 39 46   // -45B5-AA23-85B9F
                                                                                                    37 43 42 34 32 34 42 00 00 )                      // 7CB424B..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxPreprocessingPasses([in] unsigned int32 dwInputNum,
                                                     [in] unsigned int32 dwFlags,
                                                     [out] unsigned int32& pdwMaxNumPasses) runtime managed internalcall
    {
    } // end of method IWMWriterPreprocess::GetMaxPreprocessingPasses

    .method public hidebysig newslot virtual abstract 
            instance void  SetNumPreprocessingPasses([in] unsigned int32 dwInputNum,
                                                     [in] unsigned int32 dwFlags,
                                                     [in] unsigned int32 dwNumPasses) runtime managed internalcall
    {
    } // end of method IWMWriterPreprocess::SetNumPreprocessingPasses

    .method public hidebysig newslot virtual abstract 
            instance void  BeginPreprocessingPass([in] unsigned int32 dwInputNum,
                                                  [in] unsigned int32 dwFlags) runtime managed internalcall
    {
    } // end of method IWMWriterPreprocess::BeginPreprocessingPass

    .method public hidebysig newslot virtual abstract 
            instance void  PreprocessSample([in] unsigned int32 dwInputNum,
                                            [in] unsigned int64 cnsSampleTime,
                                            [in] unsigned int32 dwFlags,
                                            [in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pSample) runtime managed internalcall
    {
    } // end of method IWMWriterPreprocess::PreprocessSample

    .method public hidebysig newslot virtual abstract 
            instance void  EndPreprocessingPass([in] unsigned int32 dwInputNum,
                                                [in] unsigned int32 dwFlags) runtime managed internalcall
    {
    } // end of method IWMWriterPreprocess::EndPreprocessingPass

  } // end of class IWMWriterPreprocess

  .class interface public abstract auto ansi import IWMWriterFileSink
         implements UW.CSE.ManagedWM.IWMWriterSink
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 45 35 2D 32 42 32 42   // ..$96406BE5-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .method public hidebysig newslot virtual abstract 
            instance void  OnHeader([in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pHeader) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink::OnHeader

    .method public hidebysig newslot virtual abstract 
            instance void  IsRealTime([out] int32& pfRealTime) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink::IsRealTime

    .method public hidebysig newslot virtual abstract 
            instance void  AllocateDataUnit([in] unsigned int32 cbDataUnit,
                                            [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppDataUnit) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink::AllocateDataUnit

    .method public hidebysig newslot virtual abstract 
            instance void  OnDataUnit([in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pDataUnit) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink::OnDataUnit

    .method public hidebysig newslot virtual abstract 
            instance void  OnEndWriting() runtime managed internalcall
    {
    } // end of method IWMWriterFileSink::OnEndWriting

    .method public hidebysig newslot virtual abstract 
            instance void  Open([in][out] native int pwszFilename) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink::Open

  } // end of class IWMWriterFileSink

  .class interface public abstract auto ansi import IWMWriterNetworkSink
         implements UW.CSE.ManagedWM.IWMWriterSink
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 45 37 2D 32 42 32 42   // ..$96406BE7-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  OnHeader([in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pHeader) runtime managed internalcall
    {
    } // end of method IWMWriterNetworkSink::OnHeader

    .method public hidebysig newslot virtual abstract 
            instance void  IsRealTime([out] int32& pfRealTime) runtime managed internalcall
    {
    } // end of method IWMWriterNetworkSink::IsRealTime

    .method public hidebysig newslot virtual abstract 
            instance void  AllocateDataUnit([in] unsigned int32 cbDataUnit,
                                            [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppDataUnit) runtime managed internalcall
    {
    } // end of method IWMWriterNetworkSink::AllocateDataUnit

    .method public hidebysig newslot virtual abstract 
            instance void  OnDataUnit([in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pDataUnit) runtime managed internalcall
    {
    } // end of method IWMWriterNetworkSink::OnDataUnit

    .method public hidebysig newslot virtual abstract 
            instance void  OnEndWriting() runtime managed internalcall
    {
    } // end of method IWMWriterNetworkSink::OnEndWriting

    .method public hidebysig newslot virtual abstract 
            instance void  SetMaximumClients([in] unsigned int32 dwMaxClients) runtime managed internalcall
    {
    } // end of method IWMWriterNetworkSink::SetMaximumClients

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaximumClients([out] unsigned int32& pdwMaxClients) runtime managed internalcall
    {
    } // end of method IWMWriterNetworkSink::GetMaximumClients

    .method public hidebysig newslot virtual abstract 
            instance void  SetNetworkProtocol([in] valuetype UW.CSE.ManagedWM.WMT_NET_PROTOCOL protocol) runtime managed internalcall
    {
    } // end of method IWMWriterNetworkSink::SetNetworkProtocol

    .method public hidebysig newslot virtual abstract 
            instance void  GetNetworkProtocol([out] valuetype UW.CSE.ManagedWM.WMT_NET_PROTOCOL& pProtocol) runtime managed internalcall
    {
    } // end of method IWMWriterNetworkSink::GetNetworkProtocol

    //.method public hidebysig newslot virtual abstract 
    //        instance void  GetHostURL([out] unsigned int16& pwszURL,
    //                                  [in][out] unsigned int32& pcchURL) runtime managed internalcall
    .method public hidebysig newslot virtual abstract 
            instance void  GetHostURL([in][out] native int pwszURL,
                                   [in][out] unsigned int32& pcchURL) runtime managed internalcall
    {
    } // end of method IWMWriterNetworkSink::GetHostURL

    .method public hidebysig newslot virtual abstract 
            instance void  Open([in][out] unsigned int32& pdwPortNum) runtime managed internalcall
    {
    } // end of method IWMWriterNetworkSink::Open

    .method public hidebysig newslot virtual abstract 
            instance void  Disconnect() runtime managed internalcall
    {
    } // end of method IWMWriterNetworkSink::Disconnect

    .method public hidebysig newslot virtual abstract 
            instance void  Close() runtime managed internalcall
    {
    } // end of method IWMWriterNetworkSink::Close

  } // end of class IWMWriterNetworkSink

  .class public auto ansi sealed WMT_NET_PROTOCOL
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_NET_PROTOCOL WMT_PROTOCOL_HTTP = int32(0x00000000)
  } // end of class WMT_NET_PROTOCOL

  .class interface public abstract auto ansi import IWMDRMWriter
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 36 45 41 35 44 44 30 2D 31 32 41 30   // ..$D6EA5DD0-12A0
                                                                                                    2D 34 33 46 34 2D 39 30 41 42 2D 41 33 46 44 34   // -43F4-90AB-A3FD4
                                                                                                    35 31 45 36 41 30 37 00 00 )                      // 51E6A07..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GenerateKeySeed([out] unsigned int16& pwszKeySeed,
                                           [in][out] unsigned int32& pcwchLength) runtime managed internalcall
    {
    } // end of method IWMDRMWriter::GenerateKeySeed

    .method public hidebysig newslot virtual abstract 
            instance void  GenerateKeyID([out] unsigned int16& pwszKeyID,
                                         [in][out] unsigned int32& pcwchLength) runtime managed internalcall
    {
    } // end of method IWMDRMWriter::GenerateKeyID

    .method public hidebysig newslot virtual abstract 
            instance void  GenerateSigningKeyPair([out] unsigned int16& pwszPrivKey,
                                                  [in][out] unsigned int32& pcwchPrivKeyLength,
                                                  [out] unsigned int16& pwszPubKey,
                                                  [in][out] unsigned int32& pcwchPubKeyLength) runtime managed internalcall
    {
    } // end of method IWMDRMWriter::GenerateSigningKeyPair

    .method public hidebysig newslot virtual abstract 
            instance void  SetDRMAttribute([in] unsigned int16 wStreamNum,
                                           [in] string  marshal( lpwstr) pszName,
                                           [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                           [in] unsigned int8& pValue,
                                           [in] unsigned int16 cbLength) runtime managed internalcall
    {
    } // end of method IWMDRMWriter::SetDRMAttribute

  } // end of class IWMDRMWriter

  .class interface public abstract auto ansi import IWMReaderAdvanced
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 45 41 2D 32 42 32 42   // ..$96406BEA-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetUserProvidedClock([in] int32 fUserClock) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::SetUserProvidedClock

    .method public hidebysig newslot virtual abstract 
            instance void  GetUserProvidedClock([out] int32& pfUserClock) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::GetUserProvidedClock

    .method public hidebysig newslot virtual abstract 
            instance void  DeliverTime([in] unsigned int64 cnsTime) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::DeliverTime

    .method public hidebysig newslot virtual abstract 
            instance void  SetManualStreamSelection([in] int32 fSelection) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::SetManualStreamSelection

    .method public hidebysig newslot virtual abstract 
            instance void  GetManualStreamSelection([out] int32& pfSelection) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::GetManualStreamSelection

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamsSelected([in] unsigned int16 cStreamCount,
                                              [in] unsigned int16& pwStreamNumbers,
                                              [in] valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION& pSelections) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::SetStreamsSelected

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamSelected([in] unsigned int16 wStreamNum,
                                             [out] valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION& pSelection) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::GetStreamSelected

    .method public hidebysig newslot virtual abstract 
            instance void  SetReceiveSelectionCallbacks([in] int32 fGetCallbacks) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::SetReceiveSelectionCallbacks

    .method public hidebysig newslot virtual abstract 
            instance void  GetReceiveSelectionCallbacks([out] int32& pfGetCallbacks) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::GetReceiveSelectionCallbacks

    .method public hidebysig newslot virtual abstract 
            instance void  SetReceiveStreamSamples([in] unsigned int16 wStreamNum,
                                                   [in] int32 fReceiveStreamSamples) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::SetReceiveStreamSamples

    .method public hidebysig newslot virtual abstract 
            instance void  GetReceiveStreamSamples([in] unsigned int16 wStreamNum,
                                                   [out] int32& pfReceiveStreamSamples) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::GetReceiveStreamSamples

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllocateForOutput([in] unsigned int32 dwOutputNum,
                                                [in] int32 fAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::SetAllocateForOutput

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocateForOutput([in] unsigned int32 dwOutputNum,
                                                [out] int32& pfAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::GetAllocateForOutput

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllocateForStream([in] unsigned int16 wStreamNum,
                                                [in] int32 fAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::SetAllocateForStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocateForStream([in] unsigned int16 dwSreamNum,
                                                [out] int32& pfAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::GetAllocateForStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetStatistics([in][out] valuetype UW.CSE.ManagedWM._WMReaderStatistics& pStatistics) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::GetStatistics

    .method public hidebysig newslot virtual abstract 
            instance void  SetClientInfo([in] valuetype UW.CSE.ManagedWM._WMReaderClientInfo& pClientInfo) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::SetClientInfo

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxOutputSampleSize([in] unsigned int32 dwOutput,
                                                  [out] unsigned int32& pcbMax) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::GetMaxOutputSampleSize

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxStreamSampleSize([in] unsigned int16 wStream,
                                                  [out] unsigned int32& pcbMax) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::GetMaxStreamSampleSize

    .method public hidebysig newslot virtual abstract 
            instance void  NotifyLateDelivery(unsigned int64 cnsLateness) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced::NotifyLateDelivery

  } // end of class IWMReaderAdvanced

  .class public auto ansi sealed WMT_STREAM_SELECTION
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION WMT_OFF = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION WMT_CLEANPOINT_ONLY = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION WMT_ON = int32(0x00000002)
  } // end of class WMT_STREAM_SELECTION

  .class public sequential ansi sealed beforefieldinit _WMReaderStatistics
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 cbSize
    .field public unsigned int32 dwBandwidth
    .field public unsigned int32 cPacketsReceived
    .field public unsigned int32 cPacketsRecovered
    .field public unsigned int32 cPacketsLost
    .field public unsigned int16 wQuality
  } // end of class _WMReaderStatistics

  .class public sequential ansi sealed beforefieldinit _WMReaderClientInfo
         extends [mscorlib]System.ValueType
  {
    .pack 8
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 cbSize
    .field public native int wszLang
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public native int wszBrowserUserAgent
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public native int wszBrowserWebPage
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int64 qwReserved
    .field public native int pReserved
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 19 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                            64 57 4D 2E 4C 4F 4E 47 5F 50 54 52 00 00 )       // dWM.LONG_PTR..
    .field public native int wszHostExe
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int64 qwHostVersion
    .field public native int wszPlayerUserAgent
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
  } // end of class _WMReaderClientInfo

  .class interface public abstract auto ansi import IWMReaderAdvanced2
         implements UW.CSE.ManagedWM.IWMReaderAdvanced
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 41 45 31 34 41 39 34 35 2D 42 39 30 43   // ..$AE14A945-B90C
                                                                                                    2D 34 44 30 44 2D 39 31 32 37 2D 38 30 44 36 36   // -4D0D-9127-80D66
                                                                                                    35 46 37 44 37 33 45 00 00 )                      // 5F7D73E..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetUserProvidedClock([in] int32 fUserClock) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::SetUserProvidedClock

    .method public hidebysig newslot virtual abstract 
            instance void  GetUserProvidedClock([out] int32& pfUserClock) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetUserProvidedClock

    .method public hidebysig newslot virtual abstract 
            instance void  DeliverTime([in] unsigned int64 cnsTime) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::DeliverTime

    .method public hidebysig newslot virtual abstract 
            instance void  SetManualStreamSelection([in] int32 fSelection) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::SetManualStreamSelection

    .method public hidebysig newslot virtual abstract 
            instance void  GetManualStreamSelection([out] int32& pfSelection) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetManualStreamSelection

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamsSelected([in] unsigned int16 cStreamCount,
                                              [in] unsigned int16& pwStreamNumbers,
                                              [in] valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION& pSelections) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::SetStreamsSelected

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamSelected([in] unsigned int16 wStreamNum,
                                             [out] valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION& pSelection) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetStreamSelected

    .method public hidebysig newslot virtual abstract 
            instance void  SetReceiveSelectionCallbacks([in] int32 fGetCallbacks) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::SetReceiveSelectionCallbacks

    .method public hidebysig newslot virtual abstract 
            instance void  GetReceiveSelectionCallbacks([out] int32& pfGetCallbacks) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetReceiveSelectionCallbacks

    .method public hidebysig newslot virtual abstract 
            instance void  SetReceiveStreamSamples([in] unsigned int16 wStreamNum,
                                                   [in] int32 fReceiveStreamSamples) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::SetReceiveStreamSamples

    .method public hidebysig newslot virtual abstract 
            instance void  GetReceiveStreamSamples([in] unsigned int16 wStreamNum,
                                                   [out] int32& pfReceiveStreamSamples) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetReceiveStreamSamples

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllocateForOutput([in] unsigned int32 dwOutputNum,
                                                [in] int32 fAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::SetAllocateForOutput

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocateForOutput([in] unsigned int32 dwOutputNum,
                                                [out] int32& pfAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetAllocateForOutput

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllocateForStream([in] unsigned int16 wStreamNum,
                                                [in] int32 fAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::SetAllocateForStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocateForStream([in] unsigned int16 dwSreamNum,
                                                [out] int32& pfAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetAllocateForStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetStatistics([in][out] valuetype UW.CSE.ManagedWM._WMReaderStatistics& pStatistics) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetStatistics

    .method public hidebysig newslot virtual abstract 
            instance void  SetClientInfo([in] valuetype UW.CSE.ManagedWM._WMReaderClientInfo& pClientInfo) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::SetClientInfo

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxOutputSampleSize([in] unsigned int32 dwOutput,
                                                  [out] unsigned int32& pcbMax) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetMaxOutputSampleSize

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxStreamSampleSize([in] unsigned int16 wStream,
                                                  [out] unsigned int32& pcbMax) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetMaxStreamSampleSize

    .method public hidebysig newslot virtual abstract 
            instance void  NotifyLateDelivery(unsigned int64 cnsLateness) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::NotifyLateDelivery

    .method public hidebysig newslot virtual abstract 
            instance void  SetPlayMode([in] valuetype UW.CSE.ManagedWM.WMT_PLAY_MODE Mode) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::SetPlayMode

    .method public hidebysig newslot virtual abstract 
            instance void  GetPlayMode([out] valuetype UW.CSE.ManagedWM.WMT_PLAY_MODE& pMode) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetPlayMode

    .method public hidebysig newslot virtual abstract 
            instance void  GetBufferProgress([out] unsigned int32& pdwPercent,
                                             [out] unsigned int64& pcnsBuffering) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetBufferProgress

    .method public hidebysig newslot virtual abstract 
            instance void  GetDownloadProgress([out] unsigned int32& pdwPercent,
                                               [out] unsigned int64& pqwBytesDownloaded,
                                               [out] unsigned int64& pcnsDownload) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetDownloadProgress

    .method public hidebysig newslot virtual abstract 
            instance void  GetSaveAsProgress([out] unsigned int32& pdwPercent) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetSaveAsProgress

    .method public hidebysig newslot virtual abstract 
            instance void  SaveFileAs([in] unsigned int16& pwszFilename) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::SaveFileAs

    .method public hidebysig newslot virtual abstract 
            instance void  GetProtocolName([out] unsigned int16& pwszProtocol,
                                           [in][out] unsigned int32& pcchProtocol) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetProtocolName

    .method public hidebysig newslot virtual abstract 
            instance void  StartAtMarker([in] unsigned int16 wMarkerIndex,
                                         [in] unsigned int64 cnsDuration,
                                         [in] float32 fRate,
                                         [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::StartAtMarker

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputSetting([in] unsigned int32 dwOutputNum,
                                            [in] string  marshal( lpwstr) pszName,
                                            [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                            [out] unsigned int8& pValue,
                                            [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetOutputSetting

    .method public hidebysig newslot virtual abstract 
            instance void  SetOutputSetting([in] unsigned int32 dwOutputNum,
                                            [in] string  marshal( lpwstr) pszName,
                                            [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                            [in] unsigned int8& pValue,
                                            [in] unsigned int16 cbLength) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::SetOutputSetting

    .method public hidebysig newslot virtual abstract 
            instance void  Preroll([in] unsigned int64 cnsStart,
                                   [in] unsigned int64 cnsDuration,
                                   [in] float32 fRate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::Preroll

    .method public hidebysig newslot virtual abstract 
            instance void  SetLogClientID([in] int32 fLogClientID) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::SetLogClientID

    .method public hidebysig newslot virtual abstract 
            instance void  GetLogClientID([out] int32& pfLogClientID) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::GetLogClientID

    .method public hidebysig newslot virtual abstract 
            instance void  StopBuffering() runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::StopBuffering

    .method public hidebysig newslot virtual abstract 
            instance void  OpenStream([in] class UW.CSE.ManagedWM.IStream  marshal( interface) pStream,
                                      [in] class UW.CSE.ManagedWM.IWMReaderCallback  marshal( interface) pCallback,
                                      [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced2::OpenStream

  } // end of class IWMReaderAdvanced2

  .class public auto ansi sealed WMT_PLAY_MODE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_PLAY_MODE WMT_PLAY_MODE_AUTOSELECT = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_PLAY_MODE WMT_PLAY_MODE_LOCAL = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_PLAY_MODE WMT_PLAY_MODE_DOWNLOAD = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_PLAY_MODE WMT_PLAY_MODE_STREAMING = int32(0x00000003)
  } // end of class WMT_PLAY_MODE

  .class interface public abstract auto ansi import IStream
         implements UW.CSE.ManagedWM.ISequentialStream
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 30 30 30 30 30 30 43 2D 30 30 30 30   // ..$0000000C-0000
                                                                                                    2D 30 30 30 30 2D 43 30 30 30 2D 30 30 30 30 30   // -0000-C000-00000
                                                                                                    30 30 30 30 30 34 36 00 00 )                      // 0000046..
    .method public hidebysig newslot virtual abstract 
            instance void  RemoteRead([out] unsigned int8& pv,
                                      [in] unsigned int32 cb,
                                      [out] unsigned int32& pcbRead) runtime managed internalcall
    {
    } // end of method IStream::RemoteRead

    .method public hidebysig newslot virtual abstract 
            instance void  RemoteWrite([in] unsigned int8& pv,
                                       [in] unsigned int32 cb,
                                       [out] unsigned int32& pcbWritten) runtime managed internalcall
    {
    } // end of method IStream::RemoteWrite

    .method public hidebysig newslot virtual abstract 
            instance void  RemoteSeek([in] valuetype UW.CSE.ManagedWM._LARGE_INTEGER dlibMove,
                                      [in] unsigned int32 dwOrigin,
                                      [out] valuetype UW.CSE.ManagedWM._ULARGE_INTEGER& plibNewPosition) runtime managed internalcall
    {
    } // end of method IStream::RemoteSeek

    .method public hidebysig newslot virtual abstract 
            instance void  SetSize([in] valuetype UW.CSE.ManagedWM._ULARGE_INTEGER libNewSize) runtime managed internalcall
    {
    } // end of method IStream::SetSize

    .method public hidebysig newslot virtual abstract 
            instance void  RemoteCopyTo([in] class UW.CSE.ManagedWM.IStream  marshal( interface) pstm,
                                        [in] valuetype UW.CSE.ManagedWM._ULARGE_INTEGER cb,
                                        [out] valuetype UW.CSE.ManagedWM._ULARGE_INTEGER& pcbRead,
                                        [out] valuetype UW.CSE.ManagedWM._ULARGE_INTEGER& pcbWritten) runtime managed internalcall
    {
    } // end of method IStream::RemoteCopyTo

    .method public hidebysig newslot virtual abstract 
            instance void  Commit([in] unsigned int32 grfCommitFlags) runtime managed internalcall
    {
    } // end of method IStream::Commit

    .method public hidebysig newslot virtual abstract 
            instance void  Revert() runtime managed internalcall
    {
    } // end of method IStream::Revert

    .method public hidebysig newslot virtual abstract 
            instance void  LockRegion([in] valuetype UW.CSE.ManagedWM._ULARGE_INTEGER libOffset,
                                      [in] valuetype UW.CSE.ManagedWM._ULARGE_INTEGER cb,
                                      [in] unsigned int32 dwLockType) runtime managed internalcall
    {
    } // end of method IStream::LockRegion

    .method public hidebysig newslot virtual abstract 
            instance void  UnlockRegion([in] valuetype UW.CSE.ManagedWM._ULARGE_INTEGER libOffset,
                                        [in] valuetype UW.CSE.ManagedWM._ULARGE_INTEGER cb,
                                        [in] unsigned int32 dwLockType) runtime managed internalcall
    {
    } // end of method IStream::UnlockRegion

    .method public hidebysig newslot virtual abstract 
            instance void  Stat([out] valuetype UW.CSE.ManagedWM.tagSTATSTG& pstatstg,
                                [in] unsigned int32 grfStatFlag) runtime managed internalcall
    {
    } // end of method IStream::Stat

    .method public hidebysig newslot virtual abstract 
            instance void  Clone([out] class UW.CSE.ManagedWM.IStream&  marshal( interface) ppstm) runtime managed internalcall
    {
    } // end of method IStream::Clone

  } // end of class IStream

  .class interface public abstract auto ansi import ISequentialStream
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 43 37 33 33 41 33 30 2D 32 41 31 43   // ..$0C733A30-2A1C
                                                                                                    2D 31 31 43 45 2D 41 44 45 35 2D 30 30 41 41 30   // -11CE-ADE5-00AA0
                                                                                                    30 34 34 37 37 33 44 00 00 )                      // 044773D..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  RemoteRead([out] unsigned int8& pv,
                                      [in] unsigned int32 cb,
                                      [out] unsigned int32& pcbRead) runtime managed internalcall
    {
    } // end of method ISequentialStream::RemoteRead

    .method public hidebysig newslot virtual abstract 
            instance void  RemoteWrite([in] unsigned int8& pv,
                                       [in] unsigned int32 cb,
                                       [out] unsigned int32& pcbWritten) runtime managed internalcall
    {
    } // end of method ISequentialStream::RemoteWrite

  } // end of class ISequentialStream

  .class public sequential ansi sealed beforefieldinit _LARGE_INTEGER
         extends [mscorlib]System.ValueType
  {
    .pack 8
    .size 0
    .field public int64 QuadPart
  } // end of class _LARGE_INTEGER

  .class public sequential ansi sealed beforefieldinit _ULARGE_INTEGER
         extends [mscorlib]System.ValueType
  {
    .pack 8
    .size 0
    .field public unsigned int64 QuadPart
  } // end of class _ULARGE_INTEGER

  .class public sequential ansi sealed beforefieldinit tagSTATSTG
         extends [mscorlib]System.ValueType
  {
    .pack 8
    .size 0
    .field public  marshal( lpwstr) string pwcsName
    .field public unsigned int32 Type
    .field public valuetype UW.CSE.ManagedWM._ULARGE_INTEGER cbSize
    .field public valuetype UW.CSE.ManagedWM._FILETIME mtime
    .field public valuetype UW.CSE.ManagedWM._FILETIME ctime
    .field public valuetype UW.CSE.ManagedWM._FILETIME atime
    .field public unsigned int32 grfMode
    .field public unsigned int32 grfLocksSupported
    .field public valuetype UW.CSE.ManagedWM.GUID 'clsid'
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                            64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    .field public unsigned int32 grfStateBits
    .field public unsigned int32 reserved
  } // end of class tagSTATSTG

  .class public sequential ansi sealed beforefieldinit _FILETIME
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 dwLowDateTime
    .field public unsigned int32 dwHighDateTime
  } // end of class _FILETIME

  .class interface public abstract auto ansi import IWMReaderAdvanced3
         implements UW.CSE.ManagedWM.IWMReaderAdvanced2
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 44 43 30 36 37 34 42 2D 46 30 34 42   // ..$5DC0674B-F04B
                                                                                                    2D 34 41 34 45 2D 39 46 32 41 2D 42 31 41 46 44   // -4A4E-9F2A-B1AFD
                                                                                                    45 32 43 38 31 30 30 00 00 )                      // E2C8100..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetUserProvidedClock([in] int32 fUserClock) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::SetUserProvidedClock

    .method public hidebysig newslot virtual abstract 
            instance void  GetUserProvidedClock([out] int32& pfUserClock) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetUserProvidedClock

    .method public hidebysig newslot virtual abstract 
            instance void  DeliverTime([in] unsigned int64 cnsTime) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::DeliverTime

    .method public hidebysig newslot virtual abstract 
            instance void  SetManualStreamSelection([in] int32 fSelection) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::SetManualStreamSelection

    .method public hidebysig newslot virtual abstract 
            instance void  GetManualStreamSelection([out] int32& pfSelection) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetManualStreamSelection

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamsSelected([in] unsigned int16 cStreamCount,
                                              [in] unsigned int16& pwStreamNumbers,
                                              [in] valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION& pSelections) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::SetStreamsSelected

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamSelected([in] unsigned int16 wStreamNum,
                                             [out] valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION& pSelection) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetStreamSelected

    .method public hidebysig newslot virtual abstract 
            instance void  SetReceiveSelectionCallbacks([in] int32 fGetCallbacks) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::SetReceiveSelectionCallbacks

    .method public hidebysig newslot virtual abstract 
            instance void  GetReceiveSelectionCallbacks([out] int32& pfGetCallbacks) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetReceiveSelectionCallbacks

    .method public hidebysig newslot virtual abstract 
            instance void  SetReceiveStreamSamples([in] unsigned int16 wStreamNum,
                                                   [in] int32 fReceiveStreamSamples) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::SetReceiveStreamSamples

    .method public hidebysig newslot virtual abstract 
            instance void  GetReceiveStreamSamples([in] unsigned int16 wStreamNum,
                                                   [out] int32& pfReceiveStreamSamples) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetReceiveStreamSamples

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllocateForOutput([in] unsigned int32 dwOutputNum,
                                                [in] int32 fAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::SetAllocateForOutput

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocateForOutput([in] unsigned int32 dwOutputNum,
                                                [out] int32& pfAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetAllocateForOutput

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllocateForStream([in] unsigned int16 wStreamNum,
                                                [in] int32 fAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::SetAllocateForStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocateForStream([in] unsigned int16 dwSreamNum,
                                                [out] int32& pfAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetAllocateForStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetStatistics([in][out] valuetype UW.CSE.ManagedWM._WMReaderStatistics& pStatistics) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetStatistics

    .method public hidebysig newslot virtual abstract 
            instance void  SetClientInfo([in] valuetype UW.CSE.ManagedWM._WMReaderClientInfo& pClientInfo) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::SetClientInfo

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxOutputSampleSize([in] unsigned int32 dwOutput,
                                                  [out] unsigned int32& pcbMax) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetMaxOutputSampleSize

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxStreamSampleSize([in] unsigned int16 wStream,
                                                  [out] unsigned int32& pcbMax) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetMaxStreamSampleSize

    .method public hidebysig newslot virtual abstract 
            instance void  NotifyLateDelivery(unsigned int64 cnsLateness) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::NotifyLateDelivery

    .method public hidebysig newslot virtual abstract 
            instance void  SetPlayMode([in] valuetype UW.CSE.ManagedWM.WMT_PLAY_MODE Mode) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::SetPlayMode

    .method public hidebysig newslot virtual abstract 
            instance void  GetPlayMode([out] valuetype UW.CSE.ManagedWM.WMT_PLAY_MODE& pMode) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetPlayMode

    .method public hidebysig newslot virtual abstract 
            instance void  GetBufferProgress([out] unsigned int32& pdwPercent,
                                             [out] unsigned int64& pcnsBuffering) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetBufferProgress

    .method public hidebysig newslot virtual abstract 
            instance void  GetDownloadProgress([out] unsigned int32& pdwPercent,
                                               [out] unsigned int64& pqwBytesDownloaded,
                                               [out] unsigned int64& pcnsDownload) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetDownloadProgress

    .method public hidebysig newslot virtual abstract 
            instance void  GetSaveAsProgress([out] unsigned int32& pdwPercent) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetSaveAsProgress

    .method public hidebysig newslot virtual abstract 
            instance void  SaveFileAs([in] unsigned int16& pwszFilename) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::SaveFileAs

    .method public hidebysig newslot virtual abstract 
            instance void  GetProtocolName([out] unsigned int16& pwszProtocol,
                                           [in][out] unsigned int32& pcchProtocol) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetProtocolName

    .method public hidebysig newslot virtual abstract 
            instance void  StartAtMarker([in] unsigned int16 wMarkerIndex,
                                         [in] unsigned int64 cnsDuration,
                                         [in] float32 fRate,
                                         [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::StartAtMarker

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputSetting([in] unsigned int32 dwOutputNum,
                                            [in] string  marshal( lpwstr) pszName,
                                            [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                            [out] unsigned int8& pValue,
                                            [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetOutputSetting

    .method public hidebysig newslot virtual abstract 
            instance void  SetOutputSetting([in] unsigned int32 dwOutputNum,
                                            [in] string  marshal( lpwstr) pszName,
                                            [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                            [in] unsigned int8& pValue,
                                            [in] unsigned int16 cbLength) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::SetOutputSetting

    .method public hidebysig newslot virtual abstract 
            instance void  Preroll([in] unsigned int64 cnsStart,
                                   [in] unsigned int64 cnsDuration,
                                   [in] float32 fRate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::Preroll

    .method public hidebysig newslot virtual abstract 
            instance void  SetLogClientID([in] int32 fLogClientID) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::SetLogClientID

    .method public hidebysig newslot virtual abstract 
            instance void  GetLogClientID([out] int32& pfLogClientID) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::GetLogClientID

    .method public hidebysig newslot virtual abstract 
            instance void  StopBuffering() runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::StopBuffering

    .method public hidebysig newslot virtual abstract 
            instance void  OpenStream([in] class UW.CSE.ManagedWM.IStream  marshal( interface) pStream,
                                      [in] class UW.CSE.ManagedWM.IWMReaderCallback  marshal( interface) pCallback,
                                      [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::OpenStream

    .method public hidebysig newslot virtual abstract 
            instance void  StopNetStreaming() runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::StopNetStreaming

    .method public hidebysig newslot virtual abstract 
            instance void  StartAtPosition([in] unsigned int16 wStreamNum,
                                           [in] native int pvOffsetStart,
                                           [in] native int pvDuration,
                                           [in] valuetype UW.CSE.ManagedWM.tagWMT_OFFSET_FORMAT dwOffsetFormat,
                                           [in] float32 fRate,
                                           [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced3::StartAtPosition

  } // end of class IWMReaderAdvanced3

  .class public auto ansi sealed tagWMT_OFFSET_FORMAT
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_OFFSET_FORMAT WMT_OFFSET_FORMAT_100NS = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_OFFSET_FORMAT WMT_OFFSET_FORMAT_FRAME_NUMBERS = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_OFFSET_FORMAT WMT_OFFSET_FORMAT_PLAYLIST_OFFSET = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_OFFSET_FORMAT WMT_OFFSET_FORMAT_TIMECODE = int32(0x00000003)
  } // end of class tagWMT_OFFSET_FORMAT

  .class interface public abstract auto ansi import IWMReaderAdvanced4
         implements UW.CSE.ManagedWM.IWMReaderAdvanced3
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 34 35 41 37 36 41 32 2D 31 32 41 45   // ..$945A76A2-12AE
                                                                                                    2D 34 44 34 38 2D 42 44 33 43 2D 43 44 31 44 39   // -4D48-BD3C-CD1D9
                                                                                                    30 33 39 39 42 38 35 00 00 )                      // 0399B85..
    .method public hidebysig newslot virtual abstract 
            instance void  SetUserProvidedClock([in] int32 fUserClock) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::SetUserProvidedClock

    .method public hidebysig newslot virtual abstract 
            instance void  GetUserProvidedClock([out] int32& pfUserClock) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetUserProvidedClock

    .method public hidebysig newslot virtual abstract 
            instance void  DeliverTime([in] unsigned int64 cnsTime) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::DeliverTime

    .method public hidebysig newslot virtual abstract 
            instance void  SetManualStreamSelection([in] int32 fSelection) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::SetManualStreamSelection

    .method public hidebysig newslot virtual abstract 
            instance void  GetManualStreamSelection([out] int32& pfSelection) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetManualStreamSelection

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamsSelected([in] unsigned int16 cStreamCount,
                                              [in] unsigned int16& pwStreamNumbers,
                                              [in] valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION& pSelections) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::SetStreamsSelected

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamSelected([in] unsigned int16 wStreamNum,
                                             [out] valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION& pSelection) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetStreamSelected

    .method public hidebysig newslot virtual abstract 
            instance void  SetReceiveSelectionCallbacks([in] int32 fGetCallbacks) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::SetReceiveSelectionCallbacks

    .method public hidebysig newslot virtual abstract 
            instance void  GetReceiveSelectionCallbacks([out] int32& pfGetCallbacks) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetReceiveSelectionCallbacks

    .method public hidebysig newslot virtual abstract 
            instance void  SetReceiveStreamSamples([in] unsigned int16 wStreamNum,
                                                   [in] int32 fReceiveStreamSamples) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::SetReceiveStreamSamples

    .method public hidebysig newslot virtual abstract 
            instance void  GetReceiveStreamSamples([in] unsigned int16 wStreamNum,
                                                   [out] int32& pfReceiveStreamSamples) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetReceiveStreamSamples

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllocateForOutput([in] unsigned int32 dwOutputNum,
                                                [in] int32 fAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::SetAllocateForOutput

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocateForOutput([in] unsigned int32 dwOutputNum,
                                                [out] int32& pfAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetAllocateForOutput

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllocateForStream([in] unsigned int16 wStreamNum,
                                                [in] int32 fAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::SetAllocateForStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocateForStream([in] unsigned int16 dwSreamNum,
                                                [out] int32& pfAllocate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetAllocateForStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetStatistics([in][out] valuetype UW.CSE.ManagedWM._WMReaderStatistics& pStatistics) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetStatistics

    .method public hidebysig newslot virtual abstract 
            instance void  SetClientInfo([in] valuetype UW.CSE.ManagedWM._WMReaderClientInfo& pClientInfo) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::SetClientInfo

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxOutputSampleSize([in] unsigned int32 dwOutput,
                                                  [out] unsigned int32& pcbMax) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetMaxOutputSampleSize

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxStreamSampleSize([in] unsigned int16 wStream,
                                                  [out] unsigned int32& pcbMax) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetMaxStreamSampleSize

    .method public hidebysig newslot virtual abstract 
            instance void  NotifyLateDelivery(unsigned int64 cnsLateness) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::NotifyLateDelivery

    .method public hidebysig newslot virtual abstract 
            instance void  SetPlayMode([in] valuetype UW.CSE.ManagedWM.WMT_PLAY_MODE Mode) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::SetPlayMode

    .method public hidebysig newslot virtual abstract 
            instance void  GetPlayMode([out] valuetype UW.CSE.ManagedWM.WMT_PLAY_MODE& pMode) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetPlayMode

    .method public hidebysig newslot virtual abstract 
            instance void  GetBufferProgress([out] unsigned int32& pdwPercent,
                                             [out] unsigned int64& pcnsBuffering) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetBufferProgress

    .method public hidebysig newslot virtual abstract 
            instance void  GetDownloadProgress([out] unsigned int32& pdwPercent,
                                               [out] unsigned int64& pqwBytesDownloaded,
                                               [out] unsigned int64& pcnsDownload) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetDownloadProgress

    .method public hidebysig newslot virtual abstract 
            instance void  GetSaveAsProgress([out] unsigned int32& pdwPercent) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetSaveAsProgress

    .method public hidebysig newslot virtual abstract 
            instance void  SaveFileAs([in] unsigned int16& pwszFilename) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::SaveFileAs

    .method public hidebysig newslot virtual abstract 
            instance void  GetProtocolName([out] unsigned int16& pwszProtocol,
                                           [in][out] unsigned int32& pcchProtocol) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetProtocolName

    .method public hidebysig newslot virtual abstract 
            instance void  StartAtMarker([in] unsigned int16 wMarkerIndex,
                                         [in] unsigned int64 cnsDuration,
                                         [in] float32 fRate,
                                         [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::StartAtMarker

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputSetting([in] unsigned int32 dwOutputNum,
                                            [in] string  marshal( lpwstr) pszName,
                                            [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                            [out] unsigned int8& pValue,
                                            [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetOutputSetting

    .method public hidebysig newslot virtual abstract 
            instance void  SetOutputSetting([in] unsigned int32 dwOutputNum,
                                            [in] string  marshal( lpwstr) pszName,
                                            [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                            [in] unsigned int8& pValue,
                                            [in] unsigned int16 cbLength) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::SetOutputSetting

    .method public hidebysig newslot virtual abstract 
            instance void  Preroll([in] unsigned int64 cnsStart,
                                   [in] unsigned int64 cnsDuration,
                                   [in] float32 fRate) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::Preroll

    .method public hidebysig newslot virtual abstract 
            instance void  SetLogClientID([in] int32 fLogClientID) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::SetLogClientID

    .method public hidebysig newslot virtual abstract 
            instance void  GetLogClientID([out] int32& pfLogClientID) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetLogClientID

    .method public hidebysig newslot virtual abstract 
            instance void  StopBuffering() runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::StopBuffering

    .method public hidebysig newslot virtual abstract 
            instance void  OpenStream([in] class UW.CSE.ManagedWM.IStream  marshal( interface) pStream,
                                      [in] class UW.CSE.ManagedWM.IWMReaderCallback  marshal( interface) pCallback,
                                      [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::OpenStream

    .method public hidebysig newslot virtual abstract 
            instance void  StopNetStreaming() runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::StopNetStreaming

    .method public hidebysig newslot virtual abstract 
            instance void  StartAtPosition([in] unsigned int16 wStreamNum,
                                           [in] native int pvOffsetStart,
                                           [in] native int pvDuration,
                                           [in] valuetype UW.CSE.ManagedWM.tagWMT_OFFSET_FORMAT dwOffsetFormat,
                                           [in] float32 fRate,
                                           [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::StartAtPosition

    .method public hidebysig newslot virtual abstract 
            instance void  GetLanguageCount([in] unsigned int32 dwOutputNum,
                                            [out] unsigned int16& pwLanguageCount) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetLanguageCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetLanguage([in] unsigned int32 dwOutputNum,
                                       [in] unsigned int16 wLanguage,
                                       [out] unsigned int16& pwszLanguageString,
                                       [in][out] unsigned int16& pcchLanguageStringLength) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetLanguage

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxSpeedFactor([out] float64& pdblFactor) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetMaxSpeedFactor

    .method public hidebysig newslot virtual abstract 
            instance void  IsUsingFastCache([out] int32& pfUsingFastCache) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::IsUsingFastCache

    .method public hidebysig newslot virtual abstract 
            instance void  AddLogParam([in] string  marshal( lpwstr) wszNameSpace,
                                       [in] string  marshal( lpwstr) wszName,
                                       [in] string  marshal( lpwstr) wszValue) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::AddLogParam

    .method public hidebysig newslot virtual abstract 
            instance void  SendLogParams() runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::SendLogParams

    .method public hidebysig newslot virtual abstract 
            instance void  CanSaveFileAs([out] int32& pfCanSave) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::CanSaveFileAs

    .method public hidebysig newslot virtual abstract 
            instance void  CancelSaveFileAs() runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::CancelSaveFileAs

    .method public hidebysig newslot virtual abstract 
            instance void  GetURL([out] unsigned int16& pwszURL,
                                  [in][out] unsigned int32& pcchURL) runtime managed internalcall
    {
    } // end of method IWMReaderAdvanced4::GetURL

  } // end of class IWMReaderAdvanced4

  .class interface public abstract auto ansi import IWMReaderCallbackAdvanced
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 45 42 2D 32 42 32 42   // ..$96406BEB-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  OnStreamSample([in] unsigned int16 wStreamNum,
                                          [in] unsigned int64 cnsSampleTime,
                                          [in] unsigned int64 cnsSampleDuration,
                                          [in] unsigned int32 dwFlags,
                                          [in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pSample,
                                          [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderCallbackAdvanced::OnStreamSample

    .method public hidebysig newslot virtual abstract 
            instance void  OnTime([in] unsigned int64 cnsCurrentTime,
                                  [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderCallbackAdvanced::OnTime

    .method public hidebysig newslot virtual abstract 
            instance void  OnStreamSelection([in] unsigned int16 wStreamCount,
                                             [in] unsigned int16& pStreamNumbers,
                                             [in] valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION& pSelections,
                                             [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderCallbackAdvanced::OnStreamSelection

    .method public hidebysig newslot virtual abstract 
            instance void  OnOutputPropsChanged([in] unsigned int32 dwOutputNum,
                                                [in] valuetype UW.CSE.ManagedWM._WMMediaType& pMediaType,
                                                [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderCallbackAdvanced::OnOutputPropsChanged

    .method public hidebysig newslot virtual abstract 
            instance void  AllocateForStream([in] unsigned int16 wStreamNum,
                                             [in] unsigned int32 cbBuffer,
                                             [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppBuffer,
                                             [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderCallbackAdvanced::AllocateForStream

    .method public hidebysig newslot virtual abstract 
            instance void  AllocateForOutput([in] unsigned int32 dwOutputNum,
                                             [in] unsigned int32 cbBuffer,
                                             [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppBuffer,
                                             [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderCallbackAdvanced::AllocateForOutput

  } // end of class IWMReaderCallbackAdvanced

  .class interface public abstract auto ansi import IWMDRMReader
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 32 38 32 37 35 34 30 2D 33 45 45 37   // ..$D2827540-3EE7
                                                                                                    2D 34 33 32 43 2D 42 31 34 43 2D 44 43 31 37 46   // -432C-B14C-DC17F
                                                                                                    30 38 35 44 33 42 33 00 00 )                      // 085D3B3..
    .method public hidebysig newslot virtual abstract 
            instance void  AcquireLicense([in] unsigned int32 dwFlags) runtime managed internalcall
    {
    } // end of method IWMDRMReader::AcquireLicense

    .method public hidebysig newslot virtual abstract 
            instance void  CancelLicenseAcquisition() runtime managed internalcall
    {
    } // end of method IWMDRMReader::CancelLicenseAcquisition

    .method public hidebysig newslot virtual abstract 
            instance void  Individualize([in] unsigned int32 dwFlags) runtime managed internalcall
    {
    } // end of method IWMDRMReader::Individualize

    .method public hidebysig newslot virtual abstract 
            instance void  CancelIndividualization() runtime managed internalcall
    {
    } // end of method IWMDRMReader::CancelIndividualization

    .method public hidebysig newslot virtual abstract 
            instance void  MonitorLicenseAcquisition() runtime managed internalcall
    {
    } // end of method IWMDRMReader::MonitorLicenseAcquisition

    .method public hidebysig newslot virtual abstract 
            instance void  CancelMonitorLicenseAcquisition() runtime managed internalcall
    {
    } // end of method IWMDRMReader::CancelMonitorLicenseAcquisition

    .method public hidebysig newslot virtual abstract 
            instance void  SetDRMProperty([in] string  marshal( lpwstr) pwstrName,
                                          [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE dwType,
                                          [in] unsigned int8& pValue,
                                          [in] unsigned int16 cbLength) runtime managed internalcall
    {
    } // end of method IWMDRMReader::SetDRMProperty

    .method public hidebysig newslot virtual abstract 
            instance void  GetDRMProperty([in] string  marshal( lpwstr) pwstrName,
                                          [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pdwType,
                                          [out] unsigned int8& pValue,
                                          [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMDRMReader::GetDRMProperty

  } // end of class IWMDRMReader

  .class interface public abstract auto ansi import IWMReaderAllocatorEx
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 46 37 36 32 46 41 37 2D 41 32 32 45   // ..$9F762FA7-A22E
                                                                                                    2D 34 32 38 44 2D 39 33 43 39 2D 41 43 38 32 46   // -428D-93C9-AC82F
                                                                                                    33 41 41 46 45 35 41 00 00 )                      // 3AAFE5A..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  AllocateForStreamEx([in] unsigned int16 wStreamNum,
                                               [in] unsigned int32 cbBuffer,
                                               [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppBuffer,
                                               [in] unsigned int32 dwFlags,
                                               [in] unsigned int64 cnsSampleTime,
                                               [in] unsigned int64 cnsSampleDuration,
                                               [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderAllocatorEx::AllocateForStreamEx

    .method public hidebysig newslot virtual abstract 
            instance void  AllocateForOutputEx([in] unsigned int32 dwOutputNum,
                                               [in] unsigned int32 cbBuffer,
                                               [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppBuffer,
                                               [in] unsigned int32 dwFlags,
                                               [in] unsigned int64 cnsSampleTime,
                                               [in] unsigned int64 cnsSampleDuration,
                                               [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMReaderAllocatorEx::AllocateForOutputEx

  } // end of class IWMReaderAllocatorEx

  .class interface public abstract auto ansi import IWMReaderNetworkConfig
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 45 43 2D 32 42 32 42   // ..$96406BEC-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .method public hidebysig newslot virtual abstract 
            instance void  GetBufferingTime([out] unsigned int64& pcnsBufferingTime) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetBufferingTime

    .method public hidebysig newslot virtual abstract 
            instance void  SetBufferingTime([in] unsigned int64 cnsBufferingTime) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::SetBufferingTime

    .method public hidebysig newslot virtual abstract 
            instance void  GetUDPPortRanges([out] valuetype UW.CSE.ManagedWM._WMPortNumberRange& pRangeArray,
                                            [in][out] unsigned int32& pcRanges) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetUDPPortRanges

    .method public hidebysig newslot virtual abstract 
            instance void  SetUDPPortRanges([in] valuetype UW.CSE.ManagedWM._WMPortNumberRange& pRangeArray,
                                            [in] unsigned int32 cRanges) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::SetUDPPortRanges

    .method public hidebysig newslot virtual abstract 
            instance void  GetProxySettings([in] string  marshal( lpwstr) pwszProtocol,
                                            [out] valuetype UW.CSE.ManagedWM.WMT_PROXY_SETTINGS& pProxySetting) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetProxySettings

    .method public hidebysig newslot virtual abstract 
            instance void  SetProxySettings([in] string  marshal( lpwstr) pwszProtocol,
                                            [in] valuetype UW.CSE.ManagedWM.WMT_PROXY_SETTINGS ProxySetting) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::SetProxySettings

    .method public hidebysig newslot virtual abstract 
            instance void  GetProxyHostName([in] string  marshal( lpwstr) pwszProtocol,
                                            [out] unsigned int16& pwszHostName,
                                            [in][out] unsigned int32& pcchHostName) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetProxyHostName

    .method public hidebysig newslot virtual abstract 
            instance void  SetProxyHostName([in] string  marshal( lpwstr) pwszProtocol,
                                            [in] string  marshal( lpwstr) pwszHostName) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::SetProxyHostName

    .method public hidebysig newslot virtual abstract 
            instance void  GetProxyPort([in] string  marshal( lpwstr) pwszProtocol,
                                        [out] unsigned int32& pdwPort) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetProxyPort

    .method public hidebysig newslot virtual abstract 
            instance void  SetProxyPort([in] string  marshal( lpwstr) pwszProtocol,
                                        [in] unsigned int32 dwPort) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::SetProxyPort

    .method public hidebysig newslot virtual abstract 
            instance void  GetProxyExceptionList([in] string  marshal( lpwstr) pwszProtocol,
                                                 [out] unsigned int16& pwszExceptionList,
                                                 [in][out] unsigned int32& pcchExceptionList) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetProxyExceptionList

    .method public hidebysig newslot virtual abstract 
            instance void  SetProxyExceptionList([in] string  marshal( lpwstr) pwszProtocol,
                                                 [in] string  marshal( lpwstr) pwszExceptionList) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::SetProxyExceptionList

    .method public hidebysig newslot virtual abstract 
            instance void  GetProxyBypassForLocal([in] string  marshal( lpwstr) pwszProtocol,
                                                  [out] int32& pfBypassForLocal) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetProxyBypassForLocal

    .method public hidebysig newslot virtual abstract 
            instance void  SetProxyBypassForLocal([in] string  marshal( lpwstr) pwszProtocol,
                                                  [in] int32 fBypassForLocal) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::SetProxyBypassForLocal

    .method public hidebysig newslot virtual abstract 
            instance void  GetForceRerunAutoProxyDetection([out] int32& pfForceRerunDetection) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetForceRerunAutoProxyDetection

    .method public hidebysig newslot virtual abstract 
            instance void  SetForceRerunAutoProxyDetection([in] int32 fForceRerunDetection) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::SetForceRerunAutoProxyDetection

    .method public hidebysig newslot virtual abstract 
            instance void  GetEnableMulticast([out] int32& pfEnableMulticast) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetEnableMulticast

    .method public hidebysig newslot virtual abstract 
            instance void  SetEnableMulticast([in] int32 fEnableMulticast) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::SetEnableMulticast

    .method public hidebysig newslot virtual abstract 
            instance void  GetEnableHTTP([out] int32& pfEnableHTTP) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetEnableHTTP

    .method public hidebysig newslot virtual abstract 
            instance void  SetEnableHTTP([in] int32 fEnableHTTP) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::SetEnableHTTP

    .method public hidebysig newslot virtual abstract 
            instance void  GetEnableUDP([out] int32& pfEnableUDP) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetEnableUDP

    .method public hidebysig newslot virtual abstract 
            instance void  SetEnableUDP([in] int32 fEnableUDP) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::SetEnableUDP

    .method public hidebysig newslot virtual abstract 
            instance void  GetEnableTCP([out] int32& pfEnableTCP) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetEnableTCP

    .method public hidebysig newslot virtual abstract 
            instance void  SetEnableTCP([in] int32 fEnableTCP) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::SetEnableTCP

    .method public hidebysig newslot virtual abstract 
            instance void  ResetProtocolRollover() runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::ResetProtocolRollover

    .method public hidebysig newslot virtual abstract 
            instance void  GetConnectionBandwidth([out] unsigned int32& pdwConnectionBandwidth) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetConnectionBandwidth

    .method public hidebysig newslot virtual abstract 
            instance void  SetConnectionBandwidth([in] unsigned int32 dwConnectionBandwidth) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::SetConnectionBandwidth

    .method public hidebysig newslot virtual abstract 
            instance void  GetNumProtocolsSupported([out] unsigned int32& pcProtocols) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetNumProtocolsSupported

    .method public hidebysig newslot virtual abstract 
            instance void  GetSupportedProtocolName([in] unsigned int32 dwProtocolNum,
                                                    [out] unsigned int16& pwszProtocolName,
                                                    [in][out] unsigned int32& pcchProtocolName) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetSupportedProtocolName

    .method public hidebysig newslot virtual abstract 
            instance void  AddLoggingUrl([in] string  marshal( lpwstr) pwszURL) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::AddLoggingUrl

    .method public hidebysig newslot virtual abstract 
            instance void  GetLoggingUrl([in] unsigned int32 dwIndex,
                                         [out] string  marshal( lpwstr) pwszURL,
                                         [in][out] unsigned int32& pcchURL) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetLoggingUrl

    .method public hidebysig newslot virtual abstract 
            instance void  GetLoggingUrlCount([out] unsigned int32& pdwUrlCount) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::GetLoggingUrlCount

    .method public hidebysig newslot virtual abstract 
            instance void  ResetLoggingUrlList() runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig::ResetLoggingUrlList

  } // end of class IWMReaderNetworkConfig

  .class public sequential ansi sealed beforefieldinit _WMPortNumberRange
         extends [mscorlib]System.ValueType
  {
    .pack 2
    .size 0
    .field public unsigned int16 wPortBegin
    .field public unsigned int16 wPortEnd
  } // end of class _WMPortNumberRange

  .class public auto ansi sealed WMT_PROXY_SETTINGS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_PROXY_SETTINGS WMT_PROXY_SETTING_NONE = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_PROXY_SETTINGS WMT_PROXY_SETTING_MANUAL = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_PROXY_SETTINGS WMT_PROXY_SETTING_AUTO = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_PROXY_SETTINGS WMT_PROXY_SETTING_BROWSER = int32(0x00000003)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_PROXY_SETTINGS WMT_PROXY_SETTING_MAX = int32(0x00000004)
  } // end of class WMT_PROXY_SETTINGS

  .class interface public abstract auto ansi import IWMReaderNetworkConfig2
         implements UW.CSE.ManagedWM.IWMReaderNetworkConfig
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 39 37 39 41 38 35 33 2D 30 34 32 42   // ..$D979A853-042B
                                                                                                    2D 34 30 35 30 2D 38 33 38 37 2D 43 39 33 39 44   // -4050-8387-C939D
                                                                                                    42 32 32 30 31 33 46 00 00 )                      // B22013F..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetBufferingTime([out] unsigned int64& pcnsBufferingTime) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetBufferingTime

    .method public hidebysig newslot virtual abstract 
            instance void  SetBufferingTime([in] unsigned int64 cnsBufferingTime) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetBufferingTime

    .method public hidebysig newslot virtual abstract 
            instance void  GetUDPPortRanges([out] valuetype UW.CSE.ManagedWM._WMPortNumberRange& pRangeArray,
                                            [in][out] unsigned int32& pcRanges) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetUDPPortRanges

    .method public hidebysig newslot virtual abstract 
            instance void  SetUDPPortRanges([in] valuetype UW.CSE.ManagedWM._WMPortNumberRange& pRangeArray,
                                            [in] unsigned int32 cRanges) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetUDPPortRanges

    .method public hidebysig newslot virtual abstract 
            instance void  GetProxySettings([in] string  marshal( lpwstr) pwszProtocol,
                                            [out] valuetype UW.CSE.ManagedWM.WMT_PROXY_SETTINGS& pProxySetting) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetProxySettings

    .method public hidebysig newslot virtual abstract 
            instance void  SetProxySettings([in] string  marshal( lpwstr) pwszProtocol,
                                            [in] valuetype UW.CSE.ManagedWM.WMT_PROXY_SETTINGS ProxySetting) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetProxySettings

    .method public hidebysig newslot virtual abstract 
            instance void  GetProxyHostName([in] string  marshal( lpwstr) pwszProtocol,
                                            [out] unsigned int16& pwszHostName,
                                            [in][out] unsigned int32& pcchHostName) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetProxyHostName

    .method public hidebysig newslot virtual abstract 
            instance void  SetProxyHostName([in] string  marshal( lpwstr) pwszProtocol,
                                            [in] string  marshal( lpwstr) pwszHostName) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetProxyHostName

    .method public hidebysig newslot virtual abstract 
            instance void  GetProxyPort([in] string  marshal( lpwstr) pwszProtocol,
                                        [out] unsigned int32& pdwPort) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetProxyPort

    .method public hidebysig newslot virtual abstract 
            instance void  SetProxyPort([in] string  marshal( lpwstr) pwszProtocol,
                                        [in] unsigned int32 dwPort) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetProxyPort

    .method public hidebysig newslot virtual abstract 
            instance void  GetProxyExceptionList([in] string  marshal( lpwstr) pwszProtocol,
                                                 [out] unsigned int16& pwszExceptionList,
                                                 [in][out] unsigned int32& pcchExceptionList) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetProxyExceptionList

    .method public hidebysig newslot virtual abstract 
            instance void  SetProxyExceptionList([in] string  marshal( lpwstr) pwszProtocol,
                                                 [in] string  marshal( lpwstr) pwszExceptionList) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetProxyExceptionList

    .method public hidebysig newslot virtual abstract 
            instance void  GetProxyBypassForLocal([in] string  marshal( lpwstr) pwszProtocol,
                                                  [out] int32& pfBypassForLocal) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetProxyBypassForLocal

    .method public hidebysig newslot virtual abstract 
            instance void  SetProxyBypassForLocal([in] string  marshal( lpwstr) pwszProtocol,
                                                  [in] int32 fBypassForLocal) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetProxyBypassForLocal

    .method public hidebysig newslot virtual abstract 
            instance void  GetForceRerunAutoProxyDetection([out] int32& pfForceRerunDetection) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetForceRerunAutoProxyDetection

    .method public hidebysig newslot virtual abstract 
            instance void  SetForceRerunAutoProxyDetection([in] int32 fForceRerunDetection) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetForceRerunAutoProxyDetection

    .method public hidebysig newslot virtual abstract 
            instance void  GetEnableMulticast([out] int32& pfEnableMulticast) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetEnableMulticast

    .method public hidebysig newslot virtual abstract 
            instance void  SetEnableMulticast([in] int32 fEnableMulticast) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetEnableMulticast

    .method public hidebysig newslot virtual abstract 
            instance void  GetEnableHTTP([out] int32& pfEnableHTTP) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetEnableHTTP

    .method public hidebysig newslot virtual abstract 
            instance void  SetEnableHTTP([in] int32 fEnableHTTP) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetEnableHTTP

    .method public hidebysig newslot virtual abstract 
            instance void  GetEnableUDP([out] int32& pfEnableUDP) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetEnableUDP

    .method public hidebysig newslot virtual abstract 
            instance void  SetEnableUDP([in] int32 fEnableUDP) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetEnableUDP

    .method public hidebysig newslot virtual abstract 
            instance void  GetEnableTCP([out] int32& pfEnableTCP) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetEnableTCP

    .method public hidebysig newslot virtual abstract 
            instance void  SetEnableTCP([in] int32 fEnableTCP) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetEnableTCP

    .method public hidebysig newslot virtual abstract 
            instance void  ResetProtocolRollover() runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::ResetProtocolRollover

    .method public hidebysig newslot virtual abstract 
            instance void  GetConnectionBandwidth([out] unsigned int32& pdwConnectionBandwidth) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetConnectionBandwidth

    .method public hidebysig newslot virtual abstract 
            instance void  SetConnectionBandwidth([in] unsigned int32 dwConnectionBandwidth) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetConnectionBandwidth

    .method public hidebysig newslot virtual abstract 
            instance void  GetNumProtocolsSupported([out] unsigned int32& pcProtocols) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetNumProtocolsSupported

    .method public hidebysig newslot virtual abstract 
            instance void  GetSupportedProtocolName([in] unsigned int32 dwProtocolNum,
                                                    [out] unsigned int16& pwszProtocolName,
                                                    [in][out] unsigned int32& pcchProtocolName) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetSupportedProtocolName

    .method public hidebysig newslot virtual abstract 
            instance void  AddLoggingUrl([in] string  marshal( lpwstr) pwszURL) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::AddLoggingUrl

    .method public hidebysig newslot virtual abstract 
            instance void  GetLoggingUrl([in] unsigned int32 dwIndex,
                                         [out] string  marshal( lpwstr) pwszURL,
                                         [in][out] unsigned int32& pcchURL) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetLoggingUrl

    .method public hidebysig newslot virtual abstract 
            instance void  GetLoggingUrlCount([out] unsigned int32& pdwUrlCount) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetLoggingUrlCount

    .method public hidebysig newslot virtual abstract 
            instance void  ResetLoggingUrlList() runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::ResetLoggingUrlList

    .method public hidebysig newslot virtual abstract 
            instance void  GetEnableContentCaching([out] int32& pfEnableContentCaching) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetEnableContentCaching

    .method public hidebysig newslot virtual abstract 
            instance void  SetEnableContentCaching([in] int32 fEnableContentCaching) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetEnableContentCaching

    .method public hidebysig newslot virtual abstract 
            instance void  GetEnableFastCache([out] int32& pfEnableFastCache) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetEnableFastCache

    .method public hidebysig newslot virtual abstract 
            instance void  SetEnableFastCache([in] int32 fEnableFastCache) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetEnableFastCache

    .method public hidebysig newslot virtual abstract 
            instance void  GetAcceleratedStreamingDuration([out] unsigned int64& pcnsAccelDuration) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetAcceleratedStreamingDuration

    .method public hidebysig newslot virtual abstract 
            instance void  SetAcceleratedStreamingDuration([in] unsigned int64 cnsAccelDuration) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetAcceleratedStreamingDuration

    .method public hidebysig newslot virtual abstract 
            instance void  GetAutoReconnectLimit([out] unsigned int32& pdwAutoReconnectLimit) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetAutoReconnectLimit

    .method public hidebysig newslot virtual abstract 
            instance void  SetAutoReconnectLimit([in] unsigned int32 dwAutoReconnectLimit) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetAutoReconnectLimit

    .method public hidebysig newslot virtual abstract 
            instance void  GetEnableResends([out] int32& pfEnableResends) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetEnableResends

    .method public hidebysig newslot virtual abstract 
            instance void  SetEnableResends([in] int32 fEnableResends) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetEnableResends

    .method public hidebysig newslot virtual abstract 
            instance void  GetEnableThinning([out] int32& pfEnableThinning) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetEnableThinning

    .method public hidebysig newslot virtual abstract 
            instance void  SetEnableThinning([in] int32 fEnableThinning) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::SetEnableThinning

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxNetPacketSize([out] unsigned int32& pdwMaxNetPacketSize) runtime managed internalcall
    {
    } // end of method IWMReaderNetworkConfig2::GetMaxNetPacketSize

  } // end of class IWMReaderNetworkConfig2

  .class interface public abstract auto ansi import IWMLicenseBackup
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 35 45 35 41 43 39 46 2D 33 46 42 36   // ..$05E5AC9F-3FB6
                                                                                                    2D 34 35 30 38 2D 42 42 34 33 2D 41 34 30 36 37   // -4508-BB43-A4067
                                                                                                    42 41 31 45 42 45 38 00 00 )                      // BA1EBE8..
    .method public hidebysig newslot virtual abstract 
            instance void  BackupLicenses([in] unsigned int32 dwFlags,
                                          [in] class UW.CSE.ManagedWM.IWMStatusCallback  marshal( interface) pCallback) runtime managed internalcall
    {
    } // end of method IWMLicenseBackup::BackupLicenses

    .method public hidebysig newslot virtual abstract 
            instance void  CancelLicenseBackup() runtime managed internalcall
    {
    } // end of method IWMLicenseBackup::CancelLicenseBackup

  } // end of class IWMLicenseBackup

  .class interface public abstract auto ansi import IWMLicenseRestore
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 37 30 42 36 33 33 34 2D 41 32 32 45   // ..$C70B6334-A22E
                                                                                                    2D 34 45 46 42 2D 41 32 34 35 2D 31 35 45 36 35   // -4EFB-A245-15E65
                                                                                                    41 30 30 34 41 31 33 00 00 )                      // A004A13..
    .method public hidebysig newslot virtual abstract 
            instance void  RestoreLicenses([in] unsigned int32 dwFlags,
                                           [in] class UW.CSE.ManagedWM.IWMStatusCallback  marshal( interface) pCallback) runtime managed internalcall
    {
    } // end of method IWMLicenseRestore::RestoreLicenses

    .method public hidebysig newslot virtual abstract 
            instance void  CancelLicenseRestore() runtime managed internalcall
    {
    } // end of method IWMLicenseRestore::CancelLicenseRestore

  } // end of class IWMLicenseRestore

  .class interface public abstract auto ansi import IWMBackupRestoreProps
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 43 38 45 30 44 41 36 2D 39 39 36 46   // ..$3C8E0DA6-996F
                                                                                                    2D 34 46 46 33 2D 41 31 41 46 2D 34 38 33 38 46   // -4FF3-A1AF-4838F
                                                                                                    39 33 37 37 45 32 45 00 00 )                      // 9377E2E..
    .method public hidebysig newslot virtual abstract 
            instance void  GetPropCount([out] unsigned int16& pcProps) runtime managed internalcall
    {
    } // end of method IWMBackupRestoreProps::GetPropCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetPropByIndex([in] unsigned int16 wIndex,
                                          [out] unsigned int16& pwszName,
                                          [in][out] unsigned int16& pcchNameLen,
                                          [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                          [out] unsigned int8& pValue,
                                          [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMBackupRestoreProps::GetPropByIndex

    .method public hidebysig newslot virtual abstract 
            instance void  GetPropByName([in] string  marshal( lpwstr) pszName,
                                         [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                         [out] unsigned int8& pValue,
                                         [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMBackupRestoreProps::GetPropByName

    .method public hidebysig newslot virtual abstract 
            instance void  SetProp([in] string  marshal( lpwstr) pszName,
                                   [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                   [in] unsigned int8& pValue,
                                   [in] unsigned int16 cbLength) runtime managed internalcall
    {
    } // end of method IWMBackupRestoreProps::SetProp

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveProp([in] string  marshal( lpwstr) pcwszName) runtime managed internalcall
    {
    } // end of method IWMBackupRestoreProps::RemoveProp

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveAllProps() runtime managed internalcall
    {
    } // end of method IWMBackupRestoreProps::RemoveAllProps

  } // end of class IWMBackupRestoreProps

  .class interface public abstract auto ansi import IWMCodecInfo
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 41 39 37 30 46 34 31 45 2D 33 34 44 45   // ..$A970F41E-34DE
                                                                                                    2D 34 41 39 38 2D 42 33 42 41 2D 45 34 42 33 43   // -4A98-B3BA-E4B3C
                                                                                                    41 37 35 32 38 46 30 00 00 )                      // A7528F0..
    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecInfoCount([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                             [out] unsigned int32& pcCodecs) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo::GetCodecInfoCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecFormatCount([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                               [in] unsigned int32 dwCodecIndex,
                                               [out] unsigned int32& pcFormat) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo::GetCodecFormatCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecFormat([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                          [in] unsigned int32 dwCodecIndex,
                                          [in] unsigned int32 dwFormatIndex,
                                          [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppIStreamConfig) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo::GetCodecFormat

  } // end of class IWMCodecInfo

  .class interface public abstract auto ansi import IWMCodecInfo2
         implements UW.CSE.ManagedWM.IWMCodecInfo
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 41 41 36 35 45 32 37 33 2D 42 36 38 36   // ..$AA65E273-B686
                                                                                                    2D 34 30 35 36 2D 39 31 45 43 2D 44 44 37 36 38   // -4056-91EC-DD768
                                                                                                    44 34 44 46 37 31 30 00 00 )                      // D4DF710..
    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecInfoCount([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                             [out] unsigned int32& pcCodecs) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo2::GetCodecInfoCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecFormatCount([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                               [in] unsigned int32 dwCodecIndex,
                                               [out] unsigned int32& pcFormat) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo2::GetCodecFormatCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecFormat([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                          [in] unsigned int32 dwCodecIndex,
                                          [in] unsigned int32 dwFormatIndex,
                                          [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppIStreamConfig) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo2::GetCodecFormat

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecName([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                        [in] unsigned int32 dwCodecIndex,
                                        [out] unsigned int16& wszName,
                                        [in][out] unsigned int32& pcchName) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo2::GetCodecName

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecFormatDesc([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                              [in] unsigned int32 dwCodecIndex,
                                              [in] unsigned int32 dwFormatIndex,
                                              [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppIStreamConfig,
                                              [out] unsigned int16& wszDesc,
                                              [in][out] unsigned int32& pcchDesc) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo2::GetCodecFormatDesc

  } // end of class IWMCodecInfo2

  .class interface public abstract auto ansi import IWMCodecInfo3
         implements UW.CSE.ManagedWM.IWMCodecInfo2
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 37 45 35 31 46 34 38 37 2D 34 44 39 33   // ..$7E51F487-4D93
                                                                                                    2D 34 46 39 38 2D 38 41 42 34 2D 32 37 44 30 35   // -4F98-8AB4-27D05
                                                                                                    36 35 41 44 43 35 31 00 00 )                      // 65ADC51..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecInfoCount([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                             [out] unsigned int32& pcCodecs) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo3::GetCodecInfoCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecFormatCount([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                               [in] unsigned int32 dwCodecIndex,
                                               [out] unsigned int32& pcFormat) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo3::GetCodecFormatCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecFormat([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                          [in] unsigned int32 dwCodecIndex,
                                          [in] unsigned int32 dwFormatIndex,
                                          [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppIStreamConfig) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo3::GetCodecFormat

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecName([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                        [in] unsigned int32 dwCodecIndex,
                                        [out] unsigned int16& wszName,
                                        [in][out] unsigned int32& pcchName) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo3::GetCodecName

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecFormatDesc([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                              [in] unsigned int32 dwCodecIndex,
                                              [in] unsigned int32 dwFormatIndex,
                                              [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppIStreamConfig,
                                              [out] unsigned int16& wszDesc,
                                              [in][out] unsigned int32& pcchDesc) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo3::GetCodecFormatDesc

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecFormatProp([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                              [in] unsigned int32 dwCodecIndex,
                                              [in] unsigned int32 dwFormatIndex,
                                              [in] string  marshal( lpwstr) pszName,
                                              [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                              [out] unsigned int8& pValue,
                                              [in][out] unsigned int32& pdwSize) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo3::GetCodecFormatProp

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecProp([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                        [in] unsigned int32 dwCodecIndex,
                                        [in] string  marshal( lpwstr) pszName,
                                        [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                        [out] unsigned int8& pValue,
                                        [in][out] unsigned int32& pdwSize) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo3::GetCodecProp

    .method public hidebysig newslot virtual abstract 
            instance void  SetCodecEnumerationSetting([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                                      [in] unsigned int32 dwCodecIndex,
                                                      [in] string  marshal( lpwstr) pszName,
                                                      [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                                      [in] unsigned int8& pValue,
                                                      [in] unsigned int32 dwSize) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo3::SetCodecEnumerationSetting

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecEnumerationSetting([in] valuetype UW.CSE.ManagedWM.GUID& guidType,
                                                      [in] unsigned int32 dwCodecIndex,
                                                      [in] string  marshal( lpwstr) pszName,
                                                      [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                                      [out] unsigned int8& pValue,
                                                      [in][out] unsigned int32& pdwSize) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMCodecInfo3::GetCodecEnumerationSetting

  } // end of class IWMCodecInfo3

  .class interface public abstract auto ansi import IWMSyncReader
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 33 39 37 46 31 32 31 2D 37 37 30 35   // ..$9397F121-7705
                                                                                                    2D 34 44 43 39 2D 42 30 34 39 2D 39 38 42 36 39   // -4DC9-B049-98B69
                                                                                                    38 31 38 38 34 31 34 00 00 )                      // 8188414..
    .method public hidebysig newslot virtual abstract 
            instance void  Open([in] unsigned int16& pwszFilename) runtime managed internalcall
    {
    } // end of method IWMSyncReader::Open

    .method public hidebysig newslot virtual abstract 
            instance void  Close() runtime managed internalcall
    {
    } // end of method IWMSyncReader::Close

    .method public hidebysig newslot virtual abstract 
            instance void  SetRange([in] unsigned int64 cnsStartTime,
                                    [in] int64 cnsDuration) runtime managed internalcall
    {
    } // end of method IWMSyncReader::SetRange

    .method public hidebysig newslot virtual abstract 
            instance void  SetRangeByFrame([in] unsigned int16 wStreamNum,
                                           [in] unsigned int64 qwFrameNumber,
                                           [in] int64 cFramesToRead) runtime managed internalcall
    {
    } // end of method IWMSyncReader::SetRangeByFrame

    .method public hidebysig newslot virtual abstract 
            instance void  GetNextSample([in] unsigned int16 wStreamNum,
                                         [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppSample,
                                         [out] unsigned int64& pcnsSampleTime,
                                         [out] unsigned int64& pcnsDuration,
                                         [out] unsigned int32& pdwFlags,
                                         [out] unsigned int32& pdwOutputNum,
                                         [out] unsigned int16& pwStreamNum) runtime managed internalcall
    {
    } // end of method IWMSyncReader::GetNextSample

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamsSelected([in] unsigned int16 cStreamCount,
                                              [in] unsigned int16& pwStreamNumbers,
                                              [in] valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION& pSelections) runtime managed internalcall
    {
    } // end of method IWMSyncReader::SetStreamsSelected

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamSelected([in] unsigned int16 wStreamNum,
                                             [out] valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION& pSelection) runtime managed internalcall
    {
    } // end of method IWMSyncReader::GetStreamSelected

    .method public hidebysig newslot virtual abstract 
            instance void  SetReadStreamSamples([in] unsigned int16 wStreamNum,
                                                [in] int32 fCompressed) runtime managed internalcall
    {
    } // end of method IWMSyncReader::SetReadStreamSamples

    .method public hidebysig newslot virtual abstract 
            instance void  GetReadStreamSamples([in] unsigned int16 wStreamNum,
                                                [out] int32& pfCompressed) runtime managed internalcall
    {
    } // end of method IWMSyncReader::GetReadStreamSamples

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputSetting([in] unsigned int32 dwOutputNum,
                                            [in] string  marshal( lpwstr) pszName,
                                            [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                            [out] unsigned int8& pValue,
                                            [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMSyncReader::GetOutputSetting

    .method public hidebysig newslot virtual abstract 
            instance void  SetOutputSetting([in] unsigned int32 dwOutputNum,
                                            [in] string  marshal( lpwstr) pszName,
                                            [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                            [in] unsigned int8& pValue,
                                            [in] unsigned int16 cbLength) runtime managed internalcall
    {
    } // end of method IWMSyncReader::SetOutputSetting

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputCount([out] unsigned int32& pcOutputs) runtime managed internalcall
    {
    } // end of method IWMSyncReader::GetOutputCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputProps([in] unsigned int32 dwOutputNum,
                                          [out] class UW.CSE.ManagedWM.IWMOutputMediaProps&  marshal( interface) ppOutput) runtime managed internalcall
    {
    } // end of method IWMSyncReader::GetOutputProps

    .method public hidebysig newslot virtual abstract 
            instance void  SetOutputProps([in] unsigned int32 dwOutputNum,
                                          [in] class UW.CSE.ManagedWM.IWMOutputMediaProps  marshal( interface) pOutput) runtime managed internalcall
    {
    } // end of method IWMSyncReader::SetOutputProps

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputFormatCount([in] unsigned int32 dwOutputNum,
                                                [out] unsigned int32& pcFormats) runtime managed internalcall
    {
    } // end of method IWMSyncReader::GetOutputFormatCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputFormat([in] unsigned int32 dwOutputNum,
                                           [in] unsigned int32 dwFormatNum,
                                           [out] class UW.CSE.ManagedWM.IWMOutputMediaProps&  marshal( interface) ppProps) runtime managed internalcall
    {
    } // end of method IWMSyncReader::GetOutputFormat

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputNumberForStream([in] unsigned int16 wStreamNum,
                                                    [out] unsigned int32& pdwOutputNum) runtime managed internalcall
    {
    } // end of method IWMSyncReader::GetOutputNumberForStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamNumberForOutput([in] unsigned int32 dwOutputNum,
                                                    [out] unsigned int16& pwStreamNum) runtime managed internalcall
    {
    } // end of method IWMSyncReader::GetStreamNumberForOutput

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxOutputSampleSize([in] unsigned int32 dwOutput,
                                                  [out] unsigned int32& pcbMax) runtime managed internalcall
    {
    } // end of method IWMSyncReader::GetMaxOutputSampleSize

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxStreamSampleSize([in] unsigned int16 wStream,
                                                  [out] unsigned int32& pcbMax) runtime managed internalcall
    {
    } // end of method IWMSyncReader::GetMaxStreamSampleSize

    .method public hidebysig newslot virtual abstract 
            instance void  OpenStream([in] class UW.CSE.ManagedWM.IStream  marshal( interface) pStream) runtime managed internalcall
    {
    } // end of method IWMSyncReader::OpenStream

  } // end of class IWMSyncReader

  .class interface public abstract auto ansi import IWMLanguageList
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 46 36 38 33 46 30 30 2D 32 44 34 39   // ..$DF683F00-2D49
                                                                                                    2D 34 44 38 45 2D 39 32 42 37 2D 46 42 31 39 46   // -4D8E-92B7-FB19F
                                                                                                    36 41 30 44 43 35 37 00 00 )                      // 6A0DC57..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetLanguageCount([out] unsigned int16& pwCount) runtime managed internalcall
    {
    } // end of method IWMLanguageList::GetLanguageCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetLanguageDetails([in] unsigned int16 wIndex,
                                              [out] unsigned int16& pwszLanguageString,
                                              [in][out] unsigned int16& pcchLanguageStringLength) runtime managed internalcall
    {
    } // end of method IWMLanguageList::GetLanguageDetails

    .method public hidebysig newslot virtual abstract 
            instance void  AddLanguageByRFC1766String([in] string  marshal( lpwstr) pwszLanguageString,
                                                      [out] unsigned int16& pwIndex) runtime managed internalcall
    {
    } // end of method IWMLanguageList::AddLanguageByRFC1766String

  } // end of class IWMLanguageList

  .class interface public abstract auto ansi import IWMImageInfo
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 46 30 41 41 33 42 36 2D 37 32 36 37   // ..$9F0AA3B6-7267
                                                                                                    2D 34 44 38 39 2D 38 38 46 32 2D 42 41 39 31 35   // -4D89-88F2-BA915
                                                                                                    41 41 35 43 34 43 36 00 00 )                      // AA5C4C6..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetImageCount([out] unsigned int32& pcImages) runtime managed internalcall
    {
    } // end of method IWMImageInfo::GetImageCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetImage([in] unsigned int32 wIndex,
                                    [in][out] unsigned int16& pcchMIMEType,
                                    [out] unsigned int16& pwszMIMEType,
                                    [in][out] unsigned int16& pcchDescription,
                                    [out] unsigned int16& pwszDescription,
                                    [out] unsigned int16& pImageType,
                                    [in][out] unsigned int32& pcbImageData,
                                    [out] unsigned int8& pbImageData) runtime managed internalcall
    {
    } // end of method IWMImageInfo::GetImage

  } // end of class IWMImageInfo

  .class interface public abstract auto ansi import IWMAddressAccess
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 42 42 33 43 36 33 38 39 2D 31 36 33 33   // ..$BB3C6389-1633
                                                                                                    2D 34 45 39 32 2D 41 46 31 34 2D 39 46 33 31 37   // -4E92-AF14-9F317
                                                                                                    33 42 41 33 39 44 30 00 00 )                      // 3BA39D0..
    .method public hidebysig newslot virtual abstract 
            instance void  GetAccessEntryCount([in] valuetype UW.CSE.ManagedWM.WM_AETYPE aeType,
                                               [out] unsigned int32& pcEntries) runtime managed internalcall
    {
    } // end of method IWMAddressAccess::GetAccessEntryCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetAccessEntry([in] valuetype UW.CSE.ManagedWM.WM_AETYPE aeType,
                                          [in] unsigned int32 dwEntryNum,
                                          [out] valuetype UW.CSE.ManagedWM._WMAddressAccessEntry& pAddrAccessEntry) runtime managed internalcall
    {
    } // end of method IWMAddressAccess::GetAccessEntry

    .method public hidebysig newslot virtual abstract 
            instance void  AddAccessEntry([in] valuetype UW.CSE.ManagedWM.WM_AETYPE aeType,
                                          [in] valuetype UW.CSE.ManagedWM._WMAddressAccessEntry& pAddrAccessEntry) runtime managed internalcall
    {
    } // end of method IWMAddressAccess::AddAccessEntry

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveAccessEntry([in] valuetype UW.CSE.ManagedWM.WM_AETYPE aeType,
                                             [in] unsigned int32 dwEntryNum) runtime managed internalcall
    {
    } // end of method IWMAddressAccess::RemoveAccessEntry

  } // end of class IWMAddressAccess

  .class public auto ansi sealed WM_AETYPE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.WM_AETYPE WM_AETYPE_INCLUDE = int32(0x00000069)
    .field public static literal valuetype UW.CSE.ManagedWM.WM_AETYPE WM_AETYPE_EXCLUDE = int32(0x00000065)
  } // end of class WM_AETYPE

  .class public sequential ansi sealed beforefieldinit _WMAddressAccessEntry
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 dwIPAddress
    .field public unsigned int32 dwMask
  } // end of class _WMAddressAccessEntry

  .class interface public abstract auto ansi import IWMAddressAccess2
         implements UW.CSE.ManagedWM.IWMAddressAccess
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 35 41 38 33 46 43 32 2D 33 45 39 38   // ..$65A83FC2-3E98
                                                                                                    2D 34 44 34 44 2D 38 31 42 35 2D 32 41 37 34 32   // -4D4D-81B5-2A742
                                                                                                    38 38 36 42 33 33 44 00 00 )                      // 886B33D..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetAccessEntryCount([in] valuetype UW.CSE.ManagedWM.WM_AETYPE aeType,
                                               [out] unsigned int32& pcEntries) runtime managed internalcall
    {
    } // end of method IWMAddressAccess2::GetAccessEntryCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetAccessEntry([in] valuetype UW.CSE.ManagedWM.WM_AETYPE aeType,
                                          [in] unsigned int32 dwEntryNum,
                                          [out] valuetype UW.CSE.ManagedWM._WMAddressAccessEntry& pAddrAccessEntry) runtime managed internalcall
    {
    } // end of method IWMAddressAccess2::GetAccessEntry

    .method public hidebysig newslot virtual abstract 
            instance void  AddAccessEntry([in] valuetype UW.CSE.ManagedWM.WM_AETYPE aeType,
                                          [in] valuetype UW.CSE.ManagedWM._WMAddressAccessEntry& pAddrAccessEntry) runtime managed internalcall
    {
    } // end of method IWMAddressAccess2::AddAccessEntry

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveAccessEntry([in] valuetype UW.CSE.ManagedWM.WM_AETYPE aeType,
                                             [in] unsigned int32 dwEntryNum) runtime managed internalcall
    {
    } // end of method IWMAddressAccess2::RemoveAccessEntry

    .method public hidebysig newslot virtual abstract 
            instance void  GetAccessEntryEx([in] valuetype UW.CSE.ManagedWM.WM_AETYPE aeType,
                                            [in] unsigned int32 dwEntryNum,
                                            [out] string&  marshal( bstr) pbstrAddress,
                                            [out] string&  marshal( bstr) pbstrMask) runtime managed internalcall
    {
    } // end of method IWMAddressAccess2::GetAccessEntryEx

    .method public hidebysig newslot virtual abstract 
            instance void  AddAccessEntryEx([in] valuetype UW.CSE.ManagedWM.WM_AETYPE aeType,
                                            [in] string  marshal( bstr) bstrAddress,
                                            [in] string  marshal( bstr) bstrMask) runtime managed internalcall
    {
    } // end of method IWMAddressAccess2::AddAccessEntryEx

  } // end of class IWMAddressAccess2

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0001
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0001 WEBSTREAM_SAMPLE_TYPE_FILE = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0001 WEBSTREAM_SAMPLE_TYPE_RENDER = int32(0x00000002)
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0001

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0002
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0002 WM_SF_CLEANPOINT = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0002 WM_SF_DISCONTINUITY = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0002 WM_SF_DATALOSS = int32(0x00000004)
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0002

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0003
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0003 WM_SFEX_NOTASYNCPOINT = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0003 WM_SFEX_DATALOSS = int32(0x00000004)
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0003

  .class public auto ansi sealed WMT_RIGHTS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_RIGHTS WMT_RIGHT_PLAYBACK = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_RIGHTS WMT_RIGHT_COPY_TO_NON_SDMI_DEVICE = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_RIGHTS WMT_RIGHT_COPY_TO_CD = int32(0x00000008)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_RIGHTS WMT_RIGHT_COPY_TO_SDMI_DEVICE = int32(0x00000010)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_RIGHTS WMT_RIGHT_ONE_TIME = int32(0x00000020)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_RIGHTS WMT_RIGHT_SAVE_STREAM_PROTECTED = int32(0x00000040)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_RIGHTS WMT_RIGHT_SDMI_TRIGGER = int32(0x00010000)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_RIGHTS WMT_RIGHT_SDMI_NOMORECOPIES = int32(0x00020000)
  } // end of class WMT_RIGHTS

  .class public auto ansi sealed WMT_IMAGE_TYPE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_IMAGE_TYPE WMT_IT_NONE = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_IMAGE_TYPE WMT_IT_BITMAP = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_IMAGE_TYPE WMT_IT_JPEG = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_IMAGE_TYPE WMT_IT_GIF = int32(0x00000003)
  } // end of class WMT_IMAGE_TYPE

  .class public auto ansi sealed WMT_ATTR_IMAGETYPE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_ATTR_IMAGETYPE WMT_IMAGETYPE_BITMAP = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_ATTR_IMAGETYPE WMT_IMAGETYPE_JPEG = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_ATTR_IMAGETYPE WMT_IMAGETYPE_GIF = int32(0x00000003)
  } // end of class WMT_ATTR_IMAGETYPE

  .class public auto ansi sealed tagWMT_STORAGE_FORMAT
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_STORAGE_FORMAT WMT_Storage_Format_MP3 = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_STORAGE_FORMAT WMT_Storage_Format_V1 = int32(0x00000001)
  } // end of class tagWMT_STORAGE_FORMAT

  .class public auto ansi sealed tagWMT_DRMLA_TRUST
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_DRMLA_TRUST WMT_DRMLA_UNTRUSTED = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_DRMLA_TRUST WMT_DRMLA_TRUSTED = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_DRMLA_TRUST WMT_DRMLA_TAMPERED = int32(0x00000002)
  } // end of class tagWMT_DRMLA_TRUST

  .class public auto ansi sealed tagWMT_TRANSPORT_TYPE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_TRANSPORT_TYPE WMT_Transport_Type_Unreliable = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_TRANSPORT_TYPE WMT_Transport_Type_Reliable = int32(0x00000001)
  } // end of class tagWMT_TRANSPORT_TYPE

  .class public auto ansi sealed WMT_CODEC_INFO_TYPE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_CODEC_INFO_TYPE WMT_CODECINFO_AUDIO = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_CODEC_INFO_TYPE WMT_CODECINFO_VIDEO = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_CODEC_INFO_TYPE WMT_CODECINFO_UNKNOWN = int32(0xFFFFFFFF)
  } // end of class WMT_CODEC_INFO_TYPE

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0004
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0004 WM_DM_NOTINTERLACED = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0004 WM_DM_DEINTERLACE_NORMAL = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0004 WM_DM_DEINTERLACE_HALFSIZE = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0004 WM_DM_DEINTERLACE_HALFSIZEDOUBLERATE = int32(0x00000003)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0004 WM_DM_DEINTERLACE_INVERSETELECINE = int32(0x00000004)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0004 WM_DM_DEINTERLACE_VERTICALHALFSIZEDOUBLERATE = int32(0x00000005)
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0004

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0005
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0005 WM_DM_IT_DISABLE_COHERENT_MODE = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0005 WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_TOP = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0005 WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_TOP = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0005 WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_TOP = int32(0x00000003)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0005 WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_TOP = int32(0x00000004)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0005 WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_TOP = int32(0x00000005)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0005 WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_BOTTOM = int32(0x00000006)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0005 WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_BOTTOM = int32(0x00000007)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0005 WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_BOTTOM = int32(0x00000008)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0005 WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_BOTTOM = int32(0x00000009)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0005 WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_BOTTOM = int32(0x0000000A)
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0005

  .class public auto ansi sealed tagWMT_INDEXER_TYPE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_INDEXER_TYPE WMT_IT_PRESENTATION_TIME = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_INDEXER_TYPE WMT_IT_FRAME_NUMBERS = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_INDEXER_TYPE WMT_IT_TIMECODE = int32(0x00000002)
  } // end of class tagWMT_INDEXER_TYPE

  .class public auto ansi sealed tagWMT_INDEX_TYPE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_INDEX_TYPE WMT_IT_NEAREST_DATA_UNIT = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_INDEX_TYPE WMT_IT_NEAREST_OBJECT = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_INDEX_TYPE WMT_IT_NEAREST_CLEAN_POINT = int32(0x00000003)
  } // end of class tagWMT_INDEX_TYPE

  .class public auto ansi sealed tagWMT_FILESINK_MODE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_FILESINK_MODE WMT_FM_SINGLE_BUFFERS = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_FILESINK_MODE WMT_FM_FILESINK_DATA_UNITS = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_FILESINK_MODE WMT_FM_FILESINK_UNBUFFERED = int32(0x00000004)
  } // end of class tagWMT_FILESINK_MODE

  .class public auto ansi sealed tagWMT_MUSICSPEECH_CLASS_MODE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_MUSICSPEECH_CLASS_MODE WMT_MS_CLASS_MUSIC = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_MUSICSPEECH_CLASS_MODE WMT_MS_CLASS_SPEECH = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_MUSICSPEECH_CLASS_MODE WMT_MS_CLASS_MIXED = int32(0x00000002)
  } // end of class tagWMT_MUSICSPEECH_CLASS_MODE

  .class public auto ansi sealed tagWMT_WATERMARK_ENTRY_TYPE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_WATERMARK_ENTRY_TYPE WMT_WMETYPE_AUDIO = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.tagWMT_WATERMARK_ENTRY_TYPE WMT_WMETYPE_VIDEO = int32(0x00000002)
  } // end of class tagWMT_WATERMARK_ENTRY_TYPE

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0006
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0006 WM_PLAYBACK_DRC_HIGH = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0006 WM_PLAYBACK_DRC_MEDIUM = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0006 WM_PLAYBACK_DRC_LOW = int32(0x00000002)
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0006

  .class public auto ansi sealed __MIDL___MIDL_itf_ManagedWM_0000_0007
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0007 WMT_TIMECODE_FRAMERATE_30 = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0007 WMT_TIMECODE_FRAMERATE_30DROP = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0007 WMT_TIMECODE_FRAMERATE_25 = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.__MIDL___MIDL_itf_ManagedWM_0000_0007 WMT_TIMECODE_FRAMERATE_24 = int32(0x00000003)
  } // end of class __MIDL___MIDL_itf_ManagedWM_0000_0007

  .class public auto ansi sealed WMT_CREDENTIAL_FLAGS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_CREDENTIAL_FLAGS WMT_CREDENTIAL_SAVE = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_CREDENTIAL_FLAGS WMT_CREDENTIAL_DONT_CACHE = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_CREDENTIAL_FLAGS WMT_CREDENTIAL_CLEAR_TEXT = int32(0x00000004)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_CREDENTIAL_FLAGS WMT_CREDENTIAL_PROXY = int32(0x00000008)
    .field public static literal valuetype UW.CSE.ManagedWM.WMT_CREDENTIAL_FLAGS WMT_CREDENTIAL_ENCRYPT = int32(0x00000010)
  } // end of class WMT_CREDENTIAL_FLAGS

  .class public sequential ansi sealed beforefieldinit _WMClientProperties
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 dwIPAddress
    .field public unsigned int32 dwPort
  } // end of class _WMClientProperties

  .class public sequential ansi sealed beforefieldinit _WMClientPropertiesEx
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 cbSize
    .field public  marshal( lpwstr) string pwszIPAddress
    .field public  marshal( lpwstr) string pwszPort
    .field public  marshal( lpwstr) string pwszDNSName
  } // end of class _WMClientPropertiesEx

  .class public sequential ansi sealed beforefieldinit _WMT_BUFFER_SEGMENT
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public  marshal( interface) class UW.CSE.ManagedWM.INSSBuffer pBuffer
    .field public unsigned int32 cbOffset
    .field public unsigned int32 cbLength
  } // end of class _WMT_BUFFER_SEGMENT

  .class public sequential ansi sealed beforefieldinit _WMT_PAYLOAD_FRAGMENT
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 dwPayloadIndex
    .field public valuetype UW.CSE.ManagedWM._WMT_BUFFER_SEGMENT segmentData
  } // end of class _WMT_PAYLOAD_FRAGMENT

  .class public sequential ansi sealed beforefieldinit _WMT_FILESINK_DATA_UNIT
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public valuetype UW.CSE.ManagedWM._WMT_BUFFER_SEGMENT packetHeaderBuffer
    .field public unsigned int32 cPayloads
    .field public native int pPayloadHeaderBuffers
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 cPayloadDataFragments
    .field public native int pPayloadDataFragments
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
  } // end of class _WMT_FILESINK_DATA_UNIT

  .class public sequential ansi sealed beforefieldinit _WMT_WEBSTREAM_FORMAT
         extends [mscorlib]System.ValueType
  {
    .pack 2
    .size 0
    .field public unsigned int16 cbSize
    .field public unsigned int16 cbSampleHeaderFixedData
    .field public unsigned int16 wVersion
    .field public unsigned int16 wReserved
  } // end of class _WMT_WEBSTREAM_FORMAT

  .class public sequential ansi sealed beforefieldinit _WMT_WEBSTREAM_SAMPLE_HEADER
         extends [mscorlib]System.ValueType
  {
    .pack 2
    .size 0
    .field public unsigned int16 cbLength
    .field public unsigned int16 wPart
    .field public unsigned int16 cTotalParts
    .field public unsigned int16 wSampleType
    .field public  marshal( fixed array [1]) unsigned int16[] wszURL
  } // end of class _WMT_WEBSTREAM_SAMPLE_HEADER

  .class public sequential ansi sealed beforefieldinit _WMPicture
         extends [mscorlib]System.ValueType
  {
    .pack 1
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public  marshal( lpwstr) string pwszMIMEType
    .field public unsigned int8 bPictureType
    .field public  marshal( lpwstr) string pwszDescription
    .field public unsigned int32 dwDataLen
    .field public native int pbData
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
  } // end of class _WMPicture

  .class public sequential ansi sealed beforefieldinit _WMSynchronisedLyrics
         extends [mscorlib]System.ValueType
  {
    .pack 1
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int8 bTimeStampFormat
    .field public unsigned int8 bContentType
    .field public  marshal( lpwstr) string pwszContentDescriptor
    .field public unsigned int32 dwLyricsLen
    .field public native int pbLyrics
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
  } // end of class _WMSynchronisedLyrics

  .class public sequential ansi sealed beforefieldinit _WMUserWebURL
         extends [mscorlib]System.ValueType
  {
    .pack 1
    .size 0
    .field public  marshal( lpwstr) string pwszDescription
    .field public  marshal( lpwstr) string pwszURL
  } // end of class _WMUserWebURL

  .class public sequential ansi sealed beforefieldinit _WMUserText
         extends [mscorlib]System.ValueType
  {
    .pack 1
    .size 0
    .field public  marshal( lpwstr) string pwszDescription
    .field public  marshal( lpwstr) string pwszText
  } // end of class _WMUserText

  .class public sequential ansi sealed beforefieldinit _WMLeakyBucketPair
         extends [mscorlib]System.ValueType
  {
    .pack 1
    .size 0
    .field public unsigned int32 dwBitrate
    .field public unsigned int32 msBufferWindow
  } // end of class _WMLeakyBucketPair

  .class public sequential ansi sealed beforefieldinit _WM_LICENSE_STATE_DATA
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 dwSize
    .field public unsigned int32 dwNumStates
    .field public  marshal( fixed array [1]) valuetype UW.CSE.ManagedWM._DRM_LICENSE_STATE_DATA[] stateData
  } // end of class _WM_LICENSE_STATE_DATA

  .class public sequential ansi sealed beforefieldinit _DRM_LICENSE_STATE_DATA
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 dwStreamId
    .field public valuetype UW.CSE.ManagedWM.DRM_LICENSE_STATE_CATEGORY dwCategory
    .field public unsigned int32 dwNumCounts
    .field public  marshal( fixed array [4]) unsigned int32[] dwCount
    .field public unsigned int32 dwNumDates
    .field public  marshal( fixed array [4]) valuetype UW.CSE.ManagedWM._FILETIME[] datetime
    .field public unsigned int32 dwVague
  } // end of class _DRM_LICENSE_STATE_DATA

  .class public auto ansi sealed DRM_LICENSE_STATE_CATEGORY
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype UW.CSE.ManagedWM.DRM_LICENSE_STATE_CATEGORY WM_DRM_LICENSE_STATE_NORIGHT = int32(0x00000000)
    .field public static literal valuetype UW.CSE.ManagedWM.DRM_LICENSE_STATE_CATEGORY WM_DRM_LICENSE_STATE_UNLIM = int32(0x00000001)
    .field public static literal valuetype UW.CSE.ManagedWM.DRM_LICENSE_STATE_CATEGORY WM_DRM_LICENSE_STATE_COUNT = int32(0x00000002)
    .field public static literal valuetype UW.CSE.ManagedWM.DRM_LICENSE_STATE_CATEGORY WM_DRM_LICENSE_STATE_FROM = int32(0x00000003)
    .field public static literal valuetype UW.CSE.ManagedWM.DRM_LICENSE_STATE_CATEGORY WM_DRM_LICENSE_STATE_UNTIL = int32(0x00000004)
    .field public static literal valuetype UW.CSE.ManagedWM.DRM_LICENSE_STATE_CATEGORY WM_DRM_LICENSE_STATE_FROM_UNTIL = int32(0x00000005)
    .field public static literal valuetype UW.CSE.ManagedWM.DRM_LICENSE_STATE_CATEGORY WM_DRM_LICENSE_STATE_COUNT_FROM = int32(0x00000006)
    .field public static literal valuetype UW.CSE.ManagedWM.DRM_LICENSE_STATE_CATEGORY WM_DRM_LICENSE_STATE_COUNT_UNTIL = int32(0x00000007)
    .field public static literal valuetype UW.CSE.ManagedWM.DRM_LICENSE_STATE_CATEGORY WM_DRM_LICENSE_STATE_COUNT_FROM_UNTIL = int32(0x00000008)
    .field public static literal valuetype UW.CSE.ManagedWM.DRM_LICENSE_STATE_CATEGORY WM_DRM_LICENSE_STATE_EXPIRATION_AFTER_FIRSTUSE = int32(0x00000009)
  } // end of class DRM_LICENSE_STATE_CATEGORY

  .class public sequential ansi sealed beforefieldinit __WMT_WATERMARK_ENTRY
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public valuetype UW.CSE.ManagedWM.tagWMT_WATERMARK_ENTRY_TYPE wmetType
    .field public valuetype UW.CSE.ManagedWM.GUID 'clsid'
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                            64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    .field public unsigned int32 cbDisplayName
    .field public  marshal( lpwstr) string pwszDisplayName
  } // end of class __WMT_WATERMARK_ENTRY

  .class public sequential ansi sealed beforefieldinit __WMT_VIDEOIMAGE_SAMPLE
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 dwMagic
    .field public unsigned int32 cbStruct
    .field public unsigned int32 dwControlFlags
    .field public unsigned int32 dwInputFlagsCur
    .field public int32 lCurMotionXtoX
    .field public int32 lCurMotionYtoX
    .field public int32 lCurMotionXoffset
    .field public int32 lCurMotionXtoY
    .field public int32 lCurMotionYtoY
    .field public int32 lCurMotionYoffset
    .field public int32 lCurBlendCoef1
    .field public int32 lCurBlendCoef2
    .field public unsigned int32 dwInputFlagsPrev
    .field public int32 lPrevMotionXtoX
    .field public int32 lPrevMotionYtoX
    .field public int32 lPrevMotionXoffset
    .field public int32 lPrevMotionXtoY
    .field public int32 lPrevMotionYtoY
    .field public int32 lPrevMotionYoffset
    .field public int32 lPrevBlendCoef1
    .field public int32 lPrevBlendCoef2
  } // end of class __WMT_VIDEOIMAGE_SAMPLE

  .class public sequential ansi sealed beforefieldinit _WMT_TIMECODE_EXTENSION_DATA
         extends [mscorlib]System.ValueType
  {
    .pack 2
    .size 0
    .field public unsigned int16 wRange
    .field public unsigned int32 dwTimecode
    .field public unsigned int32 dwUserbits
    .field public unsigned int32 dwAmFlags
  } // end of class _WMT_TIMECODE_EXTENSION_DATA

  .class interface public abstract auto ansi import IWMPropertyVault
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 37 32 39 39 35 41 37 39 2D 35 30 39 30   // ..$72995A79-5090
                                                                                                    2D 34 32 41 34 2D 39 43 38 43 2D 44 39 44 30 42   // -42A4-9C8C-D9D0B
                                                                                                    36 44 33 34 42 45 35 00 00 )                      // 6D34BE5..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetPropertyCount([in] unsigned int32& pdwCount) runtime managed internalcall
    {
    } // end of method IWMPropertyVault::GetPropertyCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetPropertyByName([in] string  marshal( lpwstr) pszName,
                                             [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                             [out] unsigned int8& pValue,
                                             [in][out] unsigned int32& pdwSize) runtime managed internalcall
    {
    } // end of method IWMPropertyVault::GetPropertyByName

    .method public hidebysig newslot virtual abstract 
            instance void  SetProperty([in] string  marshal( lpwstr) pszName,
                                       [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE pType,
                                       [in] unsigned int8& pValue,
                                       [in] unsigned int32 dwSize) runtime managed internalcall
    {
    } // end of method IWMPropertyVault::SetProperty

    .method public hidebysig newslot virtual abstract 
            instance void  GetPropertyByIndex([in] unsigned int32 dwIndex,
                                              [out] string  marshal( lpwstr) pszName,
                                              [in][out] unsigned int32& pdwNameLen,
                                              [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                              [out] unsigned int8& pValue,
                                              [in][out] unsigned int32& pdwSize) runtime managed internalcall
    {
    } // end of method IWMPropertyVault::GetPropertyByIndex

    .method public hidebysig newslot virtual abstract 
            instance void  CopyPropertiesFrom([in] class UW.CSE.ManagedWM.IWMPropertyVault  marshal( interface) pIWMPropertyVault) runtime managed internalcall
    {
    } // end of method IWMPropertyVault::CopyPropertiesFrom

    .method public hidebysig newslot virtual abstract 
            instance void  Clear() runtime managed internalcall
    {
    } // end of method IWMPropertyVault::Clear

  } // end of class IWMPropertyVault

  .class interface public abstract auto ansi import IWMIStreamProps
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 38 31 36 44 41 44 33 2D 32 42 34 42   // ..$6816DAD3-2B4B
                                                                                                    2D 34 43 38 45 2D 38 31 34 39 2D 38 37 34 43 33   // -4C8E-8149-874C3
                                                                                                    34 38 33 41 37 35 33 00 00 )                      // 483A753..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetProperty([in] string  marshal( lpwstr) pszName,
                                       [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                       [out] unsigned int8& pValue,
                                       [in][out] unsigned int32& pdwSize) runtime managed internalcall
    {
    } // end of method IWMIStreamProps::GetProperty

  } // end of class IWMIStreamProps

  .class interface public abstract auto ansi import IWMSyncReader2
         implements UW.CSE.ManagedWM.IWMSyncReader
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 46 41 45 44 33 44 32 31 2D 31 42 36 42   // ..$FAED3D21-1B6B
                                                                                                    2D 34 41 46 37 2D 38 43 42 36 2D 33 45 31 38 39   // -4AF7-8CB6-3E189
                                                                                                    42 42 43 31 38 37 42 00 00 )                      // BBC187B..
    .method public hidebysig newslot virtual abstract 
            instance void  Open([in] unsigned int16& pwszFilename) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::Open

    .method public hidebysig newslot virtual abstract 
            instance void  Close() runtime managed internalcall
    {
    } // end of method IWMSyncReader2::Close

    .method public hidebysig newslot virtual abstract 
            instance void  SetRange([in] unsigned int64 cnsStartTime,
                                    [in] int64 cnsDuration) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::SetRange

    .method public hidebysig newslot virtual abstract 
            instance void  SetRangeByFrame([in] unsigned int16 wStreamNum,
                                           [in] unsigned int64 qwFrameNumber,
                                           [in] int64 cFramesToRead) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::SetRangeByFrame

    .method public hidebysig newslot virtual abstract 
            instance void  GetNextSample([in] unsigned int16 wStreamNum,
                                         [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppSample,
                                         [out] unsigned int64& pcnsSampleTime,
                                         [out] unsigned int64& pcnsDuration,
                                         [out] unsigned int32& pdwFlags,
                                         [out] unsigned int32& pdwOutputNum,
                                         [out] unsigned int16& pwStreamNum) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetNextSample

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamsSelected([in] unsigned int16 cStreamCount,
                                              [in] unsigned int16& pwStreamNumbers,
                                              [in] valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION& pSelections) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::SetStreamsSelected

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamSelected([in] unsigned int16 wStreamNum,
                                             [out] valuetype UW.CSE.ManagedWM.WMT_STREAM_SELECTION& pSelection) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetStreamSelected

    .method public hidebysig newslot virtual abstract 
            instance void  SetReadStreamSamples([in] unsigned int16 wStreamNum,
                                                [in] int32 fCompressed) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::SetReadStreamSamples

    .method public hidebysig newslot virtual abstract 
            instance void  GetReadStreamSamples([in] unsigned int16 wStreamNum,
                                                [out] int32& pfCompressed) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetReadStreamSamples

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputSetting([in] unsigned int32 dwOutputNum,
                                            [in] string  marshal( lpwstr) pszName,
                                            [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                            [out] unsigned int8& pValue,
                                            [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetOutputSetting

    .method public hidebysig newslot virtual abstract 
            instance void  SetOutputSetting([in] unsigned int32 dwOutputNum,
                                            [in] string  marshal( lpwstr) pszName,
                                            [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                            [in] unsigned int8& pValue,
                                            [in] unsigned int16 cbLength) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::SetOutputSetting

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputCount([out] unsigned int32& pcOutputs) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetOutputCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputProps([in] unsigned int32 dwOutputNum,
                                          [out] class UW.CSE.ManagedWM.IWMOutputMediaProps&  marshal( interface) ppOutput) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetOutputProps

    .method public hidebysig newslot virtual abstract 
            instance void  SetOutputProps([in] unsigned int32 dwOutputNum,
                                          [in] class UW.CSE.ManagedWM.IWMOutputMediaProps  marshal( interface) pOutput) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::SetOutputProps

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputFormatCount([in] unsigned int32 dwOutputNum,
                                                [out] unsigned int32& pcFormats) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetOutputFormatCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputFormat([in] unsigned int32 dwOutputNum,
                                           [in] unsigned int32 dwFormatNum,
                                           [out] class UW.CSE.ManagedWM.IWMOutputMediaProps&  marshal( interface) ppProps) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetOutputFormat

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputNumberForStream([in] unsigned int16 wStreamNum,
                                                    [out] unsigned int32& pdwOutputNum) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetOutputNumberForStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamNumberForOutput([in] unsigned int32 dwOutputNum,
                                                    [out] unsigned int16& pwStreamNum) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetStreamNumberForOutput

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxOutputSampleSize([in] unsigned int32 dwOutput,
                                                  [out] unsigned int32& pcbMax) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetMaxOutputSampleSize

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxStreamSampleSize([in] unsigned int16 wStream,
                                                  [out] unsigned int32& pcbMax) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetMaxStreamSampleSize

    .method public hidebysig newslot virtual abstract 
            instance void  OpenStream([in] class UW.CSE.ManagedWM.IStream  marshal( interface) pStream) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::OpenStream

    .method public hidebysig newslot virtual abstract 
            instance void  SetRangeByTimecode([in] unsigned int16 wStreamNum,
                                              [in] valuetype UW.CSE.ManagedWM._WMT_TIMECODE_EXTENSION_DATA& pStart,
                                              [in] valuetype UW.CSE.ManagedWM._WMT_TIMECODE_EXTENSION_DATA& pEnd) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::SetRangeByTimecode

    .method public hidebysig newslot virtual abstract 
            instance void  SetRangeByFrameEx([in] unsigned int16 wStreamNum,
                                             [in] unsigned int64 qwFrameNumber,
                                             [in] int64 cFramesToRead,
                                             [out] unsigned int64& pcnsStartTime) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::SetRangeByFrameEx

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllocateForOutput([in] unsigned int32 dwOutputNum,
                                                [in] class UW.CSE.ManagedWM.IWMReaderAllocatorEx  marshal( interface) pAllocator) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::SetAllocateForOutput

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocateForOutput([in] unsigned int32 dwOutputNum,
                                                [out] class UW.CSE.ManagedWM.IWMReaderAllocatorEx&  marshal( interface) ppAllocator) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetAllocateForOutput

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllocateForStream([in] unsigned int16 wStreamNum,
                                                [in] class UW.CSE.ManagedWM.IWMReaderAllocatorEx  marshal( interface) pAllocator) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::SetAllocateForStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocateForStream([in] unsigned int16 dwSreamNum,
                                                [out] class UW.CSE.ManagedWM.IWMReaderAllocatorEx&  marshal( interface) ppAllocator) runtime managed internalcall
    {
    } // end of method IWMSyncReader2::GetAllocateForStream

  } // end of class IWMSyncReader2

  .class interface public abstract auto ansi import IWMCredentialCallback
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 34 32 45 30 45 42 37 2D 45 36 35 31   // ..$342E0EB7-E651
                                                                                                    2D 34 35 30 43 2D 39 37 35 42 2D 32 41 43 45 32   // -450C-975B-2ACE2
                                                                                                    43 39 30 43 34 38 45 00 00 )                      // C90C48E..
    .method public hidebysig newslot virtual abstract 
            instance void  AcquireCredentials([in] unsigned int16& pwszRealm,
                                              [in] unsigned int16& pwszSite,
                                              [out] unsigned int16& pwszUser,
                                              [in] unsigned int32 cchUser,
                                              [out] unsigned int16& pwszPassword,
                                              [in] unsigned int32 cchPassword,
                                              [in] int32  marshal( error) hrStatus,
                                              [out] unsigned int32& pdwFlags) runtime managed internalcall
    {
    } // end of method IWMCredentialCallback::AcquireCredentials

  } // end of class IWMCredentialCallback

  .class interface public abstract auto ansi import IWMHeaderInfo2
         implements UW.CSE.ManagedWM.IWMHeaderInfo
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 31 35 43 46 39 37 38 31 2D 34 35 34 45   // ..$15CF9781-454E
                                                                                                    2D 34 38 32 45 2D 42 33 39 33 2D 38 35 46 41 45   // -482E-B393-85FAE
                                                                                                    34 38 37 41 38 31 30 00 00 )                      // 487A810..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetAttributeCount([in] unsigned int16 wStreamNum,
                                             [out] unsigned int16& pcAttributes) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::GetAttributeCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetAttributeByIndex([in] unsigned int16 wIndex,
                                               [in][out] unsigned int16& pwStreamNum,
                                               [out] unsigned int16& pwszName,
                                               [in][out] unsigned int16& pcchNameLen,
                                               [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                               [out] unsigned int8& pValue,
                                               [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::GetAttributeByIndex

    .method public hidebysig newslot virtual abstract 
            instance void  GetAttributeByName([in][out] unsigned int16& pwStreamNum,
                                              [in] string  marshal( lpwstr) pszName,
                                              [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                              [out] unsigned int8& pValue,
                                              [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::GetAttributeByName

    .method public hidebysig newslot virtual abstract 
            instance void  SetAttribute([in] unsigned int16 wStreamNum,
                                        [in] string  marshal( lpwstr) pszName,
                                        [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                        [in] unsigned int8& pValue,
                                        [in] unsigned int16 cbLength) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::SetAttribute

    .method public hidebysig newslot virtual abstract 
            instance void  GetMarkerCount([out] unsigned int16& pcMarkers) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::GetMarkerCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetMarker([in] unsigned int16 wIndex,
                                     [out] unsigned int16& pwszMarkerName,
                                     [in][out] unsigned int16& pcchMarkerNameLen,
                                     [out] unsigned int64& pcnsMarkerTime) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::GetMarker

    .method public hidebysig newslot virtual abstract 
            instance void  AddMarker([in] unsigned int16& pwszMarkerName,
                                     [in] unsigned int64 cnsMarkerTime) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::AddMarker

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveMarker([in] unsigned int16 wIndex) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::RemoveMarker

    .method public hidebysig newslot virtual abstract 
            instance void  GetScriptCount([out] unsigned int16& pcScripts) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::GetScriptCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetScript([in] unsigned int16 wIndex,
                                     [out] unsigned int16& pwszType,
                                     [in][out] unsigned int16& pcchTypeLen,
                                     [out] unsigned int16& pwszCommand,
                                     [in][out] unsigned int16& pcchCommandLen,
                                     [out] unsigned int64& pcnsScriptTime) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::GetScript

    .method public hidebysig newslot virtual abstract 
            instance void  AddScript([in] unsigned int16& pwszType,
                                     [in] unsigned int16& pwszCommand,
                                     [in] unsigned int64 cnsScriptTime) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::AddScript

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveScript([in] unsigned int16 wIndex) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::RemoveScript

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecInfoCount([out] unsigned int32& pcCodecInfos) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::GetCodecInfoCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecInfo([in] unsigned int32 wIndex,
                                        [in][out] unsigned int16& pcchName,
                                        [out] unsigned int16& pwszName,
                                        [in][out] unsigned int16& pcchDescription,
                                        [out] unsigned int16& pwszDescription,
                                        [out] valuetype UW.CSE.ManagedWM.WMT_CODEC_INFO_TYPE& pCodecType,
                                        [in][out] unsigned int16& pcbCodecInfo,
                                        [out] unsigned int8& pbCodecInfo) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo2::GetCodecInfo

  } // end of class IWMHeaderInfo2

  .class interface public abstract auto ansi import IWMHeaderInfo3
         implements UW.CSE.ManagedWM.IWMHeaderInfo2
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 31 35 43 43 36 38 45 33 2D 32 37 43 43   // ..$15CC68E3-27CC
                                                                                                    2D 34 45 43 44 2D 42 32 32 32 2D 33 46 35 44 30   // -4ECD-B222-3F5D0
                                                                                                    32 44 38 30 42 44 35 00 00 )                      // 2D80BD5..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetAttributeCount([in] unsigned int16 wStreamNum,
                                             [out] unsigned int16& pcAttributes) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::GetAttributeCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetAttributeByIndex([in] unsigned int16 wIndex,
                                               [in][out] unsigned int16& pwStreamNum,
                                               [out] unsigned int16& pwszName,
                                               [in][out] unsigned int16& pcchNameLen,
                                               [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                               [out] unsigned int8& pValue,
                                               [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::GetAttributeByIndex

    .method public hidebysig newslot virtual abstract 
            instance void  GetAttributeByName([in][out] unsigned int16& pwStreamNum,
                                              [in] string  marshal( lpwstr) pszName,
                                              [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                              [out] unsigned int8& pValue,
                                              [in][out] unsigned int16& pcbLength) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::GetAttributeByName

    .method public hidebysig newslot virtual abstract 
            instance void  SetAttribute([in] unsigned int16 wStreamNum,
                                        [in] string  marshal( lpwstr) pszName,
                                        [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                        [in] unsigned int8& pValue,
                                        [in] unsigned int16 cbLength) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::SetAttribute

    .method public hidebysig newslot virtual abstract 
            instance void  GetMarkerCount([out] unsigned int16& pcMarkers) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::GetMarkerCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetMarker([in] unsigned int16 wIndex,
                                     [out] unsigned int16& pwszMarkerName,
                                     [in][out] unsigned int16& pcchMarkerNameLen,
                                     [out] unsigned int64& pcnsMarkerTime) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::GetMarker

    .method public hidebysig newslot virtual abstract 
            instance void  AddMarker([in] unsigned int16& pwszMarkerName,
                                     [in] unsigned int64 cnsMarkerTime) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::AddMarker

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveMarker([in] unsigned int16 wIndex) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::RemoveMarker

    .method public hidebysig newslot virtual abstract 
            instance void  GetScriptCount([out] unsigned int16& pcScripts) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::GetScriptCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetScript([in] unsigned int16 wIndex,
                                     [out] unsigned int16& pwszType,
                                     [in][out] unsigned int16& pcchTypeLen,
                                     [out] unsigned int16& pwszCommand,
                                     [in][out] unsigned int16& pcchCommandLen,
                                     [out] unsigned int64& pcnsScriptTime) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::GetScript

    .method public hidebysig newslot virtual abstract 
            instance void  AddScript([in] unsigned int16& pwszType,
                                     [in] unsigned int16& pwszCommand,
                                     [in] unsigned int64 cnsScriptTime) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::AddScript

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveScript([in] unsigned int16 wIndex) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::RemoveScript

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecInfoCount([out] unsigned int32& pcCodecInfos) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::GetCodecInfoCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecInfo([in] unsigned int32 wIndex,
                                        [in][out] unsigned int16& pcchName,
                                        [out] unsigned int16& pwszName,
                                        [in][out] unsigned int16& pcchDescription,
                                        [out] unsigned int16& pwszDescription,
                                        [out] valuetype UW.CSE.ManagedWM.WMT_CODEC_INFO_TYPE& pCodecType,
                                        [in][out] unsigned int16& pcbCodecInfo,
                                        [out] unsigned int8& pbCodecInfo) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::GetCodecInfo

    .method public hidebysig newslot virtual abstract 
            instance void  GetAttributeCountEx([in] unsigned int16 wStreamNum,
                                               [out] unsigned int16& pcAttributes) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::GetAttributeCountEx

    .method public hidebysig newslot virtual abstract 
            instance void  GetAttributeIndices([in] unsigned int16 wStreamNum,
                                               [in] string  marshal( lpwstr) pwszName,
                                               [in] unsigned int16& pwLangIndex,
                                               [out] unsigned int16& pwIndices,
                                               [in][out] unsigned int16& pwCount) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::GetAttributeIndices

    .method public hidebysig newslot virtual abstract 
            instance void  GetAttributeByIndexEx([in] unsigned int16 wStreamNum,
                                                 [in] unsigned int16 wIndex,
                                                 [out] string  marshal( lpwstr) pwszName,
                                                 [in][out] unsigned int16& pwNameLen,
                                                 [out] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE& pType,
                                                 [out] unsigned int16& pwLangIndex,
                                                 [out] unsigned int8& pValue,
                                                 [in][out] unsigned int32& pdwDataLength) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::GetAttributeByIndexEx

    .method public hidebysig newslot virtual abstract 
            instance void  ModifyAttribute([in] unsigned int16 wStreamNum,
                                           [in] unsigned int16 wIndex,
                                           [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                           [in] unsigned int16 wLangIndex,
                                           [in] unsigned int8& pValue,
                                           [in] unsigned int32 dwLength) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::ModifyAttribute

    .method public hidebysig newslot virtual abstract 
            instance void  AddAttribute([in] unsigned int16 wStreamNum,
                                        [in] string  marshal( lpwstr) pszName,
                                        [out] unsigned int16& pwIndex,
                                        [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE Type,
                                        [in] unsigned int16 wLangIndex,
                                        [in] unsigned int8& pValue,
                                        [in] unsigned int32 dwLength) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::AddAttribute

    .method public hidebysig newslot virtual abstract 
            instance void  DeleteAttribute([in] unsigned int16 wStreamNum,
                                           [in] unsigned int16 wIndex) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::DeleteAttribute

    .method public hidebysig newslot virtual abstract 
            instance void  AddCodecInfo([in] unsigned int16& pwszName,
                                        [in] unsigned int16& pwszDescription,
                                        [in] valuetype UW.CSE.ManagedWM.WMT_CODEC_INFO_TYPE codecType,
                                        [in] unsigned int16 cbCodecInfo,
                                        [in] unsigned int8& pbCodecInfo) runtime managed internalcall
    {
    } // end of method IWMHeaderInfo3::AddCodecInfo

  } // end of class IWMHeaderInfo3

  .class interface public abstract auto ansi import IWMProfileManager2
         implements UW.CSE.ManagedWM.IWMProfileManager
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 37 41 39 32 34 45 35 31 2D 37 33 43 31   // ..$7A924E51-73C1
                                                                                                    2D 34 39 34 44 2D 38 30 31 39 2D 32 33 44 33 37   // -494D-8019-23D37
                                                                                                    45 44 39 42 38 39 41 00 00 )                      // ED9B89A..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  CreateEmptyProfile([in] valuetype UW.CSE.ManagedWM.WMT_VERSION dwVersion,
                                              [out] class UW.CSE.ManagedWM.IWMProfile&  marshal( interface) ppProfile) runtime managed internalcall
    {
    } // end of method IWMProfileManager2::CreateEmptyProfile

    .method public hidebysig newslot virtual abstract 
            instance void  LoadProfileByID([in] valuetype UW.CSE.ManagedWM.GUID& guidProfile,
                                           [out] class UW.CSE.ManagedWM.IWMProfile&  marshal( interface) ppProfile) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMProfileManager2::LoadProfileByID

    .method public hidebysig newslot virtual abstract 
            instance void  LoadProfileByData([in] unsigned int16& pwszProfile,
                                             [out] class UW.CSE.ManagedWM.IWMProfile&  marshal( interface) ppProfile) runtime managed internalcall
    {
    } // end of method IWMProfileManager2::LoadProfileByData

    .method public hidebysig newslot virtual abstract 
            instance void  SaveProfile([in] class UW.CSE.ManagedWM.IWMProfile  marshal( interface) pIWMProfile,
                                       [in] unsigned int16& pwszProfile,
                                       [in][out] unsigned int32& pdwLength) runtime managed internalcall
    {
    } // end of method IWMProfileManager2::SaveProfile

    .method public hidebysig newslot virtual abstract 
            instance void  GetSystemProfileCount([out] unsigned int32& pcProfiles) runtime managed internalcall
    {
    } // end of method IWMProfileManager2::GetSystemProfileCount

    .method public hidebysig newslot virtual abstract 
            instance void  LoadSystemProfile([in] unsigned int32 dwProfileIndex,
                                             [out] class UW.CSE.ManagedWM.IWMProfile&  marshal( interface) ppProfile) runtime managed internalcall
    {
    } // end of method IWMProfileManager2::LoadSystemProfile

    .method public hidebysig newslot virtual abstract 
            instance void  GetSystemProfileVersion(valuetype UW.CSE.ManagedWM.WMT_VERSION& pdwVersion) runtime managed internalcall
    {
    } // end of method IWMProfileManager2::GetSystemProfileVersion

    .method public hidebysig newslot virtual abstract 
            instance void  SetSystemProfileVersion(valuetype UW.CSE.ManagedWM.WMT_VERSION dwVersion) runtime managed internalcall
    {
    } // end of method IWMProfileManager2::SetSystemProfileVersion

  } // end of class IWMProfileManager2

  .class interface public abstract auto ansi import IWMProfileManagerLanguage
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 42 41 34 44 43 43 37 38 2D 37 45 45 30   // ..$BA4DCC78-7EE0
                                                                                                    2D 34 41 42 38 2D 42 32 37 41 2D 44 42 43 45 38   // -4AB8-B27A-DBCE8
                                                                                                    42 43 35 31 34 35 34 00 00 )                      // BC51454..
    .method public hidebysig newslot virtual abstract 
            instance void  GetUserLanguageID(unsigned int16& wLangID) runtime managed internalcall
    {
    } // end of method IWMProfileManagerLanguage::GetUserLanguageID

    .method public hidebysig newslot virtual abstract 
            instance void  SetUserLanguageID(unsigned int16 wLangID) runtime managed internalcall
    {
    } // end of method IWMProfileManagerLanguage::SetUserLanguageID

  } // end of class IWMProfileManagerLanguage

  .class interface public abstract auto ansi import IWMProfile2
         implements UW.CSE.ManagedWM.IWMProfile
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 37 45 37 32 44 33 33 2D 44 39 34 45   // ..$07E72D33-D94E
                                                                                                    2D 34 42 45 37 2D 38 38 34 33 2D 36 30 41 45 35   // -4BE7-8843-60AE5
                                                                                                    46 46 37 45 35 46 35 00 00 )                      // FF7E5F5..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetVersion([out] valuetype UW.CSE.ManagedWM.WMT_VERSION& pdwVersion) runtime managed internalcall
    {
    } // end of method IWMProfile2::GetVersion

    .method public hidebysig newslot virtual abstract 
            instance void  GetName([out] unsigned int16& pwszName,
                                   [in][out] unsigned int32& pcchName) runtime managed internalcall
    {
    } // end of method IWMProfile2::GetName

    .method public hidebysig newslot virtual abstract 
            instance void  SetName([in] unsigned int16& pwszName) runtime managed internalcall
    {
    } // end of method IWMProfile2::SetName

    .method public hidebysig newslot virtual abstract 
            instance void  GetDescription([out] unsigned int16& pwszDescription,
                                          [in][out] unsigned int32& pcchDescription) runtime managed internalcall
    {
    } // end of method IWMProfile2::GetDescription

    .method public hidebysig newslot virtual abstract 
            instance void  SetDescription([in] unsigned int16& pwszDescription) runtime managed internalcall
    {
    } // end of method IWMProfile2::SetDescription

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamCount([out] unsigned int32& pcStreams) runtime managed internalcall
    {
    } // end of method IWMProfile2::GetStreamCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetStream([in] unsigned int32 dwStreamIndex,
                                     [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppConfig) runtime managed internalcall
    {
    } // end of method IWMProfile2::GetStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamByNumber([in] unsigned int16 wStreamNum,
                                             [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppConfig) runtime managed internalcall
    {
    } // end of method IWMProfile2::GetStreamByNumber

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveStream([in] class UW.CSE.ManagedWM.IWMStreamConfig  marshal( interface) pConfig) runtime managed internalcall
    {
    } // end of method IWMProfile2::RemoveStream

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveStreamByNumber([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMProfile2::RemoveStreamByNumber

    .method public hidebysig newslot virtual abstract 
            instance void  AddStream([in] class UW.CSE.ManagedWM.IWMStreamConfig  marshal( interface) pConfig) runtime managed internalcall
    {
    } // end of method IWMProfile2::AddStream

    .method public hidebysig newslot virtual abstract 
            instance void  ReconfigStream([in] class UW.CSE.ManagedWM.IWMStreamConfig  marshal( interface) pConfig) runtime managed internalcall
    {
    } // end of method IWMProfile2::ReconfigStream

    .method public hidebysig newslot virtual abstract 
            instance void  CreateNewStream([in] valuetype UW.CSE.ManagedWM.GUID& guidStreamType,
                                           [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppConfig) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMProfile2::CreateNewStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetMutualExclusionCount([out] unsigned int32& pcME) runtime managed internalcall
    {
    } // end of method IWMProfile2::GetMutualExclusionCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetMutualExclusion([in] unsigned int32 dwMEIndex,
                                              [out] class UW.CSE.ManagedWM.IWMMutualExclusion&  marshal( interface) ppME) runtime managed internalcall
    {
    } // end of method IWMProfile2::GetMutualExclusion

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveMutualExclusion([in] class UW.CSE.ManagedWM.IWMMutualExclusion  marshal( interface) pME) runtime managed internalcall
    {
    } // end of method IWMProfile2::RemoveMutualExclusion

    .method public hidebysig newslot virtual abstract 
            instance void  AddMutualExclusion([in] class UW.CSE.ManagedWM.IWMMutualExclusion  marshal( interface) pME) runtime managed internalcall
    {
    } // end of method IWMProfile2::AddMutualExclusion

    .method public hidebysig newslot virtual abstract 
            instance void  CreateNewMutualExclusion([out] class UW.CSE.ManagedWM.IWMMutualExclusion&  marshal( interface) ppME) runtime managed internalcall
    {
    } // end of method IWMProfile2::CreateNewMutualExclusion

    .method public hidebysig newslot virtual abstract 
            instance void  GetProfileID([out] valuetype UW.CSE.ManagedWM.GUID& pguidID) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMProfile2::GetProfileID

  } // end of class IWMProfile2

  .class interface public abstract auto ansi import IWMProfile3
         implements UW.CSE.ManagedWM.IWMProfile2
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 30 45 46 39 36 43 43 2D 41 34 36 31   // ..$00EF96CC-A461
                                                                                                    2D 34 35 34 36 2D 38 42 43 44 2D 43 39 41 32 38   // -4546-8BCD-C9A28
                                                                                                    46 30 45 30 36 46 35 00 00 )                      // F0E06F5..
    .method public hidebysig newslot virtual abstract 
            instance void  GetVersion([out] valuetype UW.CSE.ManagedWM.WMT_VERSION& pdwVersion) runtime managed internalcall
    {
    } // end of method IWMProfile3::GetVersion

    .method public hidebysig newslot virtual abstract 
            instance void  GetName([out] unsigned int16& pwszName,
                                   [in][out] unsigned int32& pcchName) runtime managed internalcall
    {
    } // end of method IWMProfile3::GetName

    .method public hidebysig newslot virtual abstract 
            instance void  SetName([in] unsigned int16& pwszName) runtime managed internalcall
    {
    } // end of method IWMProfile3::SetName

    .method public hidebysig newslot virtual abstract 
            instance void  GetDescription([out] unsigned int16& pwszDescription,
                                          [in][out] unsigned int32& pcchDescription) runtime managed internalcall
    {
    } // end of method IWMProfile3::GetDescription

    .method public hidebysig newslot virtual abstract 
            instance void  SetDescription([in] unsigned int16& pwszDescription) runtime managed internalcall
    {
    } // end of method IWMProfile3::SetDescription

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamCount([out] unsigned int32& pcStreams) runtime managed internalcall
    {
    } // end of method IWMProfile3::GetStreamCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetStream([in] unsigned int32 dwStreamIndex,
                                     [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppConfig) runtime managed internalcall
    {
    } // end of method IWMProfile3::GetStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamByNumber([in] unsigned int16 wStreamNum,
                                             [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppConfig) runtime managed internalcall
    {
    } // end of method IWMProfile3::GetStreamByNumber

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveStream([in] class UW.CSE.ManagedWM.IWMStreamConfig  marshal( interface) pConfig) runtime managed internalcall
    {
    } // end of method IWMProfile3::RemoveStream

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveStreamByNumber([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMProfile3::RemoveStreamByNumber

    .method public hidebysig newslot virtual abstract 
            instance void  AddStream([in] class UW.CSE.ManagedWM.IWMStreamConfig  marshal( interface) pConfig) runtime managed internalcall
    {
    } // end of method IWMProfile3::AddStream

    .method public hidebysig newslot virtual abstract 
            instance void  ReconfigStream([in] class UW.CSE.ManagedWM.IWMStreamConfig  marshal( interface) pConfig) runtime managed internalcall
    {
    } // end of method IWMProfile3::ReconfigStream

    .method public hidebysig newslot virtual abstract 
            instance void  CreateNewStream([in] valuetype UW.CSE.ManagedWM.GUID& guidStreamType,
                                           [out] class UW.CSE.ManagedWM.IWMStreamConfig&  marshal( interface) ppConfig) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMProfile3::CreateNewStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetMutualExclusionCount([out] unsigned int32& pcME) runtime managed internalcall
    {
    } // end of method IWMProfile3::GetMutualExclusionCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetMutualExclusion([in] unsigned int32 dwMEIndex,
                                              [out] class UW.CSE.ManagedWM.IWMMutualExclusion&  marshal( interface) ppME) runtime managed internalcall
    {
    } // end of method IWMProfile3::GetMutualExclusion

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveMutualExclusion([in] class UW.CSE.ManagedWM.IWMMutualExclusion  marshal( interface) pME) runtime managed internalcall
    {
    } // end of method IWMProfile3::RemoveMutualExclusion

    .method public hidebysig newslot virtual abstract 
            instance void  AddMutualExclusion([in] class UW.CSE.ManagedWM.IWMMutualExclusion  marshal( interface) pME) runtime managed internalcall
    {
    } // end of method IWMProfile3::AddMutualExclusion

    .method public hidebysig newslot virtual abstract 
            instance void  CreateNewMutualExclusion([out] class UW.CSE.ManagedWM.IWMMutualExclusion&  marshal( interface) ppME) runtime managed internalcall
    {
    } // end of method IWMProfile3::CreateNewMutualExclusion

    .method public hidebysig newslot virtual abstract 
            instance void  GetProfileID([out] valuetype UW.CSE.ManagedWM.GUID& pguidID) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMProfile3::GetProfileID

    .method public hidebysig newslot virtual abstract 
            instance void  GetStorageFormat([out] valuetype UW.CSE.ManagedWM.tagWMT_STORAGE_FORMAT& pnStorageFormat) runtime managed internalcall
    {
    } // end of method IWMProfile3::GetStorageFormat

    .method public hidebysig newslot virtual abstract 
            instance void  SetStorageFormat([in] valuetype UW.CSE.ManagedWM.tagWMT_STORAGE_FORMAT nStorageFormat) runtime managed internalcall
    {
    } // end of method IWMProfile3::SetStorageFormat

    .method public hidebysig newslot virtual abstract 
            instance void  GetBandwidthSharingCount([out] unsigned int32& pcBS) runtime managed internalcall
    {
    } // end of method IWMProfile3::GetBandwidthSharingCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetBandwidthSharing([in] unsigned int32 dwBSIndex,
                                               [out] class UW.CSE.ManagedWM.IWMBandwidthSharing&  marshal( interface) ppBS) runtime managed internalcall
    {
    } // end of method IWMProfile3::GetBandwidthSharing

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveBandwidthSharing([in] class UW.CSE.ManagedWM.IWMBandwidthSharing  marshal( interface) pBS) runtime managed internalcall
    {
    } // end of method IWMProfile3::RemoveBandwidthSharing

    .method public hidebysig newslot virtual abstract 
            instance void  AddBandwidthSharing([in] class UW.CSE.ManagedWM.IWMBandwidthSharing  marshal( interface) pBS) runtime managed internalcall
    {
    } // end of method IWMProfile3::AddBandwidthSharing

    .method public hidebysig newslot virtual abstract 
            instance void  CreateNewBandwidthSharing([out] class UW.CSE.ManagedWM.IWMBandwidthSharing&  marshal( interface) ppBS) runtime managed internalcall
    {
    } // end of method IWMProfile3::CreateNewBandwidthSharing

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamPrioritization([out] class UW.CSE.ManagedWM.IWMStreamPrioritization&  marshal( interface) ppSP) runtime managed internalcall
    {
    } // end of method IWMProfile3::GetStreamPrioritization

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamPrioritization([in] class UW.CSE.ManagedWM.IWMStreamPrioritization  marshal( interface) pSP) runtime managed internalcall
    {
    } // end of method IWMProfile3::SetStreamPrioritization

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveStreamPrioritization() runtime managed internalcall
    {
    } // end of method IWMProfile3::RemoveStreamPrioritization

    .method public hidebysig newslot virtual abstract 
            instance void  CreateNewStreamPrioritization([out] class UW.CSE.ManagedWM.IWMStreamPrioritization&  marshal( interface) ppSP) runtime managed internalcall
    {
    } // end of method IWMProfile3::CreateNewStreamPrioritization

    .method public hidebysig newslot virtual abstract 
            instance void  GetExpectedPacketCount([in] unsigned int64 msDuration,
                                                  [out] unsigned int64& pcPackets) runtime managed internalcall
    {
    } // end of method IWMProfile3::GetExpectedPacketCount

  } // end of class IWMProfile3

  .class interface public abstract auto ansi import IWMStreamConfig2
         implements UW.CSE.ManagedWM.IWMStreamConfig
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 37 36 38 38 44 38 43 42 2D 46 43 30 44   // ..$7688D8CB-FC0D
                                                                                                    2D 34 33 42 44 2D 39 34 35 39 2D 35 41 38 44 45   // -43BD-9459-5A8DE
                                                                                                    43 32 30 30 43 46 41 00 00 )                      // C200CFA..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamType([out] valuetype UW.CSE.ManagedWM.GUID& pguidStreamType) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMStreamConfig2::GetStreamType

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamNumber([out] unsigned int16& pwStreamNum) runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::GetStreamNumber

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamNumber([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::SetStreamNumber

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamName([out] unsigned int16& pwszStreamName,
                                         [in][out] unsigned int16& pcchStreamName) runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::GetStreamName

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamName([in] unsigned int16& pwszStreamName) runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::SetStreamName

    .method public hidebysig newslot virtual abstract 
            instance void  GetConnectionName([out] unsigned int16& pwszInputName,
                                             [in][out] unsigned int16& pcchInputName) runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::GetConnectionName

    .method public hidebysig newslot virtual abstract 
            instance void  SetConnectionName([in] unsigned int16& pwszInputName) runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::SetConnectionName

    .method public hidebysig newslot virtual abstract 
            instance void  GetBitrate([out] unsigned int32& pdwBitrate) runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::GetBitrate

    .method public hidebysig newslot virtual abstract 
            instance void  SetBitrate([in] unsigned int32 pdwBitrate) runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::SetBitrate

    .method public hidebysig newslot virtual abstract 
            instance void  GetBufferWindow([out] unsigned int32& pmsBufferWindow) runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::GetBufferWindow

    .method public hidebysig newslot virtual abstract 
            instance void  SetBufferWindow([in] unsigned int32 msBufferWindow) runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::SetBufferWindow

    .method public hidebysig newslot virtual abstract 
            instance void  GetTransportType([out] valuetype UW.CSE.ManagedWM.tagWMT_TRANSPORT_TYPE& pnTransportType) runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::GetTransportType

    .method public hidebysig newslot virtual abstract 
            instance void  SetTransportType([in] valuetype UW.CSE.ManagedWM.tagWMT_TRANSPORT_TYPE nTransportType) runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::SetTransportType

    .method public hidebysig newslot virtual abstract 
            instance void  AddDataUnitExtension([in] valuetype UW.CSE.ManagedWM.GUID guidExtensionSystemID,
                                                [in] unsigned int16 cbExtensionDataSize,
                                                [in] unsigned int8& pbExtensionSystemInfo,
                                                [in] unsigned int32 cbExtensionSystemInfo) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMStreamConfig2::AddDataUnitExtension

    .method public hidebysig newslot virtual abstract 
            instance void  GetDataUnitExtensionCount([out] unsigned int16& pcDataUnitExtensions) runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::GetDataUnitExtensionCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetDataUnitExtension([in] unsigned int16 wDataUnitExtensionNumber,
                                                [out] valuetype UW.CSE.ManagedWM.GUID& pguidExtensionSystemID,
                                                [out] unsigned int16& pcbExtensionDataSize,
                                                [out] unsigned int8& pbExtensionSystemInfo,
                                                [in][out] unsigned int32& pcbExtensionSystemInfo) runtime managed internalcall
    {
      .param [2]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMStreamConfig2::GetDataUnitExtension

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveAllDataUnitExtensions() runtime managed internalcall
    {
    } // end of method IWMStreamConfig2::RemoveAllDataUnitExtensions

  } // end of class IWMStreamConfig2

  .class interface public abstract auto ansi import IWMStreamConfig3
         implements UW.CSE.ManagedWM.IWMStreamConfig2
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 42 31 36 34 31 30 34 2D 33 41 41 39   // ..$CB164104-3AA9
                                                                                                    2D 34 35 41 37 2D 39 41 43 39 2D 34 44 41 45 45   // -45A7-9AC9-4DAEE
                                                                                                    31 33 31 44 36 45 31 00 00 )                      // 131D6E1..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamType([out] valuetype UW.CSE.ManagedWM.GUID& pguidStreamType) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMStreamConfig3::GetStreamType

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamNumber([out] unsigned int16& pwStreamNum) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::GetStreamNumber

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamNumber([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::SetStreamNumber

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamName([out] unsigned int16& pwszStreamName,
                                         [in][out] unsigned int16& pcchStreamName) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::GetStreamName

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamName([in] unsigned int16& pwszStreamName) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::SetStreamName

    .method public hidebysig newslot virtual abstract 
            instance void  GetConnectionName([out] unsigned int16& pwszInputName,
                                             [in][out] unsigned int16& pcchInputName) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::GetConnectionName

    .method public hidebysig newslot virtual abstract 
            instance void  SetConnectionName([in] unsigned int16& pwszInputName) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::SetConnectionName

    .method public hidebysig newslot virtual abstract 
            instance void  GetBitrate([out] unsigned int32& pdwBitrate) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::GetBitrate

    .method public hidebysig newslot virtual abstract 
            instance void  SetBitrate([in] unsigned int32 pdwBitrate) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::SetBitrate

    .method public hidebysig newslot virtual abstract 
            instance void  GetBufferWindow([out] unsigned int32& pmsBufferWindow) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::GetBufferWindow

    .method public hidebysig newslot virtual abstract 
            instance void  SetBufferWindow([in] unsigned int32 msBufferWindow) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::SetBufferWindow

    .method public hidebysig newslot virtual abstract 
            instance void  GetTransportType([out] valuetype UW.CSE.ManagedWM.tagWMT_TRANSPORT_TYPE& pnTransportType) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::GetTransportType

    .method public hidebysig newslot virtual abstract 
            instance void  SetTransportType([in] valuetype UW.CSE.ManagedWM.tagWMT_TRANSPORT_TYPE nTransportType) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::SetTransportType

    .method public hidebysig newslot virtual abstract 
            instance void  AddDataUnitExtension([in] valuetype UW.CSE.ManagedWM.GUID guidExtensionSystemID,
                                                [in] unsigned int16 cbExtensionDataSize,
                                                [in] unsigned int8& pbExtensionSystemInfo,
                                                [in] unsigned int32 cbExtensionSystemInfo) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMStreamConfig3::AddDataUnitExtension

    .method public hidebysig newslot virtual abstract 
            instance void  GetDataUnitExtensionCount([out] unsigned int16& pcDataUnitExtensions) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::GetDataUnitExtensionCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetDataUnitExtension([in] unsigned int16 wDataUnitExtensionNumber,
                                                [out] valuetype UW.CSE.ManagedWM.GUID& pguidExtensionSystemID,
                                                [out] unsigned int16& pcbExtensionDataSize,
                                                [out] unsigned int8& pbExtensionSystemInfo,
                                                [in][out] unsigned int32& pcbExtensionSystemInfo) runtime managed internalcall
    {
      .param [2]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMStreamConfig3::GetDataUnitExtension

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveAllDataUnitExtensions() runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::RemoveAllDataUnitExtensions

    .method public hidebysig newslot virtual abstract 
            instance void  GetLanguage([out] unsigned int16& pwszLanguageString,
                                       [in][out] unsigned int16& pcchLanguageStringLength) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::GetLanguage

    .method public hidebysig newslot virtual abstract 
            instance void  SetLanguage([in] string  marshal( lpwstr) pwszLanguageString) runtime managed internalcall
    {
    } // end of method IWMStreamConfig3::SetLanguage

  } // end of class IWMStreamConfig3

  .class interface public abstract auto ansi import IWMMutualExclusion2
         implements UW.CSE.ManagedWM.IWMMutualExclusion
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 33 30 32 42 35 37 44 2D 38 39 44 31   // ..$0302B57D-89D1
                                                                                                    2D 34 42 41 32 2D 38 35 43 39 2D 31 36 36 46 32   // -4BA2-85C9-166F2
                                                                                                    43 35 33 45 42 39 31 00 00 )                      // C53EB91..
    .method public hidebysig newslot virtual abstract 
            instance void  GetStreams([out] unsigned int16& pwStreamNumArray,
                                      [in][out] unsigned int16& pcStreams) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion2::GetStreams

    .method public hidebysig newslot virtual abstract 
            instance void  AddStream([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion2::AddStream

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveStream([in] unsigned int16 wStreamNum) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion2::RemoveStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetType([out] valuetype UW.CSE.ManagedWM.GUID& pguidType) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMMutualExclusion2::GetType

    .method public hidebysig newslot virtual abstract 
            instance void  SetType([in] valuetype UW.CSE.ManagedWM.GUID& guidType) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMMutualExclusion2::SetType

    .method public hidebysig newslot virtual abstract 
            instance void  GetName([out] unsigned int16& pwszName,
                                   [in][out] unsigned int16& pcchName) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion2::GetName

    .method public hidebysig newslot virtual abstract 
            instance void  SetName([in] unsigned int16& pwszName) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion2::SetName

    .method public hidebysig newslot virtual abstract 
            instance void  GetRecordCount([out] unsigned int16& pwRecordCount) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion2::GetRecordCount

    .method public hidebysig newslot virtual abstract 
            instance void  AddRecord() runtime managed internalcall
    {
    } // end of method IWMMutualExclusion2::AddRecord

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveRecord([in] unsigned int16 wRecordNumber) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion2::RemoveRecord

    .method public hidebysig newslot virtual abstract 
            instance void  GetRecordName([in] unsigned int16 wRecordNumber,
                                         [out] unsigned int16& pwszRecordName,
                                         [in][out] unsigned int16& pcchRecordName) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion2::GetRecordName

    .method public hidebysig newslot virtual abstract 
            instance void  SetRecordName([in] unsigned int16 wRecordNumber,
                                         [in] unsigned int16& pwszRecordName) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion2::SetRecordName

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamsForRecord([in] unsigned int16 wRecordNumber,
                                               [out] unsigned int16& pwStreamNumArray,
                                               [in][out] unsigned int16& pcStreams) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion2::GetStreamsForRecord

    .method public hidebysig newslot virtual abstract 
            instance void  AddStreamForRecord([in] unsigned int16 wRecordNumber,
                                              [in] unsigned int16 wStreamNumber) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion2::AddStreamForRecord

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveStreamForRecord([in] unsigned int16 wRecordNumber,
                                                 [in] unsigned int16 wStreamNumber) runtime managed internalcall
    {
    } // end of method IWMMutualExclusion2::RemoveStreamForRecord

  } // end of class IWMMutualExclusion2

  .class interface public abstract auto ansi import IWMWriterPostViewCallback
         implements UW.CSE.ManagedWM.IWMStatusCallback
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 39 44 36 35 34 39 44 2D 41 31 39 33   // ..$D9D6549D-A193
                                                                                                    2D 34 46 32 34 2D 42 33 30 38 2D 30 33 31 32 33   // -4F24-B308-03123
                                                                                                    44 39 42 37 46 38 44 00 00 )                      // D9B7F8D..
    .method public hidebysig newslot virtual abstract 
            instance void  OnStatus([in] valuetype UW.CSE.ManagedWM.WMT_STATUS Status,
                                    [in] int32  marshal( error) hr,
                                    [in] valuetype UW.CSE.ManagedWM.WMT_ATTR_DATATYPE dwType,
                                    [in] unsigned int8& pValue,
                                    [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMWriterPostViewCallback::OnStatus

    .method public hidebysig newslot virtual abstract 
            instance void  OnPostViewSample([in] unsigned int16 wStreamNumber,
                                            [in] unsigned int64 cnsSampleTime,
                                            [in] unsigned int64 cnsSampleDuration,
                                            [in] unsigned int32 dwFlags,
                                            [in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pSample,
                                            [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMWriterPostViewCallback::OnPostViewSample

    .method public hidebysig newslot virtual abstract 
            instance void  AllocateForPostView([in] unsigned int16 wStreamNum,
                                               [in] unsigned int32 cbBuffer,
                                               [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppBuffer,
                                               [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMWriterPostViewCallback::AllocateForPostView

  } // end of class IWMWriterPostViewCallback

  .class interface public abstract auto ansi import IWMWriterPostView
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 31 45 32 30 43 45 34 2D 37 35 45 46   // ..$81E20CE4-75EF
                                                                                                    2D 34 39 31 41 2D 38 30 30 34 2D 46 43 35 33 43   // -491A-8004-FC53C
                                                                                                    34 35 42 44 43 33 45 00 00 )                      // 45BDC3E..
    .method public hidebysig newslot virtual abstract 
            instance void  SetPostViewCallback(class UW.CSE.ManagedWM.IWMWriterPostViewCallback  marshal( interface) pCallback,
                                               native int pvContext) runtime managed internalcall
    {
    } // end of method IWMWriterPostView::SetPostViewCallback

    .method public hidebysig newslot virtual abstract 
            instance void  SetReceivePostViewSamples([in] unsigned int16 wStreamNum,
                                                     [in] int32 fReceivePostViewSamples) runtime managed internalcall
    {
    } // end of method IWMWriterPostView::SetReceivePostViewSamples

    .method public hidebysig newslot virtual abstract 
            instance void  GetReceivePostViewSamples([in] unsigned int16 wStreamNum,
                                                     [out] int32& pfReceivePostViewSamples) runtime managed internalcall
    {
    } // end of method IWMWriterPostView::GetReceivePostViewSamples

    .method public hidebysig newslot virtual abstract 
            instance void  GetPostViewProps([in] unsigned int16 wStreamNumber,
                                            [out] class UW.CSE.ManagedWM.IWMMediaProps&  marshal( interface) ppOutput) runtime managed internalcall
    {
    } // end of method IWMWriterPostView::GetPostViewProps

    .method public hidebysig newslot virtual abstract 
            instance void  SetPostViewProps([in] unsigned int16 wStreamNumber,
                                            [in] class UW.CSE.ManagedWM.IWMMediaProps  marshal( interface) pOutput) runtime managed internalcall
    {
    } // end of method IWMWriterPostView::SetPostViewProps

    .method public hidebysig newslot virtual abstract 
            instance void  GetPostViewFormatCount([in] unsigned int16 wStreamNumber,
                                                  [out] unsigned int32& pcFormats) runtime managed internalcall
    {
    } // end of method IWMWriterPostView::GetPostViewFormatCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetPostViewFormat([in] unsigned int16 wStreamNumber,
                                             [in] unsigned int32 dwFormatNumber,
                                             [out] class UW.CSE.ManagedWM.IWMMediaProps&  marshal( interface) ppProps) runtime managed internalcall
    {
    } // end of method IWMWriterPostView::GetPostViewFormat

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllocateForPostView([in] unsigned int16 wStreamNumber,
                                                  [in] int32 fAllocate) runtime managed internalcall
    {
    } // end of method IWMWriterPostView::SetAllocateForPostView

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocateForPostView([in] unsigned int16 wStreamNumber,
                                                  [out] int32& pfAllocate) runtime managed internalcall
    {
    } // end of method IWMWriterPostView::GetAllocateForPostView

  } // end of class IWMWriterPostView

  .class interface public abstract auto ansi import IWMRegisterCallback
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 46 34 42 31 46 39 39 2D 34 44 45 32   // ..$CF4B1F99-4DE2
                                                                                                    2D 34 45 34 39 2D 41 33 36 33 2D 32 35 32 37 34   // -4E49-A363-25274
                                                                                                    30 44 39 39 42 43 31 00 00 )                      // 0D99BC1..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  Advise([in] class UW.CSE.ManagedWM.IWMStatusCallback  marshal( interface) pCallback,
                                  [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMRegisterCallback::Advise

    .method public hidebysig newslot virtual abstract 
            instance void  Unadvise([in] class UW.CSE.ManagedWM.IWMStatusCallback  marshal( interface) pCallback,
                                    [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMRegisterCallback::Unadvise

  } // end of class IWMRegisterCallback

  .class interface public abstract auto ansi import IWMWriterFileSink2
         implements UW.CSE.ManagedWM.IWMWriterFileSink
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 31 34 32 38 32 42 41 37 2D 34 41 45 46   // ..$14282BA7-4AEF
                                                                                                    2D 34 32 30 35 2D 38 43 45 35 2D 43 32 32 39 30   // -4205-8CE5-C2290
                                                                                                    33 35 41 30 35 42 43 00 00 )                      // 35A05BC..
    .method public hidebysig newslot virtual abstract 
            instance void  OnHeader([in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pHeader) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink2::OnHeader

    .method public hidebysig newslot virtual abstract 
            instance void  IsRealTime([out] int32& pfRealTime) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink2::IsRealTime

    .method public hidebysig newslot virtual abstract 
            instance void  AllocateDataUnit([in] unsigned int32 cbDataUnit,
                                            [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppDataUnit) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink2::AllocateDataUnit

    .method public hidebysig newslot virtual abstract 
            instance void  OnDataUnit([in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pDataUnit) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink2::OnDataUnit

    .method public hidebysig newslot virtual abstract 
            instance void  OnEndWriting() runtime managed internalcall
    {
    } // end of method IWMWriterFileSink2::OnEndWriting

    .method public hidebysig newslot virtual abstract 
            instance void  Open([in] unsigned int16& pwszFilename) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink2::Open

    .method public hidebysig newslot virtual abstract 
            instance void  Start([in] unsigned int64 cnsStartTime) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink2::Start

    .method public hidebysig newslot virtual abstract 
            instance void  Stop([in] unsigned int64 cnsStopTime) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink2::Stop

    .method public hidebysig newslot virtual abstract 
            instance void  IsStopped([out] int32& pfStopped) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink2::IsStopped

    .method public hidebysig newslot virtual abstract 
            instance void  GetFileDuration([out] unsigned int64& pcnsDuration) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink2::GetFileDuration

    .method public hidebysig newslot virtual abstract 
            instance void  GetFileSize([out] unsigned int64& pcbFile) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink2::GetFileSize

    .method public hidebysig newslot virtual abstract 
            instance void  Close() runtime managed internalcall
    {
    } // end of method IWMWriterFileSink2::Close

    .method public hidebysig newslot virtual abstract 
            instance void  IsClosed([out] int32& pfClosed) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink2::IsClosed

  } // end of class IWMWriterFileSink2

  .class interface public abstract auto ansi import IWMWriterFileSink3
         implements UW.CSE.ManagedWM.IWMWriterFileSink2
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 46 45 41 34 46 45 42 2D 32 39 34 35   // ..$3FEA4FEB-2945
                                                                                                    2D 34 37 41 37 2D 41 31 44 44 2D 43 35 33 41 38   // -47A7-A1DD-C53A8
                                                                                                    46 43 34 43 34 35 43 00 00 )                      // FC4C45C..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  OnHeader([in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pHeader) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::OnHeader

    .method public hidebysig newslot virtual abstract 
            instance void  IsRealTime([out] int32& pfRealTime) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::IsRealTime

    .method public hidebysig newslot virtual abstract 
            instance void  AllocateDataUnit([in] unsigned int32 cbDataUnit,
                                            [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppDataUnit) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::AllocateDataUnit

    .method public hidebysig newslot virtual abstract 
            instance void  OnDataUnit([in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pDataUnit) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::OnDataUnit

    .method public hidebysig newslot virtual abstract 
            instance void  OnEndWriting() runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::OnEndWriting

    .method public hidebysig newslot virtual abstract 
            instance void  Open([in] unsigned int16& pwszFilename) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::Open

    .method public hidebysig newslot virtual abstract 
            instance void  Start([in] unsigned int64 cnsStartTime) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::Start

    .method public hidebysig newslot virtual abstract 
            instance void  Stop([in] unsigned int64 cnsStopTime) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::Stop

    .method public hidebysig newslot virtual abstract 
            instance void  IsStopped([out] int32& pfStopped) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::IsStopped

    .method public hidebysig newslot virtual abstract 
            instance void  GetFileDuration([out] unsigned int64& pcnsDuration) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::GetFileDuration

    .method public hidebysig newslot virtual abstract 
            instance void  GetFileSize([out] unsigned int64& pcbFile) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::GetFileSize

    .method public hidebysig newslot virtual abstract 
            instance void  Close() runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::Close

    .method public hidebysig newslot virtual abstract 
            instance void  IsClosed([out] int32& pfClosed) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::IsClosed

    .method public hidebysig newslot virtual abstract 
            instance void  SetAutoIndexing([in] int32 fDoAutoIndexing) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::SetAutoIndexing

    .method public hidebysig newslot virtual abstract 
            instance void  GetAutoIndexing([out] int32& pfAutoIndexing) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::GetAutoIndexing

    .method public hidebysig newslot virtual abstract 
            instance void  SetControlStream([in] unsigned int16 wStreamNumber,
                                            [in] int32 fShouldControlStartAndStop) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::SetControlStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetMode([out] unsigned int32& pdwFileSinkMode) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::GetMode

    .method public hidebysig newslot virtual abstract 
            instance void  OnDataUnitEx([in] valuetype UW.CSE.ManagedWM._WMT_FILESINK_DATA_UNIT& pFileSinkDataUnit) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::OnDataUnitEx

    .method public hidebysig newslot virtual abstract 
            instance void  SetUnbufferedIO([in] int32 fUnbufferedIO,
                                           [in] int32 fRestrictMemUsage) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::SetUnbufferedIO

    .method public hidebysig newslot virtual abstract 
            instance void  GetUnbufferedIO([out] int32& pfUnbufferedIO) runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::GetUnbufferedIO

    .method public hidebysig newslot virtual abstract 
            instance void  CompleteOperations() runtime managed internalcall
    {
    } // end of method IWMWriterFileSink3::CompleteOperations

  } // end of class IWMWriterFileSink3

  .class interface public abstract auto ansi import IWMClientConnections
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 37 33 43 36 36 30 31 30 2D 41 32 39 39   // ..$73C66010-A299
                                                                                                    2D 34 31 44 46 2D 42 31 46 30 2D 43 43 46 30 33   // -41DF-B1F0-CCF03
                                                                                                    42 30 39 43 31 43 36 00 00 )                      // B09C1C6..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetClientCount([out] unsigned int32& pcClients) runtime managed internalcall
    {
    } // end of method IWMClientConnections::GetClientCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetClientProperties([in] unsigned int32 dwClientNum,
                                               [out] valuetype UW.CSE.ManagedWM._WMClientProperties& pClientProperties) runtime managed internalcall
    {
    } // end of method IWMClientConnections::GetClientProperties

  } // end of class IWMClientConnections

  .class interface public abstract auto ansi import IWMClientConnections2
         implements UW.CSE.ManagedWM.IWMClientConnections
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 34 30 39 31 35 37 31 45 2D 34 37 30 31   // ..$4091571E-4701
                                                                                                    2D 34 35 39 33 2D 42 42 33 44 2D 44 35 46 35 46   // -4593-BB3D-D5F5F
                                                                                                    30 43 37 34 32 34 36 00 00 )                      // 0C74246..
    .method public hidebysig newslot virtual abstract 
            instance void  GetClientCount([out] unsigned int32& pcClients) runtime managed internalcall
    {
    } // end of method IWMClientConnections2::GetClientCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetClientProperties([in] unsigned int32 dwClientNum,
                                               [out] valuetype UW.CSE.ManagedWM._WMClientProperties& pClientProperties) runtime managed internalcall
    {
    } // end of method IWMClientConnections2::GetClientProperties

    .method public hidebysig newslot virtual abstract 
            instance void  GetClientInfo([in] unsigned int32 dwClientNum,
                                         [out] unsigned int16& pwszNetworkAddress,
                                         [in][out] unsigned int32& pcchNetworkAddress,
                                         [out] unsigned int16& pwszPort,
                                         [in][out] unsigned int32& pcchPort,
                                         [out] unsigned int16& pwszDNSName,
                                         [in][out] unsigned int32& pcchDNSName) runtime managed internalcall
    {
    } // end of method IWMClientConnections2::GetClientInfo

  } // end of class IWMClientConnections2

  .class interface public abstract auto ansi import IWMReaderTypeNegotiation
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 46 44 42 45 35 35 39 32 2D 38 31 41 31   // ..$FDBE5592-81A1
                                                                                                    2D 34 31 45 41 2D 39 33 42 44 2D 37 33 35 43 41   // -41EA-93BD-735CA
                                                                                                    44 31 41 44 43 30 35 00 00 )                      // D1ADC05..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  TryOutputProps([in] unsigned int32 dwOutputNum,
                                          [in] class UW.CSE.ManagedWM.IWMOutputMediaProps  marshal( interface) pOutput) runtime managed internalcall
    {
    } // end of method IWMReaderTypeNegotiation::TryOutputProps

  } // end of class IWMReaderTypeNegotiation

  .class interface public abstract auto ansi import IWMReaderStreamClock
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 36 34 30 36 42 45 44 2D 32 42 32 42   // ..$96406BED-2B2B
                                                                                                    2D 31 31 44 33 2D 42 33 36 42 2D 30 30 43 30 34   // -11D3-B36B-00C04
                                                                                                    46 36 31 30 38 46 46 00 00 )                      // F6108FF..
    .method public hidebysig newslot virtual abstract 
            instance void  GetTime([in] unsigned int64& pcnsNow) runtime managed internalcall
    {
    } // end of method IWMReaderStreamClock::GetTime

    .method public hidebysig newslot virtual abstract 
            instance void  SetTimer([in] unsigned int64 cnsWhen,
                                    [in] native int pvParam,
                                    [out] unsigned int32& pdwTimerId) runtime managed internalcall
    {
    } // end of method IWMReaderStreamClock::SetTimer

    .method public hidebysig newslot virtual abstract 
            instance void  KillTimer([in] unsigned int32 dwTimerId) runtime managed internalcall
    {
    } // end of method IWMReaderStreamClock::KillTimer

  } // end of class IWMReaderStreamClock

  .class interface public abstract auto ansi import IWMIndexer
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 44 37 43 44 43 37 31 2D 39 38 38 38   // ..$6D7CDC71-9888
                                                                                                    2D 31 31 44 33 2D 38 45 44 43 2D 30 30 43 30 34   // -11D3-8EDC-00C04
                                                                                                    46 36 31 30 39 43 46 00 00 )                      // F6109CF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  StartIndexing([in] unsigned int16& pwszURL,
                                         [in] class UW.CSE.ManagedWM.IWMStatusCallback  marshal( interface) pCallback,
                                         [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMIndexer::StartIndexing

    .method public hidebysig newslot virtual abstract 
            instance void  Cancel() runtime managed internalcall
    {
    } // end of method IWMIndexer::Cancel

  } // end of class IWMIndexer

  .class interface public abstract auto ansi import IWMIndexer2
         implements UW.CSE.ManagedWM.IWMIndexer
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 42 37 30 46 31 45 34 32 2D 36 32 35 35   // ..$B70F1E42-6255
                                                                                                    2D 34 44 46 30 2D 41 36 42 39 2D 30 32 42 32 31   // -4DF0-A6B9-02B21
                                                                                                    32 44 39 45 32 42 42 00 00 )                      // 2D9E2BB..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  StartIndexing([in] unsigned int16& pwszURL,
                                         [in] class UW.CSE.ManagedWM.IWMStatusCallback  marshal( interface) pCallback,
                                         [in] native int pvContext) runtime managed internalcall
    {
    } // end of method IWMIndexer2::StartIndexing

    .method public hidebysig newslot virtual abstract 
            instance void  Cancel() runtime managed internalcall
    {
    } // end of method IWMIndexer2::Cancel

    .method public hidebysig newslot virtual abstract 
            instance void  Configure([in] unsigned int16 wStreamNum,
                                     [in] valuetype UW.CSE.ManagedWM.tagWMT_INDEXER_TYPE nIndexerType,
                                     [in] native int pvInterval,
                                     [in] native int pvIndexType) runtime managed internalcall
    {
    } // end of method IWMIndexer2::Configure

  } // end of class IWMIndexer2

  .class interface public abstract auto ansi import IWMWriterPushSink
         implements UW.CSE.ManagedWM.IWMWriterSink
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 43 31 30 45 36 41 35 2D 30 37 32 43   // ..$DC10E6A5-072C
                                                                                                    2D 34 36 37 44 2D 42 46 35 37 2D 36 33 33 30 41   // -467D-BF57-6330A
                                                                                                    39 44 44 45 31 32 41 00 00 )                      // 9DDE12A..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  OnHeader([in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pHeader) runtime managed internalcall
    {
    } // end of method IWMWriterPushSink::OnHeader

    .method public hidebysig newslot virtual abstract 
            instance void  IsRealTime([out] int32& pfRealTime) runtime managed internalcall
    {
    } // end of method IWMWriterPushSink::IsRealTime

    .method public hidebysig newslot virtual abstract 
            instance void  AllocateDataUnit([in] unsigned int32 cbDataUnit,
                                            [out] class UW.CSE.ManagedWM.INSSBuffer&  marshal( interface) ppDataUnit) runtime managed internalcall
    {
    } // end of method IWMWriterPushSink::AllocateDataUnit

    .method public hidebysig newslot virtual abstract 
            instance void  OnDataUnit([in] class UW.CSE.ManagedWM.INSSBuffer  marshal( interface) pDataUnit) runtime managed internalcall
    {
    } // end of method IWMWriterPushSink::OnDataUnit

    .method public hidebysig newslot virtual abstract 
            instance void  OnEndWriting() runtime managed internalcall
    {
    } // end of method IWMWriterPushSink::OnEndWriting

    .method public hidebysig newslot virtual abstract 
            instance void  Connect([in] string  marshal( lpwstr) pwszURL,
                                   [in] string  marshal( lpwstr) pwszTemplateURL,
                                   [in] int32 fAutoDestroy) runtime managed internalcall
    {
    } // end of method IWMWriterPushSink::Connect

    .method public hidebysig newslot virtual abstract 
            instance void  Disconnect() runtime managed internalcall
    {
    } // end of method IWMWriterPushSink::Disconnect

    .method public hidebysig newslot virtual abstract 
            instance void  EndSession() runtime managed internalcall
    {
    } // end of method IWMWriterPushSink::EndSession

  } // end of class IWMWriterPushSink

  .class interface public abstract auto ansi import IWMWatermarkInfo
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 46 34 39 37 30 36 32 2D 46 32 45 32   // ..$6F497062-F2E2
                                                                                                    2D 34 36 32 34 2D 38 45 41 37 2D 39 44 44 34 30   // -4624-8EA7-9DD40
                                                                                                    44 38 31 46 43 38 44 00 00 )                      // D81FC8D..
    .method public hidebysig newslot virtual abstract 
            instance void  GetWatermarkEntryCount([in] valuetype UW.CSE.ManagedWM.tagWMT_WATERMARK_ENTRY_TYPE wmetType,
                                                  [out] unsigned int32& pdwCount) runtime managed internalcall
    {
    } // end of method IWMWatermarkInfo::GetWatermarkEntryCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetWatermarkEntry([in] valuetype UW.CSE.ManagedWM.tagWMT_WATERMARK_ENTRY_TYPE wmetType,
                                             [in] unsigned int32 dwEntryNum,
                                             [out] valuetype UW.CSE.ManagedWM.__WMT_WATERMARK_ENTRY& pEntry) runtime managed internalcall
    {
    } // end of method IWMWatermarkInfo::GetWatermarkEntry

  } // end of class IWMWatermarkInfo

  .class interface public abstract auto ansi import IWMReaderAccelerator
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 42 44 44 43 34 44 30 38 2D 39 34 34 44   // ..$BDDC4D08-944D
                                                                                                    2D 34 44 35 32 2D 41 36 31 32 2D 34 36 43 33 46   // -4D52-A612-46C3F
                                                                                                    44 41 30 37 44 44 34 00 00 )                      // DA07DD4..
    .method public hidebysig newslot virtual abstract 
            instance void  GetCodecInterface([in] unsigned int32 dwOutputNum,
                                             [in] valuetype UW.CSE.ManagedWM.GUID& riid,
                                             [out] native int& ppvCodecInterface) runtime managed internalcall
    {
      .param [2]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 55 57 2E 43 53 45 2E 4D 61 6E 61 67 65   // ...UW.CSE.Manage
                                                                                                              64 57 4D 2E 47 55 49 44 00 00 )                   // dWM.GUID..
    } // end of method IWMReaderAccelerator::GetCodecInterface

    .method public hidebysig newslot virtual abstract 
            instance void  Notify([in] unsigned int32 dwOutputNum,
                                  [in] valuetype UW.CSE.ManagedWM._WMMediaType& pSubtype) runtime managed internalcall
    {
    } // end of method IWMReaderAccelerator::Notify

  } // end of class IWMReaderAccelerator

  .class interface public abstract auto ansi import IWMReaderTimecode
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 46 33 36 39 45 32 46 30 2D 45 30 38 31   // ..$F369E2F0-E081
                                                                                                    2D 34 46 45 36 2D 38 34 35 30 2D 42 38 31 30 42   // -4FE6-8450-B810B
                                                                                                    32 46 34 31 30 44 31 00 00 )                      // 2F410D1..
    .method public hidebysig newslot virtual abstract 
            instance void  GetTimecodeRangeCount([in] unsigned int16 wStreamNum,
                                                 [out] unsigned int16& pwRangeCount) runtime managed internalcall
    {
    } // end of method IWMReaderTimecode::GetTimecodeRangeCount

    .method public hidebysig newslot virtual abstract 
            instance void  GetTimecodeRangeBounds([in] unsigned int16 wStreamNum,
                                                  [in] unsigned int16 wRangeNum,
                                                  [out] unsigned int32& pStartTimecode,
                                                  [out] unsigned int32& pEndTimecode) runtime managed internalcall
    {
    } // end of method IWMReaderTimecode::GetTimecodeRangeBounds

  } // end of class IWMReaderTimecode


// =============================================================

} // end of namespace UW.CSE.ManagedWM

//*********** DISASSEMBLY COMPLETE ***********************
// WARNING: Created Win32 resource file ManagedWM.res
