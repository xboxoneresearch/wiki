# VBI - Virtual Boot Image
A custom boot image format used to load the critical boot components for the Xbox OS. It contains its own mapped loader block, kernel and/or hypervisor (if host), and more. These files can be located within the user-data section for bootable XVD's or in the boot.bin for the Host OS VBI. 

## File format
### VBI Header
| Offset | Length | Type            | Information                    |
| ------ | ------ | --------------- | ------------------------------ |
| 0x00   |   0x04 |   uint32        | Magic (1IBV)                   |
| 0x04   |   0x04 |   uint32        | MinimumVersion                 |
| 0x08   |   0x04 |   uint32        | SizeOfHeaders                  |
| 0x0C   |   0x04 |   uint32        | ImageSize                      |
| 0x10   |   0x08 |   uint64        | BasePhysicalAddress            |
| 0x14   |   0x08 |   uint64        | TrampolineVirtualAddress       |
| 0x1C   |   0x04 |   uint32        | DataOffset                     |
| 0x20   |   0x04 |   uint32        | Flags                          |
| 0x24   |   0x04 |   uint32        | DirectoryEntryCount            |
| 0x28   |   0xB8 |   VbiDirectory  | Directories                    |

### VBI Directory
| Offset | Length | Type            | Information                    |
| ------ | ------ | --------------- | ------------------------------ |
| 0x00   |   0x04 |   uint32        | Offset                         |
| 0x04   |   0x04 |   uint32        | Size                           |


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
4. Go to offset ``0xC`` (ImageSize) and copy the value as a 32-bit integer
5. Re-run:
    - `` xcrdutil.exe -read_ud F:\system.xvd 0 <size> <path on console for output> ``
    Example:
        - `` xcrdutil -read_ud F:\system.xvd 0 32071680 D:\\DevelopmentFiles\\system.vbi ``
6. Viola!

#### This can also be applied to gameos.xvd or gamecore.xvd when running within their partitions.
