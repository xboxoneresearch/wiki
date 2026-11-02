### Get known folders

**Request**

Gets accessible known folders on the device.

| Method | Request URI                       |
| :----- | :-------------------------------- |
| GET    | /api/filesystem/apps/knownfolders |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response includes an array of known folder names:

```json
{
  "KnownFolders": [
    string
  ]
}
```

Expected folder names include:
- `CameraRoll`
- `Documents`
- `InstalledAppData`
- `LocalAppData`
- `Music`
- `Pictures`
- `SavedPictures`
- `Videos`

**Status code**

| HTTP status code | Description |
| :--------------- | :---------- |
| 200              | OK          |
| 5XX              | Error codes |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
