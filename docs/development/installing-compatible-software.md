<!-- TITLE: Installing Compatible Software -->
<!-- SUBTITLE: A quick summary of Installing Compatible Software -->

# Installing compatible software
## Python

  - Download
    <https://www.python.org/ftp/python/3.7.3/python-3.7.3-embed-amd64.zip>
  - Unzip
  - Uncomment "import site" in file python37._pth
  - Download get-pip.py (https://bootstrap.pypa.io/get-pip.py) and place
    it inside extracted python folder
  - Copy extracted folder to console
  - Execute:

```
set PYTHONPATH="D:\DevelopmentFiles\Python"
set PATH="%PATH%;%PYTHONPATH%"
```

  - Execute

`python.exe get-pip.py`

  - Profit

## PowerShell

  - Download:
    <https://github.com/PowerShell/PowerShell/releases/download/v6.2.0/PowerShell-6.2.0-win-x64.zip>
  - Unzip
  - Copy over to console
  - Execute pwsh.exe
  - Profit

## .NET Core

  - Download the latest 64 bit dotnet core **runtime** from
    <https://dotnet.microsoft.com/download/dotnet-core>.
  - Unzip and copy the binaries to a flash drive or
    D:\\DevelopmentFiles\\Dotnet.
  - Optionally add the dotnet directory to your system PATH via `setx
    path "%path%;D:\\DotnetPath"` using SSH.
  - Execute your dotnet core software via "dotnet program.exe" using SSH
    in the dotnet diectory (or anywhere if you updated your PATH).
  - Profit
### Troubleshooting
  Error | Solution
  :---- | :----
  The system cannot find the file specified | If running your dotnetcore software on an external drive, move it to an internal one such as D: or T:

## SysInternals

Sysinternals provide a suite of nice tools to look for possible misconfigured states or inner workings of the system.

For example:

* Listing active HANDLEs
* Listing loaded ddls
* Listing active Volumes (incl. hidden / unmounted)
* Checking access control of files/registry/pipes etc.
* ...

Here is just a quick reminder how to deploy it.

### Download

Download: https://learn.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite

Fetch:

* Sysinternals Suite
* Sysinternals Suite for Nano Server

Extract each to their own folder on the console.

### Accept the EULA via reg key

Normally each tool requires the additional argument `-accepteula` on the commandline - on each call!

Instead, execute this in powershell just once:
`New-ItemProperty -Path 'HKCU:\Software\Sysinternals' -Name 'EulaAccepted' -Value '1' -PropertyType DWORD -Force`

Profit!

## .NET 5

  - Download the latest preview Windows 64 bit dotnet **runtime** from
    <https://dotnet.microsoft.com/download/dotnet/5.0>.
  - Unzip and copy the binaries to a flash drive or a location of your choice such as
    D:\\DevelopmentFiles\\Dotnet.
  - Optionally add the dotnet directory to your system PATH via `setx
    path "%path%;D:\\DotnetPath"` using SSH.
  - Execute your dotnet software via "dotnet program.exe" using SSH
    in the dotnet diectory (or anywhere if you updated your PATH).
  - Profit
### Troubleshooting
  Error | Solution
  :---- | :----
  The system cannot find the file specified | If running your dotnetcore software on an external drive, move it to an internal one such as D: or T:
  
  ## .NET 6

  - Download the latest preview Windows 64 bit dotnet **runtime** from
    https://dotnet.microsoft.com/download/dotnet/6.0.
  - Unzip and copy the binaries to a flash drive or a location of your choice such as
    D:\\DevelopmentFiles\\Dotnet.
  - Optionally add the dotnet directory to your system PATH via `setx
    path "%path%;D:\\DotnetPath"` using SSH.
  - Execute your dotnet software via "dotnet program.exe" using SSH
    in the dotnet diectory (or anywhere if you updated your PATH).
  - Profit
### Troubleshooting
  Error | Solution
  :---- | :----
  The system cannot find the file specified | If running your dotnetcore software on an external drive, move it to an internal one such as D: or T:


## Java Development Kit

  - Download the latest JDK Windows 64 bit **Compressed Archive** from
    <https://www.oracle.com/java/technologies/downloads/>.
  - Unzip and copy the binaries to a flash drive or a location of your choice such as
    D:\\DevelopmentFiles\\jdk.
  - Optionally add the java directory to your system PATH via
    ```cmd
    set JAVA_HOME=D:\DevelopmentFiles\Applications\jdk-17.0.3.1
    set PATH=%PATH%;%JAVA_HOME%\bin
    ```
    using SSH.
  - Execute your java software via "java -jar program.jar" using SSH
    in the java diectory (or anywhere if you updated your PATH).
  - Profit
