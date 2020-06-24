# unregistered packages. API reference

Gets a Boolean value that indicates whether there are any apps ready to be registered on the Title Scratch drive or in the DeveloperFiles LooseApps folder.

**Request**
Method      | Request URI
:------     | :-----
GET | /ext/app/packagemanager/era/available

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**   

If the call is successful, the service will return a JSON array containing information about the unregistered packages on the console. Each entry in the array will contain the following members.

Member      | Description
:------     | :-----
Folder | Relative path to the app
PackageFullName | Name of the app.
isEra | Boolean. If this value is true, the app is an ERA title. If this value is false, the app is a UWP app.

**Status code**

This API has the following expected status codes.

HTTP status code      | Description
:------     | :-----
200 | The request to access the credentials for the file share was granted.
4XX | Error codes
5XX | Error codes

**Available device families**

* Windows Xbox

**Credits**
Microsoft