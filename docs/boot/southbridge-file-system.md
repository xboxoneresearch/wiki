# SBFS

The "Series"-era of Xbox consoles has, in addition to [XBFS](xbox-boot-file-system.md), a filesystem called SBFS.

It is not exposed to the operating system itself transparently.

## Filesystem sizes

Unknown

## SBFS Header offsets

Checking if a filetable exists is done by checking for
SBFS_HEADER-\>Magic.

Absolute offsets:

 - 0x1_0000
 - 0x1_1000

## SBFS Structures

Byteorder: Little endian

MAX_FILE_COUNT: 24

PAGE_SIZE: 0x1000

### SBFS_HEADER

Size: 0x1C0

| Offset | Length                                    | Type                   | Information        |
| ------ | ----------------------------------------- | ---------------------- | ------------------ |
| 0x00   | 0x04                                      | uint                   | Magic (SFBS)       |
| 0x04   | 0x01                                      | byte                   | Format Version     |
| 0x05   | 0x01                                      | byte                   | Sequence Version\* |
| 0x06   | 0x02                                      | ushort                 | Layout Version     |
| 0x08   | 0x08                                      | uint64                 | Unknown            |
| 0x10   | 0x08                                      | uint64                 | Unknown            |
| 0x18   | 0x08                                      | uint64                 | Unknown            |
| 0x20   | MAX_FILE_COUNT \* sizeof(SBFS_FILE_ENTRY) | struct SBFS_FILE_ENTRY | File Entries       |
| 0x1A0  | 0x20                                      | byte\[\]               | SHA256 Hash        |


  - Sequence number: Wraps around, aka 0xFF -\> 0x00. 0x00 would be
    latest.

### SBFS_FILE_ENTRY

Size: 0x10

| Offset | Length | Type   | Information         |
| ------ | ------ | ------ | ------------------- |
| 0x00   | 0x04   | uint32 | Offset (page count) |
| 0x04   | 0x04   | uint32 | Size (page count)   |
| 0x08   | 0x08   | uint64 | Unknown             |

## File Entries


| Index | Name         | Format | Plaintext | Information                   | Per console |
| ----- | ------------ | ------ | --------- | ----------------------------- | ----------- |
| 01    | smcfw.bin    | binary | no        | SMC firmware                  | ?           |
| 02    | psp1sp.bin   | binary | no        | Bootloaders                   | yes         |
| 03    | speaker.bin  | binary | ?         | (likely) Startup/eject sounds | no          |
| 04    | smcerr.log   | binary | no        | SMC error log                 | yes         |
| 05    | smc_d.cfg    | binary | no        | Dynamic SMC config            | yes         |
| 06    | certkeys.smc | binary | no        | SMC boot capability cert      | yes         |

## Tools

 - [sbfs-tool](https://github.com/RetroTechCorner/sbfs-tool) - (Go) Parsing/extracting a raw SBFS image