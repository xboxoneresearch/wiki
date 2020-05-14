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
| $Diagnosis\\debug.bin       | File   | Set debug settings from *debug.bin*                                                                                                                       |
| $SystemUpdate\\consoles.txt | File   | Put an empty file consoles.txt on the flashdrive. Console will write its current systemupdate build version to the file on boot. |
| $ConsoleRegion0             | File   | Only available on Chinese Xbox One. Put an empty file $ConsoleRegion0 on the flashdrive to Disable region lock.|
| $ConsoleRegion1             | File   | Only available on Chinese Xbox One. Put an empty file $ConsoleRegion1 on the flashdrive to Enable region lock.|
| MSXB_Kiosk                 | File   | Put a special Kiosk XVD on the flashdrive, after booting the console will be locked in Kiosk mode. To exit, power off console and remove the flash drive. |

Note: 
+ The SystemOS-full.dmpx file is encrypted and requires a retail key
to decrypt.
+ Using *$ConsoleRegion0* & *$ConsoleRegion1* will affect the ability to read Xbox China game discs, but won't affect already installed digital games.
+ Non-Chinese Xbox One units cannot be region locked and read Xbox China discs / access China region Xbox Live by *$ConsoleRegion1*.
+ $ConsoleRegion0 and $ConsoleRegion has been deprecated since OS 10.0.10941.2493 (rs_xbox_release_2005.200512-1756)(insider preview). Devices' region lock status will be remained as the same before it's update to this version. Quitting Insider Preview and factory and re-upgrade the Xbox system while the current latest release ring OS version is equal to or under 10.0.19041.1927 (rs_xbox_release_2004.200415-0000) will re-enable the $ConsoleRegion0 and $ConsoleRegion1.
