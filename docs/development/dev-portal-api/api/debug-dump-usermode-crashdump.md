### Download sideloaded app crash dump

**Request**

Downloads a crash dump for a sideloaded app.

| Method | Request URI                        |
| :----- | :--------------------------------- |
| GET    | /api/debug/dump/usermode/crashdump |

**URI parameters**

| URI parameter   | Description                                          |
| :-------------- | :--------------------------------------------------- |
| packageFullname | (**required**) Package full name of the application. |
| fileName        | (**required**) Dump file name.                       |

**Request headers**

- None

**Request body**

- None

**Response**

Returns the binary `.dmp` file (inspectable in WinDbg or Visual Studio).

**Status code**

| HTTP status code | Description        |
| :--------------- | :----------------- |
| 200              | Dump file returned |
| 404              | File not found     |
| 5XX              | Error codes        |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft

<hr>

### Delete sideloaded app crash dump

**Request**

Deletes a crash dump for a sideloaded app.

| Method | Request URI                        |
| :----- | :--------------------------------- |
| DELETE | /api/debug/dump/usermode/crashdump |

**URI parameters**

| URI parameter   | Description                                          |
| :-------------- | :--------------------------------------------------- |
| packageFullname | (**required**) Package full name of the application. |
| fileName        | (**required**) Dump file name to delete.             |

**Request headers**

- None

**Request body**

- None

**Response**

- None

**Status code**

| HTTP status code | Description |
| :--------------- | :---------- |
| 200              | OK          |
| 4XX              | Error codes |
| 5XX              | Error codes |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
