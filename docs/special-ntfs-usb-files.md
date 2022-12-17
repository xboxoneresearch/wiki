<!-- TITLE: Special Ntfs Usb Files -->
<!-- SUBTITLE: A quick summary of Special Ntfs Usb Files -->

# Special NTFS USB files
## What is this about ?

Following special folders / files that can be created on a NTFS USB
flash drive to trigger commands on console boot.

## List of files / folders

| Path                        | Type   | Information                                                                                                                                               |
| --------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| $Diagnosis                  | Folder | The command *$DumpSystemOS* will write *SystemOS-full.dmpx* here.                                                                                         |
| $NoSurface                  | Folder | Mount drive in HostOS instead of SystemOS.                                                                                                                |
| $DumpSystemOS               | Folder | SystemOS Memory Dump. The console will ding when the dump is finished. (Host will delete $DumpSystemOS and dump SystemOS's memory into the $Diagnosis.)   |
| $DumpHostOS                 | Folder | HostOS Memory Dump                                                                                                                                        |
| $Diagnosis\\debug.bin       | File   | Godbox certificate used for temporary godbox boosting of a Retail.                                                                                                                   |
| $SystemUpdate\\consoles.txt | File   | Put an empty file consoles.txt on the flashdrive. Console will write its current systemupdate build version to the file on boot. |
| $SystemUpdate\\hwinit.cfg   | File   | Enables an overclocked mode controlled by a byte at 0x8 and can have a value between 0x01 - 0x58. File Magic: 0x1-0x58 - 4E,49,57,48,02.Unknown FF range|
| $ConsoleRegion0             | File   | Only available on Chinese Xbox One. <s>Put an empty file $ConsoleRegion0 on the flashdrive to Disable region lock.</s> __This has now been blocked by an update, see below.__|
| $ConsoleRegion1             | File   | Only available on Chinese Xbox One. <s>Put an empty file $ConsoleRegion1 on the flashdrive to Enable region lock.</s> __This has now been blocked by an update, see below.__|
| $ConsoleGen8             | File   | Only available on Chinese Xbox One. Put an empty file $ConsoleGen8 on the flashdrive to disable region lock.|
| $ConsoleGen9             | File   | Only available on Chinese Xbox Series X/S. Put an empty file $ConsoleGen9 on the flashdrive to disable region lock.|
| MSXB_Kiosk                 | File   | Put a special Kiosk XVD on the flashdrive, after booting the console will be locked in Kiosk mode. To exit, power off console and remove the flash drive. |

Note:

* $Diagnosis, $NoSurface, $DumpSystemOS, $DumpHostOS references were found in xvdd.sys

* The SystemOS-full.dmpx file is encrypted and requires a retail key to decrypt.

* Using *$ConsoleRegion0* , *$ConsoleRegion1*, *$ConsoleGen8* or *$ConsoleGen9* will affect the ability to read Xbox China game discs, but won't affect already installed digital games.

* Non-Chinese Xbox One units cannot be region locked and read Xbox China discs / access China region Xbox Live by *$ConsoleRegion1*.

* *$ConsoleRegion0* and *$ConsoleRegion1* has been deprecated since OS 10.0.19041.2493 (rs_xbox_release_2005.200512-1756). Devices' region lock status will be remained as the same before it's update to this version. Those two special files will still work on devices with OS version equal to or under 10.0.19041.1927 (rs_xbox_release_2004.200415-0000). Users who still need to disable region lock should consider using *$ConsoleGen8* and *$ConsoleGen9* instead.

* Usage of *$ConsoleGen8* and *$ConsoleGen9* require OS version equal to or newer than XB_FLT_2106VB\19041.8033.210514-0000 (insider preview) and active Internet connection to Xbox Live.

* *$ConsoleGen8* will not work on Xbox Series X/S and *$ConsoleGen9* will not work on Xbox One (S/X).

Credits:
TitleOS for discovering $SystemUpdate\\hwinit.cfg
