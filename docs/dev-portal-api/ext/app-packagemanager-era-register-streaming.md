# Starts the streaming install of an XVC from a network share or local drive on the console.


**Request**

Method      | Request URI
:------     | :------
POST | (/ext/app/packagemanager/era/streaming
<br />

**URI parameters**

Parameter      |  Format |  Description
:------     | :-----  | :-----
xvcfilepath  | base64-encoded string | The network share or console local path to the XVC to be installed.
deploydrive | string | Optional deploy drive.
Languages | string  | Optional language specifiers.
Devices | string | Optional devices specifiers.
ContentTypes | string | Optional contentTypes specifiers
Tags | string | Optional tags specifiers.
OddSim | Whether or not ODD simulation should be used.

**Request headers**

- None

**Request body**

- Optionally this API can take a “username” and “password” optional parameter in JSON format in the request body if credentials are needed to access the network share.

###Response

**Response body**

If the call is successful, the service will return a JSON object with the following members.

Member      |  Format |  Description
:------     | :-----  | :-----
ContentId  | string | A GUID indicating the ContentId of this package.
InstallId | string | A GUID which will identify the install for future calls to cancel or retrieve the status of the install.

**Status code**

This API has the following expected status codes.

HTTP status code      | Description
:------     | :-----
200 | Success
4XX | Error codes
5XX | Error codes


**Available device families**

* Windows Xbox

**Credits**
Microsoft