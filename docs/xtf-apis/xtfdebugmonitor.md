# XtfDebugMonitor
Xbox Tools Framework (XTF) API that is used to receive debug output from an app or game running on a development console.

## Interfaces
|Interface             | Description
|-----------------------|------------------------------------------------------
|IXtfDebugMonitorCallback | Provides a callback that is used when an Xbox Tools Framework (XTF) app sends debug output.
|IXtfDebugMonitorClient | Receives debug output from Xbox Tools Framework (XTF) apps.

## Functions
|Function              | Description
|-----------------------|------------------------------------------------------
|XtfCreateDebugMonitorClient | Initializes a new instance of the IXtfDebugMonitorClient Interface interface.

## Structures
|Structure              | Description
|-----------------------|------------------------------------------------------
|XTF_OUTPUT_DEBUG_STRING_DATA structure | Contains debug output string data.
