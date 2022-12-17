<!-- TITLE: XtfConsoleControl -->
<!-- SUBTITLE: A summary of XtfConsoleControl APIs -->

# XtfConsoleControl
The Xbox Tools Framework (XTF) API that is used to get information about and manage a development console.

## Interfaces
| Interface             | Description                                          |
|-----------------------|------------------------------------------------------|
| IXtfConfigSettingsCallback | Represents an Xbox Tools Framework (XTF) app client. |
| IXtfConsoleControlClient    | Represents an Xbox Tools Framework (XTF) development console client.|
| IXtfRunningProcessCallback    | Provides a callback that is called when a running process is found during an IXtfConsoleControlClient::GetRunningProcesses Method operation.|


## Functions
| Function              | Description                                          |
|-----------------------|------------------------------------------------------|
| XtfCaptureScreenshot | Captures the current screen display of the specified development console as a bitmap. |
| XtfCreateConsoleControlClient | Initializes a new instance of the IXtfConsoleControlClient interface with the specified address. |


## Structures
| Structure              | Description                                          |
|-----------------------|------------------------------------------------------|
| XTFCONFIGSETTING | Describes a configuration setting for a console. |
| XTFPROCESSINFO | Contains information about a running Xbox Tools Framework (XTF) process. |
| XTFSYSTEMTIME | Contains system time information for Xbox Tools Framework (XTF) apps. |
