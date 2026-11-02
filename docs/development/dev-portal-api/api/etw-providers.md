### Registered ETW providers

**Request**

Gets registered ETW providers.

| Method | Request URI        |
| :----- | :----------------- |
| GET    | /api/etw/providers |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response contains a list of registered ETW providers with friendly names and GUIDs:

```json
{
  "Providers": [
    {
      "GUID": string,
      "Name": string
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

<hr>

### Custom ETW providers

**Request**

Gets custom ETW providers.

| Method | Request URI              |
| :----- | :----------------------- |
| GET    | /api/etw/customproviders |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response contains a list of custom ETW providers:

```json
{
  "Providers": [
    {
      "GUID": string,
      "Name": string
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
