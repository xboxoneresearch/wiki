# Debug native via UWA / SRA kit

## Spawn msvsmon

1. Starting MSVSMon

We have 4 versions of debugmon available:

General -> `J:\tools\debugmon\msvsmon.exe`

VS v14 (VS 2015) -> `J:\tools\debugmon\debugmondev14payload\msvsmon.exe`

VS v15 (VS 2017) -> `J:\tools\debugmon\debugmondev15payload\msvsmon.exe`

VS v16 (VS 2019) -> `J:\tools\debugmon\debugmondev16payload\msvsmon.exe`

**NOTE**: I used VS2019 on the Development-PC and had minimal success with the "general" msvsmon, `debugmondev16payload` worked nicely tho.

Choose the version that you like best, navigate to the dir and, in an admin shell, execute:

```
msvsmon.exe /noauth /anyuser
```

If the following message pops up:

> Msvsmon Message: Msvsmon has been launched with the '/noauth' option, which disables authentication. This is a security risk. This option should only be used on networks that have no hostile traffic, and should never be used to debug across the internet.
>
> Are you sure you want to continue?    (Use /nosecuritywarn to suppress this warning)


Do as it says and append `/nosecuritywarn` to the msvsmon.exe call.

1. Checking port of MSVSMon

Some msvsmon executable are talkative and tell you the port they bind to. Setting a port manually seems hit-miss whether it works.

To find the port used, use `netstat.exe` (copied from your Win10 x64 build).
Ensure to also copy the en-US folder next to the .exe with the appropriate .mui files.

Example

```
/netstat.exe
/en-US/netstat.exe.mui
```

Call `netstat.exe -bao` - The port of MSVSMon is usually in the range of **4020-4026**.

1. In Visual Studio, in the top toolbar, go to `Debug` -> `Attach to Process`
2. Connection Type: `Remote (no authentication)`
   Connection target: `<Xbox-IP>:<PORT>`

   Hit "ENTER"

Choose process to debug and profit!


## dbgsrv in reverse mode / Userspace remote debugging

**NOTE**: Use if you can't open the firewall for incoming connections (f.e. on RETAIL)

dbgsrv/cdb are part of Windows 10 SDK

Reference: https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/repeater-examples

On Xbox

```
# With dbgsrv
.\dbgsrv  -t tcp:port=1333,clicon=<PC IP>
# with cdb
.\cdb.exe /server tcp:clicon=<PC IP>,port=1333 tlist.exe
```

On PC

```
# Old windbg, connecting to dbgsrv
.\windbg -premote tcp:clicon=<PC IP>,port=1333 tlist.exe
# WinDbgX (WinDbg Preview), connecting to cdb
WinDbgX.exe /remote tcp:clicon=<PC IP>,port=1333
```
