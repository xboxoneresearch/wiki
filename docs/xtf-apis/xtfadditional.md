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

## Credentials functions
| Credential function | Description |
|---------------------|-------------|
| XtfAddCredential    | Adds credentials (user name and password) to the given console for use by Run from PC Deployment. |
| XtfCloseCredentialInfoList | Frees resources associated with an XtfNetworkCredentials object returned by XtfGetCredentialInfoList. |
| XtfGetCredentialInfoCount | Gets the count of credentials stored in an XtfNetworkCredentials object returned by XtfGetCredentialInfoList. |
| XtfGetCredentialInfoList | Returns an XtfNetworkCredentials object that contains the list of credentials currently stored on the console. |
| XtfGetCredentialServerName | Gets the server name part of the credentials stored at an index in an XtfNetworkCredentials object returned by XtfGetCredentialInfoList. |
| XtfGetCredentialUserName | Gets the user name part of the credentials stored at an index in an XtfNetworkCredentials object returned by XtfGetCredentialInfoList. |
| XtfRemoveCredential | Removes credentials from the given console. Use XtfAddCredential add credentials. |

## Debug functions
| Debug function        | Description                                               |
|-----------------------|-----------------------------------------------------------|
| XtfCaptureOutputBegin | Starts capture of debug output.                           |
| XtfCaptureOutputEnd   | Stop capture debug output.                                |
| XtfDebugStringCallback | Callback invoked for each output debug string captured.  |
| XtfDebugStringErrorCallback | Callback invoked for each error captured.           |
| XtfGetErrorText       | Gets a user-friendly error message and action text.       |

## Game clip functions
| Game clip function    | Description                                           |
|-----------------------|-----------------------------------------------------------|
| XtfCaptureRecordedGameClip | Captures a video clip from the currently running game.|

## Package info functions
| Package info function | Description |
| --------------------- | ----------- |
| XtfClosePackageInfo  | Frees a package information object. |
| XtfGetAumid           | Gets the application model user ID at an index from a package information object. |
| XtfGetCountofAppUserModelIds | Gets the count of application user model IDs from a package information object. |
| XtfGetPackageFullName | Get the full package name from a package information object. |
| XtfRegisterAllPackagesOnDrive | Register all packages deployed on the specified drive. |
| XtfRegisterNetworkSharePackage | Registers a package for Run from PC Deployment. |
| XtfRegisterPackage | Registers a package deployed to the title scratch drive. |
| XtfRegisterPackageOnDrive | Registers a package deployed on the specified drive. |
| XtfUnregisterPackage | Unregisters a package deployed to the title scratch drive. |

## TitleOS functions
| TitleOS function   | Description                      |
|-------------------|----------------------------------|
| XtfCacheTitleOS   | Adds a Game OS to the OS cache.  |
| XtfGetCachedTitleOSVersions | Gets the version information of each Game OS cached on the console. |
| XtfGetCachedTitleOSVersionsCallback | Callback invoked for each Game OS found by XtfGetCachedTitleOSVersions. |
| XtfGetTitleOSFourPartVersion | Gets version information about the Game OS for the currently running title. |
| XtfGetTitleOSState | Query the state of the Title OS, Fast Iteration Mode, running Title, associate PID, and Package information. |
| XtfGetTitleProcessMemoryReports | Reserved for internal use. |
| XtfRemoveTitleOSFromCache | Removes a Game OS from the cache on the console. |
| XtfRemoveTitleOSFromCacheByVersion | Removes the Game OS matching the specified FourPartVersion from the cache on the console. |
| XtfShutdownTitleOS | Shuts down the active title and Game OS. |
| XtfStartTitleOS | Starts or restarts the specified Game OS. |
| XtfStartTitleOSByGameConfig | Starts or restarts the Game OS based on the contents of a MicrosoftGame.config file that is stored in memory as a string. |
| XtfStartTitleOSByVersion | Starts or restarts the Game OS matching the specified FourPartVersion from the cache on the console. |                                                                                                        |

## Overlay Folder functions
| Overlay Folder Function        | Description                                            |
|-----------------|--------------------------------------------------------|
| XtfClearAllOverlayFolders | Clears the Overlay Folder paths for all packages installed/registered on the console. |
| XtfGetOverlayFolder | Gets the Overlay Folder path for a specified package. |
| XtfSetOverlayFolder | Sets the Overlay Folder path for a specified package. |

## Structures
| Structure | Description |
| --------------------- | ----------- |
| FourPartVersion  | The four-part version number of a Game OS. |

## Enumerations
| Enumeration       | Description                                                                      |
|-------------------|----------------------------------------------------------------------------------|
| XtfConsoleCertType | Enumeration Reserved for internal use.                                            |
| XtfConsoleFieldId  | Enumeration Identifies the value to return from XtfGetConsoleFieldValue.        |
| XtfConsoleFieldType| Enumeration Identifies the type of the value returned from XtfGetConsoleFieldValue.|
