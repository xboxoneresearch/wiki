# Provides access to the boot script on the target Xbox One development console.  


## Deletes the boot script on the target Xbox One development console.


**Request**


Method      | Request URI
:------     | :-----
Delete | /ext/unattendedsetup/default



**URI parameters**

- None

**Request headers**

- None

**Request body**   

- None

**Response**   

- None

**Status code**

This API has the following expected status codes.

HTTP status code      | Description
:------     | :-----
200 | Success
4XX | Error codes
5XX | Error codes

## Retrieves the boot script on the target Xbox One development console

**Request**

Method      | Request URI
:------     | :-----
Get | /ext/unattendedsetup/default

**URI parameters**

- None


**Request headers**

- None

**Request body**

- None

**Response**   

If the call is successful, the service will return the script file as a multi-part conforming HTTP body.

**Status code**

This API has the following expected status codes.

HTTP status code      | Description
:------     | :-----
204 | The request to enable Fiddler was accepted. Fiddler will be enabled the next time the device reboots.
4XX | Error codes
5XX | Error codes

## Runs the boot script on the target Xbox One development console.

**Request**

Method      | Request URI
:------     | :-----
Post | /ext/unattendedsetup/default

**URI parameters**

- None

**Request headers**

- None

**Request body**   

- None

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
