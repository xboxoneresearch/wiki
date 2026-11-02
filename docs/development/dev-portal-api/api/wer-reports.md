### List WER reports

**Request**

Gets WER reports.

| Method | Request URI      |
| :----- | :--------------- |
| GET    | /api/wer/reports |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response includes lists of queued and archived error reports:

```json
{
  "ArchivedReports": [
    {
      "CreationTime": string,
      "Name": string,
      "ReportType": string,
      "User": string
    }
  ],
  "QueuedReports": [
    {
      "CreationTime": string,
      "Name": string,
      "ReportType": string,
      "User": string
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
