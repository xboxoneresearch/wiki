### Get app installation status

**Request**

You can get the status of an app installation that is currently in progress by using the following request format.
 
| Method      | Request URI |
| :------     | :----- |
| GET | /api/app/packagemanager/state |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

**Status code**

This API has the following expected status codes.

|  HTTP status code      | Description | 
| :------     | :----- |
| 200 | The result of the last deployment |
| 204 | The installation is running |
| 404 | No installation action was found |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT
**Credits**
Microsoft
