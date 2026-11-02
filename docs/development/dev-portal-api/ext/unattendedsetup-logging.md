# Configure unattended setup logging

**Request**

Sets the action types to log during unattended setup.

| Method | Request URI                  |
| :----- | :--------------------------- |
| POST   | /ext/unattendedsetup/logging |

**URI parameters**

- None

**Request headers**

- Content-Type: application/json

**Request body**

```json
{
  "ActionTypes": string
}
```

**Response**

- None

**Status code**

| HTTP status code | Description              |
| :--------------- | :----------------------- |
| 200              | Logging settings updated |
| 4XX              | Error codes              |
| 5XX              | Error codes              |

**Available device families**

* Xbox

**Credits**
Microsoft
