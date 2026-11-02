# Xbox Live and Console Status API reference

**Request**

Streams real-time console status (IP address, friendly name, active user, sandbox, dev mode) over a WebSocket connection.

| Method    | Request URI |
| :-------- | :---------- |
| WebSocket | /ext/status |

**URI parameters**

- None

**Server messages**

The server pushes real-time status updates whenever console state, active user, network, or developer mode configuration changes:

```json
{
  "ConsoleType": string,
  "DevMode": string,
  "FriendlyName": string,
  "IpAddress": string,
  "OsEdition": string,
  "OsVersion": string,
  "Sandbox": string,
  "User": string
}
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
