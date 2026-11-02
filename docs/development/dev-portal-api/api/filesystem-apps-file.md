### Download file inside user's known folders

**Request**

Downloads a file from a known folder or app data.

| Method | Request URI               |
| :----- | :------------------------ |
| GET    | /api/filesystem/apps/file |

**URI parameters**

| URI parameter   | Description                                                          |
| :-------------- | :------------------------------------------------------------------- |
| knownfolderid   | (**required**) ID or name of the target known folder.                |
| filename        | (**required**) Relative file path within the folder.                 |
| packagefullname | (optional) Package full name if accessing application local storage. |

**Request headers**

- None

**Request body**

- None

**Response**

Returns the binary content of the requested file as an attachment.

**Status code**

| HTTP status code | Description    |
| :--------------- | :------------- |
| 200              | OK             |
| 404              | File not found |
| 5XX              | Error codes    |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft

<hr>

### Upload file inside user's known folders

**Request**

Uploads a file to a known folder or app data. Parent directories must already exist.

| Method | Request URI               |
| :----- | :------------------------ |
| POST   | /api/filesystem/apps/file |

**URI parameters**

| URI parameter   | Description                                            |
| :-------------- | :----------------------------------------------------- |
| knownfolderid   | (**required**) ID or name of the target known folder.  |
| filename        | (**required**) Target file name or path.               |
| packagefullname | (optional) Package full name if uploading to app data. |

**Request headers**

- Content-Type: multipart/form-data

**Request body**

Multipart conforming HTTP body containing the file payload.

**Response**

- None

**Status code**

| HTTP status code | Description |
| :--------------- | :---------- |
| 200              | OK          |
| 4XX              | Error codes |
| 5XX              | Error codes |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft

<hr>

### Delete file inside user's known folders

**Request**

Deletes a file from a known folder or app data.

| Method | Request URI               |
| :----- | :------------------------ |
| DELETE | /api/filesystem/apps/file |

**URI parameters**

| URI parameter   | Description                                             |
| :-------------- | :------------------------------------------------------ |
| knownfolderid   | (**required**) ID or name of the target known folder.   |
| filename        | (**required**) Relative path to the file to be deleted. |
| packagefullname | (optional) Package full name if targeting app data.     |

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
| 404              | File not found |
| 5XX              | Error codes    |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
