# unregistered packages. API reference

You can access development-related files on your Xbox One using a standard file explorer. This allows you to easily view and replace files from your PC to the console.

**Request**
Returns a JSON array of unregistered packages.

Method      | Request URI
:------     | :-----
GET | /ext/app/unregistered

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
PackageFullName | Name of the app.
DeployType | This should be UnregisteredPackage.
DeployDrive | The drive where the package resides.
DeploySizeInBytes | The size of the package.

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