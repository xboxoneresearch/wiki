# Savegames

## File format

### BLOB_TYPE
| Enum   | Value     |
| ------ | --------- |
| Binary |       0x1 |
| Json   |       0x2 |
| Config |       0x3 |

### SAVEGAME_TYPE
| Enum    | Value     |
| ------- | --------- |
| User    |       0x1 |
| Machine |       0x5 |

### CONTAINER_INDEX_FILE
Structure of *containers.index* file.

| Offset | Length | Type                            | Information                    |
| ------ | ------ | ------------------------------- | ------------------------------ |
| 0x00   | 0x04   | uint32                          | Type                           |
| 0x08   | 0x04   | uint32                          | FileCount                      |
| 0x0C   | 0x04   | uint32                          | NameLength                     |
| 0x10   | *var*  | WCHAR[NameLength]               | Name                           |
| *var*  | 0x04   | uint32                          | AumIdLength                    |
| *var*  | *var*  | WCHAR[AumIdLength]              | AumId                          |
| *var*  | 0x08   | FILETIME                        | Timestamp                      |
| *var*  | 0x04   | uint32                          | Unknown (seen 0, 1, 3 so far)  |
| *var*  | 0x04   | uint32                          | IdLength                       |
| *var*  | *var*  | WCHAR[IdLength]                 | Id                             |
| *var*  | 0x04   | uint32                          | AumIdLength                    |
| *var*  | *var*  | CONTAINER_INDEX_FILE[FileCount] | Files                          |

### CONTAINER_INDEX_ENTRY

| Offset | Length | Type                     | Information                    |
| ------ | ------ | ------------------------ | ------------------------------ |
| 0x00   | 0x04   | uint32                   | FilenameLength                 |
| 0x04   | *var*  | WCHAR[FilenameLength]    | Filename                       |
| *var*  | 0x04   | uint32                   | FilenameAltLength              |
| *var*  | *var*  | WCHAR[FilenameAltLength] | FilenameAlt                    |
| *var*  | 0x04   | uint32                   | TextLength                     |
| *var*  | *var*  | WCHAR[TextLength]        | Text                           |
| *var*  | 0x01   | byte                     | BlobNumber                     |
| *var*  | 0x04   | uint32                   | SaveType                       |
| *var*  | 0x10   | byte[]                   | FolderGuid                     |
| *var*  | 0x08   | FILETIME                 | Timestamp                      |
| *var*  | 0x08   | uint64                   | Unknown                        |
| *var*  | 0x04   | uint32                   | FileSize                       |
| *var*  | 0x04   | uint32                   | Unknown                        |

### CONTAINER_BLOB
| Offset | Length | Type                     | Information                    |
| ------ | ------ | ------------------------ | ------------------------------ |
| 0x00   | 0x04   | uint32                   | Unknown                        |
| 0x04   | 0x04   | uint32                   | Unknown                        |
| 0x08   | 0x08   | WCHAR[]                  | Magic (Blob)                   |
| 0x10   | 0x88   | byte[]                   | Data                           |
| 0x98   | 0x10   | byte[]                   | GUID                           |