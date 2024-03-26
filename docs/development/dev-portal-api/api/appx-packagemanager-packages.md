### Get installed apps

**Request**

You can get a list of apps installed on the system by using the following request format.
 
| Method      | Request URI |
| :------     | :----- |
| GET | /api/appx/packagemanager/packages |


**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response includes a list of installed packages with associated details. The template for this response is as follows.
```json
{"InstalledPackages": [
    {
        "Name": string,
        "PackageFamilyName": string,
        "PackageFullName": string,
        "PackageOrigin": int, (https://msdn.microsoft.com/library/windows/desktop/dn313167(v=vs.85).aspx)
        "PackageRelativeId": string,
        "Publisher": string,
        "Version": {
            "Build": int,
            "Major": int,
            "Minor": int,
            "Revision": int
     },
     "RegisteredUsers": [
     {
        "UserDisplayName": string,
        "UserSID": string
     },...
     ]
    },...
]}
```
**Status code**

This API has the following expected status codes.

|  HTTP status code      | Description | 
| :------     | :----- |
|  200 | OK | 
| 4XX | Error codes |
| 5XX | Error codes |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Notes**
This appears to be a duplicate of `/api/app/packagemanager/package`

**Credits**
Microsoft