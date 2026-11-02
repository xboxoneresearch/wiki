### IPv4 configuration

**Request**

Gets IPv4 settings for network adapters.

| Method | Request URI                |
| :----- | :------------------------- |
| GET    | /api/networking/ipV4config |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

```json
{
  "IPv4Configuration": [
    {
      "AdapterName": string,
      "IPAddress": string,
      "SubnetMask": string,
      "DefaultGateway": string,
      "IsDhcpEnabled": bool
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
