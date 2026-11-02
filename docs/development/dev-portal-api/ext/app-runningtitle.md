# Get currently running title

**Request**

Gets the Package Full Name of the currently running foreground title.

| Method | Request URI           |
| :----- | :-------------------- |
| GET    | /ext/app/runningtitle |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response contains the Package Full Name of the running title, or an empty string if no title is active:

```json
{
  "PackageFullName": string
}
```

**Status code**

| HTTP status code | Description |
| :--------------- | :---------- |
| 200              | OK          |
| 5XX              | Error codes |

**Available device families**

* Xbox

**Credits**
Microsoft
