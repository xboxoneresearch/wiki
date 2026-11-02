### Change app lifecycle state

**Request**

Suspends or resumes a modern app.

| Method | Request URI                |
| :----- | :------------------------- |
| POST   | /api/taskmanager/app/state |

**URI parameters**

| URI parameter | Description                                                                |
| :------------ | :------------------------------------------------------------------------- |
| package       | (**required**) Base64-encoded Package Full Name of the target application. |
| state         | (**required**) Target lifecycle state: `suspend` or `resume`.              |

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
