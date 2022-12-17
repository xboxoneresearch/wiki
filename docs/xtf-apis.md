<!-- TITLE: XTF APIs -->
<!-- SUBTITLE: A quick summary of the developer XTF APIs, their function and description. -->

# XTF APIs

## What are XTF APIs?
XTF (Also known as Xbox Toolkit Framework) is a set of APIs used in conjunction by the console and XDK or GDK running on a PC. These APIs are generally only active console side on an ERA kit or above, however **patched** methods have allowed UWA kits to use them in the past. They expose a number of functions from console information gathering and application management to controller input simulation, execution, file management and debugging. Note: Headers, libraries and debugging symbols for XTF can be found at `C:\Program Files (x86)\Microsoft GDK\toolKit` in the case of a local GDK installation.

## XtfApplication
This [XTF API](xtf-apis/xtfapplication.md) is used to automate application management.

## XtfConsoleControl
This [XTF API](xtf-apis/xtfconsolecontrol.md) is used to get information about and manage a development console.

## XtfConsoleManager
This [XTF API](xtf-apis/xtfconsolemanager.md) is used to get the default development console or to manage a collection of development consoles.

## XtfDebugMonitor
This [XTF API](xtf-apis/xtfdebugmonitor.md) is used to receive debug output from an app or game running on a development console.

## XtfFileIO
This [XTF API](xtf-apis/xtffileio.md) is used to manage files on a development console.

## XtfInput
This [XTF API](xtf-apis/xtfinput.md) is used to simulate controller input on a development console.

## XtfRemoteRun
This [XTF API](xtf-apis/xtfremoterun.md) is used to run utility executables on a development console.

## XtfUser
This [XTF API](xtf-apis/xtfuser.md) is used to manage users on a development console.

## Additional Xtf APIs
These [XTF APIs](xtf-apis/xtfadditional.md) are used for checking available space for apps and retrieving user friendly error messages.


###### Disclaimer:
This infomation was gathered from a publicly accessible Game Development Kit and files dumped from a UWA devkit.
As such, no NDA was broken as no NDA is in existance between Microsoft Inc and Team XOSFT. 

