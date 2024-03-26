# XtfRemoteRun
The Xbox Tools Framework (XTF) API that is used to run utility executables on a development console.

## Interfaces
| Interface             | Description                                          |
|-----------------------|------------------------------------------------------|
| IXtfRemoteRunCallback | Provides callbacks to be used when standard input or standard output of a remote executable are redirected by IXtfRemoteRunClient::Run Method.|
| IXtfRemoteRunClient    | Provides the ability to run an executable remotely on a development console.|

## Functions
| Function              | Description                                          |
|-----------------------|------------------------------------------------------|
| XtfCreateRemoteRunClient | Initializes a new instance of the IXtfRemoteRunClient interface with the specified address.|
