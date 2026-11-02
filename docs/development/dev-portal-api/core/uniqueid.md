### Get unique ID

**Request**

Gets a unique client session ID.

| Method | Request URI    |
| :----- | :------------- |
| GET    | /core/uniqueId |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

```json
{
  "UniqueId": string
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
