### Enumerate Wi-Fi networks

**Request**

Scans for Wi-Fi networks on a wireless interface.

| Method | Request URI        |
| :----- | :----------------- |
| GET    | /api/wifi/networks |

**URI parameters**

| URI parameter | Description                                     |
| :------------ | :---------------------------------------------- |
| interface     | (**required**) Wireless network interface GUID. |

**Request headers**

- None

**Request body**

- None

**Response**

The response lists wireless networks discovered in scan range:

```json
{
  "Networks": [
    {
      "Authentication": string,
      "Channel": int,
      "Encryption": string,
      "ProfileName": string,
      "SSID": string,
      "SignalQuality": int
    }
  ]
}
```

**Status code**

| HTTP status code | Description |
| :--------------- | :---------- |
| 200              | OK          |
| 400              | Bad request |
| 5XX              | Error codes |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
