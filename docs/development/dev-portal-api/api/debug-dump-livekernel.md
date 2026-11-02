### Live kernel dump

**Request**

Collects a live kernel dump.

| Method | Request URI                |
| :----- | :------------------------- |
| GET    | /api/debug/dump/livekernel |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

Returns the binary live kernel dump file (inspectable in WinDbg).

**Status code**

| HTTP status code | Description                 |
| :--------------- | :-------------------------- |
| 200              | Dump generated and returned |
| 5XX              | Error codes                 |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
