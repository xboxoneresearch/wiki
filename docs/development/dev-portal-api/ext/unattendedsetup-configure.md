# Provides access to configuration data for how scripts are run. 

## Retrieves configuration data for how scripts are run.

**Request**

Method      | Request URI
:------     | :-----
Get | /ext/unattendedsetup/configure

**URI parameters**

- None


**Request headers**

- None

**Request body**

- None

**Response**   

If the call is successful, the service will return a JSON object with the following members.

Member      | Description
:------     | :-----
RunOobeScript | Boolean value that indicates whether we should run any one-time script on the next boot (expected script name is oobe.cmd).
BlockUsbScript | Boolean value that indicates whether we should block unattended scripts from running when on a USB device.
SkipAbortToast | Boolean value that indicates whether we should run scripts immediately on boot instead of waiting for an abort window.
BlockAllScripts | Boolean value that indicates whether we should block unattended scripts from running.
HasScript | Boolean value that indicates whether the target console currently has a boot script.

**Status code**

This API has the following expected status codes.

HTTP status code      | Description
:------     | :-----
204 | The request to enable Fiddler was accepted. Fiddler will be enabled the next time the device reboots.
4XX | Error codes
5XX | Error codes

## Sets configuration data for how scripts are run.

**Request**

Method      | Request URI
:------     | :-----
Post | /ext/unattendedsetup/configure

**URI parameters**

- None

**Request headers**

- None

**Request body**   

The request must contain a JSON body that has the following members.

RunOobeScript | Boolean value that indicates whether we should run any one-time script on the next boot (expected script name is oobe.cmd).
BlockUsbScript | Boolean value that indicates whether we should block unattended scripts from running when on a USB device.
SkipAbortToast | Boolean value that indicates whether we should run scripts immediately on boot instead of waiting for an abort window.
BlockAllScripts | Boolean value that indicates whether we should block unattended scripts from running.

**Response**   

- None

**Status code**

This API has the following expected status codes.

HTTP status code      | Description
:------     | :-----
204 | The request to disable Fiddler tracing was successful. Tracing will be disabled on the next reboot of the device.
4XX | Error codes
5XX | Error codes


**Available device families**

* Windows Xbox

**Credits**
Microsoft
