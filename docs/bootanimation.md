# Bootanimation
Bootanimation is the Xbox loading animation showing at bootup of the console.

The file is stored in [XBFS](../xbox-boot-filesystem) as bootanim.dat.

It uses a proprietary format, likely specific to the AMD GPU.

## File format
The file starts with a section header (BOOTANIM_SECTION_HEADER) and then followed by unknown data of
size *Header->SectionSize*.

If the following data starts with the header magic, an additional section follows.

### BOOTANIM_SECTION_HEADER
| Offset | Length | Type     | Information                    |
| ------ | ------ | -------- | ------------------------------ |
| 0x00   | 0x04   | uint     | Magic (FSEG)                   |
| 0x04   | 0x04   | uint     | SectionIndex                   |
| 0x08   | 0x04   | uint     | SectionSize                    |

### BOOTANIM_DATE
| Offset | Length | Type     | Information                    |
| ------ | ------ | -------- | ------------------------------ |
| 0x00   | 0x??   | ??       | Unknown                        |
