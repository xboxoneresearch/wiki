# Tests a script by running it on the target Xbox One development console.


**Request**

Method      | Request URI
:------     | :------
POST | /ext/unattendedsetup/test
<br />

**URI parameters**

- None

**Request headers**

- None

**Request body**

Multi-part conforming HTTP body that contains the script file to run. 

###Response

**Response body**

If the call is successful, the service will return a JSON object with the script output and status code.

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