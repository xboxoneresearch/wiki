<!-- TITLE: Compiling For Xbox -->
<!-- SUBTITLE: A quick summary of Compiling For Xbox -->

# Compiling for Xbox
Since the Xbox One's System operating system is based on OneCore we can use the libraries provided in Visual Studio and the Windows SDK. The primary library that will solve our needs is named: 'OneCore.lib' or 'OneCoreUAP.lib'. This is known as an umbrella library which links the common Win32 API's that are common among all Windows 10 devices. You can learn more here: <https://docs.microsoft.com/en-us/windows/win32/apiindex/windows-umbrella-libraries>

## Requirements

- **Recommended:** [CMake](https://cmake.org)
- **Visual Studio 2022 Community Edition** (or higher):

### Workloads
- **WinUI application development**
- **Desktop development with C++**

### Individual Components
- **MSVC v143 - VS 2022 C++ x64/x86 build tools (Latest)**
- **VS 2022 C++ x64/x86 Spectre-mitigated libs (Latest)**
- **MSVC v142 - VS 2019 C++ x64/x86 build tools (v14.29)** *(optional, for compatibility with older apps)*
- **VS 2019 C++ x64/x86 Spectre-mitigated libs (v14.29)** *(optional, for compatibility with older apps)*
- **Windows 11 SDK (Latest)**
- **Windows Universal CRT SDK**
- **C++ CMake tools for Windows**
- **C++ ATL for latest v143 build tools (x86 & x64)**
- **C++ Modules for v143 build tools (x64/x86 - experimental)** *(optional)*

---

> *The "WinUI application development" workload replaces the older "Universal Windows Platform development" workload and is the correct one for Xbox One/Series builds.*






