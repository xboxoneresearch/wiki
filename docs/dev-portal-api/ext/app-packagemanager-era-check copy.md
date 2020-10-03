# Determines whether the specified AppXManifest is for an ERA title or a UWP application.
Gets a Boolean value that indicates whether the specified AppXManifest is for an ERA title.

**Request**

Method      | Request URI
:------     | :------
POST | (/ext/app/packagemanager/era/check
<br />

**URI parameters**

 - None

**Request headers**

- None

**Request body**

- The request must contain the multi-part conforming HTTP body of the AppXManifest.xml file.

###Response

**Response body**

If the call is successful, the service will return a JSON object with the following members.
Member      | Description
:------     | :-----
isEra | Boolean. If this value is true, the specified AppXManifest is for an ERA title. If this value is false, the specified AppXManifest is for a UWP app.

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