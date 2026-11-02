### Get system performance

**Request**

Gets system performance statistics (or streams over WebSocket).

| Method          | Request URI                     |
| :-------------- | :------------------------------ |
| GET / WebSocket | /api/resourcemanager/systemperf |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response contains system performance counters:

```json
{
  "Cpu": {
    "TotalCycles": int,
    "KernelCycles": int,
    "UserCycles": int
  },
  "Gpu": {
    "AdapterMemoryUsed": int,
    "DedicatedMemoryUsed": int,
    "SharedMemoryUsed": int
  },
  "Memory": {
    "AvailablePages": int,
    "CommitLimit": int,
    "CommittedPages": int,
    "PageSize": int,
    "TotalPhysicalPages": int
  },
  "Network": {
    "BytesIn": int,
    "BytesOut": int
  },
  "IO": {
    "ReadTransferCount": int,
    "WriteTransferCount": int,
    "OtherTransferCount": int
  }
}
```

**Status code**

| HTTP status code | Description                     |
| :--------------- | :------------------------------ |
| 200              | OK                              |
| 101              | Switching Protocols (WebSocket) |
| 5XX              | Error codes                     |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
