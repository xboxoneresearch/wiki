### Get bugcheck dumps list

**Request**

Gets the list of bugcheck dump files.

| Method | Request URI                     |
| :----- | :------------------------------ |
| GET    | /api/debug/dump/kernel/dumplist |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response contains a list of available crash dump files:

```json
{
  "Dumps": [
    {
      "Date": string,
      "FileName": string,
      "FileSize": int
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
