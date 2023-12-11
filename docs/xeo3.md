# XEO3
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

### Notes
* xboxkrnlce.exe and .hvdata can be found in the Flash folder of a Backwards Compat game's XVC. Version 17003 has leaked publicly.
* The emulated Xbox 360 does not display a serial number.
* If a BC Game is deployed in Dev Mode, the XDK's Xbox Console Manager (The GDK dropped this functionality) can be used to capture kernel debug logging from the emulated kernel, when launching the game from the Console Manager.


### Discovery
XEO3, known as emu.exe, was first located by TitleOS who dumped it from a plaintext XVDP of eratools captured from a Xbox Live update before releasing it via Twitter.