# Check system update policy

**Request**

Checks if switching to an update group will downgrade the OS and returns the build version.

| Method | Request URI       |
| :----- | :---------------- |
| GET    | /ext/update/check |

**URI parameters**

| URI parameter | Description                                                                              |
| :------------ | :--------------------------------------------------------------------------------------- |
| DesiredGroup  | (**required**) Target update ring or group name (e.g. `Release`, `Preview`, `NoUpdate`). |

**Request headers**

- None

**Request body**

- None

**Response**

The response contains update eligibility details:

```json
{
  "IsDowngrade": bool,
  "VersionId": string
}
```

**Status code**

| HTTP status code | Description |
| :--------------- | :---------- |
| 200              | OK          |
| 4XX              | Error codes |
| 5XX              | Error codes |

**Available device families**

* Xbox

**Credits**
Microsoft
