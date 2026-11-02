### Enumerate files in a WER report

**Request**

Gets files attached to a WER report.

| Method | Request URI            |
| :----- | :--------------------- |
| GET    | /api/wer/reports/files |
| GET    | /api/wer/report/files  |

**URI parameters**

| URI parameter | Description                                                |
| :------------ | :--------------------------------------------------------- |
| user          | (**required**) Target user account for the report.         |
| type          | (**required**) Report queue type (`queued` or `archived`). |
| name          | (**required**) Name/identifier of the report.              |

**Request headers**

- None

**Request body**

- None

**Response**

The response lists files contained within the report:

```json
{
  "Files": [
    string
  ]
}
```

**Status code**

| HTTP status code | Description      |
| :--------------- | :--------------- |
| 200              | OK               |
| 404              | Report not found |
| 5XX              | Error codes      |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
