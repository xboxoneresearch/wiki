### Get running processes

**Request**

Gets running processes and resource usage.

| Method | Request URI                    |
| :----- | :----------------------------- |
| GET    | /api/resourcemanager/processes |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response contains process utilization metrics:

```json
{
  "Processes": [
    {
      "CPUUsage": float,
      "ImageName": string,
      "PackageFullName": string,
      "PageFileUsage": int,
      "ProcessId": int,
      "SessionId": int,
      "ThreadCount": int,
      "VirtualSize": int,
      "WorkingSetSize": int
    }
  ]
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
