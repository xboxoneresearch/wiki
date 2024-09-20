# XEO3 - Xbox360 and Classic Xbox emulator
XEO3 is the Xbox 360 and Original Xbox emulator executable for the Xbox One/Series's ERA partition.

## Executable Arguments
| Argument         | Description                                       | Example Usage          |
|------------------|---------------------------------------------------|------------------------|
| `-compiler`      | Select the JIT compiler (default option)          | Unknown                |
| `-interpreter`   | Select the interpreter                            | Unknown                |
| `-dvd pathname`  | Specify host path for simulated DVD               | -dvd D:\Game           |
| `-flash pathname`| Specify host path for simulated Flash Filesystem  | -flash D:\Flash        |
| `-disk pathname` | Specify host path for simulated Hard disk         | -disk D:\HardDisk      |
| `-mu0 pathname`  | Specify host path for simulated memory unit 0     | -mu0 D:\MUOne          |
| `-mu1 pathname`  | Specify host path for simulated memory unit 1     | -mu1 D:\MUTwo          |
| `-log pathname`  | Specify host path for write logging files         | -log D:\xeo3logs       |
| `-testpass`      | Enable data gathering for test pass               | Unknown                |
| `-msaa [on or off]` | Enable/disable multisample anti-aliasing (default is enabled) | -msaa on|
| `-fs`            | Run in full screen mode                           | -fs                    |
| `-net[:macaddress]` | Enable networking                              | -net:12-34-56-78-9a-bc |
| `-xma`           | Enable XMA emulation via CMODEL or Hardware       | Unknown                |
| `-kernel filename` | Specify host path to the guest kernel binary    | -kernel D:\xboxkrnlce.exe|
| `-hvdata filename` | Specify host path to the guest hypervisor data blob | -hvdata D:\xboxkrnlce.hvdata |

## LaunchArguments.txt
Additional arguments can be passed to XEO3 via a text file placed next to emu.exe, named LaunchArguments.txt. One X and Series consoles can take advantage of additional arguments (Mainly graphical improvements like Auto HDR) via a similar file named ScorpioLaunchArguments.txt, reflecting the One X's codename. These arguments appear to have to include the media ID and title ID of the 360 game. Halo Reach (Xbox 360 Backwards Compat) for example, has a launcharguments.txt containing the following arguments:
```
?disableAudioOnConstrained&insecureUtilityDrive&mediaId=96abdab3-1852-4046-8020-af38b985010f&titleId=4D53085B&shaderCompilerLegacyTexValuePatch&forceDurangoGammaRamp
```

## Notes
* xboxkrnlce.exe and .hvdata can be found in the Flash folder of a Backwards Compat game's XVC. Version 17003 has leaked publicly.
* The emulated Xbox 360 does not display a serial number.
* If a BC Game is deployed in Dev Mode, the XDK's Xbox Console Manager (The GDK dropped this functionality) can be used to capture kernel debug logging from the emulated kernel, when launching the game from the Console Manager.

## Discovery
XEO3, known as emu.exe, was first located by TitleOS, who dumped it from a plaintext XVDP of eratools captured from a Xbox Live update before releasing it via Twitter.

## XEO3 Shaders
Little is currently known about the XEO3 shader format, for example how the original shaders from Xbox 360 games are converted into the DirectX 11 Durango format. While it is known that that Backwards Compat games' XVCs contain DirectX 11 Durango format shaders in the DLL file format, creation or rendering of these shaders is not currently possible. 

These shaders appear critical to running any graphical xex, as evidenced by attempting to run [XeXMenu on the emulator](https://web.archive.org/web/20210414133418/https://twitter.com/XB1_HexDecimal/status/1382326180490010630). 

Example: `xeo3_3bfc9c1a_932fc286_956f016e_98ef8821_6b9d46d0.dll` (From CastleCrashers)

### BackgroundShaderCompiler
Dumps of Xbox 360 Backwards Compat games (Obtained via [Durango Dumplings](https://xboxoneresearch.github.io/games/2024/05/15/xbox-dump-games.html)) contain a runtime shader (re)compiler executable called BackgroundShaderCompiler.exe. This would appear to be the reason not all BC games shipped with precompiled xeo3 DLL shaders.
