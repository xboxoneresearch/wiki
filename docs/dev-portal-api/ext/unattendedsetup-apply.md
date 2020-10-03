# Sets a script to the boot script for the target Xbox One development console.


**Request**

Method      | Request URI
:------     | :------
POST | /ext/unattendedsetup/apply
<br />

**URI parameters**

- None

**Request headers**

- None

**Request body**

Multi-part conforming HTTP body that contains the script file to apply.

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