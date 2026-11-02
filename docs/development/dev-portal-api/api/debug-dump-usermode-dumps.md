### Sideloaded apps crash dump list

**Request**

Gets all crash dumps for sideloaded apps.

| Method | Request URI                    |
| :----- | :----------------------------- |
| GET    | /api/debug/dump/usermode/dumps |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response contains crash dumps grouped by application package:

```json
{
  "CrashDumps": [
    {
      "PackageFullName": string,
      "Dumps": [
        {
          "FileName": string,
          "FileSize": int,
          "Date": string
        }
      ]
    }
  ]
}
```

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
