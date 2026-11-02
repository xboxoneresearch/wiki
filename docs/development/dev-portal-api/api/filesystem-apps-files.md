### Get files

**Request**

Gets files inside a known folder or app data directory.

| Method | Request URI                |
| :----- | :------------------------- |
| GET    | /api/filesystem/apps/files |

**URI parameters**

| URI parameter   | Description                                                                                                             |
| :-------------- | :---------------------------------------------------------------------------------------------------------------------- |
| knownfolderid   | (**required**) Known folder identifier (e.g. `CameraRoll`, `Documents`, `LocalAppData`, `Music`, `Pictures`, `Videos`). |
| path            | (optional) Relative subfolder path within the known folder.                                                             |
| packagefullname | (optional) Package full name when targeting an app's LocalAppData folder.                                               |

**Request headers**

- None

**Request body**

- None

**Response**

The response includes the contents of the directory:

```json
{
  "Items": [
    {
      "CurrentDir": string,
      "Date": string,
      "FileSize": int,
      "Id": string,
      "Name": string,
      "SubPath": string,
      "Type": int
    }
  ]
}
```

**Status code**

| HTTP status code | Description      |
| :--------------- | :--------------- |
| 200              | OK               |
| 404              | Folder not found |
| 5XX              | Error codes      |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
