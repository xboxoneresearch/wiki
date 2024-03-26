# Registers the app in the specified loose folder, or registers an app on a specified drive by the package full name.


**Request**

Method      | Request URI
:------     | :------
POST | /ext/app/packagemanager/era/register
<br />

**URI parameters**

Parameter      |  Format |  Description
:------     | :-----  | :-----
Folder  | base64-encoded string | The destination folder name of the package to be registered. This folder must exist on the Title Scratch drive on the console. This folder name should be base64-encoded, as it may contain path separators if the folder is in a subfolder on the drive. Required if registering a loose folder.
packagefullname | base64-encoded string | The Package Full Name of the package. Required if registering an app on a drive.
deploydrive | string  | The drive where the package resides. Required if registering an app on a drive.

**Request headers**

- None

**Request body**

- None

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