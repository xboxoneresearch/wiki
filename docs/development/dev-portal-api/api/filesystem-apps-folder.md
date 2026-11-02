### Create or delete folder

**Request**

Creates or deletes a folder inside a known folder or app data.

| Method        | Request URI                 |
| :------------ | :-------------------------- |
| POST / DELETE | /api/filesystem/apps/folder |

**URI parameters**

| URI parameter   | Description                                                         |
| :-------------- | :------------------------------------------------------------------ |
| knownfolderid   | (**required**) Target known folder identifier.                      |
| path            | (**required**) Path of the directory to create or delete.           |
| packagefullname | (optional) Package full name when operating in application storage. |

**Request headers**

- None

**Request body**

- None

**Response**

- None

**Status code**

| HTTP status code | Description    |
| :--------------- | :------------- |
| 200              | OK             |
| 400              | Bad request    |
| 404              | Path not found |
| 5XX              | Error codes    |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
