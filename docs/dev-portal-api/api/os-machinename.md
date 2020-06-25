### Get the machine name

**Request**

You can get the name of a machine by using the following request format.
 
| Method      | Request URI |
| :------     | :----- |
| GET | /api/os/machinename |


**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response includes the computer name in the following format. 

```json
{"ComputerName": string}
```

**Status code**

This API has the following expected status codes.

| HTTP status code      | Description |
| :------     | :----- |
| 200 | OK |
| 4XX | Error codes |
| 5XX | Error codes |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT