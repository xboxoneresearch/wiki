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
| $SystemUpdate\\consoles.txt | File   | Put an empty file consoles.txt on the flashdrive. Console will write its current systemupdate build version to the file on boot.                          |
| MSXB_Kiosk                 | File   | Put a special Kiosk XVD on the flashdrive, after booting the console will be locked in Kiosk mode. To exit, power off console and remove the flash drive. |

Note: The SystemOS-full.dmpx file is encrypted and requires a retail key
to decrypt.