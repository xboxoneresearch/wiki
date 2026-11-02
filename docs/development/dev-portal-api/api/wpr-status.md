### WPR tracing status

**Request**

Gets the status of the WPR session.

| Method | Request URI     |
| :----- | :-------------- |
| GET    | /api/wpr/status |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response details active tracing session state:

```json
{
  "Profiles": [
    string
  ],
  "Status": string
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
