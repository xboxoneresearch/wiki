# SystemOS Read/Write overlay for System.xvd

## Metadata
|                             |                                                     |
|-----------------------------|-----------------------------------------------------|
|Release date                 |                                          31.07.2019 |
|Author                       |                                   Xbox One Research |
|Classification               |                             Privileged write access |
|Patched                      |                                                  no |
|Patch date                   |                                                 N/A |
|First patched system version |                                                 N/A |
|Source                       |                                             Discord |
|Download                     |                      [Download](files/SYSTEMRW.zip) |

## Info
The "System Boot Partition" aka. *C:\* is mounted read-only. This hack allows temporary mounting of a self-created XVD as an overlay
under mountpoint *C:\*. It enables write access to this partition.

## Prerequisites
- Dev Mode
- Elevated privileges

## Instructions
Copy the extracted files to the console and execute them via cmdline.