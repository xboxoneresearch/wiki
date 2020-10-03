# Registers the app on the specified network share.


**Request**

Method      | Request URI
:------     | :------
POST | /ext/app/packagemanager/era/registernetwork
<br />

**URI parameters**

Parameter      |  Format |  Description
:------     | :-----  | :-----
networkshare  | base64-encoded string | The network share location of the package to be registered. This network share should be base64-encoded.

**Request headers**

- None

**Request body**

This API can take a “username” and “password” optional parameter in JSON format in the request body if credentials are needed to access the network share.

###Response

**Response body**

- Unknown

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