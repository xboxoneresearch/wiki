### Enumerate WPR trace files

**Request**

Gets saved WPR trace files.

| Method | Request URI         |
| :----- | :------------------ |
| GET    | /api/wpr/tracefiles |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

```json
{
  "Files": [
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
