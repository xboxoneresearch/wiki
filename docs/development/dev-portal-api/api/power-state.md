### Get power state

**Request**

Checks if the system is in a low-power state.

| Method | Request URI      |
| :----- | :--------------- |
| GET    | /api/power/state |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

```json
{
  "LowPowerState": bool
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
