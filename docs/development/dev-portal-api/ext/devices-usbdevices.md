# USB Device Tree API reference

**Request**

Gets connected USB controllers, hubs, and devices on the console.

| Method | Request URI             |
| :----- | :---------------------- |
| GET    | /ext/devices/usbdevices |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response returns a hierarchical USB device tree structure:

```json
{
  "root": {
    "ID": string,
    "Description": string,
    "FriendlyName": string,
    "children": [
      {
        "ID": string,
        "Description": string,
        "FriendlyName": string,
        "PortLocation": int,
        "HubInfo": {
          "NumberofPorts": int,
          "PowerSwitching": string,
          "CompoundDevice": string,
          "Over-currentProtection": string
        },
        "Ports": [
          {
            "Port": int,
            "DeviceInformation": int
          }
        ],
        "children": []
      }
    ]
  }
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
