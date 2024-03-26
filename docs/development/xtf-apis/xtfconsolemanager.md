# XtfConsoleManager
The Xbox Tools Framework (XTF) API that is used to get the default development console or to manage a collection of development consoles.

## Interfaces
| Interface             | Description                                          |
|-----------------------|------------------------------------------------------|
| IXtfConsoleManager | Manages development consoles for Xbox Tools Framework (XTF) apps. |
| IXtfConsoleManagerCallback | Provides callbacks that are used when a development console in an IXtfConsoleManager instance is added or removed, or when the default development console is changed. |
| IXtfEnumerateConsolesCallback | Provides callbacks that are used when a development console is found during an IXtfConsoleManager::EnumerateConsoles operation. |

## Functions
| Function              | Description                                          |
|-----------------------|------------------------------------------------------|
| XtfCreateConsoleManager | Initializes a new instance of the IXtfConsoleManager interface. |
| XtfGetDefaultAddress | Returns the IP address of the default development console for this PC. |

## Structures
| Structure              | Description                                          |
|-----------------------|------------------------------------------------------|
| XTFCONSOLEDATA | Contains information about a development console in an IXtfConsoleManager instance. |
