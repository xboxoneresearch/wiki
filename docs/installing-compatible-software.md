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
  - Optionally add the dotnet directory to your system PATH via *setx
    path "%path%;D:\\DotnetPath"* using SSH.
  - Execute your dotnet core software via "dotnet program.exe" using SSH
    in the dotnet diectory (or anywhere if you updated your PATH).
  - Profit

  ## .NET 5

  - Download the latest preview 64 bit dotnet **runtime** from
    <https://dotnet.microsoft.com/download/dotnet/5.0>.
  - Unzip and copy the binaries to a flash drive or a location of your choice such as
    D:\\DevelopmentFiles\\Dotnet.
  - Optionally add the dotnet directory to your system PATH via *setx
    path "%path%;D:\\DotnetPath"* using SSH.
  - Execute your dotnet core software via "dotnet program.exe" using SSH
    in the dotnet diectory (or anywhere if you updated your PATH).
  - Profit