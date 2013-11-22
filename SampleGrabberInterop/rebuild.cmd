midl SampleGrabberInterop.idl /I "C:\dx9\Include\DShowIDL" /I "C:\Program Files\Microsoft Visual Studio .NET 2003\Vc7\PlatformSDK\Include"
pause
rem oleview SampleGrabberInterop.tlb
rem pause
tlbimp SampleGrabberInterop.tlb /namespace:UW.CSE.MDShow
