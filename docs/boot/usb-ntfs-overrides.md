<!-- TITLE: Special Ntfs Usb Files -->
<!-- SUBTITLE: A quick summary of USB Ntfs Ovverides -->

# USB NTFS Overrides
## What is this about ?

The following folders / files can be created on a USB NTFS formated
storage device to trigger operations during cold boot of the console.

## List of files / folders

| Path                        | Type   | Information                                                                                                                                               |
| --------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| $BootCounters               | Folder | Outputs boot counter logs to the directory.																											   |
| $ConsoleGen8                | File   | Only available on Chinese Xbox One. Put an empty file $ConsoleGen8 on the flashdrive to disable region lock.											   |
| $ConsoleGen8Lock            | File   | Only available on Chinese Xbox One. Put an empty file $ConsoleGen8Lock on the flashdrive to enable region lock.								   |
| $ConsoleGen9                | File   | Only available on Chinese Xbox Series X/S. Put an empty file $ConsoleGen9 on the flashdrive to disable region lock.									   |
| $ConsoleGen9Lock            | File   | Only available on Chinese Xbox Series X/S. Put an empty file $ConsoleGen9Lock on the flashdrive to enable region lock.						   |
| $ConsoleRegion0             | File   | Only available on Chinese Xbox One. <s>Put an empty file $ConsoleRegion0 on the flashdrive to Disable region lock.</s> __Supersceded by "ConsoleGen#", depreciated in later firmware.__|
| $ConsoleRegion1             | File   | Only available on Chinese Xbox One. <s>Put an empty file $ConsoleRegion1 on the flashdrive to Enable region lock.</s> __Supersceded by "ConsoleGen#Lock", depreciated in later firmware.__  |
| $ConsoleRefresh             | Folder | Deletes settings.xvd on the host storage drive during boot. Executes the same operation as a console refresh while keeping games and apps.                |
| $CopyGpuHix                 | TBD.   | TBD.																																					   |
| $CopyPfmFile                | Folder | Generates performance monitoring file path.																											   |
| $DisableGameCache           | TBD.   | TBD.																																					   |
| $Diagnosis                  | Folder | Diagnostic logging and dump directory. Reads from debug override binaries.                                                                                |
| $Diagnosis\\debug.bin       | File   | Hotplug Retail Debug (GodBox) capability certificate. Used for temporarily boosting debugging functionality on a retail console / OS.                     |
| $DumpAll                    | Folder | $DumpAll will be deleted upon boot, and the console will output all OS memory dump files under $Diagnosis. The console will chirp once the dump is finished.|
| $DumpHostOS                 | Folder | $DumpHostOS will be deleted upon boot, and the console will output a HostOS memory dump file under $Diagnosis. The console will chirp once the dump is finished.|
| $DumpHmb					  | Folder | $DumpHmb will dump the host memory buffer from a Xbox Series S/X NVMe.																					   |
| $DumpGameOS                 | Folder | $DumpGameOS will be deleted upon boot, and the console will output a GameOS memory dump file under $Diagnosis. The console will chirp once the dump is finished.|
| $DumpSystemOS               | Folder | $DumpSystemOS will be deleted upon boot, and the console will output a SystemOS memory dump file under $Diagnosis. The console will chirp when once dump is finished.|
| $DumpVolume				  | Folder | Informs the console to treat the external storage device as the primary dump volume. 																	   |
| $EnableGameCache			  | TBD.   | TBD.																																					   |
| $HostEtwTrace				  | Folder | Informs the console to treat the external storage device as a host trace request upon connection.														   |
| $KPixCapture				  | TBD.   | TBD.																																					   |
| $SystemUpdate\\consoles.txt | File   | When present on the external USB storage device during boot, the console will output its current system update build version to the file.                  |
| $SystemUpdate\\hwinit.cfg   | File   | Sets motherboard traces, voltages, header behavior, and IC clock speed overrides. Read, flashed, and executed during the console's cold boot routine.     |
| $SystemUpdate\\devkit.ini	  | File   | Sets default primary debug output interface, connecting host network address, and protocol. Read, flashed, and executed during the console's cold boot routine.|
| MSXB_Kiosk                  | File   | XVDs with this title (No extension) and Kiosk type will temporarily boot the console in Kiosk mode when present on the root of the USB external storage.  |
| $NoSurface                  | Folder | Mounts external storage to HostOS as opposed to SystemOS. External Host volumes are assigned a drive letter that can only be accessed from HostOS and Xcrdutil under SystemOS.|
| $Throttle                   | Folder | Initiate logging of NVMe speed throttling.																												   |
| $TitleHmb					  | File   | Overrides host memory buffer on a Xbox Series X/S NVMe.																								   |
| $XpfmDisable				  | File   | Disables console performance monitoring when present.																									   | 																																					   |
| $XpfmUseMe$				  | File   | Informs the console to treat the external storage device as an output for console performance counters.												   |
| $XvddOomAdapter			  | TBD.   | TBD.																																					   |
| $XvddOomDisk				  | File   | Enables all crash paths when empty.																													   |
| HmbConfigInfo.txt			  | File   | TBD.																																					   |
| LastConsole				  | File   | When present on the external USB storage, the console will write a true or false boolean inside the file indicating if disk was last used with this console.|
| ThrottleInfo.txt			  | File   | TBD.
| TitleHmbInfo.txt			  | File   | TBD.

Note:

* Some overrides may require a specific devkit capability certificate, $SystemUpdate, and/or $NoSurface be present to function / execute.

* $SystemUpdate\\consoles.txt can be created and added as an empty text file. The resulting build output from the console is unencryped and can be read in plaintext.

* hwinit.cfg is the console's answer to BIOS options. Overclocking is controlled by a byte at 0x8 and can have a value between 0x01 - 0x58. File Magic: 0x1-0x58 - 4E,49,57,48,02.Unknown FF range.

* $Diagnosis, $NoSurface, $DumpSystemOS, $DumpHostOS references were found in xvdd.sys

* The SystemOS-full.dmpx file is encrypted and requires a retail key to decrypt.

* Using *$ConsoleRegion0* , *$ConsoleRegion1*, *$ConsoleGen8* or *$ConsoleGen9* will affect the ability to read Xbox China game discs, but won't affect already installed digital games.

* Non-Chinese Xbox One units cannot be region locked and read Xbox China discs / access China region Xbox Live by *$ConsoleRegion1*.

* *$ConsoleRegion0* and *$ConsoleRegion1* has been deprecated since OS 10.0.19041.2493 (rs_xbox_release_2005.200512-1756). Devices' region lock status will be remained as the same before it's update to this version. Those two special files will still work on devices with OS version equal to or under 10.0.19041.1927 (rs_xbox_release_2004.200415-0000). Users who still need to disable region lock should consider using *$ConsoleGen8* and *$ConsoleGen9* instead.

* Usage of *$ConsoleGen8* and *$ConsoleGen9* require OS version equal to or newer than XB_FLT_2106VB\19041.8033.210514-0000 (insider preview) and active Internet connection to Xbox Live.

* *$ConsoleGen8* will not work on Xbox Series X/S and *$ConsoleGen9* will not work on Xbox One (S/X).

Credits:
TitleOS for discovering $SystemUpdate\\hwinit.cfg
