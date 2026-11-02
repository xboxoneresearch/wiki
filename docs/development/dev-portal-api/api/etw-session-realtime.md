### Realtime ETW over WebSocket

**Request**

Creates a real-time ETW session over WebSocket.

| Method          | Request URI               |
| :-------------- | :------------------------ |
| GET / WebSocket | /api/etw/session/realtime |

**URI parameters**

- None

**WebSocket control commands**

After opening the WebSocket, send text control strings to configure tracing:

- `provider <GUID|Name> enable [level] [keywords]` - Enables an ETW provider with optional verbosity level and keyword bitmask.
- `provider <GUID|Name> disable` - Disables an ETW provider.
- `provider <GUID|Name> capture` - Requests provider state capture.
- `filterId <ProviderGUID> enable <EventID>` - Filters by specific event ID.
- `filterId <ProviderGUID> disable <EventID>` - Removes event ID filter.
- `filterTaskName <ProviderGUID> enable <TaskName>` - Filters by task name.
- `filterTaskName <ProviderGUID> disable <TaskName>` - Removes task name filter.

**WebSocket received messages**

The server streams JSON records containing decoded ETW events from enabled providers:

```json
{
  "EventID": int,
  "EventName": string,
  "Keyword": string,
  "Level": int,
  "ProviderGUID": string,
  "ProviderName": string,
  "Timestamp": string,
  "Payload": {}
}
```

**Status code**

| HTTP status code | Description                               |
| :--------------- | :---------------------------------------- |
| 101              | Switching Protocols (WebSocket connected) |
| 4XX              | Error codes                               |
| 5XX              | Error codes                               |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
