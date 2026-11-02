# Retrieve remote unattended setup script

**Request**

Downloads the unattended setup script from the console.

| Method | Request URI                 |
| :----- | :-------------------------- |
| POST   | /ext/unattendedsetup/remote |

**URI parameters**

- None

**Request headers**

- Content-Type: application/json

**Request body**

- None

**Response**

The response contains the script text contents:

```json
{
  "Contents": string
}
```

**Status code**

| HTTP status code | Description              |
| :--------------- | :----------------------- |
| 200              | Script contents returned |
| 4XX              | Error codes              |
| 5XX              | Error codes              |

**Available device families**

* Xbox

**Credits**
Microsoft
