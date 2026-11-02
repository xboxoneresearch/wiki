### Download WPR trace file

**Request**

Downloads a saved WPR trace file.

| Method | Request URI        |
| :----- | :----------------- |
| GET    | /api/wpr/tracefile |

**URI parameters**

| URI parameter | Description                                        |
| :------------ | :------------------------------------------------- |
| filename      | (**required**) Name of the trace file to download. |

**Request headers**

- None

**Request body**

- None

**Response**

Returns the requested `.etl` trace file.

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
