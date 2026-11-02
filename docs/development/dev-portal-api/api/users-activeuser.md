### Get active user

**Request**

Gets the active logged-in user.

| Method | Request URI           |
| :----- | :-------------------- |
| GET    | /api/users/activeuser |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

```json
{
  "ActiveUser": {
    "DisplayName": string,
    "Email": string,
    "Gamertag": string,
    "UserId": string,
    "UserSid": string
  }
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
