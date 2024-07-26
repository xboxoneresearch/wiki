# VBI - Virtual Boot Image
A custom boot image format used to load the critical boot components for the Xbox OS. It contains its own mapped loader block, kernel and/or hypervisor (if host), and more. These files can be located within the user-data section for bootable XVD's, or in the boot.bin for the Host OS VBI.

## File format
### VBI Header
| Offset | Length | Type            | Information                    |
| ------ | ------ | --------------- | ------------------------------ |
| 0x00   |   0x04 |   uint32        | Magic (1IBV)                   |
| 0x04   |   0x04 |   uint32        | MinimumVersion                 |
| 0x08   |   0x04 |   uint32        | SizeOfHeaders                  |
| 0x0C   |   0x04 |   uint32        | ImageSize                      |
| 0x10   |   0x08 |   uint64        | BasePhysicalAddress            |
| 0x18   |   0x08 |   uint64        | TrampolineVirtualAddress       |
| 0x20   |   0x04 |   uint32        | DataOffset                     |
| 0x24   |   0x04 |   uint32        | Flags                          |
| 0x28   |   0x04 |   uint32        | DirectoryEntryCount            |
| 0x2C   |   0xB8 |   VbiDirectory  | Directories                    |

### VBI Directory
| Offset | Length | Type            | Information                    |
| ------ | ------ | --------------- | ------------------------------ |
| 0x00   |   0x04 |   uint32        | Offset                         |
| 0x04   |   0x04 |   uint32        | Size                           |

## Module List
### System (10.0.22621.3444)
| Index   | Name                        |
| ------- | --------------------------  |
|    [0]  |          ntoskrnl.exe       |
|    [1]  |          hal.dll            |
|    [2]  |          kdcom.dll          |
|    [3]  |          xbsyspsext.sys     |
|    [4]  |          ksecext.sys        |   
|    [5]  |          msrpc.sys          |
|    [6]  |          uem.dll            |
|    [7]  |          lstringkm.dll      |
|    [8]  |          xci.dll            |
|    [9]  |          ci.dll             |
|    [10] |          cng.sys            |
|    [11] |          crashdmp.sys       |
|    [12] |          xvsc.sys           |
|    [13] |          storport.sys       |
|    [14] |          xpalk.dll          |
|    [15] |          xvio.sys           |
|    [16] |          volmgr.sys         |
|    [17] |          wmilib.sys         |
|    [18] |          mountmgr.sys       |
|    [19] |          fltmgr.sys         |
|    [20] |          ksecdd.sys         |
|    [21] |          ksecpkg.sys        |
|    [22] |          condrv.sys         |
|    [23] |          pcw.sys            |
|    [24] |          ntfs.sys           |
|    [25] |          partmgr.sys        |
|    [26] |          volume.sys         |
|    [27] |          disk.sys           |
|    [28] |          classpnp.sys       |
|    [29] |          netio.sys          |
|    [30] |          WppRecorder.sys    |
|    [31] |          ndis.sys           |
|    [32] |          hwpolicy.sys       |
|    [33] |          pdc.sys            |
|    [34] |          cea.sys            |
|    [35] |          xvuc.sys           |
|    [36] |          fileinfo.sys       |
|    [37] |          fvevol.sys         |
|    [38] |          rdyboost.sys       |
|    [39] |          xsraflt.sys        |
|    [40] |          fs_rec.sys         |
|    [41] |          tcpip.sys          |
|    [42] |          fwpkclnt.sys       |
|    [43] |          msfs.sys           |
|    [44] |          npfs.sys           |

### GameCore (10.0.19041.4350)
| Index   | Name                        |
| ------- | --------------------------  |
|    [0]  |          ntoskrnl.exe       |
|    [1]  |          hal.dll            |
|    [2]  |          kdcom.dll          |
|    [3]  |          xbpsext.sys        |
|    [4]  |          ksecext.sys        |   
|    [5]  |          msrpc.sys          |
|    [6]  |          uem.dll            |
|    [7]  |          xci.dll            |
|    [8]  |          ci.dll             |
|    [9]  |          cng.sys            |
|    [10] |          xdgext.sys         |
|    [11] |          crashdmp.sys       |
|    [12] |          xvsc.sys           |
|    [13] |          storport.sys       |
|    [14] |          xvio.sys           |
|    [15] |          volmgr.sys         |
|    [16] |          wmilib.sys         |
|    [17] |          mountmgr.sys       |
|    [18] |          fltmgr.sys         |
|    [19] |          ksecdd.sys         |
|    [20] |          ksecpkg.sys        |
|    [21] |          condrv.sys         |
|    [22] |          pcw.sys            |
|    [23] |          ntfs.sys           |
|    [24] |          partmgr.sys        |
|    [25] |          volume.sys         |
|    [26] |          disk.sys           |
|    [27] |          classpnp.sys       |
|    [28] |          netio.sys          |
|    [29] |          WppRecorder.sys    |
|    [30] |          ndis.sys           |
|    [31] |          fileinfo.sys       |

## Retrieving from user-data section
### Requirements
- Developer Mode
- Administrator-level Privileges
- SSH

### Steps
1. Connect to the console using a privileged user account
2. Run: 
    - `` xcrdutil.exe -read_ud F:\system.xvd 0 200 <path on console for output> ``
    - Example:
        - `` xcrdutil.exe -read_ud F:\system.xvd 0 200 D:\\DevelopmentFiles\\system.vbi ``
3. Load the output file into your favourite hex editor
4. Go to offset ``0x8`` (SizeOfHeaders) and copy the value as a 32-bit integer
5. Go to offset ``0xC`` (ImageSize), copy the value as a 32-bit integer and add it to SizeOfHeaders to get the actual size
6. Re-run:
    - `` xcrdutil.exe -read_ud F:\system.xvd 0 <size> <path on console for output> ``
    Example:
        - `` xcrdutil -read_ud F:\system.xvd 0 32071680 D:\\DevelopmentFiles\\system.vbi ``
7. Viola!

#### This can also be applied to gameos.xvd or gamecore.xvd when running within their partitions.

## References
- XVMM (Host)
    - ``C:\\Windows\\System32\\Drivers\\xvmm.sys``
