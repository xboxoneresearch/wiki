### Get operating system information

**Request**

Gets operating system information.

| Method | Request URI  |
| :----- | :----------- |
| GET    | /api/os/info |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response includes operating system version, edition, and build details:

```json
{
  "ComputerName": string,
  "Language": string,
  "OsEdition": string,
  "OsEditionId": int,
  "OsName": string,
  "OsVersion": string,
  "Platform": string
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
