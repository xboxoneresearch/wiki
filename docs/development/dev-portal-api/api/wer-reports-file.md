### Download WER report file

**Request**

Downloads a file attached to a WER report.

| Method | Request URI           |
| :----- | :-------------------- |
| GET    | /api/wer/reports/file |
| GET    | /api/wer/report/file  |

**URI parameters**

| URI parameter | Description                                                    |
| :------------ | :------------------------------------------------------------- |
| user          | (**required**) Username associated with the report.            |
| type          | (**required**) Report type (`queued` or `archived`).           |
| name          | (**required**) Name of the report.                             |
| file          | (**required**) Name of the file inside the report to download. |

**Request headers**

- None

**Request body**

- None

**Response**

Returns the binary file contents as an attachment.

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
