### Get tools

**Request**

Gets the list of installed Device Portal tools.

| Method | Request URI |
| :----- | :---------- |
| GET    | /core/tools |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

Returns registered tools:

```json
{
  "Tools": [
    {
      "Id": string,
      "Name": string,
      "Uri": string
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
