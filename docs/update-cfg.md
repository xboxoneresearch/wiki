# Update.cfg

## File format

### CONTAINER_INDEX_FILE
Structure of *container.index* file.

| Offset | Length | Type               | Information                    |
| ------ | ------ | ------------------ | ------------------------------ |
| 0x00   | 0x04   | uint32             | Type                           |
| 0x08   | 0x04   | uint32             | FileCount                      |
| 0x0C   | 0x04   | uint32             | NameLength                     |
| 0x10   | *var*  | WCHAR[NameLength]  | Name                           |
| *var*  | 0x04   | uint32             | AumIdLength                    |
| *var*  | *var*  | WCHAR[AumIdLength] | AumId                          |
| *var*  | 0x08   | FILETIME           | Timestamp                      |
| *var*  | 0x04   | uint32             | Unknown (seen 0, 1, 3 so far)  |
| *var*  | 0x04   | uint32             | IdLength                       |
| *var*  | *var*  | WCHAR[IdLength]    | Id                             |
| *var*  | 0x04   | uint32             | AumIdLength                    |

### CONTAINER_INDEX_ENTRY

| Offset | Length | Type                     | Information                    |
| ------ | ------ | ------------------------ | ------------------------------ |
| 0x00   | 0x04   | uint32                   | FilenameLength                 |
| 0x04   | *var*  | WCHAR[FilenameLength]    | Filename                       |
| *var*  | 0x04   | uint32                   | FilenameAltLength              |
| *var*  | *var*  | WCHAR[FilenameAltLength] | FilenameAlt                    |
| *var*  | 0x04   | uint32                   | AumIdLength                    |
| *var*  | *var*  | WCHAR[AumIdLength]       | AumId                          |
| *var*  | 0x08   | FILETIME                 | Timestamp                      |
| *var*  | 0x04   | uint32                   | Unknown (seen 0, 1, 3 so far)  |
| *var*  | 0x04   | uint32                   | IdLength                       |
| *var*  | *var*  | WCHAR[IdLength]          | Id                             |
| *var*  | 0x04   | uint32                   | AumIdLength                    |