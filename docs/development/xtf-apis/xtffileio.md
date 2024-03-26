# XtfFileIO
The Xbox Tools Framework (XTF) API that is used to manage files on a development console.

## Interfaces
| Interface              | Description                                          |
|------------------------|------------------------------------------------------|
| IXtfBatchFileIOClient  | Batch copies files between two locations on a development console. |
| IXtfCopyFileCallback   | Provides callbacks that are used when the status of an IXtfFileIOClient::CopyFiles Method or IXtfBatchFileIOClient::CopyFiles Method operation changes. |
| IXtfFileIOClient       | Represents an Xbox Tools Framework (XTF) file I/O client. |
| IXtfFindFileCallback   | Provides a callback that is used when a file is found during a find or delete operation. |

## Functions
| Function              | Description                                          |
|------------------------|------------------------------------------------------|
| XtfCreateFileIOClient | Initializes a new instance of the IXtfFileIOClient interface with the specified address. |

## Structures
| Structure              | Description                                          |
|------------------------|------------------------------------------------------|
| XTFFILEINFO            | Contains information about a file for Xbox Tools Framework (XTF) apps. |
| XTFFILEIORESERVED      | Reserved for internal use. |
