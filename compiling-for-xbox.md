<!-- TITLE: Compiling For Xbox -->
<!-- SUBTITLE: A quick summary of Compiling For Xbox -->

# Compiling for Xbox
Since the Xbox One's System operating system is based on OneCore we can
use the libraries provided in Visual Studio and the Windows SDK. The
primary library that will solve our needs is named: 'OneCore.lib' or
'OneCoreUAP.lib'. This is known as an umbrella library which links the
common Win32 API's that are common among all Windows 10 devices. You can
learn more here:
<https://docs.microsoft.com/en-us/windows/win32/apiindex/windows-umbrella-libraries>

## Requirements

  - Recommended: CMake
  - Visual Studio 2019/2017 w/ the following (depending on version):
      - MSVC v141 - VS 2017 C++ x64/x86 build tools (v14.16) & MSVC v141
        - VS 2017 C++ x64/x86 Spectre-mitigated libs
      - MSVC v142 - VS 2019 C++ x64/x86 build tools (v14.22) & MSVC v142
        - VS 2019 C++ x64/x86 Spectre-mitigated libs
      - Windows Universal CRT SDK
  - Windows 10 SDK (Latest)