<!-- TITLE: XtfApplication -->
<!-- SUBTITLE: A summary of XtfApplication APIs -->

# XtfApplication
The Xbox Tools Framework (XTF) API that is used to automate application management.

## Interfaces
| Interface             | Description                                          |
|-----------------------|------------------------------------------------------|
| IXtfApplicationClient | Represents an Xbox Tools Framework (XTF) app client. |
| IXtfDeployCallback    | Provides a callback that is called when a trackable action occurs during an IXtfApplicationClient::Deploy Method operation.                                                     |


## Functions
| Function              | Description                                          |
|-----------------------|------------------------------------------------------|
| XtfCreateApplicationClient | Initializes a new instance of the IXtfApplicationClient interface for the development console with the specified address. |
