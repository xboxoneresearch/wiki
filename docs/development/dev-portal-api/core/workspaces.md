### Get workspaces

**Request**

Gets workspace definitions and tool layout.

| Method | Request URI      |
| :----- | :--------------- |
| GET    | /core/workspaces |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

Returns configured workspaces:

```json
{
  "Workspaces": [
    {
      "Id": string,
      "Name": string,
      "Tools": []
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
