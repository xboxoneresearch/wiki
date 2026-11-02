### Live process dump

**Request**

Collects a live process dump.

| Method | Request URI                   |
| :----- | :---------------------------- |
| GET    | /api/debug/dump/usermode/live |

**URI parameters**

| URI parameter | Description                                                                     |
| :------------ | :------------------------------------------------------------------------------ |
| pid           | (**required**) Target process ID.                                               |
| containerId   | (optional) Container ID if the process is running inside an isolated container. |

**Request headers**

- None

**Request body**

- None

**Response**

Returns the binary memory dump file (inspectable in Visual Studio or WinDbg).

**Status code**

| HTTP status code | Description           |
| :--------------- | :-------------------- |
| 200              | Process dump returned |
| 404              | Process not found     |
| 5XX              | Error codes           |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
