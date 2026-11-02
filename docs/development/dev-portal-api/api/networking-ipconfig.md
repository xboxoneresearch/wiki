### ipconfig

**Request**

Gets the current IP and network configuration.

| Method | Request URI              |
| :----- | :----------------------- |
| GET    | /api/networking/ipconfig |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response contains detailed network adapter and addressing configuration:

```json
{
  "Adapters": [
    {
      "Description": string,
      "DHCP": {
        "LeaseExpires": int,
        "LeaseObtained": int
      },
      "Gateways": [
        string
      ],
      "HardwareAddress": string,
      "Index": int,
      "IpAddresses": [
        string
      ],
      "Name": string,
      "SubnetMasks": [
        string
      ],
      "Type": string
    }
  ]
}
```

**Status code**

| HTTP status code | Description           |
| :--------------- | :-------------------- |
| 200              | OK                    |
| 500              | Internal server error |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
