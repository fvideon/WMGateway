rem NOTE: do not rebuild the dll this way because it has been modified through various edits to the IL.


rem midl ManagedWM.idl /I "C:\Program Files\Microsoft Visual Studio .NET\Vc7\PlatformSDK\Include" /I D:\WMSDK\WMFSDK9\include
rem pause
rem oleview ManagedWM.tlb
rem pause
rem tlbimp ManagedWM.tlb /namespace:UW.CSE.ManagedWM
