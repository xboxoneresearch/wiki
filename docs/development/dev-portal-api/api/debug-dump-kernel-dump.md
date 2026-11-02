### Download bugcheck dump

**Request**

Downloads a bugcheck dump file.

| Method | Request URI                 |
| :----- | :-------------------------- |
| GET    | /api/debug/dump/kernel/dump |

**URI parameters**

| URI parameter | Description                                                                                         |
| :------------ | :-------------------------------------------------------------------------------------------------- |
| filename      | (**required**) Name of the dump file to download (obtained from `/api/debug/dump/kernel/dumplist`). |

**Request headers**

- None

**Request body**

- None

**Response**

Returns the binary memory dump file (inspectable with WinDbg).

**Status code**

| HTTP status code | Description    |
| :--------------- | :------------- |
| 200              | File returned  |
| 404              | File not found |
| 5XX              | Error codes    |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
