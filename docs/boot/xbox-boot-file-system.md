<!-- TITLE: Xbox Boot File System -->
<!-- SUBTITLE: Xbox boot file system (XBFS) on eMMC -->

# Xbox Boot file system
Xbox Boot File System, or XBFS for short, refers to the console flash
filesystem.

On Xbox Series-consoles, there is also [SBFS](southbridge-file-system.md).

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

XBFS contains the following entries as of firmware version 10.0.10586.1029.

| Index | Name                                | Format | Plaintext | Information                                                                                            |
| ----- | ----------------------------------- | ------ | --------- | ------------------------------------------------------------------------------------------------------ |
| 00    | 1smcbl_a.bin                        | binary | no        | SMC bootloader (slot A)                                                                                |
| 01    | header.bin                          | binary | yes       | XBFS header                                                                                            |
| 02    | devkit.ini                          | binary | no        | Devkit initialization data                                                                             |
| 03    | mtedata.cfg                         | binary | no        | MTE data                                                                                               |
| 04    | certkeys.bin                        | binary | yes       | Per-console [SP/SMC Bootcap cert](../security/certificates.md)                                         |
| 05    | smcerr.log                          | binary | no        | SMC error log (dynamic)                                                                                |
| 06    | system.xvd                          | xvd    | yes       | SystemOS VM image                                                                                      |
| 07    | \$sospf.xvd (formerly \$sosrst.xvd) | xvd    | yes       | SystemOS restore image                                                                                 |
| 08    | download.xvd                        | xvd    | yes       | Unknown                                                                                                |
| 09    | smc_s.cfg                           | binary | no        | SMC configuration (static)                                                                             |
| 10    | sp_s.cfg                            | binary | partially | Per-console SP configuration (static) / [console certificate](../security/certificates.md)             |
| 11    | os_s.cfg                            | binary | no        | OS configuration (static)                                                                              |
| 12    | smc_d.cfg                           | binary | no        | SMC configuration (dynamic)                                                                            |
| 13    | sp_d.cfg                            | binary | no        | SP configuration (dynamic)                                                                             |
| 14    | os_d.cfg                            | binary | no        | XConfig retail mode storage (dynamic)                                                                  |
| 15    | smcfw.bin                           | binary | no        | SMC firmware                                                                                           |
| 16    | boot.bin                            | binary | no        | [Bootloaders](../boot/bootloaders.md)                                                                  |
| 17    | host.xvd                            | xvd    | yes       | HostOS image                                                                                           |
| 18    | settings.xvd                        | xvd    | yes       | SystemOS settings image                                                                                |
| 19    | 1smcbl_b.bin                        | binary | no        | SMC bootloader (slot B)                                                                                |
| 20    | bootanim.dat                        | binary | yes       | [Boot animation](../boot/bootanimation.md)                                                             |
| 21    | obsolete.001 (formerly sostmpl.xvd) | xvd    | yes       | Obsolete (formerly SystemOS template image)                                                            |
| 22    | update.cfg                          | binary | yes       | Update configuration / log?                                                                            |
| 23    | obsolete.002 (formerly sosinit.xvd) | xvd    | yes       | SystemOS initialization image                                                                          |
| 24    | hwinit.cfg                          | binary | no        | Hardware initialization configuration                                                                  |
| 25    | qaslt.xvd                           | xvd    | unknown   |                                                                                                        |
| 26    | sp_s.bak                            | binary | unknown   |                                                                                                        |
| 27    | update2.cfg                         | binary | unknown   |                                                                                                        |
| 28    | recovery.dat                        | binary | unknown   |                                                                                                        |
| 29    | dump.lng                            | binary | unknown   |                                                                                                        |
| 30    | os_d_dev.cfg                        | binary | unknown   | XConfig dev mode storage (dynamic)                                                                     |
| 31    | os_glob.cfg                         | binary | unknown   |                                                                                                        |
| 32    | sp_s.alt                            | binary | unknown   | Alternative per-console SP configuration (static) / [console certificate](../security/certificates.md) |

Note: Only XVD header is plaintext, data portion is encrypted as usual.
Per Console: Is file encrypted via console specific keys or locked to console by SocId.

## Access via SRA/SystemOS

Access to the Flash from SystemOS is possible via the provided pipes:

`\\.\Xvuc\FlashFs\` - Connects to the Flash's NTFS filter driver on host, providing a NTFS like environment compatible with most Win32 file APIs. Reading specific files is possible by simply appending them to the pipe path. Ex: `\\.\Xvuc\FlashFs\sp_s.cfg` would give you a file handle to sp_s.cfg. 

`\\.\Xvuc\Flash\` - Unlike the filtered pipe above, this pipe provides direct access to the flash, without any kind of file system filter. Refer above for more information. 

## Tools

[QuantumTunnel](https://github.com/XboxOneResearch/QuantumTunnel) - (.NET Core) XBFS dumping tool that runs in [SystemOS](../operating-system/xbox-operating-system.md#system) to dump the XBFS from the console. It does require Administrator/NT System privileges.

[xvdtool (XBFSTool)](https://github.com/emoose/xvdtool) - (.NET Core)Parsing / extraction of a raw XBFS image.

[xbfs-tool](https://github.com/RetroTechCorner/xbfs-tool)-(C) Parsing / extraction / injection of raw XBFS images.
