# Game Event Data API reference

**Request**

Streams real-time ETW game events over a WebSocket connection.

| Method    | Request URI        |
| :-------- | :----------------- |
| WebSocket | /ext/gameeventdata |

**URI parameters**

- None

**Client messages**

After establishing the WebSocket connection, the client can send filter commands to specify which game titles or event providers to trace.

**Server messages**

The server streams real-time JSON event packets containing event name, occurrence count, associated game title, and timestamp:

```json
[
  {
    "EventName": string,
    "Count": int,
    "Title": string,
    "Timestamp": string
  }
]
```

**Status code**

| HTTP status code | Description                               |
| :--------------- | :---------------------------------------- |
| 101              | Switching Protocols (WebSocket connected) |
| 5XX              | Error codes                               |

**Available device families**

* Xbox

**Credits**
Microsoft
