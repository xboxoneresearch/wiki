### Get device tree

**Request**

Gets the device tree installed on the machine.

| Method | Request URI                |
| :----- | :------------------------- |
| GET    | /api/devicemanager/devices |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response contains the device tree representation:

```json
{
  "DeviceTree": [
    {
      "Class": string,
      "Description": string,
      "ID": string,
      "Manufacturer": string,
      "Name": string,
      "Parent": string,
      "ProblemCode": int,
      "StatusCode": int,
      "Children": []
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
