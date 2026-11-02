### Check for kernel bugcheck

**Request**

Checks if a bugcheck has occurred.

| Method | Request URI                     |
| :----- | :------------------------------ |
| GET    | /api/debug/dump/kernel/bugcheck |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

Returns whether a bugcheck occurred and associated summary information:

```json
{
  "BugCheckOccurred": bool,
  "BugCheckCode": string,
  "Parameter1": string,
  "Parameter2": string,
  "Parameter3": string,
  "Parameter4": string
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
