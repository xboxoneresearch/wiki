### Enumerate Wi-Fi interfaces

**Request**

Gets wireless network interfaces.

| Method | Request URI          |
| :----- | :------------------- |
| GET    | /api/wifi/interfaces |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response contains wireless interface adapters and state:

```json
{
  "Interfaces": [
    {
      "Description": string,
      "GUID": string,
      "State": string
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
