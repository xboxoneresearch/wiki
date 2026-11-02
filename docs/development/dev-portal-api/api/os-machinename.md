### Get the machine name

**Request**

Gets the machine name.

| Method | Request URI         |
| :----- | :------------------ |
| GET    | /api/os/machinename |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response includes the computer name in the following format:

```json
{"ComputerName": string}
```

**Status code**

| HTTP status code | Description |
| :--------------- | :---------- |
| 200              | OK          |
| 4XX              | Error codes |
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

### Set machine name

**Request**

Sets the machine name.

| Method | Request URI         |
| :----- | :------------------ |
| POST   | /api/os/machinename |

**URI parameters**

| URI parameter | Description                                |
| :------------ | :----------------------------------------- |
| name          | (**required**) New machine name to set to. |

**Request headers**

- None

**Request body**

- None

**Response**

- None

**Status code**

| HTTP status code | Description |
| :--------------- | :---------- |
| 200              | OK          |
| 4XX              | Error codes |
| 5XX              | Error codes |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
