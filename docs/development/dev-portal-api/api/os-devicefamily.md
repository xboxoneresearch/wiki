### Get device family

**Request**

Gets the OS device family.

| Method | Request URI          |
| :----- | :------------------- |
| GET    | /api/os/devicefamily |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response contains the device family name (e.g. `Windows.Xbox`, `Windows.Desktop`, `Windows.Mobile`):

```json
{
  "DeviceType": string
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
