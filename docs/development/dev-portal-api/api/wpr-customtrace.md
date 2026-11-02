### Custom profile tracing

**Request**

Starts performance tracing using a custom profile.

| Method | Request URI          |
| :----- | :------------------- |
| POST   | /api/wpr/customtrace |

**URI parameters**

- None

**Request headers**

- Content-Type: multipart/form-data

**Request body**

Multipart conforming HTTP body containing the `.wprp` custom profile file.

**Response**

Returns the WPR session status:

```json
{
  "Status": string
}
```

**Status code**

| HTTP status code | Description                         |
| :--------------- | :---------------------------------- |
| 200              | Tracing started with custom profile |
| 400              | Bad request or invalid profile      |
| 5XX              | Error codes                         |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
