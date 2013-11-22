
//  Microsoft (R) .NET Framework IL Disassembler.  Version 1.0.3705.0
//  Copyright (C) Microsoft Corporation 1998-2001. All rights reserved.

.assembly extern mscorlib
{
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 )                         // .z\V.4..
  .ver 1:0:3300:0
}
.assembly extern stdole
{
  .publickeytoken = (B0 3F 5F 7F 11 D5 0A 3A )                         // .?_....:
  .ver 7:0:3300:0
}
.assembly SampleGrabberInterop
{
  .custom instance void [mscorlib]System.Runtime.InteropServices.ImportedFromTypeLibAttribute::.ctor(string) = ( 01 00 14 53 61 6D 70 6C 65 47 72 61 62 62 65 72   // ...SampleGrabber
                                                                                                                 49 6E 74 65 72 6F 70 00 00 )                      // Interop..
  .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 32 66 61 63 62 66 62 33 2D 30 34 34 33   // ..$2facbfb3-0443
                                                                                                  2D 34 61 37 64 2D 62 33 66 37 2D 34 64 34 64 39   // -4a7d-b3f7-4d4d9
                                                                                                  32 62 34 62 38 62 31 00 00 )                      // 2b4b8b1..
  .hash algorithm 0x00008004
  .ver 1:0:0:0
}
.module SampleGrabberInterop.dll
// MVID: {599B89AD-AD6A-4266-9B8A-43E7BA6E4C57}
.imagebase 0x00400000
.subsystem 0x00000003
.file alignment 4096
.corflags 0x00000001
// Image base: 0x02c00000
//
// ============== CLASS STRUCTURE DECLARATION ==================
//
.namespace MSR.LST.MDShow
{
  .class interface public abstract auto ansi import ICreateDevEnum
  {
  } // end of class ICreateDevEnum

  .class interface public abstract auto ansi import IEnumMoniker
  {
  } // end of class IEnumMoniker

  .class interface public abstract auto ansi import IMoniker
         implements MSR.LST.MDShow.IPersistStream
  {
  } // end of class IMoniker

  .class interface public abstract auto ansi import IPersistStream
         implements MSR.LST.MDShow.IPersist
  {
  } // end of class IPersistStream

  .class interface public abstract auto ansi import IPersist
  {
  } // end of class IPersist

  .class interface public abstract auto ansi import IStream
         implements MSR.LST.MDShow.ISequentialStream
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

  .class interface public abstract auto ansi import IBindCtx
  {
  } // end of class IBindCtx

  .class public sequential ansi sealed beforefieldinit tagBIND_OPTS2
         extends [mscorlib]System.ValueType
  {
  } // end of class tagBIND_OPTS2

  .class public sequential ansi sealed beforefieldinit _COSERVERINFO
         extends [mscorlib]System.ValueType
  {
  } // end of class _COSERVERINFO

  .class public sequential ansi sealed beforefieldinit _COAUTHINFO
         extends [mscorlib]System.ValueType
  {
  } // end of class _COAUTHINFO

  .class public sequential ansi sealed beforefieldinit _COAUTHIDENTITY
         extends [mscorlib]System.ValueType
  {
  } // end of class _COAUTHIDENTITY

  .class interface public abstract auto ansi import IRunningObjectTable
  {
  } // end of class IRunningObjectTable

  .class interface public abstract auto ansi import IEnumString
  {
  } // end of class IEnumString

  .class public sequential ansi sealed beforefieldinit _AMMediaType
         extends [mscorlib]System.ValueType
  {
  } // end of class _AMMediaType

  .class public auto ansi sealed _PinDirection
         extends [mscorlib]System.Enum
  {
  } // end of class _PinDirection

  .class public sequential ansi sealed beforefieldinit _AllocatorProperties
         extends [mscorlib]System.ValueType
  {
  } // end of class _AllocatorProperties

  .class interface public abstract auto ansi import IAMovieSetup
  {
  } // end of class IAMovieSetup

  .class interface public abstract auto ansi import IEnumFilters
  {
  } // end of class IEnumFilters

  .class interface public abstract auto ansi import IBaseFilter
         implements MSR.LST.MDShow.IMediaFilter
  {
  } // end of class IBaseFilter

  .class interface public abstract auto ansi import IMediaFilter
         implements MSR.LST.MDShow.IPersist
  {
  } // end of class IMediaFilter

  .class public auto ansi sealed _FilterState
         extends [mscorlib]System.Enum
  {
  } // end of class _FilterState

  .class interface public abstract auto ansi import IReferenceClock
  {
  } // end of class IReferenceClock

  .class interface public abstract auto ansi import IEnumPins
  {
  } // end of class IEnumPins

  .class interface public abstract auto ansi import IPin
  {
  } // end of class IPin

  .class public sequential ansi sealed beforefieldinit _PinInfo
         extends [mscorlib]System.ValueType
  {
  } // end of class _PinInfo

  .class interface public abstract auto ansi import IEnumMediaTypes
  {
  } // end of class IEnumMediaTypes

  .class public sequential ansi sealed beforefieldinit _FilterInfo
         extends [mscorlib]System.ValueType
  {
  } // end of class _FilterInfo

  .class interface public abstract auto ansi import IFilterGraph
  {
  } // end of class IFilterGraph

  .class interface public abstract auto ansi import IMediaSample
  {
  } // end of class IMediaSample

  .class interface public abstract auto ansi import IMemAllocator
  {
  } // end of class IMemAllocator

  .class interface public abstract auto ansi import IMemAllocatorCallbackTemp
         implements MSR.LST.MDShow.IMemAllocator
  {
  } // end of class IMemAllocatorCallbackTemp

  .class interface public abstract auto ansi import IMemAllocatorNotifyCallbackTemp
  {
  } // end of class IMemAllocatorNotifyCallbackTemp

  .class interface public abstract auto ansi import IMemInputPin
  {
  } // end of class IMemInputPin

  .class interface public abstract auto ansi import IReferenceClock2
         implements MSR.LST.MDShow.IReferenceClock
  {
  } // end of class IReferenceClock2

  .class public auto ansi sealed tagAM_SAMPLE_PROPERTY_FLAGS
         extends [mscorlib]System.Enum
  {
  } // end of class tagAM_SAMPLE_PROPERTY_FLAGS

  .class public sequential ansi sealed beforefieldinit tagAM_SAMPLE2_PROPERTIES
         extends [mscorlib]System.ValueType
  {
  } // end of class tagAM_SAMPLE2_PROPERTIES

  .class interface public abstract auto ansi import IMediaSample2
         implements MSR.LST.MDShow.IMediaSample
  {
  } // end of class IMediaSample2

  .class public auto ansi sealed AM_SEEKING_SeekingFlags
         extends [mscorlib]System.Enum
  {
  } // end of class AM_SEEKING_SeekingFlags

  .class public auto ansi sealed AM_SEEKING_SeekingCapabilities
         extends [mscorlib]System.Enum
  {
  } // end of class AM_SEEKING_SeekingCapabilities

  .class interface public abstract auto ansi import IMediaSeeking
  {
  } // end of class IMediaSeeking

  .class interface public abstract auto ansi import IEnumRegFilters
  {
  } // end of class IEnumRegFilters

  .class public sequential ansi sealed beforefieldinit REGFILTER
         extends [mscorlib]System.ValueType
  {
  } // end of class REGFILTER

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0135_0001
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0135_0001

  .class interface public abstract auto ansi import IFileSourceFilter
  {
  } // end of class IFileSourceFilter

  .class interface public abstract auto ansi import IFileSinkFilter
  {
  } // end of class IFileSinkFilter

  .class interface public abstract auto ansi import IFileSinkFilter2
         implements MSR.LST.MDShow.IFileSinkFilter
  {
  } // end of class IFileSinkFilter2

  .class interface public abstract auto ansi import IGraphBuilder
         implements MSR.LST.MDShow.IFilterGraph
  {
  } // end of class IGraphBuilder

  .class interface public abstract auto ansi import ICaptureGraphBuilder
  {
  } // end of class ICaptureGraphBuilder

  .class interface public abstract auto ansi import IAMCopyCaptureFileProgress
  {
  } // end of class IAMCopyCaptureFileProgress

  .class interface public abstract auto ansi import ICaptureGraphBuilder2
  {
  } // end of class ICaptureGraphBuilder2

  .class interface public abstract auto ansi import IFilterMapper
  {
  } // end of class IFilterMapper

  .class interface public abstract auto ansi import IFilterMapper2
  {
  } // end of class IFilterMapper2

  .class public sequential ansi sealed beforefieldinit REGFILTER2
         extends [mscorlib]System.ValueType
  {
  } // end of class REGFILTER2

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0006
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0006

  .class public explicit ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0139_0007
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0007

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0008
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0008

  .class public sequential ansi sealed beforefieldinit REGFILTERPINS
         extends [mscorlib]System.ValueType
  {
  } // end of class REGFILTERPINS

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0002
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0002

  .class public sequential ansi sealed beforefieldinit REGPINTYPES
         extends [mscorlib]System.ValueType
  {
  } // end of class REGPINTYPES

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0001
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0001

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0009
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0009

  .class public sequential ansi sealed beforefieldinit REGFILTERPINS2
         extends [mscorlib]System.ValueType
  {
  } // end of class REGFILTERPINS2

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0005
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0005

  .class public sequential ansi sealed beforefieldinit REGPINMEDIUM
         extends [mscorlib]System.ValueType
  {
  } // end of class REGPINMEDIUM

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0003
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0003

  .class interface public abstract auto ansi import IMediaEventSink
  {
  } // end of class IMediaEventSink

  .class interface public abstract auto ansi import IOverlay
  {
  } // end of class IOverlay

  .class public sequential ansi sealed beforefieldinit tagPALETTEENTRY
         extends [mscorlib]System.ValueType
  {
  } // end of class tagPALETTEENTRY

  .class public sequential ansi sealed beforefieldinit tagCOLORKEY
         extends [mscorlib]System.ValueType
  {
  } // end of class tagCOLORKEY

  .class public sequential ansi sealed beforefieldinit _RemotableHandle
         extends [mscorlib]System.ValueType
  {
  } // end of class _RemotableHandle

  .class public explicit ansi sealed __MIDL_IWinTypes_0009
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL_IWinTypes_0009

  .class public sequential ansi sealed beforefieldinit tagRECT
         extends [mscorlib]System.ValueType
  {
  } // end of class tagRECT

  .class public sequential ansi sealed beforefieldinit _RGNDATA
         extends [mscorlib]System.ValueType
  {
  } // end of class _RGNDATA

  .class public sequential ansi sealed beforefieldinit _RGNDATAHEADER
         extends [mscorlib]System.ValueType
  {
  } // end of class _RGNDATAHEADER

  .class interface public abstract auto ansi import IOverlayNotify
  {
  } // end of class IOverlayNotify

  .class interface public abstract auto ansi import IOverlayNotify2
         implements MSR.LST.MDShow.IOverlayNotify
  {
  } // end of class IOverlayNotify2

  .class interface public abstract auto ansi import IQualityControl
  {
  } // end of class IQualityControl

  .class public sequential ansi sealed beforefieldinit tagQuality
         extends [mscorlib]System.ValueType
  {
  } // end of class tagQuality

  .class public auto ansi sealed tagQualityMessageType
         extends [mscorlib]System.Enum
  {
  } // end of class tagQualityMessageType

  .class interface public abstract auto ansi import ISeekingPassThru
  {
  } // end of class ISeekingPassThru

  .class interface public abstract auto ansi import IAMStreamConfig
  {
  } // end of class IAMStreamConfig

  .class interface public abstract auto ansi import IAMDevMemoryAllocator
  {
  } // end of class IAMDevMemoryAllocator

  .class interface public abstract auto ansi import IAMDevMemoryControl
  {
  } // end of class IAMDevMemoryControl

  .class interface public abstract auto ansi import IConfigInterleaving
  {
  } // end of class IConfigInterleaving

  .class public auto ansi sealed InterleavingMode
         extends [mscorlib]System.Enum
  {
  } // end of class InterleavingMode

  .class public auto ansi sealed __MIDL_IConfigInterleaving_0001
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL_IConfigInterleaving_0001

  .class interface public abstract auto ansi import IConfigAviMux
  {
  } // end of class IConfigAviMux

  .class interface public abstract auto ansi import IAMVideoCompression
  {
  } // end of class IAMVideoCompression

  .class interface public abstract auto ansi import IAMVfwCaptureDialogs
  {
  } // end of class IAMVfwCaptureDialogs

  .class interface public abstract auto ansi import IAMVfwCompressDialogs
  {
  } // end of class IAMVfwCompressDialogs

  .class interface public abstract auto ansi import IAMDroppedFrames
  {
  } // end of class IAMDroppedFrames

  .class interface public abstract auto ansi import IAMAudioInputMixer
  {
  } // end of class IAMAudioInputMixer

  .class interface public abstract auto ansi import IAMBufferNegotiation
  {
  } // end of class IAMBufferNegotiation

  .class interface public abstract auto ansi import IAMAnalogVideoDecoder
  {
  } // end of class IAMAnalogVideoDecoder

  .class interface public abstract auto ansi import IAMVideoProcAmp
  {
  } // end of class IAMVideoProcAmp

  .class interface public abstract auto ansi import IAMAnalogVideoEncoder
  {
  } // end of class IAMAnalogVideoEncoder

  .class interface public abstract auto ansi import IAMCameraControl
  {
  } // end of class IAMCameraControl

  .class interface public abstract auto ansi import IAMCrossbar
  {
  } // end of class IAMCrossbar

  .class interface public abstract auto ansi import IAMTuner
  {
  } // end of class IAMTuner

  .class public auto ansi sealed tagAMTunerModeType
         extends [mscorlib]System.Enum
  {
  } // end of class tagAMTunerModeType

  .class interface public abstract auto ansi import IAMTunerNotification
  {
  } // end of class IAMTunerNotification

  .class public auto ansi sealed tagAMTunerEventType
         extends [mscorlib]System.Enum
  {
  } // end of class tagAMTunerEventType

  .class interface public abstract auto ansi import IAMTVTuner
         implements MSR.LST.MDShow.IAMTuner
  {
  } // end of class IAMTVTuner

  .class public auto ansi sealed tagTunerInputType
         extends [mscorlib]System.Enum
  {
  } // end of class tagTunerInputType

  .class interface public abstract auto ansi import IKsPropertySet
  {
  } // end of class IKsPropertySet

  .class interface public abstract auto ansi import IAMPhysicalPinInfo
  {
  } // end of class IAMPhysicalPinInfo

  .class interface public abstract auto ansi import IAMExtDevice
  {
  } // end of class IAMExtDevice

  .class interface public abstract auto ansi import IAMExtTransport
  {
  } // end of class IAMExtTransport

  .class interface public abstract auto ansi import IAMTimecodeReader
  {
  } // end of class IAMTimecodeReader

  .class public sequential ansi sealed beforefieldinit tagTIMECODE_SAMPLE
         extends [mscorlib]System.ValueType
  {
  } // end of class tagTIMECODE_SAMPLE

  .class public sequential ansi sealed beforefieldinit tagTIMECODE
         extends [mscorlib]System.ValueType
  {
  } // end of class tagTIMECODE

  .class interface public abstract auto ansi import IAMTimecodeGenerator
  {
  } // end of class IAMTimecodeGenerator

  .class interface public abstract auto ansi import IAMTimecodeDisplay
  {
  } // end of class IAMTimecodeDisplay

  .class interface public abstract auto ansi import IDrawVideoImage
  {
  } // end of class IDrawVideoImage

  .class interface public abstract auto ansi import IDecimateVideoImage
  {
  } // end of class IDecimateVideoImage

  .class interface public abstract auto ansi import IAMVideoDecimationProperties
  {
  } // end of class IAMVideoDecimationProperties

  .class public auto ansi sealed _DECIMATION_USAGE
         extends [mscorlib]System.Enum
  {
  } // end of class _DECIMATION_USAGE

  .class interface public abstract auto ansi import IAMLatency
  {
  } // end of class IAMLatency

  .class interface public abstract auto ansi import IAMPushSource
         implements MSR.LST.MDShow.IAMLatency
  {
  } // end of class IAMPushSource

  .class interface public abstract auto ansi import IAMAudioRendererStats
  {
  } // end of class IAMAudioRendererStats

  .class interface public abstract auto ansi import IAMGraphStreams
  {
  } // end of class IAMGraphStreams

  .class interface public abstract auto ansi import IAMOverlayFX
  {
  } // end of class IAMOverlayFX

  .class interface public abstract auto ansi import IAMOpenProgress
  {
  } // end of class IAMOpenProgress

  .class interface public abstract auto ansi import IMpeg2Demultiplexer
  {
  } // end of class IMpeg2Demultiplexer

  .class interface public abstract auto ansi import IMPEG2StreamIdMap
  {
  } // end of class IMPEG2StreamIdMap

  .class interface public abstract auto ansi import IEnumStreamIdMap
  {
  } // end of class IEnumStreamIdMap

  .class public sequential ansi sealed beforefieldinit STREAM_ID_MAP
         extends [mscorlib]System.ValueType
  {
  } // end of class STREAM_ID_MAP

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0360_0001
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0360_0001

  .class interface public abstract auto ansi import IAMClockSlave
  {
  } // end of class IAMClockSlave

  .class interface public abstract auto ansi import IEncoderAPI
  {
  } // end of class IEncoderAPI

  .class interface public abstract auto ansi import IVideoEncoder
         implements MSR.LST.MDShow.IEncoderAPI
  {
  } // end of class IVideoEncoder

  .class interface public abstract auto ansi import IAMGraphBuilderCallback
  {
  } // end of class IAMGraphBuilderCallback

  .class interface public abstract auto ansi import IAMCertifiedOutputProtection
  {
  } // end of class IAMCertifiedOutputProtection

  .class public sequential ansi sealed beforefieldinit _AMCOPPSignature
         extends [mscorlib]System.ValueType
  {
  } // end of class _AMCOPPSignature

  .class public sequential ansi sealed beforefieldinit _AMCOPPCommand
         extends [mscorlib]System.ValueType
  {
  } // end of class _AMCOPPCommand

  .class public sequential ansi sealed beforefieldinit _AMCOPPStatusInput
         extends [mscorlib]System.ValueType
  {
  } // end of class _AMCOPPStatusInput

  .class public sequential ansi sealed beforefieldinit _AMCOPPStatusOutput
         extends [mscorlib]System.ValueType
  {
  } // end of class _AMCOPPStatusOutput

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0139_0004
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0004

  .class interface public abstract auto ansi import IFilterMapper3
         implements MSR.LST.MDShow.IFilterMapper2
  {
  } // end of class IFilterMapper3

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0143_0001
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0143_0001

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0143_0002
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0143_0002

  .class public auto ansi sealed AM_FILESINK_FLAGS
         extends [mscorlib]System.Enum
  {
  } // end of class AM_FILESINK_FLAGS

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0150_0001
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0150_0001

  .class public auto ansi sealed _AM_RENSDEREXFLAGS
         extends [mscorlib]System.Enum
  {
  } // end of class _AM_RENSDEREXFLAGS

  .class interface public abstract auto ansi import IFilterGraph2
         implements MSR.LST.MDShow.IGraphBuilder
  {
  } // end of class IFilterGraph2

  .class interface public abstract auto ansi import IStreamBuilder
  {
  } // end of class IStreamBuilder

  .class interface public abstract auto ansi import IAsyncReader
  {
  } // end of class IAsyncReader

  .class interface public abstract auto ansi import IGraphVersion
  {
  } // end of class IGraphVersion

  .class interface public abstract auto ansi import IResourceConsumer
  {
  } // end of class IResourceConsumer

  .class interface public abstract auto ansi import IResourceManager
  {
  } // end of class IResourceManager

  .class interface public abstract auto ansi import IDistributorNotify
  {
  } // end of class IDistributorNotify

  .class public auto ansi sealed AM_STREAM_INFO_FLAGS
         extends [mscorlib]System.Enum
  {
  } // end of class AM_STREAM_INFO_FLAGS

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0161_0001
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0161_0001

  .class public sequential ansi sealed beforefieldinit AM_STREAM_INFO
         extends [mscorlib]System.ValueType
  {
  } // end of class AM_STREAM_INFO

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0161_0002
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0161_0002

  .class interface public abstract auto ansi import IAMStreamControl
  {
  } // end of class IAMStreamControl

  .class public auto ansi sealed CompressionCaps
         extends [mscorlib]System.Enum
  {
  } // end of class CompressionCaps

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0168_0001
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0168_0001

  .class public auto ansi sealed VfwCaptureDialogs
         extends [mscorlib]System.Enum
  {
  } // end of class VfwCaptureDialogs

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0169_0001
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0169_0001

  .class public auto ansi sealed VfwCompressDialogs
         extends [mscorlib]System.Enum
  {
  } // end of class VfwCompressDialogs

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0169_0002
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0169_0002

  .class public auto ansi sealed tagAnalogVideoStandard
         extends [mscorlib]System.Enum
  {
  } // end of class tagAnalogVideoStandard

  .class public auto ansi sealed VideoCopyProtectionType
         extends [mscorlib]System.Enum
  {
  } // end of class VideoCopyProtectionType

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0174_0001
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0174_0001

  .class public auto ansi sealed tagPhysicalConnectorType
         extends [mscorlib]System.Enum
  {
  } // end of class tagPhysicalConnectorType

  .class public auto ansi sealed tagVideoProcAmpProperty
         extends [mscorlib]System.Enum
  {
  } // end of class tagVideoProcAmpProperty

  .class public auto ansi sealed tagVideoProcAmpFlags
         extends [mscorlib]System.Enum
  {
  } // end of class tagVideoProcAmpFlags

  .class public auto ansi sealed tagCameraControlProperty
         extends [mscorlib]System.Enum
  {
  } // end of class tagCameraControlProperty

  .class public auto ansi sealed tagCameraControlFlags
         extends [mscorlib]System.Enum
  {
  } // end of class tagCameraControlFlags

  .class public auto ansi sealed tagVideoControlFlags
         extends [mscorlib]System.Enum
  {
  } // end of class tagVideoControlFlags

  .class interface public abstract auto ansi import IAMVideoControl
  {
  } // end of class IAMVideoControl

  .class public sequential ansi sealed beforefieldinit tagSIZE
         extends [mscorlib]System.ValueType
  {
  } // end of class tagSIZE

  .class public auto ansi sealed tagAMTunerSubChannel
         extends [mscorlib]System.Enum
  {
  } // end of class tagAMTunerSubChannel

  .class public auto ansi sealed tagAMTunerSignalStrength
         extends [mscorlib]System.Enum
  {
  } // end of class tagAMTunerSignalStrength

  .class interface public abstract auto ansi import IBPCSatelliteTuner
         implements MSR.LST.MDShow.IAMTuner
  {
  } // end of class IBPCSatelliteTuner

  .class public auto ansi sealed tagTVAudioMode
         extends [mscorlib]System.Enum
  {
  } // end of class tagTVAudioMode

  .class public auto ansi sealed tagAMTVAudioEventType
         extends [mscorlib]System.Enum
  {
  } // end of class tagAMTVAudioEventType

  .class interface public abstract auto ansi import IAMTVAudioNotification
  {
  } // end of class IAMTVAudioNotification

  .class interface public abstract auto ansi import IAMTVAudio
  {
  } // end of class IAMTVAudio

  .class public auto ansi sealed AMPROPERTY_PIN
         extends [mscorlib]System.Enum
  {
  } // end of class AMPROPERTY_PIN

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0186_0001
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0186_0001

  .class interface public abstract auto ansi import IMediaPropertyBag
         implements MSR.LST.MDShow.IPropertyBag
  {
  } // end of class IMediaPropertyBag

  .class interface public abstract auto ansi import IPropertyBag
  {
  } // end of class IPropertyBag

  .class interface public abstract auto ansi import IErrorLog
  {
  } // end of class IErrorLog

  .class interface public abstract auto ansi import IPersistMediaPropertyBag
         implements MSR.LST.MDShow.IPersist
  {
  } // end of class IPersistMediaPropertyBag

  .class public auto ansi sealed _AMSTREAMSELECTINFOFLAGS
         extends [mscorlib]System.Enum
  {
  } // end of class _AMSTREAMSELECTINFOFLAGS

  .class public auto ansi sealed _AMSTREAMSELECTENABLEFLAGS
         extends [mscorlib]System.Enum
  {
  } // end of class _AMSTREAMSELECTENABLEFLAGS

  .class interface public abstract auto ansi import IAMStreamSelect
  {
  } // end of class IAMStreamSelect

  .class public auto ansi sealed _AMRESCTL_RESERVEFLAGS
         extends [mscorlib]System.Enum
  {
  } // end of class _AMRESCTL_RESERVEFLAGS

  .class interface public abstract auto ansi import IAMResourceControl
  {
  } // end of class IAMResourceControl

  .class interface public abstract auto ansi import IAMClockAdjust
  {
  } // end of class IAMClockAdjust

  .class public auto ansi sealed _AM_FILTER_MISC_FLAGS
         extends [mscorlib]System.Enum
  {
  } // end of class _AM_FILTER_MISC_FLAGS

  .class interface public abstract auto ansi import IAMFilterMiscFlags
  {
  } // end of class IAMFilterMiscFlags

  .class interface public abstract auto ansi import IVideoFrameStep
  {
  } // end of class IVideoFrameStep

  .class public auto ansi sealed _AM_PUSHSOURCE_FLAGS
         extends [mscorlib]System.Enum
  {
  } // end of class _AM_PUSHSOURCE_FLAGS

  .class interface public abstract auto ansi import IAMDeviceRemoval
  {
  } // end of class IAMDeviceRemoval

  .class public sequential ansi sealed beforefieldinit DVINFO
         extends [mscorlib]System.ValueType
  {
  } // end of class DVINFO

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0350_0001
         extends [mscorlib]System.ValueType
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0350_0001

  .class public auto ansi sealed _DVENCODERRESOLUTION
         extends [mscorlib]System.Enum
  {
  } // end of class _DVENCODERRESOLUTION

  .class public auto ansi sealed _DVENCODERVIDEOFORMAT
         extends [mscorlib]System.Enum
  {
  } // end of class _DVENCODERVIDEOFORMAT

  .class public auto ansi sealed _DVENCODERFORMAT
         extends [mscorlib]System.Enum
  {
  } // end of class _DVENCODERFORMAT

  .class interface public abstract auto ansi import IDVEnc
  {
  } // end of class IDVEnc

  .class public auto ansi sealed _DVDECODERRESOLUTION
         extends [mscorlib]System.Enum
  {
  } // end of class _DVDECODERRESOLUTION

  .class public auto ansi sealed _DVRESOLUTION
         extends [mscorlib]System.Enum
  {
  } // end of class _DVRESOLUTION

  .class interface public abstract auto ansi import IIPDVDec
  {
  } // end of class IIPDVDec

  .class interface public abstract auto ansi import IDVRGB219
  {
  } // end of class IDVRGB219

  .class interface public abstract auto ansi import IDVSplitter
  {
  } // end of class IDVSplitter

  .class public auto ansi sealed _AM_AUDIO_RENDERER_STAT_PARAM
         extends [mscorlib]System.Enum
  {
  } // end of class _AM_AUDIO_RENDERER_STAT_PARAM

  .class public auto ansi sealed _AM_INTF_SEARCH_FLAGS
         extends [mscorlib]System.Enum
  {
  } // end of class _AM_INTF_SEARCH_FLAGS

  .class public auto ansi sealed AMOVERLAYFX
         extends [mscorlib]System.Enum
  {
  } // end of class AMOVERLAYFX

  .class interface public abstract auto ansi import IRegisterServiceProvider
  {
  } // end of class IRegisterServiceProvider

  .class public sequential ansi sealed beforefieldinit CodecAPIEventData
         extends [mscorlib]System.ValueType
  {
  } // end of class CodecAPIEventData

  .class interface public abstract auto ansi import ICodecAPI
  {
  } // end of class ICodecAPI

  .class interface public abstract auto ansi import IGetCapabilitiesKey
  {
  } // end of class IGetCapabilitiesKey

  .class public auto ansi sealed VIDEOENCODER_BITRATE_MODE
         extends [mscorlib]System.Enum
  {
  } // end of class VIDEOENCODER_BITRATE_MODE

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0369_0001
         extends [mscorlib]System.Enum
  {
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0369_0001

  .class interface public abstract auto ansi import IAMDecoderCaps
  {
  } // end of class IAMDecoderCaps

  .class interface public abstract auto ansi import ISampleGrabber
  {
  } // end of class ISampleGrabber

  .class interface public abstract auto ansi import ISampleGrabberCB
  {
  } // end of class ISampleGrabberCB

} // end of namespace MSR.LST.MDShow


// =============================================================


// =============== GLOBAL FIELDS AND METHODS ===================


// =============================================================


// =============== CLASS MEMBERS DECLARATION ===================
//   note that class flags, 'extends' and 'implements' clauses
//          are provided here for information only

.namespace MSR.LST.MDShow
{
  .class interface public abstract auto ansi import ICreateDevEnum
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 32 39 38 34 30 38 32 32 2D 35 42 38 34   // ..$29840822-5B84
                                                                                                    2D 31 31 44 30 2D 42 44 33 42 2D 30 30 41 30 43   // -11D0-BD3B-00A0C
                                                                                                    39 31 31 43 45 38 36 00 00 )                      // 911CE86..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  CreateClassEnumerator([in] valuetype [mscorlib]System.Guid& clsidDeviceClass,
                                                 [out] class MSR.LST.MDShow.IEnumMoniker&  marshal( interface) ppenumMoniker,
                                                 [in] unsigned int32 dwFlags) runtime managed internalcall
    {
    } // end of method ICreateDevEnum::CreateClassEnumerator

  } // end of class ICreateDevEnum

  .class interface public abstract auto ansi import IEnumMoniker
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 30 30 30 30 31 30 32 2D 30 30 30 30   // ..$00000102-0000
                                                                                                    2D 30 30 30 30 2D 43 30 30 30 2D 30 30 30 30 30   // -0000-C000-00000
                                                                                                    30 30 30 30 30 34 36 00 00 )                      // 0000046..
    .method public hidebysig newslot virtual abstract 
            instance void  RemoteNext([in] unsigned int32 celt,
                                      [out] class MSR.LST.MDShow.IMoniker&  marshal( interface) rgelt,
                                      [out] unsigned int32& pceltFetched) runtime managed internalcall
    {
    } // end of method IEnumMoniker::RemoteNext

    .method public hidebysig newslot virtual abstract 
            instance void  Skip([in] unsigned int32 celt) runtime managed internalcall
    {
    } // end of method IEnumMoniker::Skip

    .method public hidebysig newslot virtual abstract 
            instance void  Reset() runtime managed internalcall
    {
    } // end of method IEnumMoniker::Reset

    .method public hidebysig newslot virtual abstract 
            instance void  Clone([out] class MSR.LST.MDShow.IEnumMoniker&  marshal( interface) ppenum) runtime managed internalcall
    {
    } // end of method IEnumMoniker::Clone

  } // end of class IEnumMoniker

  .class interface public abstract auto ansi import IMoniker
         implements MSR.LST.MDShow.IPersistStream
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 30 30 30 30 30 30 46 2D 30 30 30 30   // ..$0000000F-0000
                                                                                                    2D 30 30 30 30 2D 43 30 30 30 2D 30 30 30 30 30   // -0000-C000-00000
                                                                                                    30 30 30 30 30 34 36 00 00 )                      // 0000046..
    .method public hidebysig newslot virtual abstract 
            instance void  GetClassID([out] valuetype [mscorlib]System.Guid& pClassID) runtime managed internalcall
    {
    } // end of method IMoniker::GetClassID

    .method public hidebysig newslot virtual abstract 
            instance void  IsDirty() runtime managed internalcall
    {
    } // end of method IMoniker::IsDirty

    .method public hidebysig newslot virtual abstract 
            instance void  Load([in] class MSR.LST.MDShow.IStream  marshal( interface) pstm) runtime managed internalcall
    {
    } // end of method IMoniker::Load

    .method public hidebysig newslot virtual abstract 
            instance void  Save([in] class MSR.LST.MDShow.IStream  marshal( interface) pstm,
                                [in] int32 fClearDirty) runtime managed internalcall
    {
    } // end of method IMoniker::Save

    .method public hidebysig newslot virtual abstract 
            instance void  GetSizeMax([out] valuetype MSR.LST.MDShow._ULARGE_INTEGER& pcbSize) runtime managed internalcall
    {
    } // end of method IMoniker::GetSizeMax

    .method public hidebysig newslot virtual abstract 
            instance void  RemoteBindToObject([in] class MSR.LST.MDShow.IBindCtx  marshal( interface) pbc,
                                              [in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkToLeft,
                                              [in] valuetype [mscorlib]System.Guid& riidResult,
                                              [out] object&  marshal( iunknown) ppvResult) runtime managed internalcall
    {
    } // end of method IMoniker::RemoteBindToObject

    .method public hidebysig newslot virtual abstract 
            instance void  RemoteBindToStorage([in] class MSR.LST.MDShow.IBindCtx  marshal( interface) pbc,
                                               [in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkToLeft,
                                               [in] valuetype [mscorlib]System.Guid& riid,
                                               [out] object&  marshal( iunknown) ppvObj) runtime managed internalcall
    {
    } // end of method IMoniker::RemoteBindToStorage

    .method public hidebysig newslot virtual abstract 
            instance void  Reduce([in] class MSR.LST.MDShow.IBindCtx  marshal( interface) pbc,
                                  [in] unsigned int32 dwReduceHowFar,
                                  [in][out] class MSR.LST.MDShow.IMoniker&  marshal( interface) ppmkToLeft,
                                  [out] class MSR.LST.MDShow.IMoniker&  marshal( interface) ppmkReduced) runtime managed internalcall
    {
    } // end of method IMoniker::Reduce

    .method public hidebysig newslot virtual abstract 
            instance void  ComposeWith([in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkRight,
                                       [in] int32 fOnlyIfNotGeneric,
                                       [out] class MSR.LST.MDShow.IMoniker&  marshal( interface) ppmkComposite) runtime managed internalcall
    {
    } // end of method IMoniker::ComposeWith

    .method public hidebysig newslot virtual abstract 
            instance void  Enum([in] int32 fForward,
                                [out] class MSR.LST.MDShow.IEnumMoniker&  marshal( interface) ppenumMoniker) runtime managed internalcall
    {
    } // end of method IMoniker::Enum

    .method public hidebysig newslot virtual abstract 
            instance void  IsEqual([in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkOtherMoniker) runtime managed internalcall
    {
    } // end of method IMoniker::IsEqual

    .method public hidebysig newslot virtual abstract 
            instance void  Hash([out] unsigned int32& pdwHash) runtime managed internalcall
    {
    } // end of method IMoniker::Hash

    .method public hidebysig newslot virtual abstract 
            instance void  IsRunning([in] class MSR.LST.MDShow.IBindCtx  marshal( interface) pbc,
                                     [in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkToLeft,
                                     [in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkNewlyRunning) runtime managed internalcall
    {
    } // end of method IMoniker::IsRunning

    .method public hidebysig newslot virtual abstract 
            instance void  GetTimeOfLastChange([in] class MSR.LST.MDShow.IBindCtx  marshal( interface) pbc,
                                               [in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkToLeft,
                                               [out] valuetype MSR.LST.MDShow._FILETIME& pfiletime) runtime managed internalcall
    {
    } // end of method IMoniker::GetTimeOfLastChange

    .method public hidebysig newslot virtual abstract 
            instance void  Inverse([out] class MSR.LST.MDShow.IMoniker&  marshal( interface) ppmk) runtime managed internalcall
    {
    } // end of method IMoniker::Inverse

    .method public hidebysig newslot virtual abstract 
            instance void  CommonPrefixWith([in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkOther,
                                            [out] class MSR.LST.MDShow.IMoniker&  marshal( interface) ppmkPrefix) runtime managed internalcall
    {
    } // end of method IMoniker::CommonPrefixWith

    .method public hidebysig newslot virtual abstract 
            instance void  RelativePathTo([in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkOther,
                                          [out] class MSR.LST.MDShow.IMoniker&  marshal( interface) ppmkRelPath) runtime managed internalcall
    {
    } // end of method IMoniker::RelativePathTo

    .method public hidebysig newslot virtual abstract 
            instance void  GetDisplayName([in] class MSR.LST.MDShow.IBindCtx  marshal( interface) pbc,
                                          [in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkToLeft,
                                          [out] string&  marshal( lpwstr) ppszDisplayName) runtime managed internalcall
    {
    } // end of method IMoniker::GetDisplayName

    .method public hidebysig newslot virtual abstract 
            instance void  ParseDisplayName([in] class MSR.LST.MDShow.IBindCtx  marshal( interface) pbc,
                                            [in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkToLeft,
                                            [in] string  marshal( lpwstr) pszDisplayName,
                                            [out] unsigned int32& pchEaten,
                                            [out] class MSR.LST.MDShow.IMoniker&  marshal( interface) ppmkOut) runtime managed internalcall
    {
    } // end of method IMoniker::ParseDisplayName

    .method public hidebysig newslot virtual abstract 
            instance void  IsSystemMoniker([out] unsigned int32& pdwMksys) runtime managed internalcall
    {
    } // end of method IMoniker::IsSystemMoniker

  } // end of class IMoniker

  .class interface public abstract auto ansi import IPersistStream
         implements MSR.LST.MDShow.IPersist
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 30 30 30 30 31 30 39 2D 30 30 30 30   // ..$00000109-0000
                                                                                                    2D 30 30 30 30 2D 43 30 30 30 2D 30 30 30 30 30   // -0000-C000-00000
                                                                                                    30 30 30 30 30 34 36 00 00 )                      // 0000046..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetClassID([out] valuetype [mscorlib]System.Guid& pClassID) runtime managed internalcall
    {
    } // end of method IPersistStream::GetClassID

    .method public hidebysig newslot virtual abstract 
            instance void  IsDirty() runtime managed internalcall
    {
    } // end of method IPersistStream::IsDirty

    .method public hidebysig newslot virtual abstract 
            instance void  Load([in] class MSR.LST.MDShow.IStream  marshal( interface) pstm) runtime managed internalcall
    {
    } // end of method IPersistStream::Load

    .method public hidebysig newslot virtual abstract 
            instance void  Save([in] class MSR.LST.MDShow.IStream  marshal( interface) pstm,
                                [in] int32 fClearDirty) runtime managed internalcall
    {
    } // end of method IPersistStream::Save

    .method public hidebysig newslot virtual abstract 
            instance void  GetSizeMax([out] valuetype MSR.LST.MDShow._ULARGE_INTEGER& pcbSize) runtime managed internalcall
    {
    } // end of method IPersistStream::GetSizeMax

  } // end of class IPersistStream

  .class interface public abstract auto ansi import IPersist
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 30 30 30 30 31 30 43 2D 30 30 30 30   // ..$0000010C-0000
                                                                                                    2D 30 30 30 30 2D 43 30 30 30 2D 30 30 30 30 30   // -0000-C000-00000
                                                                                                    30 30 30 30 30 34 36 00 00 )                      // 0000046..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetClassID([out] valuetype [mscorlib]System.Guid& pClassID) runtime managed internalcall
    {
    } // end of method IPersist::GetClassID

  } // end of class IPersist

  .class interface public abstract auto ansi import IStream
         implements MSR.LST.MDShow.ISequentialStream
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
            instance void  RemoteSeek([in] valuetype MSR.LST.MDShow._LARGE_INTEGER dlibMove,
                                      [in] unsigned int32 dwOrigin,
                                      [out] valuetype MSR.LST.MDShow._ULARGE_INTEGER& plibNewPosition) runtime managed internalcall
    {
    } // end of method IStream::RemoteSeek

    .method public hidebysig newslot virtual abstract 
            instance void  SetSize([in] valuetype MSR.LST.MDShow._ULARGE_INTEGER libNewSize) runtime managed internalcall
    {
    } // end of method IStream::SetSize

    .method public hidebysig newslot virtual abstract 
            instance void  RemoteCopyTo([in] class MSR.LST.MDShow.IStream  marshal( interface) pstm,
                                        [in] valuetype MSR.LST.MDShow._ULARGE_INTEGER cb,
                                        [out] valuetype MSR.LST.MDShow._ULARGE_INTEGER& pcbRead,
                                        [out] valuetype MSR.LST.MDShow._ULARGE_INTEGER& pcbWritten) runtime managed internalcall
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
            instance void  LockRegion([in] valuetype MSR.LST.MDShow._ULARGE_INTEGER libOffset,
                                      [in] valuetype MSR.LST.MDShow._ULARGE_INTEGER cb,
                                      [in] unsigned int32 dwLockType) runtime managed internalcall
    {
    } // end of method IStream::LockRegion

    .method public hidebysig newslot virtual abstract 
            instance void  UnlockRegion([in] valuetype MSR.LST.MDShow._ULARGE_INTEGER libOffset,
                                        [in] valuetype MSR.LST.MDShow._ULARGE_INTEGER cb,
                                        [in] unsigned int32 dwLockType) runtime managed internalcall
    {
    } // end of method IStream::UnlockRegion

    .method public hidebysig newslot virtual abstract 
            instance void  Stat([out] valuetype MSR.LST.MDShow.tagSTATSTG& pstatstg,
                                [in] unsigned int32 grfStatFlag) runtime managed internalcall
    {
    } // end of method IStream::Stat

    .method public hidebysig newslot virtual abstract 
            instance void  Clone([out] class MSR.LST.MDShow.IStream&  marshal( interface) ppstm) runtime managed internalcall
    {
    } // end of method IStream::Clone

  } // end of class IStream

  .class interface public abstract auto ansi import ISequentialStream
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 43 37 33 33 41 33 30 2D 32 41 31 43   // ..$0C733A30-2A1C
                                                                                                    2D 31 31 43 45 2D 41 44 45 35 2D 30 30 41 41 30   // -11CE-ADE5-00AA0
                                                                                                    30 34 34 37 37 33 44 00 00 )                      // 044773D..
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
    .field public unsigned int32 type
    .field public valuetype MSR.LST.MDShow._ULARGE_INTEGER cbSize
    .field public valuetype MSR.LST.MDShow._FILETIME mtime
    .field public valuetype MSR.LST.MDShow._FILETIME ctime
    .field public valuetype MSR.LST.MDShow._FILETIME atime
    .field public unsigned int32 grfMode
    .field public unsigned int32 grfLocksSupported
    .field public valuetype [mscorlib]System.Guid 'clsid'
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

  .class interface public abstract auto ansi import IBindCtx
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 30 30 30 30 30 30 45 2D 30 30 30 30   // ..$0000000E-0000
                                                                                                    2D 30 30 30 30 2D 43 30 30 30 2D 30 30 30 30 30   // -0000-C000-00000
                                                                                                    30 30 30 30 30 34 36 00 00 )                      // 0000046..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  RegisterObjectBound([in] object  marshal( iunknown) punk) runtime managed internalcall
    {
    } // end of method IBindCtx::RegisterObjectBound

    .method public hidebysig newslot virtual abstract 
            instance void  RevokeObjectBound([in] object  marshal( iunknown) punk) runtime managed internalcall
    {
    } // end of method IBindCtx::RevokeObjectBound

    .method public hidebysig newslot virtual abstract 
            instance void  ReleaseBoundObjects() runtime managed internalcall
    {
    } // end of method IBindCtx::ReleaseBoundObjects

    .method public hidebysig newslot virtual abstract 
            instance void  RemoteSetBindOptions([in] valuetype MSR.LST.MDShow.tagBIND_OPTS2& pbindopts) runtime managed internalcall
    {
    } // end of method IBindCtx::RemoteSetBindOptions

    .method public hidebysig newslot virtual abstract 
            instance void  RemoteGetBindOptions([in][out] valuetype MSR.LST.MDShow.tagBIND_OPTS2& pbindopts) runtime managed internalcall
    {
    } // end of method IBindCtx::RemoteGetBindOptions

    .method public hidebysig newslot virtual abstract 
            instance void  GetRunningObjectTable([out] class MSR.LST.MDShow.IRunningObjectTable&  marshal( interface) pprot) runtime managed internalcall
    {
    } // end of method IBindCtx::GetRunningObjectTable

    .method public hidebysig newslot virtual abstract 
            instance void  RegisterObjectParam([in] string  marshal( lpwstr) pszKey,
                                               [in] object  marshal( iunknown) punk) runtime managed internalcall
    {
    } // end of method IBindCtx::RegisterObjectParam

    .method public hidebysig newslot virtual abstract 
            instance void  GetObjectParam([in] string  marshal( lpwstr) pszKey,
                                          [out] object&  marshal( iunknown) ppunk) runtime managed internalcall
    {
    } // end of method IBindCtx::GetObjectParam

    .method public hidebysig newslot virtual abstract 
            instance void  EnumObjectParam([out] class MSR.LST.MDShow.IEnumString&  marshal( interface) ppenum) runtime managed internalcall
    {
    } // end of method IBindCtx::EnumObjectParam

    .method public hidebysig newslot virtual abstract 
            instance void  RevokeObjectParam([in] string  marshal( lpwstr) pszKey) runtime managed internalcall
    {
    } // end of method IBindCtx::RevokeObjectParam

  } // end of class IBindCtx

  .class public sequential ansi sealed beforefieldinit tagBIND_OPTS2
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 cbStruct
    .field public unsigned int32 grfFlags
    .field public unsigned int32 grfMode
    .field public unsigned int32 dwTickCountDeadline
    .field public unsigned int32 dwTrackFlags
    .field public unsigned int32 dwClassContext
    .field public unsigned int32 locale
    .field public native int pServerInfo
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
  } // end of class tagBIND_OPTS2

  .class public sequential ansi sealed beforefieldinit _COSERVERINFO
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 dwReserved1
    .field public  marshal( lpwstr) string pwszName
    .field public native int pAuthInfo
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 dwReserved2
  } // end of class _COSERVERINFO

  .class public sequential ansi sealed beforefieldinit _COAUTHINFO
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 dwAuthnSvc
    .field public unsigned int32 dwAuthzSvc
    .field public  marshal( lpwstr) string pwszServerPrincName
    .field public unsigned int32 dwAuthnLevel
    .field public unsigned int32 dwImpersonationLevel
    .field public native int pAuthIdentityData
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 dwCapabilities
  } // end of class _COAUTHINFO

  .class public sequential ansi sealed beforefieldinit _COAUTHIDENTITY
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public native int User
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 UserLength
    .field public native int Domain
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 DomainLength
    .field public native int Password
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 PasswordLength
    .field public unsigned int32 Flags
  } // end of class _COAUTHIDENTITY

  .class interface public abstract auto ansi import IRunningObjectTable
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 30 30 30 30 30 31 30 2D 30 30 30 30   // ..$00000010-0000
                                                                                                    2D 30 30 30 30 2D 43 30 30 30 2D 30 30 30 30 30   // -0000-C000-00000
                                                                                                    30 30 30 30 30 34 36 00 00 )                      // 0000046..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  Register([in] unsigned int32 grfFlags,
                                    [in] object  marshal( iunknown) punkObject,
                                    [in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkObjectName,
                                    [out] unsigned int32& pdwRegister) runtime managed internalcall
    {
    } // end of method IRunningObjectTable::Register

    .method public hidebysig newslot virtual abstract 
            instance void  Revoke([in] unsigned int32 dwRegister) runtime managed internalcall
    {
    } // end of method IRunningObjectTable::Revoke

    .method public hidebysig newslot virtual abstract 
            instance void  IsRunning([in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkObjectName) runtime managed internalcall
    {
    } // end of method IRunningObjectTable::IsRunning

    .method public hidebysig newslot virtual abstract 
            instance void  GetObject([in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkObjectName,
                                     [out] object&  marshal( iunknown) ppunkObject) runtime managed internalcall
    {
    } // end of method IRunningObjectTable::GetObject

    .method public hidebysig newslot virtual abstract 
            instance void  NoteChangeTime([in] unsigned int32 dwRegister,
                                          [in] valuetype MSR.LST.MDShow._FILETIME& pfiletime) runtime managed internalcall
    {
    } // end of method IRunningObjectTable::NoteChangeTime

    .method public hidebysig newslot virtual abstract 
            instance void  GetTimeOfLastChange([in] class MSR.LST.MDShow.IMoniker  marshal( interface) pmkObjectName,
                                               [out] valuetype MSR.LST.MDShow._FILETIME& pfiletime) runtime managed internalcall
    {
    } // end of method IRunningObjectTable::GetTimeOfLastChange

    .method public hidebysig newslot virtual abstract 
            instance void  EnumRunning([out] class MSR.LST.MDShow.IEnumMoniker&  marshal( interface) ppenumMoniker) runtime managed internalcall
    {
    } // end of method IRunningObjectTable::EnumRunning

  } // end of class IRunningObjectTable

  .class interface public abstract auto ansi import IEnumString
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 30 30 30 30 31 30 31 2D 30 30 30 30   // ..$00000101-0000
                                                                                                    2D 30 30 30 30 2D 43 30 30 30 2D 30 30 30 30 30   // -0000-C000-00000
                                                                                                    30 30 30 30 30 34 36 00 00 )                      // 0000046..
    .method public hidebysig newslot virtual abstract 
            instance void  RemoteNext([in] unsigned int32 celt,
                                      [out] string&  marshal( lpwstr) rgelt,
                                      [out] unsigned int32& pceltFetched) runtime managed internalcall
    {
    } // end of method IEnumString::RemoteNext

    .method public hidebysig newslot virtual abstract 
            instance void  Skip([in] unsigned int32 celt) runtime managed internalcall
    {
    } // end of method IEnumString::Skip

    .method public hidebysig newslot virtual abstract 
            instance void  Reset() runtime managed internalcall
    {
    } // end of method IEnumString::Reset

    .method public hidebysig newslot virtual abstract 
            instance void  Clone([out] class MSR.LST.MDShow.IEnumString&  marshal( interface) ppenum) runtime managed internalcall
    {
    } // end of method IEnumString::Clone

  } // end of class IEnumString

  .class public sequential ansi sealed beforefieldinit _AMMediaType
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public valuetype [mscorlib]System.Guid majortype
    .field public valuetype [mscorlib]System.Guid subtype
    //.field public int32 bFixedSizeSamples
    //.field public int32 bTemporalCompression
    .field /*0400002C*/ public  marshal( bool) bool bFixedSizeSamples
    .field /*0400002D*/ public  marshal( bool) bool bTemporalCompression
    .field public unsigned int32 lSampleSize
    .field public valuetype [mscorlib]System.Guid formattype
    .field public  marshal( iunknown) object punk
    .field public unsigned int32 cbFormat
    .field public native int pbFormat
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
  } // end of class _AMMediaType

  .class public auto ansi sealed _PinDirection
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._PinDirection PINDIR_INPUT = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow._PinDirection PINDIR_OUTPUT = int32(0x00000001)
  } // end of class _PinDirection

  .class public sequential ansi sealed beforefieldinit _AllocatorProperties
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public int32 cBuffers
    .field public int32 cbBuffer
    .field public int32 cbAlign
    .field public int32 cbPrefix
  } // end of class _AllocatorProperties

  .class interface public abstract auto ansi import IAMovieSetup
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 41 33 44 38 43 45 43 30 2D 37 45 35 41   // ..$A3D8CEC0-7E5A
                                                                                                    2D 31 31 43 46 2D 42 42 43 35 2D 30 30 38 30 35   // -11CF-BBC5-00805
                                                                                                    46 36 43 45 46 32 30 00 00 )                      // F6CEF20..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  Register() runtime managed internalcall
    {
    } // end of method IAMovieSetup::Register

    .method public hidebysig newslot virtual abstract 
            instance void  Unregister() runtime managed internalcall
    {
    } // end of method IAMovieSetup::Unregister

  } // end of class IAMovieSetup

  .class interface public abstract auto ansi import IEnumFilters
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 39 33 2D 30 41 44 34   // ..$56A86893-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .method public hidebysig newslot virtual abstract 
            instance void  Next([in] unsigned int32 cFilters,
                                [out] class MSR.LST.MDShow.IBaseFilter&  marshal( interface) ppFilter,
                                [out] unsigned int32& pcFetched) runtime managed internalcall
    {
    } // end of method IEnumFilters::Next

    .method public hidebysig newslot virtual abstract 
            instance void  Skip([in] unsigned int32 cFilters) runtime managed internalcall
    {
    } // end of method IEnumFilters::Skip

    .method public hidebysig newslot virtual abstract 
            instance void  Reset() runtime managed internalcall
    {
    } // end of method IEnumFilters::Reset

    .method public hidebysig newslot virtual abstract 
            instance void  Clone([out] class MSR.LST.MDShow.IEnumFilters&  marshal( interface) ppenum) runtime managed internalcall
    {
    } // end of method IEnumFilters::Clone

  } // end of class IEnumFilters

  .class interface public abstract auto ansi import IBaseFilter
         implements MSR.LST.MDShow.IMediaFilter
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 39 35 2D 30 41 44 34   // ..$56A86895-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .method public hidebysig newslot virtual abstract 
            instance void  GetClassID([out] valuetype [mscorlib]System.Guid& pClassID) runtime managed internalcall
    {
    } // end of method IBaseFilter::GetClassID

    .method public hidebysig newslot virtual abstract 
            instance void  Stop() runtime managed internalcall
    {
    } // end of method IBaseFilter::Stop

    .method public hidebysig newslot virtual abstract 
            instance void  Pause() runtime managed internalcall
    {
    } // end of method IBaseFilter::Pause

    .method public hidebysig newslot virtual abstract 
            instance void  Run(int64 tStart) runtime managed internalcall
    {
    } // end of method IBaseFilter::Run

    .method public hidebysig newslot virtual abstract 
            instance void  GetState([in] unsigned int32 dwMilliSecsTimeout,
                                    [out] valuetype MSR.LST.MDShow._FilterState& State) runtime managed internalcall
    {
    } // end of method IBaseFilter::GetState

    .method public hidebysig newslot virtual abstract 
            instance void  SetSyncSource([in] class MSR.LST.MDShow.IReferenceClock  marshal( interface) pClock) runtime managed internalcall
    {
    } // end of method IBaseFilter::SetSyncSource

    .method public hidebysig newslot virtual abstract 
            instance void  GetSyncSource([out] class MSR.LST.MDShow.IReferenceClock&  marshal( interface) pClock) runtime managed internalcall
    {
    } // end of method IBaseFilter::GetSyncSource

    .method public hidebysig newslot virtual abstract 
            instance void  EnumPins([out] class MSR.LST.MDShow.IEnumPins&  marshal( interface) ppenum) runtime managed internalcall
    {
    } // end of method IBaseFilter::EnumPins

    .method public hidebysig newslot virtual abstract 
            instance void  FindPin([in] string  marshal( lpwstr) Id,
                                   [out] class MSR.LST.MDShow.IPin&  marshal( interface) ppPin) runtime managed internalcall
    {
    } // end of method IBaseFilter::FindPin

    .method public hidebysig newslot virtual abstract 
            instance void  QueryFilterInfo([out] valuetype MSR.LST.MDShow._FilterInfo& pInfo) runtime managed internalcall
    {
    } // end of method IBaseFilter::QueryFilterInfo

    .method public hidebysig newslot virtual abstract 
            instance void  JoinFilterGraph([in] class MSR.LST.MDShow.IFilterGraph  marshal( interface) pGraph,
                                           [in] string  marshal( lpwstr) pName) runtime managed internalcall
    {
    } // end of method IBaseFilter::JoinFilterGraph

    .method public hidebysig newslot virtual abstract 
            instance void  QueryVendorInfo([out] string&  marshal( lpwstr) pVendorInfo) runtime managed internalcall
    {
    } // end of method IBaseFilter::QueryVendorInfo

  } // end of class IBaseFilter

  .class interface public abstract auto ansi import IMediaFilter
         implements MSR.LST.MDShow.IPersist
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 39 39 2D 30 41 44 34   // ..$56A86899-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .method public hidebysig newslot virtual abstract 
            instance void  GetClassID([out] valuetype [mscorlib]System.Guid& pClassID) runtime managed internalcall
    {
    } // end of method IMediaFilter::GetClassID

    .method public hidebysig newslot virtual abstract 
            instance void  Stop() runtime managed internalcall
    {
    } // end of method IMediaFilter::Stop

    .method public hidebysig newslot virtual abstract 
            instance void  Pause() runtime managed internalcall
    {
    } // end of method IMediaFilter::Pause

    .method public hidebysig newslot virtual abstract 
            instance void  Run(int64 tStart) runtime managed internalcall
    {
    } // end of method IMediaFilter::Run

    .method public hidebysig newslot virtual abstract 
            instance void  GetState([in] unsigned int32 dwMilliSecsTimeout,
                                    [out] valuetype MSR.LST.MDShow._FilterState& State) runtime managed internalcall
    {
    } // end of method IMediaFilter::GetState

    .method public hidebysig newslot virtual abstract 
            instance void  SetSyncSource([in] class MSR.LST.MDShow.IReferenceClock  marshal( interface) pClock) runtime managed internalcall
    {
    } // end of method IMediaFilter::SetSyncSource

    .method public hidebysig newslot virtual abstract 
            instance void  GetSyncSource([out] class MSR.LST.MDShow.IReferenceClock&  marshal( interface) pClock) runtime managed internalcall
    {
    } // end of method IMediaFilter::GetSyncSource

  } // end of class IMediaFilter

  .class public auto ansi sealed _FilterState
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._FilterState State_Stopped = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow._FilterState State_Paused = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow._FilterState State_Running = int32(0x00000002)
  } // end of class _FilterState

  .class interface public abstract auto ansi import IReferenceClock
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 39 37 2D 30 41 44 34   // ..$56A86897-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .method public hidebysig newslot virtual abstract 
            instance void  GetTime([out] int64& pTime) runtime managed internalcall
    {
    } // end of method IReferenceClock::GetTime

    .method public hidebysig newslot virtual abstract 
            instance void  AdviseTime([in] int64 baseTime,
                                      [in] int64 streamTime,
                                      [in] unsigned int32 hEvent,
                                      [out] unsigned int32& pdwAdviseCookie) runtime managed internalcall
    {
      .param [3]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
      .param [4]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
    } // end of method IReferenceClock::AdviseTime

    .method public hidebysig newslot virtual abstract 
            instance void  AdvisePeriodic([in] int64 startTime,
                                          [in] int64 periodTime,
                                          [in] unsigned int32 hSemaphore,
                                          [out] unsigned int32& pdwAdviseCookie) runtime managed internalcall
    {
      .param [3]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
      .param [4]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
    } // end of method IReferenceClock::AdvisePeriodic

    .method public hidebysig newslot virtual abstract 
            instance void  Unadvise([in] unsigned int32 dwAdviseCookie) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
    } // end of method IReferenceClock::Unadvise

  } // end of class IReferenceClock

  .class interface public abstract auto ansi import IEnumPins
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 39 32 2D 30 41 44 34   // ..$56A86892-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  Next([in] unsigned int32 cPins,
                                [out] class MSR.LST.MDShow.IPin&  marshal( interface) ppPins,
                                [out] unsigned int32& pcFetched) runtime managed internalcall
    {
    } // end of method IEnumPins::Next

    .method public hidebysig newslot virtual abstract 
            instance void  Skip([in] unsigned int32 cPins) runtime managed internalcall
    {
    } // end of method IEnumPins::Skip

    .method public hidebysig newslot virtual abstract 
            instance void  Reset() runtime managed internalcall
    {
    } // end of method IEnumPins::Reset

    .method public hidebysig newslot virtual abstract 
            instance void  Clone([out] class MSR.LST.MDShow.IEnumPins&  marshal( interface) ppenum) runtime managed internalcall
    {
    } // end of method IEnumPins::Clone

  } // end of class IEnumPins

  .class interface public abstract auto ansi import IPin
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 39 31 2D 30 41 44 34   // ..$56A86891-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .method public hidebysig newslot virtual abstract 
            instance void  Connect([in] class MSR.LST.MDShow.IPin  marshal( interface) pReceivePin,
                                   [in] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IPin::Connect

    .method public hidebysig newslot virtual abstract 
            instance void  ReceiveConnection([in] class MSR.LST.MDShow.IPin  marshal( interface) pConnector,
                                             [in] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IPin::ReceiveConnection

    .method public hidebysig newslot virtual abstract 
            instance void  Disconnect() runtime managed internalcall
    {
    } // end of method IPin::Disconnect

    .method public hidebysig newslot virtual abstract 
            instance void  ConnectedTo([out] class MSR.LST.MDShow.IPin&  marshal( interface) pPin) runtime managed internalcall
    {
    } // end of method IPin::ConnectedTo

    .method public hidebysig newslot virtual abstract 
            instance void  ConnectionMediaType([out] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IPin::ConnectionMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  QueryPinInfo([out] valuetype MSR.LST.MDShow._PinInfo& pInfo) runtime managed internalcall
    {
    } // end of method IPin::QueryPinInfo

    .method public hidebysig newslot virtual abstract 
            instance void  QueryDirection([out] valuetype MSR.LST.MDShow._PinDirection& pPinDir) runtime managed internalcall
    {
    } // end of method IPin::QueryDirection

    .method public hidebysig newslot virtual abstract 
            instance void  QueryId([out] string&  marshal( lpwstr) Id) runtime managed internalcall
    {
    } // end of method IPin::QueryId

    .method public hidebysig newslot virtual abstract 
            instance void  QueryAccept([in] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IPin::QueryAccept

    .method public hidebysig newslot virtual abstract 
            instance void  EnumMediaTypes([out] class MSR.LST.MDShow.IEnumMediaTypes&  marshal( interface) ppenum) runtime managed internalcall
    {
    } // end of method IPin::EnumMediaTypes

    .method public hidebysig newslot virtual abstract 
            instance void  QueryInternalConnections([out] class MSR.LST.MDShow.IPin&  marshal( interface) apPin,
                                                    [in][out] unsigned int32& nPin) runtime managed internalcall
    {
    } // end of method IPin::QueryInternalConnections

    .method public hidebysig newslot virtual abstract 
            instance void  EndOfStream() runtime managed internalcall
    {
    } // end of method IPin::EndOfStream

    .method public hidebysig newslot virtual abstract 
            instance void  BeginFlush() runtime managed internalcall
    {
    } // end of method IPin::BeginFlush

    .method public hidebysig newslot virtual abstract 
            instance void  EndFlush() runtime managed internalcall
    {
    } // end of method IPin::EndFlush

    .method public hidebysig newslot virtual abstract 
            instance void  NewSegment([in] int64 tStart,
                                      [in] int64 tStop,
                                      [in] float64 dRate) runtime managed internalcall
    {
    } // end of method IPin::NewSegment

  } // end of class IPin

  .class public sequential ansi sealed beforefieldinit _PinInfo
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public  marshal( interface) class MSR.LST.MDShow.IBaseFilter pFilter
    .field public valuetype MSR.LST.MDShow._PinDirection dir
    .field public  marshal( fixed array [128]) unsigned int16[] achName
  } // end of class _PinInfo

  .class interface public abstract auto ansi import IEnumMediaTypes
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 39 43 33 31 30 34 30 2D 38 34 36 42   // ..$89C31040-846B
                                                                                                    2D 31 31 43 45 2D 39 37 44 33 2D 30 30 41 41 30   // -11CE-97D3-00AA0
                                                                                                    30 35 35 35 39 35 41 00 00 )                      // 055595A..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  Next([in] unsigned int32 cMediaTypes,
                                [out] native int ppMediaTypes,
                                [out] unsigned int32& pcFetched) runtime managed internalcall
    {
    } // end of method IEnumMediaTypes::Next

    .method public hidebysig newslot virtual abstract 
            instance void  Skip([in] unsigned int32 cMediaTypes) runtime managed internalcall
    {
    } // end of method IEnumMediaTypes::Skip

    .method public hidebysig newslot virtual abstract 
            instance void  Reset() runtime managed internalcall
    {
    } // end of method IEnumMediaTypes::Reset

    .method public hidebysig newslot virtual abstract 
            instance void  Clone([out] class MSR.LST.MDShow.IEnumMediaTypes&  marshal( interface) ppenum) runtime managed internalcall
    {
    } // end of method IEnumMediaTypes::Clone

  } // end of class IEnumMediaTypes

  .class public sequential ansi sealed beforefieldinit _FilterInfo
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public  marshal( fixed array [128]) unsigned int16[] achName
    .field public  marshal( interface) class MSR.LST.MDShow.IFilterGraph pGraph
  } // end of class _FilterInfo

  .class interface public abstract auto ansi import IFilterGraph
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 39 46 2D 30 41 44 34   // ..$56A8689F-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .method public hidebysig newslot virtual abstract 
            instance void  AddFilter([in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pFilter,
                                     [in] string  marshal( lpwstr) pName) runtime managed internalcall
    {
    } // end of method IFilterGraph::AddFilter

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveFilter([in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pFilter) runtime managed internalcall
    {
    } // end of method IFilterGraph::RemoveFilter

    .method public hidebysig newslot virtual abstract 
            instance void  EnumFilters([out] class MSR.LST.MDShow.IEnumFilters&  marshal( interface) ppenum) runtime managed internalcall
    {
    } // end of method IFilterGraph::EnumFilters

    .method public hidebysig newslot virtual abstract 
            instance void  FindFilterByName([in] string  marshal( lpwstr) pName,
                                            [out] class MSR.LST.MDShow.IBaseFilter&  marshal( interface) ppFilter) runtime managed internalcall
    {
    } // end of method IFilterGraph::FindFilterByName

    .method public hidebysig newslot virtual abstract 
            instance void  ConnectDirect([in] class MSR.LST.MDShow.IPin  marshal( interface) ppinOut,
                                         [in] class MSR.LST.MDShow.IPin  marshal( interface) ppinIn,
                                         [in] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IFilterGraph::ConnectDirect

    .method public hidebysig newslot virtual abstract 
            instance void  Reconnect([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin) runtime managed internalcall
    {
    } // end of method IFilterGraph::Reconnect

    .method public hidebysig newslot virtual abstract 
            instance void  Disconnect([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin) runtime managed internalcall
    {
    } // end of method IFilterGraph::Disconnect

    .method public hidebysig newslot virtual abstract 
            instance void  SetDefaultSyncSource() runtime managed internalcall
    {
    } // end of method IFilterGraph::SetDefaultSyncSource

  } // end of class IFilterGraph

  .class interface public abstract auto ansi import IMediaSample
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 39 41 2D 30 41 44 34   // ..$56A8689A-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .method public hidebysig newslot virtual abstract 
            instance void  GetPointer([out] native int ppBuffer) runtime managed internalcall
    {
    } // end of method IMediaSample::GetPointer

    .method public hidebysig newslot virtual abstract 
            instance int32  GetSize() runtime managed preservesig internalcall
    {
    } // end of method IMediaSample::GetSize

    .method public hidebysig newslot virtual abstract 
            instance void  GetTime([out] int64& pTimeStart,
                                   [out] int64& pTimeEnd) runtime managed internalcall
    {
    } // end of method IMediaSample::GetTime

    .method public hidebysig newslot virtual abstract 
            instance void  SetTime([in] int64& pTimeStart,
                                   [in] int64& pTimeEnd) runtime managed internalcall
    {
    } // end of method IMediaSample::SetTime

    .method public hidebysig newslot virtual abstract 
            instance void  IsSyncPoint() runtime managed internalcall
    {
    } // end of method IMediaSample::IsSyncPoint

    .method public hidebysig newslot virtual abstract 
            instance void  SetSyncPoint(int32 bIsSyncPoint) runtime managed internalcall
    {
    } // end of method IMediaSample::SetSyncPoint

    .method public hidebysig newslot virtual abstract 
            instance void  IsPreroll() runtime managed internalcall
    {
    } // end of method IMediaSample::IsPreroll

    .method public hidebysig newslot virtual abstract 
            instance void  SetPreroll(int32 bIsPreroll) runtime managed internalcall
    {
    } // end of method IMediaSample::SetPreroll

    .method public hidebysig newslot virtual abstract 
            instance int32  GetActualDataLength() runtime managed preservesig internalcall
    {
    } // end of method IMediaSample::GetActualDataLength

    .method public hidebysig newslot virtual abstract 
            instance void  SetActualDataLength(int32 __MIDL_0010) runtime managed internalcall
    {
    } // end of method IMediaSample::SetActualDataLength

    .method public hidebysig newslot virtual abstract 
            instance void  GetMediaType(native int ppMediaType) runtime managed internalcall
    {
    } // end of method IMediaSample::GetMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  SetMediaType(valuetype MSR.LST.MDShow._AMMediaType& pMediaType) runtime managed internalcall
    {
    } // end of method IMediaSample::SetMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  IsDiscontinuity() runtime managed internalcall
    {
    } // end of method IMediaSample::IsDiscontinuity

    .method public hidebysig newslot virtual abstract 
            instance void  SetDiscontinuity(int32 bDiscontinuity) runtime managed internalcall
    {
    } // end of method IMediaSample::SetDiscontinuity

    .method public hidebysig newslot virtual abstract 
            instance void  GetMediaTime([out] int64& pTimeStart,
                                        [out] int64& pTimeEnd) runtime managed internalcall
    {
    } // end of method IMediaSample::GetMediaTime

    .method public hidebysig newslot virtual abstract 
            instance void  SetMediaTime([in] int64& pTimeStart,
                                        [in] int64& pTimeEnd) runtime managed internalcall
    {
    } // end of method IMediaSample::SetMediaTime

  } // end of class IMediaSample

  .class interface public abstract auto ansi import IMemAllocator
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 39 43 2D 30 41 44 34   // ..$56A8689C-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetProperties([in] valuetype MSR.LST.MDShow._AllocatorProperties& pRequest,
                                         [out] valuetype MSR.LST.MDShow._AllocatorProperties& pActual) runtime managed internalcall
    {
    } // end of method IMemAllocator::SetProperties

    .method public hidebysig newslot virtual abstract 
            instance void  GetProperties([out] valuetype MSR.LST.MDShow._AllocatorProperties& pProps) runtime managed internalcall
    {
    } // end of method IMemAllocator::GetProperties

    .method public hidebysig newslot virtual abstract 
            instance void  Commit() runtime managed internalcall
    {
    } // end of method IMemAllocator::Commit

    .method public hidebysig newslot virtual abstract 
            instance void  Decommit() runtime managed internalcall
    {
    } // end of method IMemAllocator::Decommit

    .method public hidebysig newslot virtual abstract 
            instance void  GetBuffer([out] class MSR.LST.MDShow.IMediaSample&  marshal( interface) ppBuffer,
                                     [in] int64& pStartTime,
                                     [in] int64& pEndTime,
                                     [in] unsigned int32 dwFlags) runtime managed internalcall
    {
    } // end of method IMemAllocator::GetBuffer

    .method public hidebysig newslot virtual abstract 
            instance void  ReleaseBuffer([in] class MSR.LST.MDShow.IMediaSample  marshal( interface) pBuffer) runtime managed internalcall
    {
    } // end of method IMemAllocator::ReleaseBuffer

  } // end of class IMemAllocator

  .class interface public abstract auto ansi import IMemAllocatorCallbackTemp
         implements MSR.LST.MDShow.IMemAllocator
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 37 39 41 30 43 46 30 2D 43 31 44 45   // ..$379A0CF0-C1DE
                                                                                                    2D 31 31 44 32 2D 41 42 46 35 2D 30 30 41 30 43   // -11D2-ABF5-00A0C
                                                                                                    39 30 35 46 33 37 35 00 00 )                      // 905F375..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetProperties([in] valuetype MSR.LST.MDShow._AllocatorProperties& pRequest,
                                         [out] valuetype MSR.LST.MDShow._AllocatorProperties& pActual) runtime managed internalcall
    {
    } // end of method IMemAllocatorCallbackTemp::SetProperties

    .method public hidebysig newslot virtual abstract 
            instance void  GetProperties([out] valuetype MSR.LST.MDShow._AllocatorProperties& pProps) runtime managed internalcall
    {
    } // end of method IMemAllocatorCallbackTemp::GetProperties

    .method public hidebysig newslot virtual abstract 
            instance void  Commit() runtime managed internalcall
    {
    } // end of method IMemAllocatorCallbackTemp::Commit

    .method public hidebysig newslot virtual abstract 
            instance void  Decommit() runtime managed internalcall
    {
    } // end of method IMemAllocatorCallbackTemp::Decommit

    .method public hidebysig newslot virtual abstract 
            instance void  GetBuffer([out] class MSR.LST.MDShow.IMediaSample&  marshal( interface) ppBuffer,
                                     [in] int64& pStartTime,
                                     [in] int64& pEndTime,
                                     [in] unsigned int32 dwFlags) runtime managed internalcall
    {
    } // end of method IMemAllocatorCallbackTemp::GetBuffer

    .method public hidebysig newslot virtual abstract 
            instance void  ReleaseBuffer([in] class MSR.LST.MDShow.IMediaSample  marshal( interface) pBuffer) runtime managed internalcall
    {
    } // end of method IMemAllocatorCallbackTemp::ReleaseBuffer

    .method public hidebysig newslot virtual abstract 
            instance void  SetNotify([in] class MSR.LST.MDShow.IMemAllocatorNotifyCallbackTemp  marshal( interface) pNotify) runtime managed internalcall
    {
    } // end of method IMemAllocatorCallbackTemp::SetNotify

    .method public hidebysig newslot virtual abstract 
            instance void  GetFreeCount([out] int32& plBuffersFree) runtime managed internalcall
    {
    } // end of method IMemAllocatorCallbackTemp::GetFreeCount

  } // end of class IMemAllocatorCallbackTemp

  .class interface public abstract auto ansi import IMemAllocatorNotifyCallbackTemp
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 32 39 38 30 42 33 30 2D 43 31 44 45   // ..$92980B30-C1DE
                                                                                                    2D 31 31 44 32 2D 41 42 46 35 2D 30 30 41 30 43   // -11D2-ABF5-00A0C
                                                                                                    39 30 35 46 33 37 35 00 00 )                      // 905F375..
    .method public hidebysig newslot virtual abstract 
            instance void  NotifyRelease() runtime managed internalcall
    {
    } // end of method IMemAllocatorNotifyCallbackTemp::NotifyRelease

  } // end of class IMemAllocatorNotifyCallbackTemp

  .class interface public abstract auto ansi import IMemInputPin
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 39 44 2D 30 41 44 34   // ..$56A8689D-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocator([out] class MSR.LST.MDShow.IMemAllocator&  marshal( interface) ppAllocator) runtime managed internalcall
    {
    } // end of method IMemInputPin::GetAllocator

    .method public hidebysig newslot virtual abstract 
            instance void  NotifyAllocator([in] class MSR.LST.MDShow.IMemAllocator  marshal( interface) pAllocator,
                                           [in] int32 bReadOnly) runtime managed internalcall
    {
    } // end of method IMemInputPin::NotifyAllocator

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocatorRequirements([out] valuetype MSR.LST.MDShow._AllocatorProperties& pProps) runtime managed internalcall
    {
    } // end of method IMemInputPin::GetAllocatorRequirements

    .method public hidebysig newslot virtual abstract 
            instance void  Receive([in] class MSR.LST.MDShow.IMediaSample  marshal( interface) pSample) runtime managed internalcall
    {
    } // end of method IMemInputPin::Receive

    .method public hidebysig newslot virtual abstract 
            instance void  ReceiveMultiple([in] class MSR.LST.MDShow.IMediaSample&  marshal( interface) pSamples,
                                           [in] int32 nSamples,
                                           [out] int32& nSamplesProcessed) runtime managed internalcall
    {
    } // end of method IMemInputPin::ReceiveMultiple

    .method public hidebysig newslot virtual abstract 
            instance void  ReceiveCanBlock() runtime managed internalcall
    {
    } // end of method IMemInputPin::ReceiveCanBlock

  } // end of class IMemInputPin

  .class interface public abstract auto ansi import IReferenceClock2
         implements MSR.LST.MDShow.IReferenceClock
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 36 42 37 33 38 38 35 2D 43 32 43 38   // ..$36B73885-C2C8
                                                                                                    2D 31 31 43 46 2D 38 42 34 36 2D 30 30 38 30 35   // -11CF-8B46-00805
                                                                                                    46 36 43 45 46 36 30 00 00 )                      // F6CEF60..
    .method public hidebysig newslot virtual abstract 
            instance void  GetTime([out] int64& pTime) runtime managed internalcall
    {
    } // end of method IReferenceClock2::GetTime

    .method public hidebysig newslot virtual abstract 
            instance void  AdviseTime([in] int64 baseTime,
                                      [in] int64 streamTime,
                                      [in] unsigned int32 hEvent,
                                      [out] unsigned int32& pdwAdviseCookie) runtime managed internalcall
    {
      .param [3]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
      .param [4]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
    } // end of method IReferenceClock2::AdviseTime

    .method public hidebysig newslot virtual abstract 
            instance void  AdvisePeriodic([in] int64 startTime,
                                          [in] int64 periodTime,
                                          [in] unsigned int32 hSemaphore,
                                          [out] unsigned int32& pdwAdviseCookie) runtime managed internalcall
    {
      .param [3]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
      .param [4]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
    } // end of method IReferenceClock2::AdvisePeriodic

    .method public hidebysig newslot virtual abstract 
            instance void  Unadvise([in] unsigned int32 dwAdviseCookie) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
    } // end of method IReferenceClock2::Unadvise

  } // end of class IReferenceClock2

  .class public auto ansi sealed tagAM_SAMPLE_PROPERTY_FLAGS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagAM_SAMPLE_PROPERTY_FLAGS AM_SAMPLE_SPLICEPOINT = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.tagAM_SAMPLE_PROPERTY_FLAGS AM_SAMPLE_PREROLL = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.tagAM_SAMPLE_PROPERTY_FLAGS AM_SAMPLE_DATADISCONTINUITY = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.tagAM_SAMPLE_PROPERTY_FLAGS AM_SAMPLE_TYPECHANGED = int32(0x00000008)
    .field public static literal valuetype MSR.LST.MDShow.tagAM_SAMPLE_PROPERTY_FLAGS AM_SAMPLE_TIMEVALID = int32(0x00000010)
    .field public static literal valuetype MSR.LST.MDShow.tagAM_SAMPLE_PROPERTY_FLAGS AM_SAMPLE_TIMEDISCONTINUITY = int32(0x00000040)
    .field public static literal valuetype MSR.LST.MDShow.tagAM_SAMPLE_PROPERTY_FLAGS AM_SAMPLE_FLUSH_ON_PAUSE = int32(0x00000080)
    .field public static literal valuetype MSR.LST.MDShow.tagAM_SAMPLE_PROPERTY_FLAGS AM_SAMPLE_STOPVALID = int32(0x00000100)
    .field public static literal valuetype MSR.LST.MDShow.tagAM_SAMPLE_PROPERTY_FLAGS AM_SAMPLE_ENDOFSTREAM = int32(0x00000200)
    .field public static literal valuetype MSR.LST.MDShow.tagAM_SAMPLE_PROPERTY_FLAGS AM_STREAM_MEDIA = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.tagAM_SAMPLE_PROPERTY_FLAGS AM_STREAM_CONTROL = int32(0x00000001)
  } // end of class tagAM_SAMPLE_PROPERTY_FLAGS

  .class public sequential ansi sealed beforefieldinit tagAM_SAMPLE2_PROPERTIES
         extends [mscorlib]System.ValueType
  {
    .pack 8
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 cbData
    .field public unsigned int32 dwTypeSpecificFlags
    .field public unsigned int32 dwSampleFlags
    .field public int32 lActual
    .field public int64 tStart
    .field public int64 tStop
    .field public unsigned int32 dwStreamId
    .field public native int pMediaType
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public native int pbBuffer
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public int32 cbBuffer
  } // end of class tagAM_SAMPLE2_PROPERTIES

  .class interface public abstract auto ansi import IMediaSample2
         implements MSR.LST.MDShow.IMediaSample
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 36 42 37 33 38 38 34 2D 43 32 43 38   // ..$36B73884-C2C8
                                                                                                    2D 31 31 43 46 2D 38 42 34 36 2D 30 30 38 30 35   // -11CF-8B46-00805
                                                                                                    46 36 43 45 46 36 30 00 00 )                      // F6CEF60..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetPointer([out] native int ppBuffer) runtime managed internalcall
    {
    } // end of method IMediaSample2::GetPointer

    .method public hidebysig newslot virtual abstract 
            instance int32  GetSize() runtime managed preservesig internalcall
    {
    } // end of method IMediaSample2::GetSize

    .method public hidebysig newslot virtual abstract 
            instance void  GetTime([out] int64& pTimeStart,
                                   [out] int64& pTimeEnd) runtime managed internalcall
    {
    } // end of method IMediaSample2::GetTime

    .method public hidebysig newslot virtual abstract 
            instance void  SetTime([in] int64& pTimeStart,
                                   [in] int64& pTimeEnd) runtime managed internalcall
    {
    } // end of method IMediaSample2::SetTime

    .method public hidebysig newslot virtual abstract 
            instance void  IsSyncPoint() runtime managed internalcall
    {
    } // end of method IMediaSample2::IsSyncPoint

    .method public hidebysig newslot virtual abstract 
            instance void  SetSyncPoint(int32 bIsSyncPoint) runtime managed internalcall
    {
    } // end of method IMediaSample2::SetSyncPoint

    .method public hidebysig newslot virtual abstract 
            instance void  IsPreroll() runtime managed internalcall
    {
    } // end of method IMediaSample2::IsPreroll

    .method public hidebysig newslot virtual abstract 
            instance void  SetPreroll(int32 bIsPreroll) runtime managed internalcall
    {
    } // end of method IMediaSample2::SetPreroll

    .method public hidebysig newslot virtual abstract 
            instance int32  GetActualDataLength() runtime managed preservesig internalcall
    {
    } // end of method IMediaSample2::GetActualDataLength

    .method public hidebysig newslot virtual abstract 
            instance void  SetActualDataLength(int32 __MIDL_0010) runtime managed internalcall
    {
    } // end of method IMediaSample2::SetActualDataLength

    .method public hidebysig newslot virtual abstract 
            instance void  GetMediaType(native int ppMediaType) runtime managed internalcall
    {
    } // end of method IMediaSample2::GetMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  SetMediaType(valuetype MSR.LST.MDShow._AMMediaType& pMediaType) runtime managed internalcall
    {
    } // end of method IMediaSample2::SetMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  IsDiscontinuity() runtime managed internalcall
    {
    } // end of method IMediaSample2::IsDiscontinuity

    .method public hidebysig newslot virtual abstract 
            instance void  SetDiscontinuity(int32 bDiscontinuity) runtime managed internalcall
    {
    } // end of method IMediaSample2::SetDiscontinuity

    .method public hidebysig newslot virtual abstract 
            instance void  GetMediaTime([out] int64& pTimeStart,
                                        [out] int64& pTimeEnd) runtime managed internalcall
    {
    } // end of method IMediaSample2::GetMediaTime

    .method public hidebysig newslot virtual abstract 
            instance void  SetMediaTime([in] int64& pTimeStart,
                                        [in] int64& pTimeEnd) runtime managed internalcall
    {
    } // end of method IMediaSample2::SetMediaTime

    .method public hidebysig newslot virtual abstract 
            instance void  GetProperties([in] unsigned int32 cbProperties,
                                         [out] unsigned int8& pbProperties) runtime managed internalcall
    {
    } // end of method IMediaSample2::GetProperties

    .method public hidebysig newslot virtual abstract 
            instance void  SetProperties([in] unsigned int32 cbProperties,
                                         [in] unsigned int8& pbProperties) runtime managed internalcall
    {
    } // end of method IMediaSample2::SetProperties

  } // end of class IMediaSample2

  .class public auto ansi sealed AM_SEEKING_SeekingFlags
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingFlags AM_SEEKING_NoPositioning = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingFlags AM_SEEKING_AbsolutePositioning = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingFlags AM_SEEKING_RelativePositioning = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingFlags AM_SEEKING_IncrementalPositioning = int32(0x00000003)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingFlags AM_SEEKING_PositioningBitsMask = int32(0x00000003)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingFlags AM_SEEKING_SeekToKeyFrame = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingFlags AM_SEEKING_ReturnTime = int32(0x00000008)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingFlags AM_SEEKING_Segment = int32(0x00000010)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingFlags AM_SEEKING_NoFlush = int32(0x00000020)
  } // end of class AM_SEEKING_SeekingFlags

  .class public auto ansi sealed AM_SEEKING_SeekingCapabilities
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingCapabilities AM_SEEKING_CanSeekAbsolute = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingCapabilities AM_SEEKING_CanSeekForwards = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingCapabilities AM_SEEKING_CanSeekBackwards = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingCapabilities AM_SEEKING_CanGetCurrentPos = int32(0x00000008)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingCapabilities AM_SEEKING_CanGetStopPos = int32(0x00000010)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingCapabilities AM_SEEKING_CanGetDuration = int32(0x00000020)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingCapabilities AM_SEEKING_CanPlayBackwards = int32(0x00000040)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingCapabilities AM_SEEKING_CanDoSegments = int32(0x00000080)
    .field public static literal valuetype MSR.LST.MDShow.AM_SEEKING_SeekingCapabilities AM_SEEKING_Source = int32(0x00000100)
  } // end of class AM_SEEKING_SeekingCapabilities

  .class interface public abstract auto ansi import IMediaSeeking
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 36 42 37 33 38 38 30 2D 43 32 43 38   // ..$36B73880-C2C8
                                                                                                    2D 31 31 43 46 2D 38 42 34 36 2D 30 30 38 30 35   // -11CF-8B46-00805
                                                                                                    46 36 43 45 46 36 30 00 00 )                      // F6CEF60..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetCapabilities([out] unsigned int32& pCapabilities) runtime managed internalcall
    {
    } // end of method IMediaSeeking::GetCapabilities

    .method public hidebysig newslot virtual abstract 
            instance void  CheckCapabilities([in][out] unsigned int32& pCapabilities) runtime managed internalcall
    {
    } // end of method IMediaSeeking::CheckCapabilities

    .method public hidebysig newslot virtual abstract 
            instance void  IsFormatSupported([in] valuetype [mscorlib]System.Guid& pFormat) runtime managed internalcall
    {
    } // end of method IMediaSeeking::IsFormatSupported

    .method public hidebysig newslot virtual abstract 
            instance void  QueryPreferredFormat([out] valuetype [mscorlib]System.Guid& pFormat) runtime managed internalcall
    {
    } // end of method IMediaSeeking::QueryPreferredFormat

    .method public hidebysig newslot virtual abstract 
            instance void  GetTimeFormat([out] valuetype [mscorlib]System.Guid& pFormat) runtime managed internalcall
    {
    } // end of method IMediaSeeking::GetTimeFormat

    .method public hidebysig newslot virtual abstract 
            instance void  IsUsingTimeFormat([in] valuetype [mscorlib]System.Guid& pFormat) runtime managed internalcall
    {
    } // end of method IMediaSeeking::IsUsingTimeFormat

    .method public hidebysig newslot virtual abstract 
            instance void  SetTimeFormat([in] valuetype [mscorlib]System.Guid& pFormat) runtime managed internalcall
    {
    } // end of method IMediaSeeking::SetTimeFormat

    .method public hidebysig newslot virtual abstract 
            instance void  GetDuration([out] int64& pDuration) runtime managed internalcall
    {
    } // end of method IMediaSeeking::GetDuration

    .method public hidebysig newslot virtual abstract 
            instance void  GetStopPosition([out] int64& pStop) runtime managed internalcall
    {
    } // end of method IMediaSeeking::GetStopPosition

    .method public hidebysig newslot virtual abstract 
            instance void  GetCurrentPosition([out] int64& pCurrent) runtime managed internalcall
    {
    } // end of method IMediaSeeking::GetCurrentPosition

    .method public hidebysig newslot virtual abstract 
            instance void  ConvertTimeFormat([out] int64& pTarget,
                                             [in] valuetype [mscorlib]System.Guid& pTargetFormat,
                                             [in] int64 Source,
                                             [in] valuetype [mscorlib]System.Guid& pSourceFormat) runtime managed internalcall
    {
    } // end of method IMediaSeeking::ConvertTimeFormat

    .method public hidebysig newslot virtual abstract 
            instance void  SetPositions([in][out] int64& pCurrent,
                                        [in] unsigned int32 dwCurrentFlags,
                                        [in][out] int64& pStop,
                                        [in] unsigned int32 dwStopFlags) runtime managed internalcall
    {
    } // end of method IMediaSeeking::SetPositions

    .method public hidebysig newslot virtual abstract 
            instance void  GetPositions([out] int64& pCurrent,
                                        [out] int64& pStop) runtime managed internalcall
    {
    } // end of method IMediaSeeking::GetPositions

    .method public hidebysig newslot virtual abstract 
            instance void  GetAvailable([out] int64& pEarliest,
                                        [out] int64& pLatest) runtime managed internalcall
    {
    } // end of method IMediaSeeking::GetAvailable

    .method public hidebysig newslot virtual abstract 
            instance void  SetRate([in] float64 dRate) runtime managed internalcall
    {
    } // end of method IMediaSeeking::SetRate

    .method public hidebysig newslot virtual abstract 
            instance void  GetRate([out] float64& pdRate) runtime managed internalcall
    {
    } // end of method IMediaSeeking::GetRate

    .method public hidebysig newslot virtual abstract 
            instance void  GetPreroll([out] int64& pllPreroll) runtime managed internalcall
    {
    } // end of method IMediaSeeking::GetPreroll

  } // end of class IMediaSeeking

  .class interface public abstract auto ansi import IEnumRegFilters
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 41 34 2D 30 41 44 34   // ..$56A868A4-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  Next([in] unsigned int32 cFilters,
                                [out] native int apRegFilter,
                                [out] unsigned int32& pcFetched) runtime managed internalcall
    {
      .param [2]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 52 45 47 46 49 4C 54 45 52 00 00 )          // w.REGFILTER..
    } // end of method IEnumRegFilters::Next

    .method public hidebysig newslot virtual abstract 
            instance void  Skip([in] unsigned int32 cFilters) runtime managed internalcall
    {
    } // end of method IEnumRegFilters::Skip

    .method public hidebysig newslot virtual abstract 
            instance void  Reset() runtime managed internalcall
    {
    } // end of method IEnumRegFilters::Reset

    .method public hidebysig newslot virtual abstract 
            instance void  Clone([out] class MSR.LST.MDShow.IEnumRegFilters&  marshal( interface) ppenum) runtime managed internalcall
    {
    } // end of method IEnumRegFilters::Clone

  } // end of class IEnumRegFilters

  .class public sequential ansi sealed beforefieldinit REGFILTER
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public valuetype [mscorlib]System.Guid 'clsid'
    .field public  marshal( lpwstr) string Name
  } // end of class REGFILTER

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0135_0001
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public valuetype [mscorlib]System.Guid 'clsid'
    .field public  marshal( lpwstr) string Name
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0135_0001

  .class interface public abstract auto ansi import IFileSourceFilter
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 41 36 2D 30 41 44 34   // ..$56A868A6-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  Load([in] string  marshal( lpwstr) pszFileName,
                                [in] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IFileSourceFilter::Load

    .method public hidebysig newslot virtual abstract 
            instance void  GetCurFile([out] string&  marshal( lpwstr) ppszFileName,
                                      [out] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IFileSourceFilter::GetCurFile

  } // end of class IFileSourceFilter

  .class interface public abstract auto ansi import IFileSinkFilter
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 41 32 31 30 34 38 33 30 2D 37 43 37 30   // ..$A2104830-7C70
                                                                                                    2D 31 31 43 46 2D 38 42 43 45 2D 30 30 41 41 30   // -11CF-8BCE-00AA0
                                                                                                    30 41 33 46 31 41 36 00 00 )                      // 0A3F1A6..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetFileName([in] string  marshal( lpwstr) pszFileName,
                                       [in] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IFileSinkFilter::SetFileName

    .method public hidebysig newslot virtual abstract 
            instance void  GetCurFile([out] string&  marshal( lpwstr) ppszFileName,
                                      [out] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IFileSinkFilter::GetCurFile

  } // end of class IFileSinkFilter

  .class interface public abstract auto ansi import IFileSinkFilter2
         implements MSR.LST.MDShow.IFileSinkFilter
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 30 38 35 35 42 39 30 2D 43 45 31 42   // ..$00855B90-CE1B
                                                                                                    2D 31 31 44 30 2D 42 44 34 46 2D 30 30 41 30 43   // -11D0-BD4F-00A0C
                                                                                                    39 31 31 43 45 38 36 00 00 )                      // 911CE86..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetFileName([in] string  marshal( lpwstr) pszFileName,
                                       [in] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IFileSinkFilter2::SetFileName

    .method public hidebysig newslot virtual abstract 
            instance void  GetCurFile([out] string&  marshal( lpwstr) ppszFileName,
                                      [out] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IFileSinkFilter2::GetCurFile

    .method public hidebysig newslot virtual abstract 
            instance void  SetMode([in] unsigned int32 dwFlags) runtime managed internalcall
    {
    } // end of method IFileSinkFilter2::SetMode

    .method public hidebysig newslot virtual abstract 
            instance void  GetMode([out] unsigned int32& pdwFlags) runtime managed internalcall
    {
    } // end of method IFileSinkFilter2::GetMode

  } // end of class IFileSinkFilter2

  .class interface public abstract auto ansi import IGraphBuilder
         implements MSR.LST.MDShow.IFilterGraph
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 41 39 2D 30 41 44 34   // ..$56A868A9-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  AddFilter([in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pFilter,
                                     [in] string  marshal( lpwstr) pName) runtime managed internalcall
    {
    } // end of method IGraphBuilder::AddFilter

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveFilter([in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pFilter) runtime managed internalcall
    {
    } // end of method IGraphBuilder::RemoveFilter

    .method public hidebysig newslot virtual abstract 
            instance void  EnumFilters([out] class MSR.LST.MDShow.IEnumFilters&  marshal( interface) ppenum) runtime managed internalcall
    {
    } // end of method IGraphBuilder::EnumFilters

    .method public hidebysig newslot virtual abstract 
            instance void  FindFilterByName([in] string  marshal( lpwstr) pName,
                                            [out] class MSR.LST.MDShow.IBaseFilter&  marshal( interface) ppFilter) runtime managed internalcall
    {
    } // end of method IGraphBuilder::FindFilterByName

    .method public hidebysig newslot virtual abstract 
            instance void  ConnectDirect([in] class MSR.LST.MDShow.IPin  marshal( interface) ppinOut,
                                         [in] class MSR.LST.MDShow.IPin  marshal( interface) ppinIn,
                                         [in] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IGraphBuilder::ConnectDirect

    .method public hidebysig newslot virtual abstract 
            instance void  Reconnect([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin) runtime managed internalcall
    {
    } // end of method IGraphBuilder::Reconnect

    .method public hidebysig newslot virtual abstract 
            instance void  Disconnect([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin) runtime managed internalcall
    {
    } // end of method IGraphBuilder::Disconnect

    .method public hidebysig newslot virtual abstract 
            instance void  SetDefaultSyncSource() runtime managed internalcall
    {
    } // end of method IGraphBuilder::SetDefaultSyncSource

    .method public hidebysig newslot virtual abstract 
            instance void  Connect([in] class MSR.LST.MDShow.IPin  marshal( interface) ppinOut,
                                   [in] class MSR.LST.MDShow.IPin  marshal( interface) ppinIn) runtime managed internalcall
    {
    } // end of method IGraphBuilder::Connect

    .method public hidebysig newslot virtual abstract 
            instance void  Render([in] class MSR.LST.MDShow.IPin  marshal( interface) ppinOut) runtime managed internalcall
    {
    } // end of method IGraphBuilder::Render

    .method public hidebysig newslot virtual abstract 
            instance void  RenderFile([in] string  marshal( lpwstr) lpcwstrFile,
                                      [in] string  marshal( lpwstr) lpcwstrPlayList) runtime managed internalcall
    {
    } // end of method IGraphBuilder::RenderFile

    .method public hidebysig newslot virtual abstract 
            instance void  AddSourceFilter([in] string  marshal( lpwstr) lpcwstrFileName,
                                           [in] string  marshal( lpwstr) lpcwstrFilterName,
                                           [out] class MSR.LST.MDShow.IBaseFilter&  marshal( interface) ppFilter) runtime managed internalcall
    {
    } // end of method IGraphBuilder::AddSourceFilter

    .method public hidebysig newslot virtual abstract 
            instance void  SetLogFile([in] unsigned int32 hFile) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
    } // end of method IGraphBuilder::SetLogFile

    .method public hidebysig newslot virtual abstract 
            instance void  Abort() runtime managed internalcall
    {
    } // end of method IGraphBuilder::Abort

    .method public hidebysig newslot virtual abstract 
            instance void  ShouldOperationContinue() runtime managed internalcall
    {
    } // end of method IGraphBuilder::ShouldOperationContinue

  } // end of class IGraphBuilder

  .class interface public abstract auto ansi import ICaptureGraphBuilder
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 42 46 38 37 42 36 45 30 2D 38 43 32 37   // ..$BF87B6E0-8C27
                                                                                                    2D 31 31 44 30 2D 42 33 46 30 2D 30 30 41 41 30   // -11D0-B3F0-00AA0
                                                                                                    30 33 37 36 31 43 35 00 00 )                      // 03761C5..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetFiltergraph([in] class MSR.LST.MDShow.IGraphBuilder  marshal( interface) pfg) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder::SetFiltergraph

    .method public hidebysig newslot virtual abstract 
            instance void  GetFiltergraph([out] class MSR.LST.MDShow.IGraphBuilder&  marshal( interface) ppfg) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder::GetFiltergraph

    .method public hidebysig newslot virtual abstract 
            instance void  SetOutputFileName([in] valuetype [mscorlib]System.Guid& pType,
                                             [in] string  marshal( lpwstr) lpstrFile,
                                             [out] class MSR.LST.MDShow.IBaseFilter&  marshal( interface) ppf,
                                             [out] class MSR.LST.MDShow.IFileSinkFilter&  marshal( interface) ppSink) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder::SetOutputFileName

    .method public hidebysig newslot virtual abstract 
            instance void  RemoteFindInterface([in] valuetype [mscorlib]System.Guid& pCategory,
                                               [in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pf,
                                               [in] valuetype [mscorlib]System.Guid& riid,
                                               [out] object&  marshal( iunknown) ppint) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder::RemoteFindInterface

    .method public hidebysig newslot virtual abstract 
            instance void  RenderStream([in] valuetype [mscorlib]System.Guid& pCategory,
                                        [in] object  marshal( iunknown) pSource,
                                        [in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pfCompressor,
                                        [in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pfRenderer) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder::RenderStream

    .method public hidebysig newslot virtual abstract 
            instance void  ControlStream([in] valuetype [mscorlib]System.Guid& pCategory,
                                         [in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pFilter,
                                         [in] int64& pstart,
                                         [in] int64& pStop,
                                         [in] unsigned int16 wStartCookie,
                                         [in] unsigned int16 wStopCookie) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder::ControlStream

    .method public hidebysig newslot virtual abstract 
            instance void  AllocCapFile([in] string  marshal( lpwstr) 'lpstr',
                                        [in] unsigned int64 dwlSize) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder::AllocCapFile

    .method public hidebysig newslot virtual abstract 
            instance void  CopyCaptureFile([in] string  marshal( lpwstr) lpwstrOld,
                                           [in] string  marshal( lpwstr) lpwstrNew,
                                           [in] int32 fAllowEscAbort,
                                           [in] class MSR.LST.MDShow.IAMCopyCaptureFileProgress  marshal( interface) pCallback) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder::CopyCaptureFile

  } // end of class ICaptureGraphBuilder

  .class interface public abstract auto ansi import IAMCopyCaptureFileProgress
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 37 30 44 31 44 32 30 2D 41 30 36 38   // ..$670D1D20-A068
                                                                                                    2D 31 31 44 30 2D 42 33 46 30 2D 30 30 41 41 30   // -11D0-B3F0-00AA0
                                                                                                    30 33 37 36 31 43 35 00 00 )                      // 03761C5..
    .method public hidebysig newslot virtual abstract 
            instance void  Progress([in] int32 iProgress) runtime managed internalcall
    {
    } // end of method IAMCopyCaptureFileProgress::Progress

  } // end of class IAMCopyCaptureFileProgress

  .class interface public abstract auto ansi import ICaptureGraphBuilder2
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 33 45 35 41 34 45 30 2D 32 44 35 30   // ..$93E5A4E0-2D50
                                                                                                    2D 31 31 44 32 2D 41 42 46 41 2D 30 30 41 30 43   // -11D2-ABFA-00A0C
                                                                                                    39 43 36 45 33 38 44 00 00 )                      // 9C6E38D..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetFiltergraph([in] class MSR.LST.MDShow.IGraphBuilder  marshal( interface) pfg) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder2::SetFiltergraph

    .method public hidebysig newslot virtual abstract 
            instance void  GetFiltergraph([out] class MSR.LST.MDShow.IGraphBuilder&  marshal( interface) ppfg) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder2::GetFiltergraph

    .method public hidebysig newslot virtual abstract 
            instance void  SetOutputFileName([in] valuetype [mscorlib]System.Guid& pType,
                                             [in] string  marshal( lpwstr) lpstrFile,
                                             [out] class MSR.LST.MDShow.IBaseFilter&  marshal( interface) ppf,
                                             [out] class MSR.LST.MDShow.IFileSinkFilter&  marshal( interface) ppSink) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder2::SetOutputFileName

    .method public hidebysig newslot virtual abstract 
            instance void  RemoteFindInterface([in] valuetype [mscorlib]System.Guid& pCategory,
                                               [in] valuetype [mscorlib]System.Guid& pType,
                                               [in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pf,
                                               [in] valuetype [mscorlib]System.Guid& riid,
                                               [out] object&  marshal( iunknown) ppint) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder2::RemoteFindInterface

    .method public hidebysig newslot virtual abstract 
            instance void  RenderStream([in] valuetype [mscorlib]System.Guid& pCategory,
                                        [in] valuetype [mscorlib]System.Guid& pType,
                                        [in] object  marshal( iunknown) pSource,
                                        [in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pfCompressor,
                                        [in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pfRenderer) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder2::RenderStream

    .method public hidebysig newslot virtual abstract 
            instance void  ControlStream([in] valuetype [mscorlib]System.Guid& pCategory,
                                         [in] valuetype [mscorlib]System.Guid& pType,
                                         [in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pFilter,
                                         [in] int64& pstart,
                                         [in] int64& pStop,
                                         [in] unsigned int16 wStartCookie,
                                         [in] unsigned int16 wStopCookie) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder2::ControlStream

    .method public hidebysig newslot virtual abstract 
            instance void  AllocCapFile([in] string  marshal( lpwstr) 'lpstr',
                                        [in] unsigned int64 dwlSize) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder2::AllocCapFile

    .method public hidebysig newslot virtual abstract 
            instance void  CopyCaptureFile([in] string  marshal( lpwstr) lpwstrOld,
                                           [in] string  marshal( lpwstr) lpwstrNew,
                                           [in] int32 fAllowEscAbort,
                                           [in] class MSR.LST.MDShow.IAMCopyCaptureFileProgress  marshal( interface) pCallback) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder2::CopyCaptureFile

    .method public hidebysig newslot virtual abstract 
            instance void  FindPin([in] object  marshal( iunknown) pSource,
                                   [in] valuetype MSR.LST.MDShow._PinDirection pindir,
                                   [in] valuetype [mscorlib]System.Guid& pCategory,
                                   [in] valuetype [mscorlib]System.Guid& pType,
                                   [in] int32 fUnconnected,
                                   [in] int32 num,
                                   [out] class MSR.LST.MDShow.IPin&  marshal( interface) ppPin) runtime managed internalcall
    {
    } // end of method ICaptureGraphBuilder2::FindPin

  } // end of class ICaptureGraphBuilder2

  .class interface public abstract auto ansi import IFilterMapper
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 41 33 2D 30 41 44 34   // ..$56A868A3-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  RegisterFilter([in] valuetype [mscorlib]System.Guid 'clsid',
                                          [in] string  marshal( lpwstr) Name,
                                          [in] unsigned int32 dwMerit) runtime managed internalcall
    {
    } // end of method IFilterMapper::RegisterFilter

    .method public hidebysig newslot virtual abstract 
            instance void  RegisterFilterInstance([in] valuetype [mscorlib]System.Guid 'clsid',
                                                  [in] string  marshal( lpwstr) Name,
                                                  [out] valuetype [mscorlib]System.Guid& MRId) runtime managed internalcall
    {
    } // end of method IFilterMapper::RegisterFilterInstance

    .method public hidebysig newslot virtual abstract 
            instance void  RegisterPin([in] valuetype [mscorlib]System.Guid Filter,
                                       [in] string  marshal( lpwstr) Name,
                                       [in] int32 bRendered,
                                       [in] int32 bOutput,
                                       [in] int32 bZero,
                                       [in] int32 bMany,
                                       [in] valuetype [mscorlib]System.Guid ConnectsToFilter,
                                       [in] string  marshal( lpwstr) ConnectsToPin) runtime managed internalcall
    {
    } // end of method IFilterMapper::RegisterPin

    .method public hidebysig newslot virtual abstract 
            instance void  RegisterPinType([in] valuetype [mscorlib]System.Guid clsFilter,
                                           [in] string  marshal( lpwstr) strName,
                                           [in] valuetype [mscorlib]System.Guid clsMajorType,
                                           [in] valuetype [mscorlib]System.Guid clsSubType) runtime managed internalcall
    {
    } // end of method IFilterMapper::RegisterPinType

    .method public hidebysig newslot virtual abstract 
            instance void  UnregisterFilter([in] valuetype [mscorlib]System.Guid Filter) runtime managed internalcall
    {
    } // end of method IFilterMapper::UnregisterFilter

    .method public hidebysig newslot virtual abstract 
            instance void  UnregisterFilterInstance([in] valuetype [mscorlib]System.Guid MRId) runtime managed internalcall
    {
    } // end of method IFilterMapper::UnregisterFilterInstance

    .method public hidebysig newslot virtual abstract 
            instance void  UnregisterPin([in] valuetype [mscorlib]System.Guid Filter,
                                         [in] string  marshal( lpwstr) Name) runtime managed internalcall
    {
    } // end of method IFilterMapper::UnregisterPin

    .method public hidebysig newslot virtual abstract 
            instance void  EnumMatchingFilters([out] class MSR.LST.MDShow.IEnumRegFilters&  marshal( interface) ppenum,
                                               [in] unsigned int32 dwMerit,
                                               [in] int32 bInputNeeded,
                                               [in] valuetype [mscorlib]System.Guid clsInMaj,
                                               [in] valuetype [mscorlib]System.Guid clsInSub,
                                               [in] int32 bRender,
                                               [in] int32 bOututNeeded,
                                               [in] valuetype [mscorlib]System.Guid clsOutMaj,
                                               [in] valuetype [mscorlib]System.Guid clsOutSub) runtime managed internalcall
    {
    } // end of method IFilterMapper::EnumMatchingFilters

  } // end of class IFilterMapper

  .class interface public abstract auto ansi import IFilterMapper2
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 42 37 39 42 42 30 42 30 2D 33 33 43 31   // ..$B79BB0B0-33C1
                                                                                                    2D 31 31 44 31 2D 41 42 45 31 2D 30 30 41 30 43   // -11D1-ABE1-00A0C
                                                                                                    39 30 35 46 33 37 35 00 00 )                      // 905F375..
    .method public hidebysig newslot virtual abstract 
            instance void  CreateCategory([in] valuetype [mscorlib]System.Guid& clsidCategory,
                                          [in] unsigned int32 dwCategoryMerit,
                                          [in] string  marshal( lpwstr) Description) runtime managed internalcall
    {
    } // end of method IFilterMapper2::CreateCategory

    .method public hidebysig newslot virtual abstract 
            instance void  UnregisterFilter([in] valuetype [mscorlib]System.Guid& pclsidCategory,
                                            [in] unsigned int16& szInstance,
                                            [in] valuetype [mscorlib]System.Guid& Filter) runtime managed internalcall
    {
    } // end of method IFilterMapper2::UnregisterFilter

    .method public hidebysig newslot virtual abstract 
            instance void  RegisterFilter([in] valuetype [mscorlib]System.Guid& clsidFilter,
                                          [in] string  marshal( lpwstr) Name,
                                          [in][out] class MSR.LST.MDShow.IMoniker&  marshal( interface) ppMoniker,
                                          [in] valuetype [mscorlib]System.Guid& pclsidCategory,
                                          [in] unsigned int16& szInstance,
                                          [in] valuetype MSR.LST.MDShow.REGFILTER2& prf2) runtime managed internalcall
    {
      .param [6]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 19 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 52 45 47 46 49 4C 54 45 52 32 00 00 )       // w.REGFILTER2..
    } // end of method IFilterMapper2::RegisterFilter

    .method public hidebysig newslot virtual abstract 
            instance void  EnumMatchingFilters([out] class MSR.LST.MDShow.IEnumMoniker&  marshal( interface) ppenum,
                                               [in] unsigned int32 dwFlags,
                                               [in] int32 bExactMatch,
                                               [in] unsigned int32 dwMerit,
                                               [in] int32 bInputNeeded,
                                               [in] unsigned int32 cInputTypes,
                                               valuetype [mscorlib]System.Guid& pInputTypes,
                                               [in] valuetype MSR.LST.MDShow.REGPINMEDIUM& pMedIn,
                                               [in] valuetype [mscorlib]System.Guid& pPinCategoryIn,
                                               [in] int32 bRender,
                                               [in] int32 bOutputNeeded,
                                               [in] unsigned int32 cOutputTypes,
                                               valuetype [mscorlib]System.Guid& pOutputTypes,
                                               [in] valuetype MSR.LST.MDShow.REGPINMEDIUM& pMedOut,
                                               [in] valuetype [mscorlib]System.Guid& pPinCategoryOut) runtime managed internalcall
    {
      .param [8]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1B 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 52 45 47 50 49 4E 4D 45 44 49 55 4D 00 00 ) // w.REGPINMEDIUM..
      .param [14]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1B 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 52 45 47 50 49 4E 4D 45 44 49 55 4D 00 00 ) // w.REGPINMEDIUM..
    } // end of method IFilterMapper2::EnumMatchingFilters

  } // end of class IFilterMapper2

  .class public sequential ansi sealed beforefieldinit REGFILTER2
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 dwVersion
    .field public unsigned int32 dwMerit
    .field public valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0139_0007 __MIDL_0014
  } // end of class REGFILTER2

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0006
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 dwVersion
    .field public unsigned int32 dwMerit
    .field public valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0139_0007 __MIDL_0014
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0006

  .class public explicit ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0139_0007
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 8
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0007

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0008
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 cPins
    .field public native int rgPins
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1C 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                            77 2E 52 45 47 46 49 4C 54 45 52 50 49 4E 53 00   // w.REGFILTERPINS.
                                                                                                            00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0008

  .class public sequential ansi sealed beforefieldinit REGFILTERPINS
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public  marshal( lpwstr) string strName
    .field public int32 bRendered
    .field public int32 bOutput
    .field public int32 bZero
    .field public int32 bMany
    .field public native int clsConnectsToFilter
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public native int strConnectsToPin
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 nMediaTypes
    .field public native int lpMediaType
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1A 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                            77 2E 52 45 47 50 49 4E 54 59 50 45 53 00 00 )    // w.REGPINTYPES..
  } // end of class REGFILTERPINS

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0002
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public  marshal( lpwstr) string strName
    .field public int32 bRendered
    .field public int32 bOutput
    .field public int32 bZero
    .field public int32 bMany
    .field public native int clsConnectsToFilter
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public native int strConnectsToPin
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 nMediaTypes
    .field public native int lpMediaType
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1A 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                            77 2E 52 45 47 50 49 4E 54 59 50 45 53 00 00 )    // w.REGPINTYPES..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0002

  .class public sequential ansi sealed beforefieldinit REGPINTYPES
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public native int clsMajorType
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public native int clsMinorType
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
  } // end of class REGPINTYPES

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0001
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public native int clsMajorType
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public native int clsMinorType
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0001

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0009
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 cPins2
    .field public native int rgPins2
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1D 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                            77 2E 52 45 47 46 49 4C 54 45 52 50 49 4E 53 32   // w.REGFILTERPINS2
                                                                                                            00 00 ) 
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0009

  .class public sequential ansi sealed beforefieldinit REGFILTERPINS2
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 dwFlags
    .field public unsigned int32 cInstances
    .field public unsigned int32 nMediaTypes
    .field public native int lpMediaType
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1A 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                            77 2E 52 45 47 50 49 4E 54 59 50 45 53 00 00 )    // w.REGPINTYPES..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 nMediums
    .field public native int lpMedium
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1B 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                            77 2E 52 45 47 50 49 4E 4D 45 44 49 55 4D 00 00 ) // w.REGPINMEDIUM..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public native int clsPinCategory
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
  } // end of class REGFILTERPINS2

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0005
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public unsigned int32 dwFlags
    .field public unsigned int32 cInstances
    .field public unsigned int32 nMediaTypes
    .field public native int lpMediaType
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1A 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                            77 2E 52 45 47 50 49 4E 54 59 50 45 53 00 00 )    // w.REGPINTYPES..
    .field public unsigned int32 nMediums
    .field public native int lpMedium
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1B 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                            77 2E 52 45 47 50 49 4E 4D 45 44 49 55 4D 00 00 ) // w.REGPINMEDIUM..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public native int clsPinCategory
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0005

  .class public sequential ansi sealed beforefieldinit REGPINMEDIUM
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public valuetype [mscorlib]System.Guid clsMedium
    .field public unsigned int32 dw1
    .field public unsigned int32 dw2
  } // end of class REGPINMEDIUM

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0139_0003
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public valuetype [mscorlib]System.Guid clsMedium
    .field public unsigned int32 dw1
    .field public unsigned int32 dw2
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0003

  .class interface public abstract auto ansi import IMediaEventSink
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 41 32 2D 30 41 44 34   // ..$56A868A2-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  Notify([in] int32 EventCode,
                                  [in] int32 EventParam1,
                                  [in] int32 EventParam2) runtime managed internalcall
    {
      .param [2]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 17 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 4C 4F 4E 47 5F 50 54 52 00 00 )             // w.LONG_PTR..
      .param [3]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 17 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 4C 4F 4E 47 5F 50 54 52 00 00 )             // w.LONG_PTR..
    } // end of method IMediaEventSink::Notify

  } // end of class IMediaEventSink

  .class interface public abstract auto ansi import IOverlay
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 41 31 2D 30 41 44 34   // ..$56A868A1-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetPalette([out] unsigned int32& pdwColors,
                                      [out] native int ppPalette) runtime managed internalcall
    {
    } // end of method IOverlay::GetPalette

    .method public hidebysig newslot virtual abstract 
            instance void  SetPalette([in] unsigned int32 dwColors,
                                      [in] valuetype MSR.LST.MDShow.tagPALETTEENTRY& pPalette) runtime managed internalcall
    {
    } // end of method IOverlay::SetPalette

    .method public hidebysig newslot virtual abstract 
            instance void  GetDefaultColorKey([out] valuetype MSR.LST.MDShow.tagCOLORKEY& pColorKey) runtime managed internalcall
    {
    } // end of method IOverlay::GetDefaultColorKey

    .method public hidebysig newslot virtual abstract 
            instance void  GetColorKey([out] valuetype MSR.LST.MDShow.tagCOLORKEY& pColorKey) runtime managed internalcall
    {
    } // end of method IOverlay::GetColorKey

    .method public hidebysig newslot virtual abstract 
            instance void  SetColorKey([in][out] valuetype MSR.LST.MDShow.tagCOLORKEY& pColorKey) runtime managed internalcall
    {
    } // end of method IOverlay::SetColorKey

    .method public hidebysig newslot virtual abstract 
            instance void  GetWindowHandle([out] native int pHwnd) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 17 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 77 69 72 65 48 57 4E 44 00 00 )             // w.wireHWND..
    } // end of method IOverlay::GetWindowHandle

    .method public hidebysig newslot virtual abstract 
            instance void  GetClipList([out] valuetype MSR.LST.MDShow.tagRECT& pSourceRect,
                                       [out] valuetype MSR.LST.MDShow.tagRECT& pDestinationRect,
                                       [out] native int ppRgnData) runtime managed internalcall
    {
    } // end of method IOverlay::GetClipList

    .method public hidebysig newslot virtual abstract 
            instance void  GetVideoPosition([out] valuetype MSR.LST.MDShow.tagRECT& pSourceRect,
                                            [out] valuetype MSR.LST.MDShow.tagRECT& pDestinationRect) runtime managed internalcall
    {
    } // end of method IOverlay::GetVideoPosition

    .method public hidebysig newslot virtual abstract 
            instance void  Advise([in] class MSR.LST.MDShow.IOverlayNotify  marshal( interface) pOverlayNotify,
                                  [in] unsigned int32 dwInterests) runtime managed internalcall
    {
    } // end of method IOverlay::Advise

    .method public hidebysig newslot virtual abstract 
            instance void  Unadvise() runtime managed internalcall
    {
    } // end of method IOverlay::Unadvise

  } // end of class IOverlay

  .class public sequential ansi sealed beforefieldinit tagPALETTEENTRY
         extends [mscorlib]System.ValueType
  {
    .pack 1
    .size 0
    .field public unsigned int8 peRed
    .field public unsigned int8 peGreen
    .field public unsigned int8 peBlue
    .field public unsigned int8 peFlags
  } // end of class tagPALETTEENTRY

  .class public sequential ansi sealed beforefieldinit tagCOLORKEY
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 KeyType
    .field public unsigned int32 PaletteIndex
    .field public unsigned int32 LowColorValue
    .field public unsigned int32 HighColorValue
  } // end of class tagCOLORKEY

  .class public sequential ansi sealed beforefieldinit _RemotableHandle
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public int32 fContext
    .field public valuetype MSR.LST.MDShow.__MIDL_IWinTypes_0009 u
  } // end of class _RemotableHandle

  .class public explicit ansi sealed __MIDL_IWinTypes_0009
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field [0] public int32 hInproc
    .field [0] public int32 hRemote
  } // end of class __MIDL_IWinTypes_0009

  .class public sequential ansi sealed beforefieldinit tagRECT
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public int32 left
    .field public int32 top
    .field public int32 right
    .field public int32 bottom
  } // end of class tagRECT

  .class public sequential ansi sealed beforefieldinit _RGNDATA
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public valuetype MSR.LST.MDShow._RGNDATAHEADER rdh
    .field public  marshal( fixed array [1]) int8[] Buffer
  } // end of class _RGNDATA

  .class public sequential ansi sealed beforefieldinit _RGNDATAHEADER
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 dwSize
    .field public unsigned int32 iType
    .field public unsigned int32 nCount
    .field public unsigned int32 nRgnSize
    .field public valuetype MSR.LST.MDShow.tagRECT rcBound
  } // end of class _RGNDATAHEADER

  .class interface public abstract auto ansi import IOverlayNotify
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 41 30 2D 30 41 44 34   // ..$56A868A0-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .method public hidebysig newslot virtual abstract 
            instance void  OnPaletteChange([in] unsigned int32 dwColors,
                                           [in] valuetype MSR.LST.MDShow.tagPALETTEENTRY& pPalette) runtime managed internalcall
    {
    } // end of method IOverlayNotify::OnPaletteChange

    .method public hidebysig newslot virtual abstract 
            instance void  OnClipChange([in] valuetype MSR.LST.MDShow.tagRECT& pSourceRect,
                                        [in] valuetype MSR.LST.MDShow.tagRECT& pDestinationRect,
                                        [in] valuetype MSR.LST.MDShow._RGNDATA& pRgnData) runtime managed internalcall
    {
    } // end of method IOverlayNotify::OnClipChange

    .method public hidebysig newslot virtual abstract 
            instance void  OnColorKeyChange([in] valuetype MSR.LST.MDShow.tagCOLORKEY& pColorKey) runtime managed internalcall
    {
    } // end of method IOverlayNotify::OnColorKeyChange

    .method public hidebysig newslot virtual abstract 
            instance void  OnPositionChange([in] valuetype MSR.LST.MDShow.tagRECT& pSourceRect,
                                            [in] valuetype MSR.LST.MDShow.tagRECT& pDestinationRect) runtime managed internalcall
    {
    } // end of method IOverlayNotify::OnPositionChange

  } // end of class IOverlayNotify

  .class interface public abstract auto ansi import IOverlayNotify2
         implements MSR.LST.MDShow.IOverlayNotify
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 38 30 45 46 41 31 30 2D 44 35 33 35   // ..$680EFA10-D535
                                                                                                    2D 31 31 44 31 2D 38 37 43 38 2D 30 30 41 30 43   // -11D1-87C8-00A0C
                                                                                                    39 32 32 33 31 39 36 00 00 )                      // 9223196..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  OnPaletteChange([in] unsigned int32 dwColors,
                                           [in] valuetype MSR.LST.MDShow.tagPALETTEENTRY& pPalette) runtime managed internalcall
    {
    } // end of method IOverlayNotify2::OnPaletteChange

    .method public hidebysig newslot virtual abstract 
            instance void  OnClipChange([in] valuetype MSR.LST.MDShow.tagRECT& pSourceRect,
                                        [in] valuetype MSR.LST.MDShow.tagRECT& pDestinationRect,
                                        [in] valuetype MSR.LST.MDShow._RGNDATA& pRgnData) runtime managed internalcall
    {
    } // end of method IOverlayNotify2::OnClipChange

    .method public hidebysig newslot virtual abstract 
            instance void  OnColorKeyChange([in] valuetype MSR.LST.MDShow.tagCOLORKEY& pColorKey) runtime managed internalcall
    {
    } // end of method IOverlayNotify2::OnColorKeyChange

    .method public hidebysig newslot virtual abstract 
            instance void  OnPositionChange([in] valuetype MSR.LST.MDShow.tagRECT& pSourceRect,
                                            [in] valuetype MSR.LST.MDShow.tagRECT& pDestinationRect) runtime managed internalcall
    {
    } // end of method IOverlayNotify2::OnPositionChange

    .method public hidebysig newslot virtual abstract 
            instance void  OnDisplayChange(native int hMonitor) runtime managed internalcall
    {
    } // end of method IOverlayNotify2::OnDisplayChange

  } // end of class IOverlayNotify2

  .class interface public abstract auto ansi import IQualityControl
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 41 35 2D 30 41 44 34   // ..$56A868A5-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .method public hidebysig newslot virtual abstract 
            instance void  Notify([in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pSelf,
                                  [in] valuetype MSR.LST.MDShow.tagQuality q) runtime managed internalcall
    {
    } // end of method IQualityControl::Notify

    .method public hidebysig newslot virtual abstract 
            instance void  SetSink([in] class MSR.LST.MDShow.IQualityControl  marshal( interface) piqc) runtime managed internalcall
    {
    } // end of method IQualityControl::SetSink

  } // end of class IQualityControl

  .class public sequential ansi sealed beforefieldinit tagQuality
         extends [mscorlib]System.ValueType
  {
    .pack 8
    .size 0
    .field public valuetype MSR.LST.MDShow.tagQualityMessageType type
    .field public int32 Proportion
    .field public int64 Late
    .field public int64 TimeStamp
  } // end of class tagQuality

  .class public auto ansi sealed tagQualityMessageType
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagQualityMessageType Famine = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.tagQualityMessageType Flood = int32(0x00000001)
  } // end of class tagQualityMessageType

  .class interface public abstract auto ansi import ISeekingPassThru
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 36 42 37 33 38 38 33 2D 43 32 43 38   // ..$36B73883-C2C8
                                                                                                    2D 31 31 43 46 2D 38 42 34 36 2D 30 30 38 30 35   // -11CF-8B46-00805
                                                                                                    46 36 43 45 46 36 30 00 00 )                      // F6CEF60..
    .method public hidebysig newslot virtual abstract 
            instance void  Init([in] int32 bSupportRendering,
                                [in] class MSR.LST.MDShow.IPin  marshal( interface) pPin) runtime managed internalcall
    {
    } // end of method ISeekingPassThru::Init

  } // end of class ISeekingPassThru

  .class interface public abstract auto ansi import IAMStreamConfig
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 36 45 31 33 33 34 30 2D 33 30 41 43   // ..$C6E13340-30AC
                                                                                                    2D 31 31 44 30 2D 41 31 38 43 2D 30 30 41 30 43   // -11D0-A18C-00A0C
                                                                                                    39 31 31 38 39 35 36 00 00 )                      // 9118956..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetFormat([in] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IAMStreamConfig::SetFormat

    .method public hidebysig newslot virtual abstract 
            instance void  GetFormat([out] native int ppmt) runtime managed internalcall
    {
    } // end of method IAMStreamConfig::GetFormat

    .method public hidebysig newslot virtual abstract 
            instance void  GetNumberOfCapabilities([out] int32& piCount,
                                                   [out] int32& piSize) runtime managed internalcall
    {
    } // end of method IAMStreamConfig::GetNumberOfCapabilities

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamCaps([in] int32 iIndex,
                                         [out] native int ppmt,
                                         [out] unsigned int8& pSCC) runtime managed internalcall
    {
    } // end of method IAMStreamConfig::GetStreamCaps

  } // end of class IAMStreamConfig

  .class interface public abstract auto ansi import IAMDevMemoryAllocator
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 36 35 34 35 42 46 30 2D 45 37 36 42   // ..$C6545BF0-E76B
                                                                                                    2D 31 31 44 30 2D 42 44 35 32 2D 30 30 41 30 43   // -11D0-BD52-00A0C
                                                                                                    39 31 31 43 45 38 36 00 00 )                      // 911CE86..
    .method public hidebysig newslot virtual abstract 
            instance void  GetInfo([out] unsigned int32& pdwcbTotalFree,
                                   [out] unsigned int32& pdwcbLargestFree,
                                   [out] unsigned int32& pdwcbTotalMemory,
                                   [out] unsigned int32& pdwcbMinimumChunk) runtime managed internalcall
    {
    } // end of method IAMDevMemoryAllocator::GetInfo

    .method public hidebysig newslot virtual abstract 
            instance void  CheckMemory([in] unsigned int8& pBuffer) runtime managed internalcall
    {
    } // end of method IAMDevMemoryAllocator::CheckMemory

    .method public hidebysig newslot virtual abstract 
            instance void  Alloc([out] native int ppBuffer,
                                 [in][out] unsigned int32& pdwcbBuffer) runtime managed internalcall
    {
    } // end of method IAMDevMemoryAllocator::Alloc

    .method public hidebysig newslot virtual abstract 
            instance void  Free([in] unsigned int8& pBuffer) runtime managed internalcall
    {
    } // end of method IAMDevMemoryAllocator::Free

    .method public hidebysig newslot virtual abstract 
            instance void  GetDevMemoryObject([out] object&  marshal( iunknown) ppUnkInnner,
                                              [in] object  marshal( iunknown) pUnkOuter) runtime managed internalcall
    {
    } // end of method IAMDevMemoryAllocator::GetDevMemoryObject

  } // end of class IAMDevMemoryAllocator

  .class interface public abstract auto ansi import IAMDevMemoryControl
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 36 35 34 35 42 46 31 2D 45 37 36 42   // ..$C6545BF1-E76B
                                                                                                    2D 31 31 44 30 2D 42 44 35 32 2D 30 30 41 30 43   // -11D0-BD52-00A0C
                                                                                                    39 31 31 43 45 38 36 00 00 )                      // 911CE86..
    .method public hidebysig newslot virtual abstract 
            instance void  QueryWriteSync() runtime managed internalcall
    {
    } // end of method IAMDevMemoryControl::QueryWriteSync

    .method public hidebysig newslot virtual abstract 
            instance void  WriteSync() runtime managed internalcall
    {
    } // end of method IAMDevMemoryControl::WriteSync

    .method public hidebysig newslot virtual abstract 
            instance void  GetDevId([out] unsigned int32& pdwDevId) runtime managed internalcall
    {
    } // end of method IAMDevMemoryControl::GetDevId

  } // end of class IAMDevMemoryControl

  .class interface public abstract auto ansi import IConfigInterleaving
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 42 45 45 33 44 32 32 30 2D 31 35 37 42   // ..$BEE3D220-157B
                                                                                                    2D 31 31 44 30 2D 42 44 32 33 2D 30 30 41 30 43   // -11D0-BD23-00A0C
                                                                                                    39 31 31 43 45 38 36 00 00 )                      // 911CE86..
    .method public hidebysig newslot virtual abstract 
            instance void  put_Mode([in] valuetype MSR.LST.MDShow.InterleavingMode mode) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1F 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 49 6E 74 65 72 6C 65 61 76 69 6E 67 4D 6F   // w.InterleavingMo
                                                                                                              64 65 00 00 )                                     // de..
    } // end of method IConfigInterleaving::put_Mode

    .method public hidebysig newslot virtual abstract 
            instance void  get_Mode([out] valuetype MSR.LST.MDShow.InterleavingMode& pMode) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1F 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 49 6E 74 65 72 6C 65 61 76 69 6E 67 4D 6F   // w.InterleavingMo
                                                                                                              64 65 00 00 )                                     // de..
    } // end of method IConfigInterleaving::get_Mode

    .method public hidebysig newslot virtual abstract 
            instance void  put_Interleaving([in] int64& prtInterleave,
                                            [in] int64& prtPreroll) runtime managed internalcall
    {
    } // end of method IConfigInterleaving::put_Interleaving

    .method public hidebysig newslot virtual abstract 
            instance void  get_Interleaving([out] int64& prtInterleave,
                                            [out] int64& prtPreroll) runtime managed internalcall
    {
    } // end of method IConfigInterleaving::get_Interleaving

  } // end of class IConfigInterleaving

  .class public auto ansi sealed InterleavingMode
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.InterleavingMode INTERLEAVE_NONE = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.InterleavingMode INTERLEAVE_CAPTURE = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.InterleavingMode INTERLEAVE_FULL = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.InterleavingMode INTERLEAVE_NONE_BUFFERED = int32(0x00000003)
  } // end of class InterleavingMode

  .class public auto ansi sealed __MIDL_IConfigInterleaving_0001
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.__MIDL_IConfigInterleaving_0001 INTERLEAVE_NONE = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL_IConfigInterleaving_0001 INTERLEAVE_CAPTURE = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL_IConfigInterleaving_0001 INTERLEAVE_FULL = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL_IConfigInterleaving_0001 INTERLEAVE_NONE_BUFFERED = int32(0x00000003)
  } // end of class __MIDL_IConfigInterleaving_0001

  .class interface public abstract auto ansi import IConfigAviMux
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 41 43 44 36 41 41 30 2D 46 34 38 32   // ..$5ACD6AA0-F482
                                                                                                    2D 31 31 43 45 2D 38 42 36 37 2D 30 30 41 41 30   // -11CE-8B67-00AA0
                                                                                                    30 41 33 46 31 41 36 00 00 )                      // 0A3F1A6..
    .method public hidebysig newslot virtual abstract 
            instance void  SetMasterStream([in] int32 IStream) runtime managed internalcall
    {
    } // end of method IConfigAviMux::SetMasterStream

    .method public hidebysig newslot virtual abstract 
            instance void  GetMasterStream([out] int32& pStream) runtime managed internalcall
    {
    } // end of method IConfigAviMux::GetMasterStream

    .method public hidebysig newslot virtual abstract 
            instance void  SetOutputCompatibilityIndex([in] int32 fOldIndex) runtime managed internalcall
    {
    } // end of method IConfigAviMux::SetOutputCompatibilityIndex

    .method public hidebysig newslot virtual abstract 
            instance void  GetOutputCompatibilityIndex([out] int32& pfOldIndex) runtime managed internalcall
    {
    } // end of method IConfigAviMux::GetOutputCompatibilityIndex

  } // end of class IConfigAviMux

  .class interface public abstract auto ansi import IAMVideoCompression
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 36 45 31 33 33 34 33 2D 33 30 41 43   // ..$C6E13343-30AC
                                                                                                    2D 31 31 44 30 2D 41 31 38 43 2D 30 30 41 30 43   // -11D0-A18C-00A0C
                                                                                                    39 31 31 38 39 35 36 00 00 )                      // 9118956..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  put_KeyFrameRate([in] int32 KeyFrameRate) runtime managed internalcall
    {
    } // end of method IAMVideoCompression::put_KeyFrameRate

    .method public hidebysig newslot virtual abstract 
            instance void  get_KeyFrameRate([out] int32& pKeyFrameRate) runtime managed internalcall
    {
    } // end of method IAMVideoCompression::get_KeyFrameRate

    .method public hidebysig newslot virtual abstract 
            instance void  put_PFramesPerKeyFrame([in] int32 PFramesPerKeyFrame) runtime managed internalcall
    {
    } // end of method IAMVideoCompression::put_PFramesPerKeyFrame

    .method public hidebysig newslot virtual abstract 
            instance void  get_PFramesPerKeyFrame([out] int32& pPFramesPerKeyFrame) runtime managed internalcall
    {
    } // end of method IAMVideoCompression::get_PFramesPerKeyFrame

    .method public hidebysig newslot virtual abstract 
            instance void  put_Quality([in] float64 Quality) runtime managed internalcall
    {
    } // end of method IAMVideoCompression::put_Quality

    .method public hidebysig newslot virtual abstract 
            instance void  get_Quality([out] float64& pQuality) runtime managed internalcall
    {
    } // end of method IAMVideoCompression::get_Quality

    .method public hidebysig newslot virtual abstract 
            instance void  put_WindowSize([in] unsigned int64 WindowSize) runtime managed internalcall
    {
    } // end of method IAMVideoCompression::put_WindowSize

    .method public hidebysig newslot virtual abstract 
            instance void  get_WindowSize([out] unsigned int64& pWindowSize) runtime managed internalcall
    {
    } // end of method IAMVideoCompression::get_WindowSize

    .method public hidebysig newslot virtual abstract 
            instance void  GetInfo([out] unsigned int16& pszVersion,
                                   [in][out] int32& pcbVersion,
                                   [out] string  marshal( lpwstr) pszDescription,
                                   [in][out] int32& pcbDescription,
                                   [out] int32& pDefaultKeyFrameRate,
                                   [out] int32& pDefaultPFramesPerKey,
                                   [out] float64& pDefaultQuality,
                                   [out] int32& pCapabilities) runtime managed internalcall
    {
    } // end of method IAMVideoCompression::GetInfo

    .method public hidebysig newslot virtual abstract 
            instance void  OverrideKeyFrame([in] int32 FrameNumber) runtime managed internalcall
    {
    } // end of method IAMVideoCompression::OverrideKeyFrame

    .method public hidebysig newslot virtual abstract 
            instance void  OverrideFrameSize([in] int32 FrameNumber,
                                             [in] int32 Size) runtime managed internalcall
    {
    } // end of method IAMVideoCompression::OverrideFrameSize

  } // end of class IAMVideoCompression

  .class interface public abstract auto ansi import IAMVfwCaptureDialogs
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 38 44 37 31 35 41 30 2D 36 45 35 45   // ..$D8D715A0-6E5E
                                                                                                    2D 31 31 44 30 2D 42 33 46 30 2D 30 30 41 41 30   // -11D0-B3F0-00AA0
                                                                                                    30 33 37 36 31 43 35 00 00 )                      // 03761C5..
    .method public hidebysig newslot virtual abstract 
            instance void  HasDialog([in] int32 iDialog) runtime managed internalcall
    {
    } // end of method IAMVfwCaptureDialogs::HasDialog

    .method public hidebysig newslot virtual abstract 
            instance void  ShowDialog([in] int32 iDialog,
                                      [in] valuetype MSR.LST.MDShow._RemotableHandle& hwnd) runtime managed internalcall
    {
      .param [2]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 17 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 77 69 72 65 48 57 4E 44 00 00 )             // w.wireHWND..
    } // end of method IAMVfwCaptureDialogs::ShowDialog

    .method public hidebysig newslot virtual abstract 
            instance void  SendDriverMessage([in] int32 iDialog,
                                             [in] int32 uMsg,
                                             [in] int32 dw1,
                                             [in] int32 dw2) runtime managed internalcall
    {
    } // end of method IAMVfwCaptureDialogs::SendDriverMessage

  } // end of class IAMVfwCaptureDialogs

  .class interface public abstract auto ansi import IAMVfwCompressDialogs
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 38 44 37 31 35 41 33 2D 36 45 35 45   // ..$D8D715A3-6E5E
                                                                                                    2D 31 31 44 30 2D 42 33 46 30 2D 30 30 41 41 30   // -11D0-B3F0-00AA0
                                                                                                    30 33 37 36 31 43 35 00 00 )                      // 03761C5..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  ShowDialog([in] int32 iDialog,
                                      [in] valuetype MSR.LST.MDShow._RemotableHandle& hwnd) runtime managed internalcall
    {
      .param [2]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 17 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 77 69 72 65 48 57 4E 44 00 00 )             // w.wireHWND..
    } // end of method IAMVfwCompressDialogs::ShowDialog

    .method public hidebysig newslot virtual abstract 
            instance void  GetState([out] native int pState,
                                    [in][out] int32& pcbState) runtime managed internalcall
    {
    } // end of method IAMVfwCompressDialogs::GetState

    .method public hidebysig newslot virtual abstract 
            instance void  SetState([in] native int pState,
                                    [in] int32 cbState) runtime managed internalcall
    {
    } // end of method IAMVfwCompressDialogs::SetState

    .method public hidebysig newslot virtual abstract 
            instance void  SendDriverMessage([in] int32 uMsg,
                                             [in] int32 dw1,
                                             [in] int32 dw2) runtime managed internalcall
    {
    } // end of method IAMVfwCompressDialogs::SendDriverMessage

  } // end of class IAMVfwCompressDialogs

  .class interface public abstract auto ansi import IAMDroppedFrames
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 36 45 31 33 33 34 34 2D 33 30 41 43   // ..$C6E13344-30AC
                                                                                                    2D 31 31 44 30 2D 41 31 38 43 2D 30 30 41 30 43   // -11D0-A18C-00A0C
                                                                                                    39 31 31 38 39 35 36 00 00 )                      // 9118956..
    .method public hidebysig newslot virtual abstract 
            instance void  GetNumDropped([out] int32& plDropped) runtime managed internalcall
    {
    } // end of method IAMDroppedFrames::GetNumDropped

    .method public hidebysig newslot virtual abstract 
            instance void  GetNumNotDropped([out] int32& plNotDropped) runtime managed internalcall
    {
    } // end of method IAMDroppedFrames::GetNumNotDropped

    .method public hidebysig newslot virtual abstract 
            instance void  GetDroppedInfo([in] int32 lSize,
                                          [out] int32& plArray,
                                          [out] int32& plNumCopied) runtime managed internalcall
    {
    } // end of method IAMDroppedFrames::GetDroppedInfo

    .method public hidebysig newslot virtual abstract 
            instance void  GetAverageFrameSize([out] int32& plAverageSize) runtime managed internalcall
    {
    } // end of method IAMDroppedFrames::GetAverageFrameSize

  } // end of class IAMDroppedFrames

  .class interface public abstract auto ansi import IAMAudioInputMixer
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 34 43 33 39 32 32 31 2D 38 33 38 30   // ..$54C39221-8380
                                                                                                    2D 31 31 44 30 2D 42 33 46 30 2D 30 30 41 41 30   // -11D0-B3F0-00AA0
                                                                                                    30 33 37 36 31 43 35 00 00 )                      // 03761C5..
    .method public hidebysig newslot virtual abstract 
            instance void  put_Enable([in] int32 fEnable) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::put_Enable

    .method public hidebysig newslot virtual abstract 
            instance void  get_Enable([out] int32& pfEnable) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::get_Enable

    .method public hidebysig newslot virtual abstract 
            instance void  put_Mono([in] int32 fMono) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::put_Mono

    .method public hidebysig newslot virtual abstract 
            instance void  get_Mono([out] int32& pfMono) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::get_Mono

    .method public hidebysig newslot virtual abstract 
            instance void  put_MixLevel([in] float64 Level) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::put_MixLevel

    .method public hidebysig newslot virtual abstract 
            instance void  get_MixLevel([out] float64& pLevel) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::get_MixLevel

    .method public hidebysig newslot virtual abstract 
            instance void  put_Pan([in] float64 Pan) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::put_Pan

    .method public hidebysig newslot virtual abstract 
            instance void  get_Pan([out] float64& pPan) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::get_Pan

    .method public hidebysig newslot virtual abstract 
            instance void  put_Loudness([in] int32 fLoudness) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::put_Loudness

    .method public hidebysig newslot virtual abstract 
            instance void  get_Loudness([out] int32& pfLoudness) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::get_Loudness

    .method public hidebysig newslot virtual abstract 
            instance void  put_Treble([in] float64 Treble) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::put_Treble

    .method public hidebysig newslot virtual abstract 
            instance void  get_Treble([out] float64& pTreble) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::get_Treble

    .method public hidebysig newslot virtual abstract 
            instance void  get_TrebleRange([out] float64& pRange) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::get_TrebleRange

    .method public hidebysig newslot virtual abstract 
            instance void  put_Bass([in] float64 Bass) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::put_Bass

    .method public hidebysig newslot virtual abstract 
            instance void  get_Bass([out] float64& pBass) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::get_Bass

    .method public hidebysig newslot virtual abstract 
            instance void  get_BassRange([out] float64& pRange) runtime managed internalcall
    {
    } // end of method IAMAudioInputMixer::get_BassRange

  } // end of class IAMAudioInputMixer

  .class interface public abstract auto ansi import IAMBufferNegotiation
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 45 44 37 31 41 30 2D 41 46 35 46   // ..$56ED71A0-AF5F
                                                                                                    2D 31 31 44 30 2D 42 33 46 30 2D 30 30 41 41 30   // -11D0-B3F0-00AA0
                                                                                                    30 33 37 36 31 43 35 00 00 )                      // 03761C5..
    .method public hidebysig newslot virtual abstract 
            instance void  SuggestAllocatorProperties([in] valuetype MSR.LST.MDShow._AllocatorProperties& pprop) runtime managed internalcall
    {
    } // end of method IAMBufferNegotiation::SuggestAllocatorProperties

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllocatorProperties([out] valuetype MSR.LST.MDShow._AllocatorProperties& pprop) runtime managed internalcall
    {
    } // end of method IAMBufferNegotiation::GetAllocatorProperties

  } // end of class IAMBufferNegotiation

  .class interface public abstract auto ansi import IAMAnalogVideoDecoder
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 36 45 31 33 33 35 30 2D 33 30 41 43   // ..$C6E13350-30AC
                                                                                                    2D 31 31 44 30 2D 41 31 38 43 2D 30 30 41 30 43   // -11D0-A18C-00A0C
                                                                                                    39 31 31 38 39 35 36 00 00 )                      // 9118956..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  get_AvailableTVFormats([out] int32& lAnalogVideoStandard) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoDecoder::get_AvailableTVFormats

    .method public hidebysig newslot virtual abstract 
            instance void  put_TVFormat([in] int32 lAnalogVideoStandard) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoDecoder::put_TVFormat

    .method public hidebysig newslot virtual abstract 
            instance void  get_TVFormat([out] int32& plAnalogVideoStandard) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoDecoder::get_TVFormat

    .method public hidebysig newslot virtual abstract 
            instance void  get_HorizontalLocked([out] int32& plLocked) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoDecoder::get_HorizontalLocked

    .method public hidebysig newslot virtual abstract 
            instance void  put_VCRHorizontalLocking([in] int32 lVCRHorizontalLocking) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoDecoder::put_VCRHorizontalLocking

    .method public hidebysig newslot virtual abstract 
            instance void  get_VCRHorizontalLocking([out] int32& plVCRHorizontalLocking) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoDecoder::get_VCRHorizontalLocking

    .method public hidebysig newslot virtual abstract 
            instance void  get_NumberOfLines([out] int32& plNumberOfLines) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoDecoder::get_NumberOfLines

    .method public hidebysig newslot virtual abstract 
            instance void  put_OutputEnable([in] int32 lOutputEnable) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoDecoder::put_OutputEnable

    .method public hidebysig newslot virtual abstract 
            instance void  get_OutputEnable([out] int32& plOutputEnable) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoDecoder::get_OutputEnable

  } // end of class IAMAnalogVideoDecoder

  .class interface public abstract auto ansi import IAMVideoProcAmp
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 36 45 31 33 33 36 30 2D 33 30 41 43   // ..$C6E13360-30AC
                                                                                                    2D 31 31 44 30 2D 41 31 38 43 2D 30 30 41 30 43   // -11D0-A18C-00A0C
                                                                                                    39 31 31 38 39 35 36 00 00 )                      // 9118956..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetRange([in] int32 Property,
                                    [out] int32& pMin,
                                    [out] int32& pMax,
                                    [out] int32& pSteppingDelta,
                                    [out] int32& pDefault,
                                    [out] int32& pCapsFlags) runtime managed internalcall
    {
    } // end of method IAMVideoProcAmp::GetRange

    .method public hidebysig newslot virtual abstract 
            instance void  Set([in] int32 Property,
                               [in] int32 lValue,
                               [in] int32 Flags) runtime managed internalcall
    {
    } // end of method IAMVideoProcAmp::Set

    .method public hidebysig newslot virtual abstract 
            instance void  Get([in] int32 Property,
                               [out] int32& lValue,
                               [out] int32& Flags) runtime managed internalcall
    {
    } // end of method IAMVideoProcAmp::Get

  } // end of class IAMVideoProcAmp

  .class interface public abstract auto ansi import IAMAnalogVideoEncoder
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 36 45 31 33 33 42 30 2D 33 30 41 43   // ..$C6E133B0-30AC
                                                                                                    2D 31 31 44 30 2D 41 31 38 43 2D 30 30 41 30 43   // -11D0-A18C-00A0C
                                                                                                    39 31 31 38 39 35 36 00 00 )                      // 9118956..
    .method public hidebysig newslot virtual abstract 
            instance void  get_AvailableTVFormats([out] int32& lAnalogVideoStandard) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoEncoder::get_AvailableTVFormats

    .method public hidebysig newslot virtual abstract 
            instance void  put_TVFormat([in] int32 lAnalogVideoStandard) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoEncoder::put_TVFormat

    .method public hidebysig newslot virtual abstract 
            instance void  get_TVFormat([out] int32& plAnalogVideoStandard) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoEncoder::get_TVFormat

    .method public hidebysig newslot virtual abstract 
            instance void  put_CopyProtection([in] int32 lVideoCopyProtection) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoEncoder::put_CopyProtection

    .method public hidebysig newslot virtual abstract 
            instance void  get_CopyProtection([out] int32& lVideoCopyProtection) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoEncoder::get_CopyProtection

    .method public hidebysig newslot virtual abstract 
            instance void  put_CCEnable([in] int32 lCCEnable) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoEncoder::put_CCEnable

    .method public hidebysig newslot virtual abstract 
            instance void  get_CCEnable([out] int32& lCCEnable) runtime managed internalcall
    {
    } // end of method IAMAnalogVideoEncoder::get_CCEnable

  } // end of class IAMAnalogVideoEncoder

  .class interface public abstract auto ansi import IAMCameraControl
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 36 45 31 33 33 37 30 2D 33 30 41 43   // ..$C6E13370-30AC
                                                                                                    2D 31 31 44 30 2D 41 31 38 43 2D 30 30 41 30 43   // -11D0-A18C-00A0C
                                                                                                    39 31 31 38 39 35 36 00 00 )                      // 9118956..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetRange([in] int32 Property,
                                    [out] int32& pMin,
                                    [out] int32& pMax,
                                    [out] int32& pSteppingDelta,
                                    [out] int32& pDefault,
                                    [out] int32& pCapsFlags) runtime managed internalcall
    {
    } // end of method IAMCameraControl::GetRange

    .method public hidebysig newslot virtual abstract 
            instance void  Set([in] int32 Property,
                               [in] int32 lValue,
                               [in] int32 Flags) runtime managed internalcall
    {
    } // end of method IAMCameraControl::Set

    .method public hidebysig newslot virtual abstract 
            instance void  Get([in] int32 Property,
                               [out] int32& lValue,
                               [out] int32& Flags) runtime managed internalcall
    {
    } // end of method IAMCameraControl::Get

  } // end of class IAMCameraControl

  .class interface public abstract auto ansi import IAMCrossbar
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 36 45 31 33 33 38 30 2D 33 30 41 43   // ..$C6E13380-30AC
                                                                                                    2D 31 31 44 30 2D 41 31 38 43 2D 30 30 41 30 43   // -11D0-A18C-00A0C
                                                                                                    39 31 31 38 39 35 36 00 00 )                      // 9118956..
    .method public hidebysig newslot virtual abstract 
            instance void  get_PinCounts([out] int32& OutputPinCount,
                                         [out] int32& InputPinCount) runtime managed internalcall
    {
    } // end of method IAMCrossbar::get_PinCounts

    .method public hidebysig newslot virtual abstract 
            instance void  CanRoute([in] int32 OutputPinIndex,
                                    [in] int32 InputPinIndex) runtime managed internalcall
    {
    } // end of method IAMCrossbar::CanRoute

    .method public hidebysig newslot virtual abstract 
            instance void  Route([in] int32 OutputPinIndex,
                                 [in] int32 InputPinIndex) runtime managed internalcall
    {
    } // end of method IAMCrossbar::Route

    .method public hidebysig newslot virtual abstract 
            instance void  get_IsRoutedTo([in] int32 OutputPinIndex,
                                          [out] int32& InputPinIndex) runtime managed internalcall
    {
    } // end of method IAMCrossbar::get_IsRoutedTo

    .method public hidebysig newslot virtual abstract 
            instance void  get_CrossbarPinInfo([in] int32 IsInputPin,
                                               [in] int32 PinIndex,
                                               [out] int32& PinIndexRelated,
                                               [out] int32& PhysicalType) runtime managed internalcall
    {
    } // end of method IAMCrossbar::get_CrossbarPinInfo

  } // end of class IAMCrossbar

  .class interface public abstract auto ansi import IAMTuner
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 32 31 31 41 38 37 36 31 2D 30 33 41 43   // ..$211A8761-03AC
                                                                                                    2D 31 31 44 31 2D 38 44 31 33 2D 30 30 41 41 30   // -11D1-8D13-00AA0
                                                                                                    30 42 44 38 33 33 39 00 00 )                      // 0BD8339..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  put_Channel([in] int32 lChannel,
                                       [in] int32 lVideoSubChannel,
                                       [in] int32 lAudioSubChannel) runtime managed internalcall
    {
    } // end of method IAMTuner::put_Channel

    .method public hidebysig newslot virtual abstract 
            instance void  get_Channel([out] int32& plChannel,
                                       [out] int32& plVideoSubChannel,
                                       [out] int32& plAudioSubChannel) runtime managed internalcall
    {
    } // end of method IAMTuner::get_Channel

    .method public hidebysig newslot virtual abstract 
            instance void  ChannelMinMax([out] int32& lChannelMin,
                                         [out] int32& lChannelMax) runtime managed internalcall
    {
    } // end of method IAMTuner::ChannelMinMax

    .method public hidebysig newslot virtual abstract 
            instance void  put_CountryCode([in] int32 lCountryCode) runtime managed internalcall
    {
    } // end of method IAMTuner::put_CountryCode

    .method public hidebysig newslot virtual abstract 
            instance void  get_CountryCode([out] int32& plCountryCode) runtime managed internalcall
    {
    } // end of method IAMTuner::get_CountryCode

    .method public hidebysig newslot virtual abstract 
            instance void  put_TuningSpace([in] int32 lTuningSpace) runtime managed internalcall
    {
    } // end of method IAMTuner::put_TuningSpace

    .method public hidebysig newslot virtual abstract 
            instance void  get_TuningSpace([out] int32& plTuningSpace) runtime managed internalcall
    {
    } // end of method IAMTuner::get_TuningSpace

    .method public hidebysig newslot virtual abstract 
            instance void  Logon([in] native int hCurrentUser) runtime managed internalcall
    {
    } // end of method IAMTuner::Logon

    .method public hidebysig newslot virtual abstract 
            instance void  Logout() runtime managed internalcall
    {
    } // end of method IAMTuner::Logout

    .method public hidebysig newslot virtual abstract 
            instance void  SignalPresent([out] int32& plSignalStrength) runtime managed internalcall
    {
    } // end of method IAMTuner::SignalPresent

    .method public hidebysig newslot virtual abstract 
            instance void  put_Mode([in] valuetype MSR.LST.MDShow.tagAMTunerModeType lMode) runtime managed internalcall
    {
    } // end of method IAMTuner::put_Mode

    .method public hidebysig newslot virtual abstract 
            instance void  get_Mode([out] valuetype MSR.LST.MDShow.tagAMTunerModeType& plMode) runtime managed internalcall
    {
    } // end of method IAMTuner::get_Mode

    .method public hidebysig newslot virtual abstract 
            instance void  GetAvailableModes([out] int32& plModes) runtime managed internalcall
    {
    } // end of method IAMTuner::GetAvailableModes

    .method public hidebysig newslot virtual abstract 
            instance void  RegisterNotificationCallBack([in] class MSR.LST.MDShow.IAMTunerNotification  marshal( interface) pNotify,
                                                        [in] int32 lEvents) runtime managed internalcall
    {
    } // end of method IAMTuner::RegisterNotificationCallBack

    .method public hidebysig newslot virtual abstract 
            instance void  UnRegisterNotificationCallBack([in] class MSR.LST.MDShow.IAMTunerNotification  marshal( interface) pNotify) runtime managed internalcall
    {
    } // end of method IAMTuner::UnRegisterNotificationCallBack

  } // end of class IAMTuner

  .class public auto ansi sealed tagAMTunerModeType
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagAMTunerModeType AMTUNER_MODE_DEFAULT = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.tagAMTunerModeType AMTUNER_MODE_TV = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.tagAMTunerModeType AMTUNER_MODE_FM_RADIO = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.tagAMTunerModeType AMTUNER_MODE_AM_RADIO = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.tagAMTunerModeType AMTUNER_MODE_DSS = int32(0x00000008)
  } // end of class tagAMTunerModeType

  .class interface public abstract auto ansi import IAMTunerNotification
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 32 31 31 41 38 37 36 30 2D 30 33 41 43   // ..$211A8760-03AC
                                                                                                    2D 31 31 44 31 2D 38 44 31 33 2D 30 30 41 41 30   // -11D1-8D13-00AA0
                                                                                                    30 42 44 38 33 33 39 00 00 )                      // 0BD8339..
    .method public hidebysig newslot virtual abstract 
            instance void  OnEvent([in] valuetype MSR.LST.MDShow.tagAMTunerEventType Event) runtime managed internalcall
    {
    } // end of method IAMTunerNotification::OnEvent

  } // end of class IAMTunerNotification

  .class public auto ansi sealed tagAMTunerEventType
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagAMTunerEventType AMTUNER_EVENT_CHANGED = int32(0x00000001)
  } // end of class tagAMTunerEventType

  .class interface public abstract auto ansi import IAMTVTuner
         implements MSR.LST.MDShow.IAMTuner
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 32 31 31 41 38 37 36 36 2D 30 33 41 43   // ..$211A8766-03AC
                                                                                                    2D 31 31 44 31 2D 38 44 31 33 2D 30 30 41 41 30   // -11D1-8D13-00AA0
                                                                                                    30 42 44 38 33 33 39 00 00 )                      // 0BD8339..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  put_Channel([in] int32 lChannel,
                                       [in] int32 lVideoSubChannel,
                                       [in] int32 lAudioSubChannel) runtime managed internalcall
    {
    } // end of method IAMTVTuner::put_Channel

    .method public hidebysig newslot virtual abstract 
            instance void  get_Channel([out] int32& plChannel,
                                       [out] int32& plVideoSubChannel,
                                       [out] int32& plAudioSubChannel) runtime managed internalcall
    {
    } // end of method IAMTVTuner::get_Channel

    .method public hidebysig newslot virtual abstract 
            instance void  ChannelMinMax([out] int32& lChannelMin,
                                         [out] int32& lChannelMax) runtime managed internalcall
    {
    } // end of method IAMTVTuner::ChannelMinMax

    .method public hidebysig newslot virtual abstract 
            instance void  put_CountryCode([in] int32 lCountryCode) runtime managed internalcall
    {
    } // end of method IAMTVTuner::put_CountryCode

    .method public hidebysig newslot virtual abstract 
            instance void  get_CountryCode([out] int32& plCountryCode) runtime managed internalcall
    {
    } // end of method IAMTVTuner::get_CountryCode

    .method public hidebysig newslot virtual abstract 
            instance void  put_TuningSpace([in] int32 lTuningSpace) runtime managed internalcall
    {
    } // end of method IAMTVTuner::put_TuningSpace

    .method public hidebysig newslot virtual abstract 
            instance void  get_TuningSpace([out] int32& plTuningSpace) runtime managed internalcall
    {
    } // end of method IAMTVTuner::get_TuningSpace

    .method public hidebysig newslot virtual abstract 
            instance void  Logon([in] native int hCurrentUser) runtime managed internalcall
    {
    } // end of method IAMTVTuner::Logon

    .method public hidebysig newslot virtual abstract 
            instance void  Logout() runtime managed internalcall
    {
    } // end of method IAMTVTuner::Logout

    .method public hidebysig newslot virtual abstract 
            instance void  SignalPresent([out] int32& plSignalStrength) runtime managed internalcall
    {
    } // end of method IAMTVTuner::SignalPresent

    .method public hidebysig newslot virtual abstract 
            instance void  put_Mode([in] valuetype MSR.LST.MDShow.tagAMTunerModeType lMode) runtime managed internalcall
    {
    } // end of method IAMTVTuner::put_Mode

    .method public hidebysig newslot virtual abstract 
            instance void  get_Mode([out] valuetype MSR.LST.MDShow.tagAMTunerModeType& plMode) runtime managed internalcall
    {
    } // end of method IAMTVTuner::get_Mode

    .method public hidebysig newslot virtual abstract 
            instance void  GetAvailableModes([out] int32& plModes) runtime managed internalcall
    {
    } // end of method IAMTVTuner::GetAvailableModes

    .method public hidebysig newslot virtual abstract 
            instance void  RegisterNotificationCallBack([in] class MSR.LST.MDShow.IAMTunerNotification  marshal( interface) pNotify,
                                                        [in] int32 lEvents) runtime managed internalcall
    {
    } // end of method IAMTVTuner::RegisterNotificationCallBack

    .method public hidebysig newslot virtual abstract 
            instance void  UnRegisterNotificationCallBack([in] class MSR.LST.MDShow.IAMTunerNotification  marshal( interface) pNotify) runtime managed internalcall
    {
    } // end of method IAMTVTuner::UnRegisterNotificationCallBack

    .method public hidebysig newslot virtual abstract 
            instance void  get_AvailableTVFormats([out] int32& lAnalogVideoStandard) runtime managed internalcall
    {
    } // end of method IAMTVTuner::get_AvailableTVFormats

    .method public hidebysig newslot virtual abstract 
            instance void  get_TVFormat([out] int32& plAnalogVideoStandard) runtime managed internalcall
    {
    } // end of method IAMTVTuner::get_TVFormat

    .method public hidebysig newslot virtual abstract 
            instance void  AutoTune([in] int32 lChannel,
                                    [out] int32& plFoundSignal) runtime managed internalcall
    {
    } // end of method IAMTVTuner::AutoTune

    .method public hidebysig newslot virtual abstract 
            instance void  StoreAutoTune() runtime managed internalcall
    {
    } // end of method IAMTVTuner::StoreAutoTune

    .method public hidebysig newslot virtual abstract 
            instance void  get_NumInputConnections([out] int32& plNumInputConnections) runtime managed internalcall
    {
    } // end of method IAMTVTuner::get_NumInputConnections

    .method public hidebysig newslot virtual abstract 
            instance void  put_InputType([in] int32 lIndex,
                                         [in] valuetype MSR.LST.MDShow.tagTunerInputType InputType) runtime managed internalcall
    {
    } // end of method IAMTVTuner::put_InputType

    .method public hidebysig newslot virtual abstract 
            instance void  get_InputType([in] int32 lIndex,
                                         [out] valuetype MSR.LST.MDShow.tagTunerInputType& pInputType) runtime managed internalcall
    {
    } // end of method IAMTVTuner::get_InputType

    .method public hidebysig newslot virtual abstract 
            instance void  put_ConnectInput([in] int32 lIndex) runtime managed internalcall
    {
    } // end of method IAMTVTuner::put_ConnectInput

    .method public hidebysig newslot virtual abstract 
            instance void  get_ConnectInput([out] int32& plIndex) runtime managed internalcall
    {
    } // end of method IAMTVTuner::get_ConnectInput

    .method public hidebysig newslot virtual abstract 
            instance void  get_VideoFrequency([out] int32& lFreq) runtime managed internalcall
    {
    } // end of method IAMTVTuner::get_VideoFrequency

    .method public hidebysig newslot virtual abstract 
            instance void  get_AudioFrequency([out] int32& lFreq) runtime managed internalcall
    {
    } // end of method IAMTVTuner::get_AudioFrequency

  } // end of class IAMTVTuner

  .class public auto ansi sealed tagTunerInputType
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagTunerInputType TunerInputCable = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.tagTunerInputType TunerInputAntenna = int32(0x00000001)
  } // end of class tagTunerInputType

  .class interface public abstract auto ansi import IKsPropertySet
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 31 45 46 41 43 33 30 2D 35 31 35 43   // ..$31EFAC30-515C
                                                                                                    2D 31 31 44 30 2D 41 39 41 41 2D 30 30 41 41 30   // -11D0-A9AA-00AA0
                                                                                                    30 36 31 42 45 39 33 00 00 )                      // 061BE93..
    .method public hidebysig newslot virtual abstract 
            instance void  RemoteSet([in] valuetype [mscorlib]System.Guid& guidPropSet,
                                     [in] unsigned int32 dwPropID,
                                     [in] unsigned int8& pInstanceData,
                                     [in] unsigned int32 cbInstanceData,
                                     [in] unsigned int8& pPropData,
                                     [in] unsigned int32 cbPropData) runtime managed internalcall
    {
    } // end of method IKsPropertySet::RemoteSet

    .method public hidebysig newslot virtual abstract 
            instance void  RemoteGet([in] valuetype [mscorlib]System.Guid& guidPropSet,
                                     [in] unsigned int32 dwPropID,
                                     [in] unsigned int8& pInstanceData,
                                     [in] unsigned int32 cbInstanceData,
                                     [out] unsigned int8& pPropData,
                                     [in] unsigned int32 cbPropData,
                                     [out] unsigned int32& pcbReturned) runtime managed internalcall
    {
    } // end of method IKsPropertySet::RemoteGet

    .method public hidebysig newslot virtual abstract 
            instance void  QuerySupported([in] valuetype [mscorlib]System.Guid& guidPropSet,
                                          [in] unsigned int32 dwPropID,
                                          [out] unsigned int32& pTypeSupport) runtime managed internalcall
    {
    } // end of method IKsPropertySet::QuerySupported

  } // end of class IKsPropertySet

  .class interface public abstract auto ansi import IAMPhysicalPinInfo
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 46 39 33 38 43 39 39 31 2D 33 30 32 39   // ..$F938C991-3029
                                                                                                    2D 31 31 43 46 2D 38 43 34 34 2D 30 30 41 41 30   // -11CF-8C44-00AA0
                                                                                                    30 36 42 36 38 31 34 00 00 )                      // 06B6814..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetPhysicalType([out] int32& pType,
                                           [out] string&  marshal( lpwstr) ppszType) runtime managed internalcall
    {
    } // end of method IAMPhysicalPinInfo::GetPhysicalType

  } // end of class IAMPhysicalPinInfo

  .class interface public abstract auto ansi import IAMExtDevice
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 42 35 37 33 30 41 39 30 2D 31 41 32 43   // ..$B5730A90-1A2C
                                                                                                    2D 31 31 43 46 2D 38 43 32 33 2D 30 30 41 41 30   // -11CF-8C23-00AA0
                                                                                                    30 36 42 36 38 31 34 00 00 )                      // 06B6814..
    .method public hidebysig newslot virtual abstract 
            instance void  GetCapability([in] int32 Capability,
                                         [out] int32& pValue,
                                         [out] float64& pdblValue) runtime managed internalcall
    {
    } // end of method IAMExtDevice::GetCapability

    .method public hidebysig newslot virtual abstract 
            instance void  get_ExternalDeviceID([out] string&  marshal( lpwstr) ppszData) runtime managed internalcall
    {
    } // end of method IAMExtDevice::get_ExternalDeviceID

    .method public hidebysig newslot virtual abstract 
            instance void  get_ExternalDeviceVersion([out] string&  marshal( lpwstr) ppszData) runtime managed internalcall
    {
    } // end of method IAMExtDevice::get_ExternalDeviceVersion

    .method public hidebysig newslot virtual abstract 
            instance void  put_DevicePower([in] int32 PowerMode) runtime managed internalcall
    {
    } // end of method IAMExtDevice::put_DevicePower

    .method public hidebysig newslot virtual abstract 
            instance void  get_DevicePower([out] int32& pPowerMode) runtime managed internalcall
    {
    } // end of method IAMExtDevice::get_DevicePower

    .method public hidebysig newslot virtual abstract 
            instance void  Calibrate([in] unsigned int32 hEvent,
                                     [in] int32 mode,
                                     [out] int32& pStatus) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
    } // end of method IAMExtDevice::Calibrate

    .method public hidebysig newslot virtual abstract 
            instance void  put_DevicePort([in] int32 DevicePort) runtime managed internalcall
    {
    } // end of method IAMExtDevice::put_DevicePort

    .method public hidebysig newslot virtual abstract 
            instance void  get_DevicePort([out] int32& pDevicePort) runtime managed internalcall
    {
    } // end of method IAMExtDevice::get_DevicePort

  } // end of class IAMExtDevice

  .class interface public abstract auto ansi import IAMExtTransport
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 41 30 33 43 44 35 46 30 2D 33 30 34 35   // ..$A03CD5F0-3045
                                                                                                    2D 31 31 43 46 2D 38 43 34 34 2D 30 30 41 41 30   // -11CF-8C44-00AA0
                                                                                                    30 36 42 36 38 31 34 00 00 )                      // 06B6814..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetCapability([in] int32 Capability,
                                         [out] int32& pValue,
                                         [out] float64& pdblValue) runtime managed internalcall
    {
    } // end of method IAMExtTransport::GetCapability

    .method public hidebysig newslot virtual abstract 
            instance void  put_MediaState([in] int32 State) runtime managed internalcall
    {
    } // end of method IAMExtTransport::put_MediaState

    .method public hidebysig newslot virtual abstract 
            instance void  get_MediaState([out] int32& pState) runtime managed internalcall
    {
    } // end of method IAMExtTransport::get_MediaState

    .method public hidebysig newslot virtual abstract 
            instance void  put_LocalControl([in] int32 State) runtime managed internalcall
    {
    } // end of method IAMExtTransport::put_LocalControl

    .method public hidebysig newslot virtual abstract 
            instance void  get_LocalControl([out] int32& pState) runtime managed internalcall
    {
    } // end of method IAMExtTransport::get_LocalControl

    .method public hidebysig newslot virtual abstract 
            instance void  GetStatus([in] int32 StatusItem,
                                     [out] int32& pValue) runtime managed internalcall
    {
    } // end of method IAMExtTransport::GetStatus

    .method public hidebysig newslot virtual abstract 
            instance void  GetTransportBasicParameters([in] int32 Param,
                                                       [out] int32& pValue,
                                                       [out] string&  marshal( lpwstr) ppszData) runtime managed internalcall
    {
    } // end of method IAMExtTransport::GetTransportBasicParameters

    .method public hidebysig newslot virtual abstract 
            instance void  SetTransportBasicParameters([in] int32 Param,
                                                       [in] int32 Value,
                                                       [in] string  marshal( lpwstr) pszData) runtime managed internalcall
    {
    } // end of method IAMExtTransport::SetTransportBasicParameters

    .method public hidebysig newslot virtual abstract 
            instance void  GetTransportVideoParameters([in] int32 Param,
                                                       [out] int32& pValue) runtime managed internalcall
    {
    } // end of method IAMExtTransport::GetTransportVideoParameters

    .method public hidebysig newslot virtual abstract 
            instance void  SetTransportVideoParameters([in] int32 Param,
                                                       [in] int32 Value) runtime managed internalcall
    {
    } // end of method IAMExtTransport::SetTransportVideoParameters

    .method public hidebysig newslot virtual abstract 
            instance void  GetTransportAudioParameters([in] int32 Param,
                                                       [out] int32& pValue) runtime managed internalcall
    {
    } // end of method IAMExtTransport::GetTransportAudioParameters

    .method public hidebysig newslot virtual abstract 
            instance void  SetTransportAudioParameters([in] int32 Param,
                                                       [in] int32 Value) runtime managed internalcall
    {
    } // end of method IAMExtTransport::SetTransportAudioParameters

    .method public hidebysig newslot virtual abstract 
            instance void  put_Mode([in] int32 mode) runtime managed internalcall
    {
    } // end of method IAMExtTransport::put_Mode

    .method public hidebysig newslot virtual abstract 
            instance void  get_Mode([out] int32& pMode) runtime managed internalcall
    {
    } // end of method IAMExtTransport::get_Mode

    .method public hidebysig newslot virtual abstract 
            instance void  put_Rate([in] float64 dblRate) runtime managed internalcall
    {
    } // end of method IAMExtTransport::put_Rate

    .method public hidebysig newslot virtual abstract 
            instance void  get_Rate([out] float64& pdblRate) runtime managed internalcall
    {
    } // end of method IAMExtTransport::get_Rate

    .method public hidebysig newslot virtual abstract 
            instance void  GetChase([out] int32& pEnabled,
                                    [out] int32& pOffset,
                                    [out] unsigned int32& phEvent) runtime managed internalcall
    {
      .param [3]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
    } // end of method IAMExtTransport::GetChase

    .method public hidebysig newslot virtual abstract 
            instance void  SetChase([in] int32 Enable,
                                    [in] int32 Offset,
                                    [in] unsigned int32 hEvent) runtime managed internalcall
    {
      .param [3]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
    } // end of method IAMExtTransport::SetChase

    .method public hidebysig newslot virtual abstract 
            instance void  GetBump([out] int32& pSpeed,
                                   [out] int32& pDuration) runtime managed internalcall
    {
    } // end of method IAMExtTransport::GetBump

    .method public hidebysig newslot virtual abstract 
            instance void  SetBump([in] int32 Speed,
                                   [in] int32 Duration) runtime managed internalcall
    {
    } // end of method IAMExtTransport::SetBump

    .method public hidebysig newslot virtual abstract 
            instance void  get_AntiClogControl([out] int32& pEnabled) runtime managed internalcall
    {
    } // end of method IAMExtTransport::get_AntiClogControl

    .method public hidebysig newslot virtual abstract 
            instance void  put_AntiClogControl([in] int32 Enable) runtime managed internalcall
    {
    } // end of method IAMExtTransport::put_AntiClogControl

    .method public hidebysig newslot virtual abstract 
            instance void  GetEditPropertySet([in] int32 EditID,
                                              [out] int32& pState) runtime managed internalcall
    {
    } // end of method IAMExtTransport::GetEditPropertySet

    .method public hidebysig newslot virtual abstract 
            instance void  SetEditPropertySet([in][out] int32& pEditID,
                                              [in] int32 State) runtime managed internalcall
    {
    } // end of method IAMExtTransport::SetEditPropertySet

    .method public hidebysig newslot virtual abstract 
            instance void  GetEditProperty([in] int32 EditID,
                                           [in] int32 Param,
                                           [out] int32& pValue) runtime managed internalcall
    {
    } // end of method IAMExtTransport::GetEditProperty

    .method public hidebysig newslot virtual abstract 
            instance void  SetEditProperty([in] int32 EditID,
                                           [in] int32 Param,
                                           [in] int32 Value) runtime managed internalcall
    {
    } // end of method IAMExtTransport::SetEditProperty

    .method public hidebysig newslot virtual abstract 
            instance void  get_EditStart([out] int32& pValue) runtime managed internalcall
    {
    } // end of method IAMExtTransport::get_EditStart

    .method public hidebysig newslot virtual abstract 
            instance void  put_EditStart([in] int32 Value) runtime managed internalcall
    {
    } // end of method IAMExtTransport::put_EditStart

  } // end of class IAMExtTransport

  .class interface public abstract auto ansi import IAMTimecodeReader
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 42 34 39 36 43 45 31 2D 38 31 31 42   // ..$9B496CE1-811B
                                                                                                    2D 31 31 43 46 2D 38 43 37 37 2D 30 30 41 41 30   // -11CF-8C77-00AA0
                                                                                                    30 36 42 36 38 31 34 00 00 )                      // 06B6814..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetTCRMode([in] int32 Param,
                                      [out] int32& pValue) runtime managed internalcall
    {
    } // end of method IAMTimecodeReader::GetTCRMode

    .method public hidebysig newslot virtual abstract 
            instance void  SetTCRMode([in] int32 Param,
                                      [in] int32 Value) runtime managed internalcall
    {
    } // end of method IAMTimecodeReader::SetTCRMode

    .method public hidebysig newslot virtual abstract 
            instance void  put_VITCLine([in] int32 Line) runtime managed internalcall
    {
    } // end of method IAMTimecodeReader::put_VITCLine

    .method public hidebysig newslot virtual abstract 
            instance void  get_VITCLine([out] int32& pLine) runtime managed internalcall
    {
    } // end of method IAMTimecodeReader::get_VITCLine

    .method public hidebysig newslot virtual abstract 
            instance void  GetTimecode([out] valuetype MSR.LST.MDShow.tagTIMECODE_SAMPLE& pTimecodeSample) runtime managed internalcall
    {
    } // end of method IAMTimecodeReader::GetTimecode

  } // end of class IAMTimecodeReader

  .class public sequential ansi sealed beforefieldinit tagTIMECODE_SAMPLE
         extends [mscorlib]System.ValueType
  {
    .pack 8
    .size 0
    .field public int64 qwTick
    .field public valuetype MSR.LST.MDShow.tagTIMECODE timecode
    .field public unsigned int32 dwUser
    .field public unsigned int32 dwFlags
  } // end of class tagTIMECODE_SAMPLE

  .class public sequential ansi sealed beforefieldinit tagTIMECODE
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int16 wFrameRate
    .field public unsigned int16 wFrameFract
    .field public unsigned int32 dwFrames
  } // end of class tagTIMECODE

  .class interface public abstract auto ansi import IAMTimecodeGenerator
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 42 34 39 36 43 45 30 2D 38 31 31 42   // ..$9B496CE0-811B
                                                                                                    2D 31 31 43 46 2D 38 43 37 37 2D 30 30 41 41 30   // -11CF-8C77-00AA0
                                                                                                    30 36 42 36 38 31 34 00 00 )                      // 06B6814..
    .method public hidebysig newslot virtual abstract 
            instance void  GetTCGMode([in] int32 Param,
                                      [out] int32& pValue) runtime managed internalcall
    {
    } // end of method IAMTimecodeGenerator::GetTCGMode

    .method public hidebysig newslot virtual abstract 
            instance void  SetTCGMode([in] int32 Param,
                                      [in] int32 Value) runtime managed internalcall
    {
    } // end of method IAMTimecodeGenerator::SetTCGMode

    .method public hidebysig newslot virtual abstract 
            instance void  put_VITCLine([in] int32 Line) runtime managed internalcall
    {
    } // end of method IAMTimecodeGenerator::put_VITCLine

    .method public hidebysig newslot virtual abstract 
            instance void  get_VITCLine([out] int32& pLine) runtime managed internalcall
    {
    } // end of method IAMTimecodeGenerator::get_VITCLine

    .method public hidebysig newslot virtual abstract 
            instance void  SetTimecode([in] valuetype MSR.LST.MDShow.tagTIMECODE_SAMPLE& pTimecodeSample) runtime managed internalcall
    {
    } // end of method IAMTimecodeGenerator::SetTimecode

    .method public hidebysig newslot virtual abstract 
            instance void  GetTimecode([out] valuetype MSR.LST.MDShow.tagTIMECODE_SAMPLE& pTimecodeSample) runtime managed internalcall
    {
    } // end of method IAMTimecodeGenerator::GetTimecode

  } // end of class IAMTimecodeGenerator

  .class interface public abstract auto ansi import IAMTimecodeDisplay
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 42 34 39 36 43 45 32 2D 38 31 31 42   // ..$9B496CE2-811B
                                                                                                    2D 31 31 43 46 2D 38 43 37 37 2D 30 30 41 41 30   // -11CF-8C77-00AA0
                                                                                                    30 36 42 36 38 31 34 00 00 )                      // 06B6814..
    .method public hidebysig newslot virtual abstract 
            instance void  GetTCDisplayEnable([out] int32& pState) runtime managed internalcall
    {
    } // end of method IAMTimecodeDisplay::GetTCDisplayEnable

    .method public hidebysig newslot virtual abstract 
            instance void  SetTCDisplayEnable([in] int32 State) runtime managed internalcall
    {
    } // end of method IAMTimecodeDisplay::SetTCDisplayEnable

    .method public hidebysig newslot virtual abstract 
            instance void  GetTCDisplay([in] int32 Param,
                                        [out] int32& pValue) runtime managed internalcall
    {
    } // end of method IAMTimecodeDisplay::GetTCDisplay

    .method public hidebysig newslot virtual abstract 
            instance void  SetTCDisplay([in] int32 Param,
                                        [in] int32 Value) runtime managed internalcall
    {
    } // end of method IAMTimecodeDisplay::SetTCDisplay

  } // end of class IAMTimecodeDisplay

  .class interface public abstract auto ansi import IDrawVideoImage
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 34 38 45 46 42 31 32 30 2D 41 42 34 39   // ..$48EFB120-AB49
                                                                                                    2D 31 31 44 32 2D 41 45 44 32 2D 30 30 41 30 43   // -11D2-AED2-00A0C
                                                                                                    39 39 35 45 38 44 35 00 00 )                      // 995E8D5..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  DrawVideoImageBegin() runtime managed internalcall
    {
    } // end of method IDrawVideoImage::DrawVideoImageBegin

    .method public hidebysig newslot virtual abstract 
            instance void  DrawVideoImageEnd() runtime managed internalcall
    {
    } // end of method IDrawVideoImage::DrawVideoImageEnd

    .method public hidebysig newslot virtual abstract 
            instance void  DrawVideoImageDraw([in] valuetype MSR.LST.MDShow._RemotableHandle& hdc,
                                              [in] valuetype MSR.LST.MDShow.tagRECT& lprcSrc,
                                              [in] valuetype MSR.LST.MDShow.tagRECT& lprcDst) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 16 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 77 69 72 65 48 44 43 00 00 )                // w.wireHDC..
    } // end of method IDrawVideoImage::DrawVideoImageDraw

  } // end of class IDrawVideoImage

  .class interface public abstract auto ansi import IDecimateVideoImage
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 32 45 35 45 41 33 45 30 2D 45 39 32 34   // ..$2E5EA3E0-E924
                                                                                                    2D 31 31 44 32 2D 42 36 44 41 2D 30 30 41 30 43   // -11D2-B6DA-00A0C
                                                                                                    39 39 35 45 38 44 46 00 00 )                      // 995E8DF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetDecimationImageSize([in] int32 lWidth,
                                                  [in] int32 lHeight) runtime managed internalcall
    {
    } // end of method IDecimateVideoImage::SetDecimationImageSize

    .method public hidebysig newslot virtual abstract 
            instance void  ResetDecimationImageSize() runtime managed internalcall
    {
    } // end of method IDecimateVideoImage::ResetDecimationImageSize

  } // end of class IDecimateVideoImage

  .class interface public abstract auto ansi import IAMVideoDecimationProperties
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 30 44 33 32 39 33 30 2D 31 33 44 41   // ..$60D32930-13DA
                                                                                                    2D 31 31 44 33 2D 39 45 43 36 2D 43 34 46 43 41   // -11D3-9EC6-C4FCA
                                                                                                    45 46 35 43 37 42 45 00 00 )                      // EF5C7BE..
    .method public hidebysig newslot virtual abstract 
            instance void  QueryDecimationUsage([out] valuetype MSR.LST.MDShow._DECIMATION_USAGE& lpUsage) runtime managed internalcall
    {
    } // end of method IAMVideoDecimationProperties::QueryDecimationUsage

    .method public hidebysig newslot virtual abstract 
            instance void  SetDecimationUsage([in] valuetype MSR.LST.MDShow._DECIMATION_USAGE Usage) runtime managed internalcall
    {
    } // end of method IAMVideoDecimationProperties::SetDecimationUsage

  } // end of class IAMVideoDecimationProperties

  .class public auto ansi sealed _DECIMATION_USAGE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._DECIMATION_USAGE DECIMATION_LEGACY = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow._DECIMATION_USAGE DECIMATION_USE_DECODER_ONLY = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow._DECIMATION_USAGE DECIMATION_USE_VIDEOPORT_ONLY = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow._DECIMATION_USAGE DECIMATION_USE_OVERLAY_ONLY = int32(0x00000003)
    .field public static literal valuetype MSR.LST.MDShow._DECIMATION_USAGE DECIMATION_DEFAULT = int32(0x00000004)
  } // end of class _DECIMATION_USAGE

  .class interface public abstract auto ansi import IAMLatency
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 32 45 41 39 33 42 41 2D 45 43 36 32   // ..$62EA93BA-EC62
                                                                                                    2D 31 31 44 32 2D 42 37 37 30 2D 30 30 43 30 34   // -11D2-B770-00C04
                                                                                                    46 42 36 42 44 33 44 00 00 )                      // FB6BD3D..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetLatency([in] int64& prtLatency) runtime managed internalcall
    {
    } // end of method IAMLatency::GetLatency

  } // end of class IAMLatency

  .class interface public abstract auto ansi import IAMPushSource
         implements MSR.LST.MDShow.IAMLatency
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 46 31 38 35 46 45 37 36 2D 45 36 34 45   // ..$F185FE76-E64E
                                                                                                    2D 31 31 44 32 2D 42 37 36 45 2D 30 30 43 30 34   // -11D2-B76E-00C04
                                                                                                    46 42 36 42 44 33 44 00 00 )                      // FB6BD3D..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetLatency([in] int64& prtLatency) runtime managed internalcall
    {
    } // end of method IAMPushSource::GetLatency

    .method public hidebysig newslot virtual abstract 
            instance void  GetPushSourceFlags([out] unsigned int32& pFlags) runtime managed internalcall
    {
    } // end of method IAMPushSource::GetPushSourceFlags

    .method public hidebysig newslot virtual abstract 
            instance void  SetPushSourceFlags([in] unsigned int32 Flags) runtime managed internalcall
    {
    } // end of method IAMPushSource::SetPushSourceFlags

    .method public hidebysig newslot virtual abstract 
            instance void  SetStreamOffset([in] int64 rtOffset) runtime managed internalcall
    {
    } // end of method IAMPushSource::SetStreamOffset

    .method public hidebysig newslot virtual abstract 
            instance void  GetStreamOffset([out] int64& prtOffset) runtime managed internalcall
    {
    } // end of method IAMPushSource::GetStreamOffset

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxStreamOffset([out] int64& prtMaxOffset) runtime managed internalcall
    {
    } // end of method IAMPushSource::GetMaxStreamOffset

    .method public hidebysig newslot virtual abstract 
            instance void  SetMaxStreamOffset([in] int64 rtMaxOffset) runtime managed internalcall
    {
    } // end of method IAMPushSource::SetMaxStreamOffset

  } // end of class IAMPushSource

  .class interface public abstract auto ansi import IAMAudioRendererStats
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 32 32 33 32 30 43 42 32 2D 44 34 31 41   // ..$22320CB2-D41A
                                                                                                    2D 31 31 44 32 2D 42 46 37 43 2D 44 37 43 42 39   // -11D2-BF7C-D7CB9
                                                                                                    44 46 30 42 46 39 33 00 00 )                      // DF0BF93..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetStatParam([in] unsigned int32 dwParam,
                                        [out] unsigned int32& pdwParam1,
                                        [out] unsigned int32& pdwParam2) runtime managed internalcall
    {
    } // end of method IAMAudioRendererStats::GetStatParam

  } // end of class IAMAudioRendererStats

  .class interface public abstract auto ansi import IAMGraphStreams
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 33 32 31 30 35 46 41 2D 30 37 32 45   // ..$632105FA-072E
                                                                                                    2D 31 31 44 33 2D 38 41 46 39 2D 30 30 43 30 34   // -11D3-8AF9-00C04
                                                                                                    46 42 36 42 44 33 44 00 00 )                      // FB6BD3D..
    .method public hidebysig newslot virtual abstract 
            instance void  FindUpstreamInterface([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin,
                                                 [in] valuetype [mscorlib]System.Guid& riid,
                                                 [out] native int& ppvInterface,
                                                 [in] unsigned int32 dwFlags) runtime managed internalcall
    {
    } // end of method IAMGraphStreams::FindUpstreamInterface

    .method public hidebysig newslot virtual abstract 
            instance void  SyncUsingStreamOffset([in] int32 bUseStreamOffset) runtime managed internalcall
    {
    } // end of method IAMGraphStreams::SyncUsingStreamOffset

    .method public hidebysig newslot virtual abstract 
            instance void  SetMaxGraphLatency([in] int64 rtMaxGraphLatency) runtime managed internalcall
    {
    } // end of method IAMGraphStreams::SetMaxGraphLatency

  } // end of class IAMGraphStreams

  .class interface public abstract auto ansi import IAMOverlayFX
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 32 46 41 45 32 35 30 2D 37 45 36 35   // ..$62FAE250-7E65
                                                                                                    2D 34 34 36 30 2D 42 46 43 39 2D 36 33 39 38 42   // -4460-BFC9-6398B
                                                                                                    33 32 32 30 37 33 43 00 00 )                      // 322073C..
    .method public hidebysig newslot virtual abstract 
            instance void  QueryOverlayFXCaps([out] unsigned int32& lpdwOverlayFXCaps) runtime managed internalcall
    {
    } // end of method IAMOverlayFX::QueryOverlayFXCaps

    .method public hidebysig newslot virtual abstract 
            instance void  SetOverlayFX([in] unsigned int32 dwOverlayFX) runtime managed internalcall
    {
    } // end of method IAMOverlayFX::SetOverlayFX

    .method public hidebysig newslot virtual abstract 
            instance void  GetOverlayFX([out] unsigned int32& lpdwOverlayFX) runtime managed internalcall
    {
    } // end of method IAMOverlayFX::GetOverlayFX

  } // end of class IAMOverlayFX

  .class interface public abstract auto ansi import IAMOpenProgress
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 45 31 43 33 39 41 31 2D 44 45 35 33   // ..$8E1C39A1-DE53
                                                                                                    2D 31 31 43 46 2D 41 41 36 33 2D 30 30 38 30 43   // -11CF-AA63-0080C
                                                                                                    37 34 34 35 32 38 44 00 00 )                      // 744528D..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  QueryProgress([out] int64& pllTotal,
                                         [out] int64& pllCurrent) runtime managed internalcall
    {
    } // end of method IAMOpenProgress::QueryProgress

    .method public hidebysig newslot virtual abstract 
            instance void  AbortOperation() runtime managed internalcall
    {
    } // end of method IAMOpenProgress::AbortOperation

  } // end of class IAMOpenProgress

  .class interface public abstract auto ansi import IMpeg2Demultiplexer
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 34 33 36 45 45 45 39 43 2D 32 36 34 46   // ..$436EEE9C-264F
                                                                                                    2D 34 32 34 32 2D 39 30 45 31 2D 34 45 33 33 30   // -4242-90E1-4E330
                                                                                                    43 31 30 37 35 31 32 00 00 )                      // C107512..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  CreateOutputPin([in] valuetype MSR.LST.MDShow._AMMediaType& pMediaType,
                                           [in] string  marshal( lpwstr) pszPinName,
                                           [out] class MSR.LST.MDShow.IPin&  marshal( interface) ppIPin) runtime managed internalcall
    {
    } // end of method IMpeg2Demultiplexer::CreateOutputPin

    .method public hidebysig newslot virtual abstract 
            instance void  SetOutputPinMediaType([in] string  marshal( lpwstr) pszPinName,
                                                 [in] valuetype MSR.LST.MDShow._AMMediaType& pMediaType) runtime managed internalcall
    {
    } // end of method IMpeg2Demultiplexer::SetOutputPinMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  DeleteOutputPin([in] string  marshal( lpwstr) pszPinName) runtime managed internalcall
    {
    } // end of method IMpeg2Demultiplexer::DeleteOutputPin

  } // end of class IMpeg2Demultiplexer

  .class interface public abstract auto ansi import IMPEG2StreamIdMap
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 30 45 30 34 43 34 37 2D 32 35 42 38   // ..$D0E04C47-25B8
                                                                                                    2D 34 33 36 39 2D 39 32 35 41 2D 33 36 32 41 30   // -4369-925A-362A0
                                                                                                    31 44 39 35 34 34 34 00 00 )                      // 1D95444..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  MapStreamId([in] unsigned int32 ulStreamId,
                                       [in] unsigned int32 MediaSampleContent,
                                       [in] unsigned int32 ulSubstreamFilterValue,
                                       [in] int32 iDataOffset) runtime managed internalcall
    {
    } // end of method IMPEG2StreamIdMap::MapStreamId

    .method public hidebysig newslot virtual abstract 
            instance void  UnmapStreamId([in] unsigned int32 culStreamId,
                                         [in] unsigned int32& pulStreamId) runtime managed internalcall
    {
    } // end of method IMPEG2StreamIdMap::UnmapStreamId

    .method public hidebysig newslot virtual abstract 
            instance void  EnumStreamIdMap([out] class MSR.LST.MDShow.IEnumStreamIdMap&  marshal( interface) ppIEnumStreamIdMap) runtime managed internalcall
    {
    } // end of method IMPEG2StreamIdMap::EnumStreamIdMap

  } // end of class IMPEG2StreamIdMap

  .class interface public abstract auto ansi import IEnumStreamIdMap
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 34 35 43 31 35 36 36 2D 36 32 30 32   // ..$945C1566-6202
                                                                                                    2D 34 36 46 43 2D 39 36 43 37 2D 44 38 37 46 32   // -46FC-96C7-D87F2
                                                                                                    38 39 43 36 35 33 34 00 00 )                      // 89C6534..
    .method public hidebysig newslot virtual abstract 
            instance void  Next([in] unsigned int32 cRequest,
                                [in][out] valuetype MSR.LST.MDShow.STREAM_ID_MAP& pStreamIdMap,
                                [out] unsigned int32& pcReceived) runtime managed internalcall
    {
      .param [2]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1C 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 53 54 52 45 41 4D 5F 49 44 5F 4D 41 50 00   // w.STREAM_ID_MAP.
                                                                                                              00 ) 
    } // end of method IEnumStreamIdMap::Next

    .method public hidebysig newslot virtual abstract 
            instance void  Skip([in] unsigned int32 cRecords) runtime managed internalcall
    {
    } // end of method IEnumStreamIdMap::Skip

    .method public hidebysig newslot virtual abstract 
            instance void  Reset() runtime managed internalcall
    {
    } // end of method IEnumStreamIdMap::Reset

    .method public hidebysig newslot virtual abstract 
            instance void  Clone([out] class MSR.LST.MDShow.IEnumStreamIdMap&  marshal( interface) ppIEnumStreamIdMap) runtime managed internalcall
    {
    } // end of method IEnumStreamIdMap::Clone

  } // end of class IEnumStreamIdMap

  .class public sequential ansi sealed beforefieldinit STREAM_ID_MAP
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 stream_id
    .field public unsigned int32 dwMediaSampleContent
    .field public unsigned int32 ulSubstreamFilterValue
    .field public int32 iDataOffset
  } // end of class STREAM_ID_MAP

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0360_0001
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 stream_id
    .field public unsigned int32 dwMediaSampleContent
    .field public unsigned int32 ulSubstreamFilterValue
    .field public int32 iDataOffset
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0360_0001

  .class interface public abstract auto ansi import IAMClockSlave
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 46 44 35 32 37 34 31 2D 31 37 36 44   // ..$9FD52741-176D
                                                                                                    2D 34 42 33 36 2D 38 46 35 31 2D 43 41 38 46 39   // -4B36-8F51-CA8F9
                                                                                                    33 33 32 32 33 42 45 00 00 )                      // 33223BE..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetErrorTolerance([in] unsigned int32 dwTolerance) runtime managed internalcall
    {
    } // end of method IAMClockSlave::SetErrorTolerance

    .method public hidebysig newslot virtual abstract 
            instance void  GetErrorTolerance([out] unsigned int32& pdwTolerance) runtime managed internalcall
    {
    } // end of method IAMClockSlave::GetErrorTolerance

  } // end of class IAMClockSlave

  .class interface public abstract auto ansi import IEncoderAPI
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 37 30 34 32 33 38 33 39 2D 36 41 43 43   // ..$70423839-6ACC
                                                                                                    2D 34 42 32 33 2D 42 30 37 39 2D 32 31 44 42 46   // -4B23-B079-21DBF
                                                                                                    30 38 31 35 36 41 35 00 00 )                      // 08156A5..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  IsSupported([in] valuetype [mscorlib]System.Guid& Api) runtime managed internalcall
    {
    } // end of method IEncoderAPI::IsSupported

    .method public hidebysig newslot virtual abstract 
            instance void  IsAvailable([in] valuetype [mscorlib]System.Guid& Api) runtime managed internalcall
    {
    } // end of method IEncoderAPI::IsAvailable

    .method public hidebysig newslot virtual abstract 
            instance void  GetParameterRange([in] valuetype [mscorlib]System.Guid& Api,
                                             [out] object&  marshal( struct) ValueMin,
                                             [out] object&  marshal( struct) ValueMax,
                                             [out] object&  marshal( struct) SteppingDelta) runtime managed internalcall
    {
    } // end of method IEncoderAPI::GetParameterRange

    .method public hidebysig newslot virtual abstract 
            instance void  GetParameterValues([in] valuetype [mscorlib]System.Guid& Api,
                                              [out] native int Values,
                                              [out] unsigned int32& ValuesCount) runtime managed internalcall
    {
    } // end of method IEncoderAPI::GetParameterValues

    .method public hidebysig newslot virtual abstract 
            instance void  GetDefaultValue([in] valuetype [mscorlib]System.Guid& Api,
                                           [out] object&  marshal( struct) Value) runtime managed internalcall
    {
    } // end of method IEncoderAPI::GetDefaultValue

    .method public hidebysig newslot virtual abstract 
            instance void  GetValue([in] valuetype [mscorlib]System.Guid& Api,
                                    [out] object&  marshal( struct) Value) runtime managed internalcall
    {
    } // end of method IEncoderAPI::GetValue

    .method public hidebysig newslot virtual abstract 
            instance void  SetValue([in] valuetype [mscorlib]System.Guid& Api,
                                    [in] object&  marshal( struct) Value) runtime managed internalcall
    {
    } // end of method IEncoderAPI::SetValue

  } // end of class IEncoderAPI

  .class interface public abstract auto ansi import IVideoEncoder
         implements MSR.LST.MDShow.IEncoderAPI
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 32 39 39 37 43 33 42 2D 38 45 31 42   // ..$02997C3B-8E1B
                                                                                                    2D 34 36 30 45 2D 39 32 37 30 2D 35 34 35 45 30   // -460E-9270-545E0
                                                                                                    44 45 39 35 36 33 45 00 00 )                      // DE9563E..
    .method public hidebysig newslot virtual abstract 
            instance void  IsSupported([in] valuetype [mscorlib]System.Guid& Api) runtime managed internalcall
    {
    } // end of method IVideoEncoder::IsSupported

    .method public hidebysig newslot virtual abstract 
            instance void  IsAvailable([in] valuetype [mscorlib]System.Guid& Api) runtime managed internalcall
    {
    } // end of method IVideoEncoder::IsAvailable

    .method public hidebysig newslot virtual abstract 
            instance void  GetParameterRange([in] valuetype [mscorlib]System.Guid& Api,
                                             [out] object&  marshal( struct) ValueMin,
                                             [out] object&  marshal( struct) ValueMax,
                                             [out] object&  marshal( struct) SteppingDelta) runtime managed internalcall
    {
    } // end of method IVideoEncoder::GetParameterRange

    .method public hidebysig newslot virtual abstract 
            instance void  GetParameterValues([in] valuetype [mscorlib]System.Guid& Api,
                                              [out] native int Values,
                                              [out] unsigned int32& ValuesCount) runtime managed internalcall
    {
    } // end of method IVideoEncoder::GetParameterValues

    .method public hidebysig newslot virtual abstract 
            instance void  GetDefaultValue([in] valuetype [mscorlib]System.Guid& Api,
                                           [out] object&  marshal( struct) Value) runtime managed internalcall
    {
    } // end of method IVideoEncoder::GetDefaultValue

    .method public hidebysig newslot virtual abstract 
            instance void  GetValue([in] valuetype [mscorlib]System.Guid& Api,
                                    [out] object&  marshal( struct) Value) runtime managed internalcall
    {
    } // end of method IVideoEncoder::GetValue

    .method public hidebysig newslot virtual abstract 
            instance void  SetValue([in] valuetype [mscorlib]System.Guid& Api,
                                    [in] object&  marshal( struct) Value) runtime managed internalcall
    {
    } // end of method IVideoEncoder::SetValue

  } // end of class IVideoEncoder

  .class interface public abstract auto ansi import IAMGraphBuilderCallback
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 34 39 39 35 46 35 31 31 2D 39 44 44 42   // ..$4995F511-9DDB
                                                                                                    2D 34 46 31 32 2D 42 44 33 42 2D 46 30 34 36 31   // -4F12-BD3B-F0461
                                                                                                    31 38 30 37 42 37 39 00 00 )                      // 1807B79..
    .method public hidebysig newslot virtual abstract 
            instance void  SelectedFilter([in] class MSR.LST.MDShow.IMoniker  marshal( interface) pMon) runtime managed internalcall
    {
    } // end of method IAMGraphBuilderCallback::SelectedFilter

    .method public hidebysig newslot virtual abstract 
            instance void  CreatedFilter([in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pFil) runtime managed internalcall
    {
    } // end of method IAMGraphBuilderCallback::CreatedFilter

  } // end of class IAMGraphBuilderCallback

  .class interface public abstract auto ansi import IAMCertifiedOutputProtection
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 46 45 44 45 44 33 45 2D 30 46 46 31   // ..$6FEDED3E-0FF1
                                                                                                    2D 34 39 30 31 2D 41 32 46 31 2D 34 33 46 37 30   // -4901-A2F1-43F70
                                                                                                    31 32 43 38 35 31 35 00 00 )                      // 12C8515..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  KeyExchange([out] valuetype [mscorlib]System.Guid& pRandom,
                                       [out] native int VarLenCertGH,
                                       [out] unsigned int32& pdwLengthCertGH) runtime managed internalcall
    {
    } // end of method IAMCertifiedOutputProtection::KeyExchange

    .method public hidebysig newslot virtual abstract 
            instance void  SessionSequenceStart([in] valuetype MSR.LST.MDShow._AMCOPPSignature& pSig) runtime managed internalcall
    {
    } // end of method IAMCertifiedOutputProtection::SessionSequenceStart

    .method public hidebysig newslot virtual abstract 
            instance void  ProtectionCommand([in] valuetype MSR.LST.MDShow._AMCOPPCommand& cmd) runtime managed internalcall
    {
    } // end of method IAMCertifiedOutputProtection::ProtectionCommand

    .method public hidebysig newslot virtual abstract 
            instance void  ProtectionStatus([in] valuetype MSR.LST.MDShow._AMCOPPStatusInput& pStatusInput,
                                            [out] valuetype MSR.LST.MDShow._AMCOPPStatusOutput& pStatusOutput) runtime managed internalcall
    {
    } // end of method IAMCertifiedOutputProtection::ProtectionStatus

  } // end of class IAMCertifiedOutputProtection

  .class public sequential ansi sealed beforefieldinit _AMCOPPSignature
         extends [mscorlib]System.ValueType
  {
    .pack 1
    .size 0
    .field public  marshal( fixed array [256]) unsigned int8[] Signature
  } // end of class _AMCOPPSignature

  .class public sequential ansi sealed beforefieldinit _AMCOPPCommand
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public valuetype [mscorlib]System.Guid macKDI
    .field public valuetype [mscorlib]System.Guid guidCommandID
    .field public unsigned int32 dwSequence
    .field public unsigned int32 cbSizeData
    .field public  marshal( fixed array [4056]) unsigned int8[] CommandData
  } // end of class _AMCOPPCommand

  .class public sequential ansi sealed beforefieldinit _AMCOPPStatusInput
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public valuetype [mscorlib]System.Guid rApp
    .field public valuetype [mscorlib]System.Guid guidStatusRequestID
    .field public unsigned int32 dwSequence
    .field public unsigned int32 cbSizeData
    .field public  marshal( fixed array [4056]) unsigned int8[] StatusData
  } // end of class _AMCOPPStatusInput

  .class public sequential ansi sealed beforefieldinit _AMCOPPStatusOutput
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public valuetype [mscorlib]System.Guid macKDI
    .field public unsigned int32 cbSizeData
    .field public  marshal( fixed array [4076]) unsigned int8[] COPPStatus
  } // end of class _AMCOPPStatusOutput

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0139_0004
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0139_0004 REG_PINFLAG_B_ZERO = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0139_0004 REG_PINFLAG_B_RENDERER = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0139_0004 REG_PINFLAG_B_MANY = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0139_0004 REG_PINFLAG_B_OUTPUT = int32(0x00000008)
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0139_0004

  .class interface public abstract auto ansi import IFilterMapper3
         implements MSR.LST.MDShow.IFilterMapper2
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 42 37 39 42 42 30 42 31 2D 33 33 43 31   // ..$B79BB0B1-33C1
                                                                                                    2D 31 31 44 31 2D 41 42 45 31 2D 30 30 41 30 43   // -11D1-ABE1-00A0C
                                                                                                    39 30 35 46 33 37 35 00 00 )                      // 905F375..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  CreateCategory([in] valuetype [mscorlib]System.Guid& clsidCategory,
                                          [in] unsigned int32 dwCategoryMerit,
                                          [in] string  marshal( lpwstr) Description) runtime managed internalcall
    {
    } // end of method IFilterMapper3::CreateCategory

    .method public hidebysig newslot virtual abstract 
            instance void  UnregisterFilter([in] valuetype [mscorlib]System.Guid& pclsidCategory,
                                            [in] unsigned int16& szInstance,
                                            [in] valuetype [mscorlib]System.Guid& Filter) runtime managed internalcall
    {
    } // end of method IFilterMapper3::UnregisterFilter

    .method public hidebysig newslot virtual abstract 
            instance void  RegisterFilter([in] valuetype [mscorlib]System.Guid& clsidFilter,
                                          [in] string  marshal( lpwstr) Name,
                                          [in][out] class MSR.LST.MDShow.IMoniker&  marshal( interface) ppMoniker,
                                          [in] valuetype [mscorlib]System.Guid& pclsidCategory,
                                          [in] unsigned int16& szInstance,
                                          [in] valuetype MSR.LST.MDShow.REGFILTER2& prf2) runtime managed internalcall
    {
      .param [6]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 19 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 52 45 47 46 49 4C 54 45 52 32 00 00 )       // w.REGFILTER2..
    } // end of method IFilterMapper3::RegisterFilter

    .method public hidebysig newslot virtual abstract 
            instance void  EnumMatchingFilters([out] class MSR.LST.MDShow.IEnumMoniker&  marshal( interface) ppenum,
                                               [in] unsigned int32 dwFlags,
                                               [in] int32 bExactMatch,
                                               [in] unsigned int32 dwMerit,
                                               [in] int32 bInputNeeded,
                                               [in] unsigned int32 cInputTypes,
                                               valuetype [mscorlib]System.Guid& pInputTypes,
                                               [in] valuetype MSR.LST.MDShow.REGPINMEDIUM& pMedIn,
                                               [in] valuetype [mscorlib]System.Guid& pPinCategoryIn,
                                               [in] int32 bRender,
                                               [in] int32 bOutputNeeded,
                                               [in] unsigned int32 cOutputTypes,
                                               valuetype [mscorlib]System.Guid& pOutputTypes,
                                               [in] valuetype MSR.LST.MDShow.REGPINMEDIUM& pMedOut,
                                               [in] valuetype [mscorlib]System.Guid& pPinCategoryOut) runtime managed internalcall
    {
      .param [8]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1B 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 52 45 47 50 49 4E 4D 45 44 49 55 4D 00 00 ) // w.REGPINMEDIUM..
      .param [14]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1B 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 52 45 47 50 49 4E 4D 45 44 49 55 4D 00 00 ) // w.REGPINMEDIUM..
    } // end of method IFilterMapper3::EnumMatchingFilters

    .method public hidebysig newslot virtual abstract 
            instance void  GetICreateDevEnum([out] class MSR.LST.MDShow.ICreateDevEnum&  marshal( interface) ppenum) runtime managed internalcall
    {
    } // end of method IFilterMapper3::GetICreateDevEnum

  } // end of class IFilterMapper3

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0143_0001
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0143_0001 CK_NOCOLORKEY = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0143_0001 CK_INDEX = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0143_0001 CK_RGB = int32(0x00000002)
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0143_0001

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0143_0002
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0143_0002 ADVISE_NONE = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0143_0002 ADVISE_CLIPPING = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0143_0002 ADVISE_PALETTE = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0143_0002 ADVISE_COLORKEY = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0143_0002 ADVISE_POSITION = int32(0x00000008)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0143_0002 ADVISE_DISPLAY_CHANGE = int32(0x00000010)
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0143_0002

  .class public auto ansi sealed AM_FILESINK_FLAGS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.AM_FILESINK_FLAGS AM_FILE_OVERWRITE = int32(0x00000001)
  } // end of class AM_FILESINK_FLAGS

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0150_0001
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0150_0001 AM_FILE_OVERWRITE = int32(0x00000001)
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0150_0001

  .class public auto ansi sealed _AM_RENSDEREXFLAGS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._AM_RENSDEREXFLAGS AM_RENDEREX_RENDERTOEXISTINGRENDERERS = int32(0x00000001)
  } // end of class _AM_RENSDEREXFLAGS

  .class interface public abstract auto ansi import IFilterGraph2
         implements MSR.LST.MDShow.IGraphBuilder
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 36 42 37 33 38 38 32 2D 43 32 43 38   // ..$36B73882-C2C8
                                                                                                    2D 31 31 43 46 2D 38 42 34 36 2D 30 30 38 30 35   // -11CF-8B46-00805
                                                                                                    46 36 43 45 46 36 30 00 00 )                      // F6CEF60..
    .method public hidebysig newslot virtual abstract 
            instance void  AddFilter([in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pFilter,
                                     [in] string  marshal( lpwstr) pName) runtime managed internalcall
    {
    } // end of method IFilterGraph2::AddFilter

    .method public hidebysig newslot virtual abstract 
            instance void  RemoveFilter([in] class MSR.LST.MDShow.IBaseFilter  marshal( interface) pFilter) runtime managed internalcall
    {
    } // end of method IFilterGraph2::RemoveFilter

    .method public hidebysig newslot virtual abstract 
            instance void  EnumFilters([out] class MSR.LST.MDShow.IEnumFilters&  marshal( interface) ppenum) runtime managed internalcall
    {
    } // end of method IFilterGraph2::EnumFilters

    .method public hidebysig newslot virtual abstract 
            instance void  FindFilterByName([in] string  marshal( lpwstr) pName,
                                            [out] class MSR.LST.MDShow.IBaseFilter&  marshal( interface) ppFilter) runtime managed internalcall
    {
    } // end of method IFilterGraph2::FindFilterByName

    .method public hidebysig newslot virtual abstract 
            instance void  ConnectDirect([in] class MSR.LST.MDShow.IPin  marshal( interface) ppinOut,
                                         [in] class MSR.LST.MDShow.IPin  marshal( interface) ppinIn,
                                         [in] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IFilterGraph2::ConnectDirect

    .method public hidebysig newslot virtual abstract 
            instance void  Reconnect([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin) runtime managed internalcall
    {
    } // end of method IFilterGraph2::Reconnect

    .method public hidebysig newslot virtual abstract 
            instance void  Disconnect([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin) runtime managed internalcall
    {
    } // end of method IFilterGraph2::Disconnect

    .method public hidebysig newslot virtual abstract 
            instance void  SetDefaultSyncSource() runtime managed internalcall
    {
    } // end of method IFilterGraph2::SetDefaultSyncSource

    .method public hidebysig newslot virtual abstract 
            instance void  Connect([in] class MSR.LST.MDShow.IPin  marshal( interface) ppinOut,
                                   [in] class MSR.LST.MDShow.IPin  marshal( interface) ppinIn) runtime managed internalcall
    {
    } // end of method IFilterGraph2::Connect

    .method public hidebysig newslot virtual abstract 
            instance void  Render([in] class MSR.LST.MDShow.IPin  marshal( interface) ppinOut) runtime managed internalcall
    {
    } // end of method IFilterGraph2::Render

    .method public hidebysig newslot virtual abstract 
            instance void  RenderFile([in] string  marshal( lpwstr) lpcwstrFile,
                                      [in] string  marshal( lpwstr) lpcwstrPlayList) runtime managed internalcall
    {
    } // end of method IFilterGraph2::RenderFile

    .method public hidebysig newslot virtual abstract 
            instance void  AddSourceFilter([in] string  marshal( lpwstr) lpcwstrFileName,
                                           [in] string  marshal( lpwstr) lpcwstrFilterName,
                                           [out] class MSR.LST.MDShow.IBaseFilter&  marshal( interface) ppFilter) runtime managed internalcall
    {
    } // end of method IFilterGraph2::AddSourceFilter

    .method public hidebysig newslot virtual abstract 
            instance void  SetLogFile([in] unsigned int32 hFile) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
    } // end of method IFilterGraph2::SetLogFile

    .method public hidebysig newslot virtual abstract 
            instance void  Abort() runtime managed internalcall
    {
    } // end of method IFilterGraph2::Abort

    .method public hidebysig newslot virtual abstract 
            instance void  ShouldOperationContinue() runtime managed internalcall
    {
    } // end of method IFilterGraph2::ShouldOperationContinue

    .method public hidebysig newslot virtual abstract 
            instance void  AddSourceFilterForMoniker([in] class MSR.LST.MDShow.IMoniker  marshal( interface) pMoniker,
                                                     [in] class MSR.LST.MDShow.IBindCtx  marshal( interface) pCtx,
                                                     [in] string  marshal( lpwstr) lpcwstrFilterName,
                                                     [out] class MSR.LST.MDShow.IBaseFilter&  marshal( interface) ppFilter) runtime managed internalcall
    {
    } // end of method IFilterGraph2::AddSourceFilterForMoniker

    .method public hidebysig newslot virtual abstract 
            instance void  ReconnectEx([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin,
                                       [in] valuetype MSR.LST.MDShow._AMMediaType& pmt) runtime managed internalcall
    {
    } // end of method IFilterGraph2::ReconnectEx

    .method public hidebysig newslot virtual abstract 
            instance void  RenderEx([in] class MSR.LST.MDShow.IPin  marshal( interface) ppinOut,
                                    [in] unsigned int32 dwFlags,
                                    [in][out] unsigned int32& pvContext) runtime managed internalcall
    {
    } // end of method IFilterGraph2::RenderEx

  } // end of class IFilterGraph2

  .class interface public abstract auto ansi import IStreamBuilder
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 42 46 2D 30 41 44 34   // ..$56A868BF-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  Render([in] class MSR.LST.MDShow.IPin  marshal( interface) ppinOut,
                                  [in] class MSR.LST.MDShow.IGraphBuilder  marshal( interface) pGraph) runtime managed internalcall
    {
    } // end of method IStreamBuilder::Render

    .method public hidebysig newslot virtual abstract 
            instance void  Backout([in] class MSR.LST.MDShow.IPin  marshal( interface) ppinOut,
                                   [in] class MSR.LST.MDShow.IGraphBuilder  marshal( interface) pGraph) runtime managed internalcall
    {
    } // end of method IStreamBuilder::Backout

  } // end of class IStreamBuilder

  .class interface public abstract auto ansi import IAsyncReader
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 41 41 2D 30 41 44 34   // ..$56A868AA-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .method public hidebysig newslot virtual abstract 
            instance void  RequestAllocator([in] class MSR.LST.MDShow.IMemAllocator  marshal( interface) pPreferred,
                                            [in] valuetype MSR.LST.MDShow._AllocatorProperties& pProps,
                                            [out] class MSR.LST.MDShow.IMemAllocator&  marshal( interface) ppActual) runtime managed internalcall
    {
    } // end of method IAsyncReader::RequestAllocator

    .method public hidebysig newslot virtual abstract 
            instance void  Request([in] class MSR.LST.MDShow.IMediaSample  marshal( interface) pSample,
                                   [in] unsigned int32 dwUser) runtime managed internalcall
    {
      .param [2]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
    } // end of method IAsyncReader::Request

    .method public hidebysig newslot virtual abstract 
            instance void  WaitForNext([in] unsigned int32 dwTimeout,
                                       [out] class MSR.LST.MDShow.IMediaSample&  marshal( interface) ppSample,
                                       [out] unsigned int32& pdwUser) runtime managed internalcall
    {
      .param [3]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 18 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 55 4C 4F 4E 47 5F 50 54 52 00 00 )          // w.ULONG_PTR..
    } // end of method IAsyncReader::WaitForNext

    .method public hidebysig newslot virtual abstract 
            instance void  SyncReadAligned([in] class MSR.LST.MDShow.IMediaSample  marshal( interface) pSample) runtime managed internalcall
    {
    } // end of method IAsyncReader::SyncReadAligned

    .method public hidebysig newslot virtual abstract 
            instance void  SyncRead([in] int64 llPosition,
                                    [in] int32 lLength,
                                    [out] unsigned int8& pBuffer) runtime managed internalcall
    {
    } // end of method IAsyncReader::SyncRead

    .method public hidebysig newslot virtual abstract 
            instance void  Length([out] int64& pTotal,
                                  [out] int64& pAvailable) runtime managed internalcall
    {
    } // end of method IAsyncReader::Length

    .method public hidebysig newslot virtual abstract 
            instance void  BeginFlush() runtime managed internalcall
    {
    } // end of method IAsyncReader::BeginFlush

    .method public hidebysig newslot virtual abstract 
            instance void  EndFlush() runtime managed internalcall
    {
    } // end of method IAsyncReader::EndFlush

  } // end of class IAsyncReader

  .class interface public abstract auto ansi import IGraphVersion
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 41 42 2D 30 41 44 34   // ..$56A868AB-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  QueryVersion(int32& pVersion) runtime managed internalcall
    {
    } // end of method IGraphVersion::QueryVersion

  } // end of class IGraphVersion

  .class interface public abstract auto ansi import IResourceConsumer
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 41 44 2D 30 41 44 34   // ..$56A868AD-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  AcquireResource([in] int32 idResource) runtime managed internalcall
    {
    } // end of method IResourceConsumer::AcquireResource

    .method public hidebysig newslot virtual abstract 
            instance void  ReleaseResource([in] int32 idResource) runtime managed internalcall
    {
    } // end of method IResourceConsumer::ReleaseResource

  } // end of class IResourceConsumer

  .class interface public abstract auto ansi import IResourceManager
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 41 43 2D 30 41 44 34   // ..$56A868AC-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  Register([in] string  marshal( lpwstr) pName,
                                    [in] int32 cResource,
                                    [out] int32& plToken) runtime managed internalcall
    {
    } // end of method IResourceManager::Register

    .method public hidebysig newslot virtual abstract 
            instance void  RegisterGroup([in] string  marshal( lpwstr) pName,
                                         [in] int32 cResource,
                                         [in] int32& palTokens,
                                         [out] int32& plToken) runtime managed internalcall
    {
    } // end of method IResourceManager::RegisterGroup

    .method public hidebysig newslot virtual abstract 
            instance void  RequestResource([in] int32 idResource,
                                           [in] object  marshal( iunknown) pFocusObject,
                                           [in] class MSR.LST.MDShow.IResourceConsumer  marshal( interface) pConsumer) runtime managed internalcall
    {
    } // end of method IResourceManager::RequestResource

    .method public hidebysig newslot virtual abstract 
            instance void  NotifyAcquire([in] int32 idResource,
                                         [in] class MSR.LST.MDShow.IResourceConsumer  marshal( interface) pConsumer,
                                         [in] int32  marshal( error) hr) runtime managed internalcall
    {
    } // end of method IResourceManager::NotifyAcquire

    .method public hidebysig newslot virtual abstract 
            instance void  NotifyRelease([in] int32 idResource,
                                         [in] class MSR.LST.MDShow.IResourceConsumer  marshal( interface) pConsumer,
                                         [in] int32 bStillWant) runtime managed internalcall
    {
    } // end of method IResourceManager::NotifyRelease

    .method public hidebysig newslot virtual abstract 
            instance void  CancelRequest([in] int32 idResource,
                                         [in] class MSR.LST.MDShow.IResourceConsumer  marshal( interface) pConsumer) runtime managed internalcall
    {
    } // end of method IResourceManager::CancelRequest

    .method public hidebysig newslot virtual abstract 
            instance void  SetFocus([in] object  marshal( iunknown) pFocusObject) runtime managed internalcall
    {
    } // end of method IResourceManager::SetFocus

    .method public hidebysig newslot virtual abstract 
            instance void  ReleaseFocus([in] object  marshal( iunknown) pFocusObject) runtime managed internalcall
    {
    } // end of method IResourceManager::ReleaseFocus

  } // end of class IResourceManager

  .class interface public abstract auto ansi import IDistributorNotify
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 36 41 38 36 38 41 46 2D 30 41 44 34   // ..$56A868AF-0AD4
                                                                                                    2D 31 31 43 45 2D 42 30 33 41 2D 30 30 32 30 41   // -11CE-B03A-0020A
                                                                                                    46 30 42 41 37 37 30 00 00 )                      // F0BA770..
    .method public hidebysig newslot virtual abstract 
            instance void  Stop() runtime managed internalcall
    {
    } // end of method IDistributorNotify::Stop

    .method public hidebysig newslot virtual abstract 
            instance void  Pause() runtime managed internalcall
    {
    } // end of method IDistributorNotify::Pause

    .method public hidebysig newslot virtual abstract 
            instance void  Run(int64 tStart) runtime managed internalcall
    {
    } // end of method IDistributorNotify::Run

    .method public hidebysig newslot virtual abstract 
            instance void  SetSyncSource([in] class MSR.LST.MDShow.IReferenceClock  marshal( interface) pClock) runtime managed internalcall
    {
    } // end of method IDistributorNotify::SetSyncSource

    .method public hidebysig newslot virtual abstract 
            instance void  NotifyGraphChange() runtime managed internalcall
    {
    } // end of method IDistributorNotify::NotifyGraphChange

  } // end of class IDistributorNotify

  .class public auto ansi sealed AM_STREAM_INFO_FLAGS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.AM_STREAM_INFO_FLAGS AM_STREAM_INFO_START_DEFINED = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.AM_STREAM_INFO_FLAGS AM_STREAM_INFO_STOP_DEFINED = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.AM_STREAM_INFO_FLAGS AM_STREAM_INFO_DISCARDING = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.AM_STREAM_INFO_FLAGS AM_STREAM_INFO_STOP_SEND_EXTRA = int32(0x00000010)
  } // end of class AM_STREAM_INFO_FLAGS

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0161_0001
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0161_0001 AM_STREAM_INFO_START_DEFINED = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0161_0001 AM_STREAM_INFO_STOP_DEFINED = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0161_0001 AM_STREAM_INFO_DISCARDING = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0161_0001 AM_STREAM_INFO_STOP_SEND_EXTRA = int32(0x00000010)
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0161_0001

  .class public sequential ansi sealed beforefieldinit AM_STREAM_INFO
         extends [mscorlib]System.ValueType
  {
    .pack 8
    .size 0
    .field public int64 tStart
    .field public int64 tStop
    .field public unsigned int32 dwStartCookie
    .field public unsigned int32 dwStopCookie
    .field public unsigned int32 dwFlags
  } // end of class AM_STREAM_INFO

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0161_0002
         extends [mscorlib]System.ValueType
  {
    .pack 8
    .size 0
    .field public int64 tStart
    .field public int64 tStop
    .field public unsigned int32 dwStartCookie
    .field public unsigned int32 dwStopCookie
    .field public unsigned int32 dwFlags
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0161_0002

  .class interface public abstract auto ansi import IAMStreamControl
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 36 42 37 33 38 38 31 2D 43 32 43 38   // ..$36B73881-C2C8
                                                                                                    2D 31 31 43 46 2D 38 42 34 36 2D 30 30 38 30 35   // -11CF-8B46-00805
                                                                                                    46 36 43 45 46 36 30 00 00 )                      // F6CEF60..
    .method public hidebysig newslot virtual abstract 
            instance void  StartAt([in] int64& ptStart,
                                   [in] unsigned int32 dwCookie) runtime managed internalcall
    {
    } // end of method IAMStreamControl::StartAt

    .method public hidebysig newslot virtual abstract 
            instance void  StopAt([in] int64& ptStop,
                                  [in] int32 bSendExtra,
                                  [in] unsigned int32 dwCookie) runtime managed internalcall
    {
    } // end of method IAMStreamControl::StopAt

    .method public hidebysig newslot virtual abstract 
            instance void  GetInfo([out] valuetype MSR.LST.MDShow.AM_STREAM_INFO& pInfo) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1D 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 41 4D 5F 53 54 52 45 41 4D 5F 49 4E 46 4F   // w.AM_STREAM_INFO
                                                                                                              00 00 ) 
    } // end of method IAMStreamControl::GetInfo

  } // end of class IAMStreamControl

  .class public auto ansi sealed CompressionCaps
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.CompressionCaps CompressionCaps_CanQuality = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.CompressionCaps CompressionCaps_CanCrunch = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.CompressionCaps CompressionCaps_CanKeyFrame = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.CompressionCaps CompressionCaps_CanBFrame = int32(0x00000008)
    .field public static literal valuetype MSR.LST.MDShow.CompressionCaps CompressionCaps_CanWindow = int32(0x00000010)
  } // end of class CompressionCaps

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0168_0001
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0168_0001 CompressionCaps_CanQuality = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0168_0001 CompressionCaps_CanCrunch = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0168_0001 CompressionCaps_CanKeyFrame = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0168_0001 CompressionCaps_CanBFrame = int32(0x00000008)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0168_0001 CompressionCaps_CanWindow = int32(0x00000010)
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0168_0001

  .class public auto ansi sealed VfwCaptureDialogs
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.VfwCaptureDialogs VfwCaptureDialog_Source = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.VfwCaptureDialogs VfwCaptureDialog_Format = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.VfwCaptureDialogs VfwCaptureDialog_Display = int32(0x00000004)
  } // end of class VfwCaptureDialogs

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0169_0001
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0169_0001 VfwCaptureDialog_Source = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0169_0001 VfwCaptureDialog_Format = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0169_0001 VfwCaptureDialog_Display = int32(0x00000004)
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0169_0001

  .class public auto ansi sealed VfwCompressDialogs
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.VfwCompressDialogs VfwCompressDialog_Config = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.VfwCompressDialogs VfwCompressDialog_About = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.VfwCompressDialogs VfwCompressDialog_QueryConfig = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.VfwCompressDialogs VfwCompressDialog_QueryAbout = int32(0x00000008)
  } // end of class VfwCompressDialogs

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0169_0002
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0169_0002 VfwCompressDialog_Config = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0169_0002 VfwCompressDialog_About = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0169_0002 VfwCompressDialog_QueryConfig = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0169_0002 VfwCompressDialog_QueryAbout = int32(0x00000008)
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0169_0002

  .class public auto ansi sealed tagAnalogVideoStandard
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_None = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_NTSC_M = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_NTSC_M_J = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_NTSC_433 = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_PAL_B = int32(0x00000010)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_PAL_D = int32(0x00000020)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_PAL_G = int32(0x00000040)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_PAL_H = int32(0x00000080)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_PAL_I = int32(0x00000100)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_PAL_M = int32(0x00000200)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_PAL_N = int32(0x00000400)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_PAL_60 = int32(0x00000800)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_SECAM_B = int32(0x00001000)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_SECAM_D = int32(0x00002000)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_SECAM_G = int32(0x00004000)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_SECAM_H = int32(0x00008000)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_SECAM_K = int32(0x00010000)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_SECAM_K1 = int32(0x00020000)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_SECAM_L = int32(0x00040000)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_SECAM_L1 = int32(0x00080000)
    .field public static literal valuetype MSR.LST.MDShow.tagAnalogVideoStandard AnalogVideo_PAL_N_COMBO = int32(0x00100000)
  } // end of class tagAnalogVideoStandard

  .class public auto ansi sealed VideoCopyProtectionType
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.VideoCopyProtectionType VideoCopyProtectionMacrovisionBasic = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.VideoCopyProtectionType VideoCopyProtectionMacrovisionCBI = int32(0x00000001)
  } // end of class VideoCopyProtectionType

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0174_0001
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0174_0001 VideoCopyProtectionMacrovisionBasic = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0174_0001 VideoCopyProtectionMacrovisionCBI = int32(0x00000001)
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0174_0001

  .class public auto ansi sealed tagPhysicalConnectorType
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_Tuner = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_Composite = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_SVideo = int32(0x00000003)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_RGB = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_YRYBY = int32(0x00000005)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_SerialDigital = int32(0x00000006)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_ParallelDigital = int32(0x00000007)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_SCSI = int32(0x00000008)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_AUX = int32(0x00000009)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_1394 = int32(0x0000000A)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_USB = int32(0x0000000B)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_VideoDecoder = int32(0x0000000C)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_VideoEncoder = int32(0x0000000D)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_SCART = int32(0x0000000E)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Video_Black = int32(0x0000000F)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Audio_Tuner = int32(0x00001000)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Audio_Line = int32(0x00001001)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Audio_Mic = int32(0x00001002)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Audio_AESDigital = int32(0x00001003)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Audio_SPDIFDigital = int32(0x00001004)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Audio_SCSI = int32(0x00001005)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Audio_AUX = int32(0x00001006)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Audio_1394 = int32(0x00001007)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Audio_USB = int32(0x00001008)
    .field public static literal valuetype MSR.LST.MDShow.tagPhysicalConnectorType PhysConn_Audio_AudioDecoder = int32(0x00001009)
  } // end of class tagPhysicalConnectorType

  .class public auto ansi sealed tagVideoProcAmpProperty
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagVideoProcAmpProperty VideoProcAmp_Brightness = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.tagVideoProcAmpProperty VideoProcAmp_Contrast = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.tagVideoProcAmpProperty VideoProcAmp_Hue = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.tagVideoProcAmpProperty VideoProcAmp_Saturation = int32(0x00000003)
    .field public static literal valuetype MSR.LST.MDShow.tagVideoProcAmpProperty VideoProcAmp_Sharpness = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.tagVideoProcAmpProperty VideoProcAmp_Gamma = int32(0x00000005)
    .field public static literal valuetype MSR.LST.MDShow.tagVideoProcAmpProperty VideoProcAmp_ColorEnable = int32(0x00000006)
    .field public static literal valuetype MSR.LST.MDShow.tagVideoProcAmpProperty VideoProcAmp_WhiteBalance = int32(0x00000007)
    .field public static literal valuetype MSR.LST.MDShow.tagVideoProcAmpProperty VideoProcAmp_BacklightCompensation = int32(0x00000008)
    .field public static literal valuetype MSR.LST.MDShow.tagVideoProcAmpProperty VideoProcAmp_Gain = int32(0x00000009)
  } // end of class tagVideoProcAmpProperty

  .class public auto ansi sealed tagVideoProcAmpFlags
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagVideoProcAmpFlags VideoProcAmp_Flags_Auto = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.tagVideoProcAmpFlags VideoProcAmp_Flags_Manual = int32(0x00000002)
  } // end of class tagVideoProcAmpFlags

  .class public auto ansi sealed tagCameraControlProperty
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagCameraControlProperty CameraControl_Pan = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.tagCameraControlProperty CameraControl_Tilt = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.tagCameraControlProperty CameraControl_Roll = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.tagCameraControlProperty CameraControl_Zoom = int32(0x00000003)
    .field public static literal valuetype MSR.LST.MDShow.tagCameraControlProperty CameraControl_Exposure = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.tagCameraControlProperty CameraControl_Iris = int32(0x00000005)
    .field public static literal valuetype MSR.LST.MDShow.tagCameraControlProperty CameraControl_Focus = int32(0x00000006)
  } // end of class tagCameraControlProperty

  .class public auto ansi sealed tagCameraControlFlags
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagCameraControlFlags CameraControl_Flags_Auto = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.tagCameraControlFlags CameraControl_Flags_Manual = int32(0x00000002)
  } // end of class tagCameraControlFlags

  .class public auto ansi sealed tagVideoControlFlags
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagVideoControlFlags VideoControlFlag_FlipHorizontal = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.tagVideoControlFlags VideoControlFlag_FlipVertical = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.tagVideoControlFlags VideoControlFlag_ExternalTriggerEnable = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.tagVideoControlFlags VideoControlFlag_Trigger = int32(0x00000008)
  } // end of class tagVideoControlFlags

  .class interface public abstract auto ansi import IAMVideoControl
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 41 32 45 30 36 37 30 2D 32 38 45 34   // ..$6A2E0670-28E4
                                                                                                    2D 31 31 44 30 2D 41 31 38 43 2D 30 30 41 30 43   // -11D0-A18C-00A0C
                                                                                                    39 31 31 38 39 35 36 00 00 )                      // 9118956..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetCaps([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin,
                                   [out] int32& pCapsFlags) runtime managed internalcall
    {
    } // end of method IAMVideoControl::GetCaps

    .method public hidebysig newslot virtual abstract 
            instance void  SetMode([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin,
                                   [in] int32 mode) runtime managed internalcall
    {
    } // end of method IAMVideoControl::SetMode

    .method public hidebysig newslot virtual abstract 
            instance void  GetMode([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin,
                                   [out] int32& mode) runtime managed internalcall
    {
    } // end of method IAMVideoControl::GetMode

    .method public hidebysig newslot virtual abstract 
            instance void  GetCurrentActualFrameRate([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin,
                                                     [out] int64& ActualFrameRate) runtime managed internalcall
    {
    } // end of method IAMVideoControl::GetCurrentActualFrameRate

    .method public hidebysig newslot virtual abstract 
            instance void  GetMaxAvailableFrameRate([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin,
                                                    [in] int32 iIndex,
                                                    [in] valuetype MSR.LST.MDShow.tagSIZE Dimensions,
                                                    [out] int64& MaxAvailableFrameRate) runtime managed internalcall
    {
    } // end of method IAMVideoControl::GetMaxAvailableFrameRate

    .method public hidebysig newslot virtual abstract 
            instance void  GetFrameRateList([in] class MSR.LST.MDShow.IPin  marshal( interface) pPin,
                                            [in] int32 iIndex,
                                            [in] valuetype MSR.LST.MDShow.tagSIZE Dimensions,
                                            [out] int32& ListSize,
                                            [out] native int FrameRates) runtime managed internalcall
    {
    } // end of method IAMVideoControl::GetFrameRateList

  } // end of class IAMVideoControl

  .class public sequential ansi sealed beforefieldinit tagSIZE
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public int32 cx
    .field public int32 cy
  } // end of class tagSIZE

  .class public auto ansi sealed tagAMTunerSubChannel
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagAMTunerSubChannel AMTUNER_SUBCHAN_NO_TUNE = int32(0xFFFFFFFE)
    .field public static literal valuetype MSR.LST.MDShow.tagAMTunerSubChannel AMTUNER_SUBCHAN_DEFAULT = int32(0xFFFFFFFF)
  } // end of class tagAMTunerSubChannel

  .class public auto ansi sealed tagAMTunerSignalStrength
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagAMTunerSignalStrength AMTUNER_HASNOSIGNALSTRENGTH = int32(0xFFFFFFFF)
    .field public static literal valuetype MSR.LST.MDShow.tagAMTunerSignalStrength AMTUNER_NOSIGNAL = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.tagAMTunerSignalStrength AMTUNER_SIGNALPRESENT = int32(0x00000001)
  } // end of class tagAMTunerSignalStrength

  .class interface public abstract auto ansi import IBPCSatelliteTuner
         implements MSR.LST.MDShow.IAMTuner
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 32 31 31 41 38 37 36 35 2D 30 33 41 43   // ..$211A8765-03AC
                                                                                                    2D 31 31 44 31 2D 38 44 31 33 2D 30 30 41 41 30   // -11D1-8D13-00AA0
                                                                                                    30 42 44 38 33 33 39 00 00 )                      // 0BD8339..
    .method public hidebysig newslot virtual abstract 
            instance void  put_Channel([in] int32 lChannel,
                                       [in] int32 lVideoSubChannel,
                                       [in] int32 lAudioSubChannel) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::put_Channel

    .method public hidebysig newslot virtual abstract 
            instance void  get_Channel([out] int32& plChannel,
                                       [out] int32& plVideoSubChannel,
                                       [out] int32& plAudioSubChannel) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::get_Channel

    .method public hidebysig newslot virtual abstract 
            instance void  ChannelMinMax([out] int32& lChannelMin,
                                         [out] int32& lChannelMax) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::ChannelMinMax

    .method public hidebysig newslot virtual abstract 
            instance void  put_CountryCode([in] int32 lCountryCode) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::put_CountryCode

    .method public hidebysig newslot virtual abstract 
            instance void  get_CountryCode([out] int32& plCountryCode) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::get_CountryCode

    .method public hidebysig newslot virtual abstract 
            instance void  put_TuningSpace([in] int32 lTuningSpace) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::put_TuningSpace

    .method public hidebysig newslot virtual abstract 
            instance void  get_TuningSpace([out] int32& plTuningSpace) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::get_TuningSpace

    .method public hidebysig newslot virtual abstract 
            instance void  Logon([in] native int hCurrentUser) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::Logon

    .method public hidebysig newslot virtual abstract 
            instance void  Logout() runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::Logout

    .method public hidebysig newslot virtual abstract 
            instance void  SignalPresent([out] int32& plSignalStrength) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::SignalPresent

    .method public hidebysig newslot virtual abstract 
            instance void  put_Mode([in] valuetype MSR.LST.MDShow.tagAMTunerModeType lMode) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::put_Mode

    .method public hidebysig newslot virtual abstract 
            instance void  get_Mode([out] valuetype MSR.LST.MDShow.tagAMTunerModeType& plMode) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::get_Mode

    .method public hidebysig newslot virtual abstract 
            instance void  GetAvailableModes([out] int32& plModes) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::GetAvailableModes

    .method public hidebysig newslot virtual abstract 
            instance void  RegisterNotificationCallBack([in] class MSR.LST.MDShow.IAMTunerNotification  marshal( interface) pNotify,
                                                        [in] int32 lEvents) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::RegisterNotificationCallBack

    .method public hidebysig newslot virtual abstract 
            instance void  UnRegisterNotificationCallBack([in] class MSR.LST.MDShow.IAMTunerNotification  marshal( interface) pNotify) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::UnRegisterNotificationCallBack

    .method public hidebysig newslot virtual abstract 
            instance void  get_DefaultSubChannelTypes([out] int32& plDefaultVideoType,
                                                      [out] int32& plDefaultAudioType) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::get_DefaultSubChannelTypes

    .method public hidebysig newslot virtual abstract 
            instance void  put_DefaultSubChannelTypes([in] int32 lDefaultVideoType,
                                                      [in] int32 lDefaultAudioType) runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::put_DefaultSubChannelTypes

    .method public hidebysig newslot virtual abstract 
            instance void  IsTapingPermitted() runtime managed internalcall
    {
    } // end of method IBPCSatelliteTuner::IsTapingPermitted

  } // end of class IBPCSatelliteTuner

  .class public auto ansi sealed tagTVAudioMode
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagTVAudioMode AMTVAUDIO_MODE_MONO = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.tagTVAudioMode AMTVAUDIO_MODE_STEREO = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.tagTVAudioMode AMTVAUDIO_MODE_LANG_A = int32(0x00000010)
    .field public static literal valuetype MSR.LST.MDShow.tagTVAudioMode AMTVAUDIO_MODE_LANG_B = int32(0x00000020)
    .field public static literal valuetype MSR.LST.MDShow.tagTVAudioMode AMTVAUDIO_MODE_LANG_C = int32(0x00000040)
  } // end of class tagTVAudioMode

  .class public auto ansi sealed tagAMTVAudioEventType
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.tagAMTVAudioEventType AMTVAUDIO_EVENT_CHANGED = int32(0x00000001)
  } // end of class tagAMTVAudioEventType

  .class interface public abstract auto ansi import IAMTVAudioNotification
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 33 45 43 31 43 33 33 2D 32 33 44 31   // ..$83EC1C33-23D1
                                                                                                    2D 31 31 44 31 2D 39 39 45 36 2D 30 30 41 30 43   // -11D1-99E6-00A0C
                                                                                                    39 35 36 30 32 36 36 00 00 )                      // 9560266..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  OnEvent([in] valuetype MSR.LST.MDShow.tagAMTVAudioEventType Event) runtime managed internalcall
    {
    } // end of method IAMTVAudioNotification::OnEvent

  } // end of class IAMTVAudioNotification

  .class interface public abstract auto ansi import IAMTVAudio
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 33 45 43 31 43 33 30 2D 32 33 44 31   // ..$83EC1C30-23D1
                                                                                                    2D 31 31 44 31 2D 39 39 45 36 2D 30 30 41 30 43   // -11D1-99E6-00A0C
                                                                                                    39 35 36 30 32 36 36 00 00 )                      // 9560266..
    .method public hidebysig newslot virtual abstract 
            instance void  GetHardwareSupportedTVAudioModes([out] int32& plModes) runtime managed internalcall
    {
    } // end of method IAMTVAudio::GetHardwareSupportedTVAudioModes

    .method public hidebysig newslot virtual abstract 
            instance void  GetAvailableTVAudioModes([out] int32& plModes) runtime managed internalcall
    {
    } // end of method IAMTVAudio::GetAvailableTVAudioModes

    .method public hidebysig newslot virtual abstract 
            instance void  get_TVAudioMode([out] int32& plMode) runtime managed internalcall
    {
    } // end of method IAMTVAudio::get_TVAudioMode

    .method public hidebysig newslot virtual abstract 
            instance void  put_TVAudioMode([in] int32 lMode) runtime managed internalcall
    {
    } // end of method IAMTVAudio::put_TVAudioMode

    .method public hidebysig newslot virtual abstract 
            instance void  RegisterNotificationCallBack([in] class MSR.LST.MDShow.IAMTunerNotification  marshal( interface) pNotify,
                                                        [in] int32 lEvents) runtime managed internalcall
    {
    } // end of method IAMTVAudio::RegisterNotificationCallBack

    .method public hidebysig newslot virtual abstract 
            instance void  UnRegisterNotificationCallBack(class MSR.LST.MDShow.IAMTunerNotification  marshal( interface) pNotify) runtime managed internalcall
    {
    } // end of method IAMTVAudio::UnRegisterNotificationCallBack

  } // end of class IAMTVAudio

  .class public auto ansi sealed AMPROPERTY_PIN
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.AMPROPERTY_PIN AMPROPERTY_PIN_CATEGORY = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.AMPROPERTY_PIN AMPROPERTY_PIN_MEDIUM = int32(0x00000001)
  } // end of class AMPROPERTY_PIN

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0186_0001
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0186_0001 AMPROPERTY_PIN_CATEGORY = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0186_0001 AMPROPERTY_PIN_MEDIUM = int32(0x00000001)
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0186_0001

  .class interface public abstract auto ansi import IMediaPropertyBag
         implements MSR.LST.MDShow.IPropertyBag
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 30 32 35 41 38 38 30 2D 43 30 44 35   // ..$6025A880-C0D5
                                                                                                    2D 31 31 44 30 2D 42 44 34 45 2D 30 30 41 30 43   // -11D0-BD4E-00A0C
                                                                                                    39 31 31 43 45 38 36 00 00 )                      // 911CE86..
    .method public hidebysig newslot virtual abstract 
            instance void  RemoteRead([in] string  marshal( lpwstr) pszPropName,
                                      [out] object&  marshal( struct) pVar,
                                      [in] class MSR.LST.MDShow.IErrorLog  marshal( interface) pErrorLog,
                                      [in] unsigned int32 varType,
                                      [in] object  marshal( iunknown) pUnkObj) runtime managed internalcall
    {
    } // end of method IMediaPropertyBag::RemoteRead

    .method public hidebysig newslot virtual abstract 
            instance void  Write([in] string  marshal( lpwstr) pszPropName,
                                 [in] object&  marshal( struct) pVar) runtime managed internalcall
    {
    } // end of method IMediaPropertyBag::Write

    .method public hidebysig newslot virtual abstract 
            instance void  EnumProperty([in] unsigned int32 iProperty,
                                        [in][out] object&  marshal( struct) pvarPropertyName,
                                        [in][out] object&  marshal( struct) pvarPropertyValue) runtime managed internalcall
    {
    } // end of method IMediaPropertyBag::EnumProperty

  } // end of class IMediaPropertyBag

  .class interface public abstract auto ansi import IPropertyBag
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 35 32 37 32 41 30 30 2D 34 32 43 42   // ..$55272A00-42CB
                                                                                                    2D 31 31 43 45 2D 38 31 33 35 2D 30 30 41 41 30   // -11CE-8135-00AA0
                                                                                                    30 34 42 42 38 35 31 00 00 )                      // 04BB851..
    .method public hidebysig newslot virtual abstract 
            instance void  RemoteRead([in] string  marshal( lpwstr) pszPropName,
                                      [out] object&  marshal( struct) pVar,
                                      [in] class MSR.LST.MDShow.IErrorLog  marshal( interface) pErrorLog,
                                      [in] unsigned int32 varType,
                                      [in] object  marshal( iunknown) pUnkObj) runtime managed internalcall
    {
    } // end of method IPropertyBag::RemoteRead

    .method public hidebysig newslot virtual abstract 
            instance void  Write([in] string  marshal( lpwstr) pszPropName,
                                 [in] object&  marshal( struct) pVar) runtime managed internalcall
    {
    } // end of method IPropertyBag::Write

  } // end of class IPropertyBag

  .class interface public abstract auto ansi import IErrorLog
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 31 32 37 43 41 34 30 2D 34 34 36 45   // ..$3127CA40-446E
                                                                                                    2D 31 31 43 45 2D 38 31 33 35 2D 30 30 41 41 30   // -11CE-8135-00AA0
                                                                                                    30 34 42 42 38 35 31 00 00 )                      // 04BB851..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  AddError([in] string  marshal( lpwstr) pszPropName,
                                    [in] valuetype [stdole]stdole.EXCEPINFO& pExcepInfo) runtime managed internalcall
    {
    } // end of method IErrorLog::AddError

  } // end of class IErrorLog

  .class interface public abstract auto ansi import IPersistMediaPropertyBag
         implements MSR.LST.MDShow.IPersist
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 37 33 38 45 30 34 30 2D 42 36 37 46   // ..$5738E040-B67F
                                                                                                    2D 31 31 44 30 2D 42 44 34 44 2D 30 30 41 30 43   // -11D0-BD4D-00A0C
                                                                                                    39 31 31 43 45 38 36 00 00 )                      // 911CE86..
    .method public hidebysig newslot virtual abstract 
            instance void  GetClassID([out] valuetype [mscorlib]System.Guid& pClassID) runtime managed internalcall
    {
    } // end of method IPersistMediaPropertyBag::GetClassID

    .method public hidebysig newslot virtual abstract 
            instance void  InitNew() runtime managed internalcall
    {
    } // end of method IPersistMediaPropertyBag::InitNew

    .method public hidebysig newslot virtual abstract 
            instance void  Load([in] class MSR.LST.MDShow.IMediaPropertyBag  marshal( interface) pPropBag,
                                [in] class MSR.LST.MDShow.IErrorLog  marshal( interface) pErrorLog) runtime managed internalcall
    {
    } // end of method IPersistMediaPropertyBag::Load

    .method public hidebysig newslot virtual abstract 
            instance void  Save([in] class MSR.LST.MDShow.IMediaPropertyBag  marshal( interface) pPropBag,
                                [in] int32 fClearDirty,
                                [in] int32 fSaveAllProperties) runtime managed internalcall
    {
    } // end of method IPersistMediaPropertyBag::Save

  } // end of class IPersistMediaPropertyBag

  .class public auto ansi sealed _AMSTREAMSELECTINFOFLAGS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._AMSTREAMSELECTINFOFLAGS AMSTREAMSELECTINFO_ENABLED = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow._AMSTREAMSELECTINFOFLAGS AMSTREAMSELECTINFO_EXCLUSIVE = int32(0x00000002)
  } // end of class _AMSTREAMSELECTINFOFLAGS

  .class public auto ansi sealed _AMSTREAMSELECTENABLEFLAGS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._AMSTREAMSELECTENABLEFLAGS AMSTREAMSELECTENABLE_ENABLE = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow._AMSTREAMSELECTENABLEFLAGS AMSTREAMSELECTENABLE_ENABLEALL = int32(0x00000002)
  } // end of class _AMSTREAMSELECTENABLEFLAGS

  .class interface public abstract auto ansi import IAMStreamSelect
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 31 39 36 30 39 36 30 2D 31 37 46 35   // ..$C1960960-17F5
                                                                                                    2D 31 31 44 31 2D 41 42 45 31 2D 30 30 41 30 43   // -11D1-ABE1-00A0C
                                                                                                    39 30 35 46 33 37 35 00 00 )                      // 905F375..
    .method public hidebysig newslot virtual abstract 
            instance void  Count([out] unsigned int32& pcStreams) runtime managed internalcall
    {
    } // end of method IAMStreamSelect::Count

    .method public hidebysig newslot virtual abstract 
            instance void  Info([in] int32 lIndex,
                                [out] native int ppmt,
                                [out] unsigned int32& pdwFlags,
                                [out] unsigned int32& plcid,
                                [out] unsigned int32& pdwGroup,
                                [out] native int ppszName,
                                [out] object&  marshal( iunknown) ppObject,
                                [out] object&  marshal( iunknown) ppunk) runtime managed internalcall
    {
    } // end of method IAMStreamSelect::Info

    .method public hidebysig newslot virtual abstract 
            instance void  Enable([in] int32 lIndex,
                                  [in] unsigned int32 dwFlags) runtime managed internalcall
    {
    } // end of method IAMStreamSelect::Enable

  } // end of class IAMStreamSelect

  .class public auto ansi sealed _AMRESCTL_RESERVEFLAGS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._AMRESCTL_RESERVEFLAGS AMRESCTL_RESERVEFLAGS_RESERVE = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow._AMRESCTL_RESERVEFLAGS AMRESCTL_RESERVEFLAGS_UNRESERVE = int32(0x00000001)
  } // end of class _AMRESCTL_RESERVEFLAGS

  .class interface public abstract auto ansi import IAMResourceControl
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 33 38 39 44 32 44 30 2D 37 37 44 37   // ..$8389D2D0-77D7
                                                                                                    2D 31 31 44 31 2D 41 42 45 36 2D 30 30 41 30 43   // -11D1-ABE6-00A0C
                                                                                                    39 30 35 46 33 37 35 00 00 )                      // 905F375..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  Reserve([in] unsigned int32 dwFlags,
                                   [in] native int pvReserved) runtime managed internalcall
    {
    } // end of method IAMResourceControl::Reserve

  } // end of class IAMResourceControl

  .class interface public abstract auto ansi import IAMClockAdjust
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 34 44 35 34 36 36 42 30 2D 41 34 39 43   // ..$4D5466B0-A49C
                                                                                                    2D 31 31 44 31 2D 41 42 45 38 2D 30 30 41 30 43   // -11D1-ABE8-00A0C
                                                                                                    39 30 35 46 33 37 35 00 00 )                      // 905F375..
    .method public hidebysig newslot virtual abstract 
            instance void  SetClockDelta([in] int64 rtDelta) runtime managed internalcall
    {
    } // end of method IAMClockAdjust::SetClockDelta

  } // end of class IAMClockAdjust

  .class public auto ansi sealed _AM_FILTER_MISC_FLAGS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._AM_FILTER_MISC_FLAGS AM_FILTER_MISC_FLAGS_IS_RENDERER = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow._AM_FILTER_MISC_FLAGS AM_FILTER_MISC_FLAGS_IS_SOURCE = int32(0x00000002)
  } // end of class _AM_FILTER_MISC_FLAGS

  .class interface public abstract auto ansi import IAMFilterMiscFlags
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 32 44 44 37 34 39 35 30 2D 41 38 39 30   // ..$2DD74950-A890
                                                                                                    2D 31 31 44 31 2D 41 42 45 38 2D 30 30 41 30 43   // -11D1-ABE8-00A0C
                                                                                                    39 30 35 46 33 37 35 00 00 )                      // 905F375..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance unsigned int32  GetMiscFlags() runtime managed preservesig internalcall
    {
    } // end of method IAMFilterMiscFlags::GetMiscFlags

  } // end of class IAMFilterMiscFlags

  .class interface public abstract auto ansi import IVideoFrameStep
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 45 34 36 41 39 37 38 37 2D 32 42 37 31   // ..$E46A9787-2B71
                                                                                                    2D 34 34 34 44 2D 41 34 42 35 2D 31 46 41 42 37   // -444D-A4B5-1FAB7
                                                                                                    42 37 30 38 44 36 41 00 00 )                      // B708D6A..
    .method public hidebysig newslot virtual abstract 
            instance void  Step(unsigned int32 dwFrames,
                                object  marshal( iunknown) pStepObject) runtime managed internalcall
    {
    } // end of method IVideoFrameStep::Step

    .method public hidebysig newslot virtual abstract 
            instance void  CanStep(int32 bMultiple,
                                   object  marshal( iunknown) pStepObject) runtime managed internalcall
    {
    } // end of method IVideoFrameStep::CanStep

    .method public hidebysig newslot virtual abstract 
            instance void  CancelStep() runtime managed internalcall
    {
    } // end of method IVideoFrameStep::CancelStep

  } // end of class IVideoFrameStep

  .class public auto ansi sealed _AM_PUSHSOURCE_FLAGS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._AM_PUSHSOURCE_FLAGS AM_PUSHSOURCECAPS_INTERNAL_RM = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow._AM_PUSHSOURCE_FLAGS AM_PUSHSOURCECAPS_NOT_LIVE = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow._AM_PUSHSOURCE_FLAGS AM_PUSHSOURCECAPS_PRIVATE_CLOCK = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow._AM_PUSHSOURCE_FLAGS AM_PUSHSOURCEREQS_USE_STREAM_CLOCK = int32(0x00010000)
    .field public static literal valuetype MSR.LST.MDShow._AM_PUSHSOURCE_FLAGS AM_PUSHSOURCEREQS_USE_CLOCK_CHAIN = int32(0x00020000)
  } // end of class _AM_PUSHSOURCE_FLAGS

  .class interface public abstract auto ansi import IAMDeviceRemoval
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 46 39 30 41 36 31 33 30 2D 42 36 35 38   // ..$F90A6130-B658
                                                                                                    2D 31 31 44 32 2D 41 45 34 39 2D 30 30 30 30 46   // -11D2-AE49-0000F
                                                                                                    38 37 35 34 42 39 39 00 00 )                      // 8754B99..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  DeviceInfo([out] valuetype [mscorlib]System.Guid& pclsidInterfaceClass,
                                      [out] native int pwszSymbolicLink) runtime managed internalcall
    {
    } // end of method IAMDeviceRemoval::DeviceInfo

    .method public hidebysig newslot virtual abstract 
            instance void  Reassociate() runtime managed internalcall
    {
    } // end of method IAMDeviceRemoval::Reassociate

    .method public hidebysig newslot virtual abstract 
            instance void  Disassociate() runtime managed internalcall
    {
    } // end of method IAMDeviceRemoval::Disassociate

  } // end of class IAMDeviceRemoval

  .class public sequential ansi sealed beforefieldinit DVINFO
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 dwDVAAuxSrc
    .field public unsigned int32 dwDVAAuxCtl
    .field public unsigned int32 dwDVAAuxSrc1
    .field public unsigned int32 dwDVAAuxCtl1
    .field public unsigned int32 dwDVVAuxSrc
    .field public unsigned int32 dwDVVAuxCtl
    .field public  marshal( fixed array [2]) unsigned int32[] dwDVReserved
  } // end of class DVINFO

  .class public sequential ansi sealed beforefieldinit __MIDL___MIDL_itf_SampleGrabberInterop_0350_0001
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public unsigned int32 dwDVAAuxSrc
    .field public unsigned int32 dwDVAAuxCtl
    .field public unsigned int32 dwDVAAuxSrc1
    .field public unsigned int32 dwDVAAuxCtl1
    .field public unsigned int32 dwDVVAuxSrc
    .field public unsigned int32 dwDVVAuxCtl
    .field public  marshal( fixed array [2]) unsigned int32[] dwDVReserved
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0350_0001

  .class public auto ansi sealed _DVENCODERRESOLUTION
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._DVENCODERRESOLUTION DVENCODERRESOLUTION_720x480 = int32(0x000007DC)
    .field public static literal valuetype MSR.LST.MDShow._DVENCODERRESOLUTION DVENCODERRESOLUTION_360x240 = int32(0x000007DD)
    .field public static literal valuetype MSR.LST.MDShow._DVENCODERRESOLUTION DVENCODERRESOLUTION_180x120 = int32(0x000007DE)
    .field public static literal valuetype MSR.LST.MDShow._DVENCODERRESOLUTION DVENCODERRESOLUTION_88x60 = int32(0x000007DF)
  } // end of class _DVENCODERRESOLUTION

  .class public auto ansi sealed _DVENCODERVIDEOFORMAT
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._DVENCODERVIDEOFORMAT DVENCODERVIDEOFORMAT_NTSC = int32(0x000007D0)
    .field public static literal valuetype MSR.LST.MDShow._DVENCODERVIDEOFORMAT DVENCODERVIDEOFORMAT_PAL = int32(0x000007D1)
  } // end of class _DVENCODERVIDEOFORMAT

  .class public auto ansi sealed _DVENCODERFORMAT
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._DVENCODERFORMAT DVENCODERFORMAT_DVSD = int32(0x000007D7)
    .field public static literal valuetype MSR.LST.MDShow._DVENCODERFORMAT DVENCODERFORMAT_DVHD = int32(0x000007D8)
    .field public static literal valuetype MSR.LST.MDShow._DVENCODERFORMAT DVENCODERFORMAT_DVSL = int32(0x000007D9)
  } // end of class _DVENCODERFORMAT

  .class interface public abstract auto ansi import IDVEnc
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 31 38 45 31 37 41 30 2D 41 41 43 42   // ..$D18E17A0-AACB
                                                                                                    2D 31 31 44 30 2D 41 46 42 30 2D 30 30 41 41 30   // -11D0-AFB0-00AA0
                                                                                                    30 42 36 37 41 34 32 00 00 )                      // 0B67A42..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  get_IFormatResolution([out] int32& VideoFormat,
                                                 [out] int32& DVFormat,
                                                 [out] int32& Resolution,
                                                 [in] unsigned int8 fDVInfo,
                                                 [out] valuetype MSR.LST.MDShow.DVINFO& sDVInfo) runtime managed internalcall
    {
      .param [5]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 44 56 49 4E 46 4F 00 00 )                   // w.DVINFO..
    } // end of method IDVEnc::get_IFormatResolution

    .method public hidebysig newslot virtual abstract 
            instance void  put_IFormatResolution([in] int32 VideoFormat,
                                                 [in] int32 DVFormat,
                                                 [in] int32 Resolution,
                                                 [in] unsigned int8 fDVInfo,
                                                 [in] valuetype MSR.LST.MDShow.DVINFO& sDVInfo) runtime managed internalcall
    {
      .param [5]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 15 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 44 56 49 4E 46 4F 00 00 )                   // w.DVINFO..
    } // end of method IDVEnc::put_IFormatResolution

  } // end of class IDVEnc

  .class public auto ansi sealed _DVDECODERRESOLUTION
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._DVDECODERRESOLUTION DVDECODERRESOLUTION_720x480 = int32(0x000003E8)
    .field public static literal valuetype MSR.LST.MDShow._DVDECODERRESOLUTION DVDECODERRESOLUTION_360x240 = int32(0x000003E9)
    .field public static literal valuetype MSR.LST.MDShow._DVDECODERRESOLUTION DVDECODERRESOLUTION_180x120 = int32(0x000003EA)
    .field public static literal valuetype MSR.LST.MDShow._DVDECODERRESOLUTION DVDECODERRESOLUTION_88x60 = int32(0x000003EB)
  } // end of class _DVDECODERRESOLUTION

  .class public auto ansi sealed _DVRESOLUTION
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._DVRESOLUTION DVRESOLUTION_FULL = int32(0x000003E8)
    .field public static literal valuetype MSR.LST.MDShow._DVRESOLUTION DVRESOLUTION_HALF = int32(0x000003E9)
    .field public static literal valuetype MSR.LST.MDShow._DVRESOLUTION DVRESOLUTION_QUARTER = int32(0x000003EA)
    .field public static literal valuetype MSR.LST.MDShow._DVRESOLUTION DVRESOLUTION_DC = int32(0x000003EB)
  } // end of class _DVRESOLUTION

  .class interface public abstract auto ansi import IIPDVDec
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 42 38 45 38 42 44 36 30 2D 30 42 46 45   // ..$B8E8BD60-0BFE
                                                                                                    2D 31 31 44 30 2D 41 46 39 31 2D 30 30 41 41 30   // -11D0-AF91-00AA0
                                                                                                    30 42 36 37 41 34 32 00 00 )                      // 0B67A42..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  get_IPDisplay([out] int32& displayPix) runtime managed internalcall
    {
    } // end of method IIPDVDec::get_IPDisplay

    .method public hidebysig newslot virtual abstract 
            instance void  put_IPDisplay([in] int32 displayPix) runtime managed internalcall
    {
    } // end of method IIPDVDec::put_IPDisplay

  } // end of class IIPDVDec

  .class interface public abstract auto ansi import IDVRGB219
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 38 34 37 33 41 31 39 2D 32 42 43 38   // ..$58473A19-2BC8
                                                                                                    2D 34 36 36 33 2D 38 30 31 32 2D 32 35 46 38 31   // -4663-8012-25F81
                                                                                                    42 41 42 44 44 44 31 00 00 )                      // BABDDD1..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  SetRGB219([in] int32 bState) runtime managed internalcall
    {
    } // end of method IDVRGB219::SetRGB219

  } // end of class IDVRGB219

  .class interface public abstract auto ansi import IDVSplitter
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 32 41 33 41 33 30 32 2D 44 41 37 43   // ..$92A3A302-DA7C
                                                                                                    2D 34 41 31 46 2D 42 41 37 45 2D 31 38 30 32 42   // -4A1F-BA7E-1802B
                                                                                                    42 35 44 32 44 30 32 00 00 )                      // B5D2D02..
    .method public hidebysig newslot virtual abstract 
            instance void  DiscardAlternateVideoFrames([in] int32 nDiscard) runtime managed internalcall
    {
    } // end of method IDVSplitter::DiscardAlternateVideoFrames

  } // end of class IDVSplitter

  .class public auto ansi sealed _AM_AUDIO_RENDERER_STAT_PARAM
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._AM_AUDIO_RENDERER_STAT_PARAM AM_AUDREND_STAT_PARAM_BREAK_COUNT = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow._AM_AUDIO_RENDERER_STAT_PARAM AM_AUDREND_STAT_PARAM_SLAVE_MODE = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow._AM_AUDIO_RENDERER_STAT_PARAM AM_AUDREND_STAT_PARAM_SILENCE_DUR = int32(0x00000003)
    .field public static literal valuetype MSR.LST.MDShow._AM_AUDIO_RENDERER_STAT_PARAM AM_AUDREND_STAT_PARAM_LAST_BUFFER_DUR = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow._AM_AUDIO_RENDERER_STAT_PARAM AM_AUDREND_STAT_PARAM_DISCONTINUITIES = int32(0x00000005)
    .field public static literal valuetype MSR.LST.MDShow._AM_AUDIO_RENDERER_STAT_PARAM AM_AUDREND_STAT_PARAM_SLAVE_RATE = int32(0x00000006)
    .field public static literal valuetype MSR.LST.MDShow._AM_AUDIO_RENDERER_STAT_PARAM AM_AUDREND_STAT_PARAM_SLAVE_DROPWRITE_DUR = int32(0x00000007)
    .field public static literal valuetype MSR.LST.MDShow._AM_AUDIO_RENDERER_STAT_PARAM AM_AUDREND_STAT_PARAM_SLAVE_HIGHLOWERROR = int32(0x00000008)
    .field public static literal valuetype MSR.LST.MDShow._AM_AUDIO_RENDERER_STAT_PARAM AM_AUDREND_STAT_PARAM_SLAVE_LASTHIGHLOWERROR = int32(0x00000009)
    .field public static literal valuetype MSR.LST.MDShow._AM_AUDIO_RENDERER_STAT_PARAM AM_AUDREND_STAT_PARAM_SLAVE_ACCUMERROR = int32(0x0000000A)
    .field public static literal valuetype MSR.LST.MDShow._AM_AUDIO_RENDERER_STAT_PARAM AM_AUDREND_STAT_PARAM_BUFFERFULLNESS = int32(0x0000000B)
    .field public static literal valuetype MSR.LST.MDShow._AM_AUDIO_RENDERER_STAT_PARAM AM_AUDREND_STAT_PARAM_JITTER = int32(0x0000000C)
  } // end of class _AM_AUDIO_RENDERER_STAT_PARAM

  .class public auto ansi sealed _AM_INTF_SEARCH_FLAGS
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow._AM_INTF_SEARCH_FLAGS AM_INTF_SEARCH_INPUT_PIN = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow._AM_INTF_SEARCH_FLAGS AM_INTF_SEARCH_OUTPUT_PIN = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow._AM_INTF_SEARCH_FLAGS AM_INTF_SEARCH_FILTER = int32(0x00000004)
  } // end of class _AM_INTF_SEARCH_FLAGS

  .class public auto ansi sealed AMOVERLAYFX
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.AMOVERLAYFX AMOVERFX_NOFX = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.AMOVERLAYFX AMOVERFX_MIRRORLEFTRIGHT = int32(0x00000002)
    .field public static literal valuetype MSR.LST.MDShow.AMOVERLAYFX AMOVERFX_MIRRORUPDOWN = int32(0x00000004)
    .field public static literal valuetype MSR.LST.MDShow.AMOVERLAYFX AMOVERFX_DEINTERLACE = int32(0x00000008)
  } // end of class AMOVERLAYFX

  .class interface public abstract auto ansi import IRegisterServiceProvider
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 37 42 33 41 32 46 30 31 2D 30 37 35 31   // ..$7B3A2F01-0751
                                                                                                    2D 34 38 44 44 2D 42 35 35 36 2D 30 30 34 37 38   // -48DD-B556-00478
                                                                                                    35 31 37 31 43 35 34 00 00 )                      // 5171C54..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  RegisterService([in] valuetype [mscorlib]System.Guid& guidService,
                                           [in] object  marshal( iunknown) punkObject) runtime managed internalcall
    {
    } // end of method IRegisterServiceProvider::RegisterService

  } // end of class IRegisterServiceProvider

  .class public sequential ansi sealed beforefieldinit CodecAPIEventData
         extends [mscorlib]System.ValueType
  {
    .pack 4
    .size 0
    .field public valuetype [mscorlib]System.Guid guid
    .field public unsigned int32 dataLength
    .field public  marshal( fixed array [3]) unsigned int32[] reserved
  } // end of class CodecAPIEventData

  .class interface public abstract auto ansi import ICodecAPI
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 30 31 44 42 34 43 37 2D 33 31 43 45   // ..$901DB4C7-31CE
                                                                                                    2D 34 31 41 32 2D 38 35 44 43 2D 38 46 41 30 42   // -41A2-85DC-8FA0B
                                                                                                    46 34 31 42 38 44 41 00 00 )                      // F41B8DA..
    .method public hidebysig newslot virtual abstract 
            instance void  IsSupported([in] valuetype [mscorlib]System.Guid& Api) runtime managed internalcall
    {
    } // end of method ICodecAPI::IsSupported

    .method public hidebysig newslot virtual abstract 
            instance void  IsModifiable([in] valuetype [mscorlib]System.Guid& Api) runtime managed internalcall
    {
    } // end of method ICodecAPI::IsModifiable

    .method public hidebysig newslot virtual abstract 
            instance void  GetParameterRange([in] valuetype [mscorlib]System.Guid& Api,
                                             [out] object&  marshal( struct) ValueMin,
                                             [out] object&  marshal( struct) ValueMax,
                                             [out] object&  marshal( struct) SteppingDelta) runtime managed internalcall
    {
    } // end of method ICodecAPI::GetParameterRange

    .method public hidebysig newslot virtual abstract 
            instance void  GetParameterValues([in] valuetype [mscorlib]System.Guid& Api,
                                              [out] native int Values,
                                              [out] unsigned int32& ValuesCount) runtime managed internalcall
    {
    } // end of method ICodecAPI::GetParameterValues

    .method public hidebysig newslot virtual abstract 
            instance void  GetDefaultValue([in] valuetype [mscorlib]System.Guid& Api,
                                           [out] object&  marshal( struct) Value) runtime managed internalcall
    {
    } // end of method ICodecAPI::GetDefaultValue

    .method public hidebysig newslot virtual abstract 
            instance void  GetValue([in] valuetype [mscorlib]System.Guid& Api,
                                    [out] object&  marshal( struct) Value) runtime managed internalcall
    {
    } // end of method ICodecAPI::GetValue

    .method public hidebysig newslot virtual abstract 
            instance void  SetValue([in] valuetype [mscorlib]System.Guid& Api,
                                    [in] object&  marshal( struct) Value) runtime managed internalcall
    {
    } // end of method ICodecAPI::SetValue

    .method public hidebysig newslot virtual abstract 
            instance void  RegisterForEvent([in] valuetype [mscorlib]System.Guid& Api,
                                            [in] int32 userData) runtime managed internalcall
    {
      .param [2]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 17 4D 53 52 2E 4C 53 54 2E 4D 44 53 68 6F   // ...MSR.LST.MDSho
                                                                                                              77 2E 4C 4F 4E 47 5F 50 54 52 00 00 )             // w.LONG_PTR..
    } // end of method ICodecAPI::RegisterForEvent

    .method public hidebysig newslot virtual abstract 
            instance void  UnregisterForEvent([in] valuetype [mscorlib]System.Guid& Api) runtime managed internalcall
    {
    } // end of method ICodecAPI::UnregisterForEvent

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllDefaults() runtime managed internalcall
    {
    } // end of method ICodecAPI::SetAllDefaults

    .method public hidebysig newslot virtual abstract 
            instance void  SetValueWithNotify([in] valuetype [mscorlib]System.Guid& Api,
                                              [in] object&  marshal( struct) Value,
                                              [out] native int ChangedParam,
                                              [out] unsigned int32& ChangedParamCount) runtime managed internalcall
    {
    } // end of method ICodecAPI::SetValueWithNotify

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllDefaultsWithNotify([out] native int ChangedParam,
                                                    [out] unsigned int32& ChangedParamCount) runtime managed internalcall
    {
    } // end of method ICodecAPI::SetAllDefaultsWithNotify

    .method public hidebysig newslot virtual abstract 
            instance void  GetAllSettings([in] class MSR.LST.MDShow.IStream  marshal( interface) __MIDL_0016) runtime managed internalcall
    {
    } // end of method ICodecAPI::GetAllSettings

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllSettings([in] class MSR.LST.MDShow.IStream  marshal( interface) __MIDL_0017) runtime managed internalcall
    {
    } // end of method ICodecAPI::SetAllSettings

    .method public hidebysig newslot virtual abstract 
            instance void  SetAllSettingsWithNotify(class MSR.LST.MDShow.IStream  marshal( interface) __MIDL_0018,
                                                    [out] native int ChangedParam,
                                                    [out] unsigned int32& ChangedParamCount) runtime managed internalcall
    {
    } // end of method ICodecAPI::SetAllSettingsWithNotify

  } // end of class ICodecAPI

  .class interface public abstract auto ansi import IGetCapabilitiesKey
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 41 38 38 30 39 32 32 32 2D 30 37 42 42   // ..$A8809222-07BB
                                                                                                    2D 34 38 45 41 2D 39 35 31 43 2D 33 33 31 35 38   // -48EA-951C-33158
                                                                                                    31 30 30 36 32 35 42 00 00 )                      // 100625B..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetCapabilitiesKey([out] native int& pHKey) runtime managed internalcall
    {
    } // end of method IGetCapabilitiesKey::GetCapabilitiesKey

  } // end of class IGetCapabilitiesKey

  .class public auto ansi sealed VIDEOENCODER_BITRATE_MODE
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.VIDEOENCODER_BITRATE_MODE ConstantBitRate = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.VIDEOENCODER_BITRATE_MODE VariableBitRateAverage = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.VIDEOENCODER_BITRATE_MODE VariableBitRatePeak = int32(0x00000002)
  } // end of class VIDEOENCODER_BITRATE_MODE

  .class public auto ansi sealed __MIDL___MIDL_itf_SampleGrabberInterop_0369_0001
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0369_0001 ConstantBitRate = int32(0x00000000)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0369_0001 VariableBitRateAverage = int32(0x00000001)
    .field public static literal valuetype MSR.LST.MDShow.__MIDL___MIDL_itf_SampleGrabberInterop_0369_0001 VariableBitRatePeak = int32(0x00000002)
  } // end of class __MIDL___MIDL_itf_SampleGrabberInterop_0369_0001

  .class interface public abstract auto ansi import IAMDecoderCaps
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 30 44 46 46 34 36 37 2D 44 34 39 39   // ..$C0DFF467-D499
                                                                                                    2D 34 39 38 36 2D 39 37 32 42 2D 45 31 44 39 30   // -4986-972B-E1D90
                                                                                                    39 30 46 41 39 34 31 00 00 )                      // 90FA941..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot virtual abstract 
            instance void  GetDecoderCaps([in] unsigned int32 dwCapIndex,
                                          [out] unsigned int32& lpdwCap) runtime managed internalcall
    {
    } // end of method IAMDecoderCaps::GetDecoderCaps

  } // end of class IAMDecoderCaps

  .class interface public abstract auto ansi import ISampleGrabber
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 42 36 35 32 46 46 46 2D 31 31 46 45   // ..$6B652FFF-11FE
                                                                                                    2D 34 46 43 45 2D 39 32 41 44 2D 30 32 36 36 42   // -4FCE-92AD-0266B
                                                                                                    35 44 37 43 37 38 46 00 00 )                      // 5D7C78F..
    .method public hidebysig newslot virtual abstract 
            instance void  SetOneShot(int32 OneShot) runtime managed internalcall
    {
    } // end of method ISampleGrabber::SetOneShot

    .method public hidebysig newslot virtual abstract 
            instance void  SetMediaType(valuetype MSR.LST.MDShow._AMMediaType& pType) runtime managed internalcall
    {
    } // end of method ISampleGrabber::SetMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  GetConnectedMediaType(valuetype MSR.LST.MDShow._AMMediaType& pType) runtime managed internalcall
    {
    } // end of method ISampleGrabber::GetConnectedMediaType

    .method public hidebysig newslot virtual abstract 
            instance void  SetBufferSamples(int32 BufferThem) runtime managed internalcall
    {
    } // end of method ISampleGrabber::SetBufferSamples

    .method public hidebysig newslot virtual abstract 
            instance void  GetCurrentBuffer([in][out] int32& pBufferSize,
                                            [out] int32& pBuffer) runtime managed internalcall
    {
    } // end of method ISampleGrabber::GetCurrentBuffer

    .method public hidebysig newslot virtual abstract 
            instance class MSR.LST.MDShow.IMediaSample 
            marshal( interface) 
            GetCurrentSample() runtime managed internalcall
    {
    } // end of method ISampleGrabber::GetCurrentSample

    .method public hidebysig newslot virtual abstract 
            instance void  SetCallback(class MSR.LST.MDShow.ISampleGrabberCB  marshal( interface) pCallback,
                                       int32 WhichMethodToCallback) runtime managed internalcall
    {
    } // end of method ISampleGrabber::SetCallback

  } // end of class ISampleGrabber

  .class interface public abstract auto ansi import ISampleGrabberCB
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComConversionLossAttribute::.ctor() = ( 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 35 37 39 31 35 34 41 2D 32 42 35 33   // ..$0579154A-2B53
                                                                                                    2D 34 39 39 34 2D 42 30 44 30 2D 45 37 37 33 31   // -4994-B0D0-E7731
                                                                                                    34 38 45 46 46 38 35 00 00 )                      // 48EFF85..
    .method public hidebysig newslot virtual abstract 
            instance void  SampleCB(float64 SampleTime,
                                    native int pSample) runtime managed internalcall
    {
    } // end of method ISampleGrabberCB::SampleCB

    .method public hidebysig newslot virtual abstract 
            instance void  BufferCB(float64 SampleTime,
                                    native int pBuffer,
                                    int32 BufferLen) runtime managed internalcall
    {
    } // end of method ISampleGrabberCB::BufferCB

  } // end of class ISampleGrabberCB


// =============================================================

} // end of namespace MSR.LST.MDShow

//*********** DISASSEMBLY COMPLETE ***********************
// WARNING: Created Win32 resource file SampleGrabberInterop.res
