### Renames a file/folder inside user's known folders

**Request**

Renames a file or folder inside a known folder or app data.

| Method | Request URI                 |
| :----- | :-------------------------- |
| POST   | /api/filesystem/apps/rename |

**URI parameters**

| URI parameter   | Description                                                            |
| :-------------- | :--------------------------------------------------------------------- |
| knownfolderid   | (**required**) Known folder identifier.                                |
| oldfilename     | (**required**) Existing file or directory path relative to the folder. |
| newfilename     | (**required**) New file or directory name.                             |
| packagefullname | (optional) Package full name if targeting application data.            |

**Request headers**

- None

**Request body**

- None

**Response**

- None

**Status code**

| HTTP status code | Description      |
| :--------------- | :--------------- |
| 200              | OK               |
| 400              | Bad request      |
| 404              | Target not found |
| 5XX              | Error codes      |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
