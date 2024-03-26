<!-- TITLE: Xbox Boot File System -->
<!-- SUBTITLE: Xbox boot file system (XBFS) on eMMC -->

# Xbox Boot file system
Xbox Boot File System, or XBFS for short, refers to the console flash
filesystem.

On Xbox Series-consoles there is also [SBFS](southbridge-file-system.md).

## Filesystem sizes

Durango (pre-series-S/X):

- RAW: 0x1_3C00_0000 (5056 MB)
- Logical: 0x1_3B00_0000 (5040 MB)

Series S/X:

- Logical: 0x4000_0000 (1024 MB / 1 GB)


## XBFS Header offsets

The Flash can contain 3 different revisions of filetables,
differentiated via its sequence number. Highest sequence number is the
active one.

Checking if a filetable exists is done by checking for
XBFS_HEADER-\>Magic.

Absolute offsets (pre-series-S/X consoles):

- 0x1_0000 (Bootslot A)
- 0x81_0000 (Bootslot B)
- 0x82_0000 (Bootslot C)

Absolute offsets (Series S/X)

- 0x0
- 0x1800_8000

## Series S/X

The Xbox Series S/X consoles have a big internal NVME drive, which has a dedicated section to hold XBFS.
For some yet unknown reasons, when calculating the start offset of a file in XBFS, `0x6000` needs to be substracted to
receive the correct start offset.

Possibly, when dumping the raw image, the initial 0x6000 are not being included.
## Checking for file existance

Iterate through the array of XBFS_FILE_ENTRY and check if
XBFS_FILE_ENTRY.Size \> 0.

## XBFS Structures

Byteorder: Little endian

MAX_FILE_COUNT: 58

PAGE_SIZE: 0x1000

### XBFS_HEADER

Size: 0x400

| Offset | Length                                    | Type                   | Information        |
| ------ | ----------------------------------------- | ---------------------- | ------------------ |
| 0x00   | 0x04                                      | uint                   | Magic (SFBX)       |
| 0x04   | 0x01                                      | byte                   | Format Version     |
| 0x05   | 0x01                                      | byte                   | Sequence Version\* |
| 0x06   | 0x02                                      | ushort                 | Layout Version     |
| 0x08   | 0x08                                      | uint64                 | Unknown            |
| 0x10   | 0x08                                      | uint64                 | Unknown            |
| 0x18   | 0x08                                      | uint64                 | Unknown            |
| 0x20   | MAX_FILE_COUNT \* sizeof(XBFS_FILE_ENTRY) | struct XBFS_FILE_ENTRY | File Entries       |
| 0x3D0  | 0x10                                      | byte\[\]               | UUID               |
| 0x3E0  | 0x20                                      | byte\[\]               | SHA256 Hash        |

  - Sequence number: Wraps around, aka 0xFF -\> 0x00. 0x00 would be
    latest.

### XBFS_FILE_ENTRY

Size: 0x10

| Offset | Length | Type   | Information         |
| ------ | ------ | ------ | ------------------- |
| 0x00   | 0x04   | uint32 | Offset (page count) |
| 0x04   | 0x04   | uint32 | Size (page count)   |
| 0x08   | 0x08   | uint64 | Unknown             |

## File Entries

| Index | Name         | Format | Plaintext | Information                                   | Per console |
| ----- | ------------ | ------ | --------- | --------------------------------------------- | ----------- |
| 01    | 1smcbl_a.bin | binary | no        | SMC bootloader, slot A                        | no          |
| 02    | header.bin   | binary | yes       | XBFS header                                   | no          |
| 03    | devkit.ini   | binary | no        | devkit ini                                    | unknown     |
| 04    | mtedata.cfg  | binary | no        | MTE data                                      | unknown     |
| 05    | certkeys.bin | binary | yes       | [SP/SMC Bootcap cert](certificates.md)        | yes         |
| 06    | smcerr.log   | binary | no        | SMC error log                                 | no          |
| 07    | system.xvd   | xvd    | yes       | SystemOS VM partition                         | no          |
| 08    | $sosrst.xvd  | xvd    | yes       | SystemOS restore                              | no          |
| 09    | download.xvd | xvd    | yes       | Download     ???                              | no          |
| 10    | smc_s.cfg    | binary | no        | SMC config - static                           | unknown     |
| 11    | sp_s.cfg     | binary | partially | [SP - static (console cert)](certificates.md) | yes         |
| 12    | os_s.cfg     | binary | no        | OS config - static                            | unknown     |
| 13    | smc_d.cfg    | binary | no        | SMC config - dynamic                          | unknown     |
| 14    | sp_d.cfg     | binary | no        | SP config - dynamic                           | unknown     |
| 15    | os_d.cfg     | binary | no        | OS config - dynamic                           | unknown     |
| 16    | smcfw.bin    | binary | no        | SMC firmware                                  | unknown     |
| 17    | boot.bin     | binary | no        | [Bootloaders](bootloaders.md)                 | unknown     |
| 18    | host.xvd     | xvd    | yes       | HostOS partition                              | no          |
| 19    | settings.xvd | xvd    | yes       | Settings                                      | no          |
| 20    | 1smcbl_b.bin | binary | no        | SMC bootloader, slot B                        | no          |
| 21    | bootanim.dat | binary | yes       | [Bootanimation](bootanimation.md)             | no          |
| 22    | sostmpl.xvd  | xvd    | yes       | SystemOS template                             | no          |
| 23    | update.cfg   | binary | yes       | Update config / log?                          | unknown     |
| 24    | sosinit.xvd  | xvd    | yes       | SystemOS init                                 | no          |
| 25    | hwinit.cfg   | binary | no        | Hardware init config                          | unknown     |

Note: Only XVD header is plaintext, data portion is encrypted as usual.
Per Console: Is file encrypted via console specific keys or locked to console by SocId.

## Access via SRA/SystemOS

Access to the Flash from SystemOS is possible via the provided pipes:

`\\.\Xvuc\FlashFs\` - Connects to the Flash's NTFS filter driver on host, providing a NTFS like environment compatible with most Win32 file APIs. Reading specific files is possible by simply appending them to the pipe path. Ex: `\\.\Xvuc\FlashFs\sp_s.cfg` would give you a file handle to sp_s.cfg. 

`\\.\Xvuc\Flash\` - Unlike the filtered pipe above, this pipe provides direct access to the flash, without any kind of file system filter. Refer above for more information. 

## Tools

[QuantumTunnel](https://github.com/XboxOneResearch/QuantumTunnel) - (.NET Core) XBFS dumping tool that runs in [SystemOS](xbox-operating-system.md#system) to dump the XBFS from the console. It does require Administrator/NT System privileges.

[xvdtool (XBFSTool)](https://github.com/emoose/xvdtool) - (.NET Core)Parsing / extraction of a raw XBFS image.

[xbfs-tool](https://github.com/RetroTechCorner/xbfs-tool)-(C) Parsing / extraction / injection of raw XBFS images.
