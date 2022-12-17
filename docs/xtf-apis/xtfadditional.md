# Additional Xtf APIs
The Xbox Tools Framework (XTF) API is used for checking available space for apps and retrieving user friendly error messages.

## App functions
| App function | Description |
|--------------|-------------|
| XtfPullAuditionApp | Reserved for internal use. |
| XtfPullRegisterApp | Reserved for internal use. |
| XtfPullSupplyMock | Reserved for internal use. |
| XtfPullUnregisterApp | Reserved for internal use. |

## Console info functions
| Console info function | Description |
|------------------------|-------------|
| XtfCloseConsoleInfoList | Frees resources associated with an XtfConsoleInfo object returned by XtfGetConsoleInfoList. |
| XtfGetAvailableSpaceForAppInstallation | Gets the total number of bytes available on the specified storage device of a development console. |
| XtfGetConsoleFieldValue | Retrieves information about a console, one of Tools IP Address, Console IP Address, AccessKey, Console ID, HostName, Device ID, DevKit Cert type, SystemMajorVersion, SystemMinorVersion, SystemBuildVersion, or SystemRevisionVersion. |
| XtfGetConsoleInfoList | Returns an XtfConsoleInfo object that contains information about a console. |
| XtfGetSavedConsoleAddress | Gets the Tools IP address of the default console for Xbox Tools Framework (XTF) apps. |
| XtfGetSystemUpTime | Gets the amount of time in milliseconds that the System has been up. |