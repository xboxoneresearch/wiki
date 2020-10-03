# Moves an application from one drive to another or manages installation of an application on the target Xbox One development console.   


## Cancels the move or install on the target Xbox One development console.


**Request**


Method      | Request URI
:------     | :-----
Delete | /ext/app/move



**URI parameters**

Parameter      | Format     | Description
:------     | :-----     | :-----
| installid       | base64-encoded string | The GUID identifying the move or install which we are querying. This value is returned from a successful GET method starting a move or install.

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

## Gets the move or install status from an installid.

**Request**

Method      | Request URI
:------     | :-----
Get | /ext/app/move

**URI parameters**

Parameter      | Format     | Description
:------     | :-----     | :-----
| installid       | base64-encoded string | The GUID identifying the move or install which we are querying. This value is returned from a successful GET method starting a move or install.


**Request headers**

- None

**Request body**

- None

**Response**   

- If the call is successful, the service will return a JSON object with the following members.

Member      | Description
:------     | :-----
installProgress | Number. This value is a percent between 0 and 100 for the move or installs current progress.
isRunning | Boolean. If this value is true, the specified move or install is still running. If it is no longer running this value will be false or the method will return an HTTP 404 indicating the install was not found.

**Status code**

This API has the following expected status codes.

HTTP status code      | Description
:------     | :-----
204 | The request to enable Fiddler was accepted. Fiddler will be enabled the next time the device reboots.
4XX | Error codes
5XX | Error codes

## Moves a given application from one drive to another drive.

**Request**

Method      | Request URI
:------     | :-----
Post | /ext/app/move

**URI parameters**

Member      | Format     | Description
:------     | :-----     | :-----
| packagefullname       | base64-encoded string | The Package Full Name of the package.
| destinationDrive       | string | The drive to move the package to.


**Request headers**

- None

**Request body**   

- None

**Response**   

- If the call is successful, the service will return a JSON object with the following members.

Parameter      | Format     | Description
:------     | :-----     | :-----
| installid       | string | The GUID identifying the move or install which we are querying. This value is returned from a successful GET method starting a move or install.

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
