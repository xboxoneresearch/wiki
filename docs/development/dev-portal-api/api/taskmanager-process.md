### Stop process

**Request**

Terminates a process by PID.

| Method | Request URI              |
| :----- | :----------------------- |
| DELETE | /api/taskmanager/process |

**URI parameters**

| URI parameter | Description                                                                       |
| :------------ | :-------------------------------------------------------------------------------- |
| pid           | (**required**) Process ID of the process to terminate.                            |
| containerId   | (optional) Identifier of the container if running in a containerized environment. |

**Request headers**

- None

**Request body**

- None

**Response**

- None

**Status code**

| HTTP status code | Description        |
| :--------------- | :----------------- |
| 200              | Process terminated |
| 404              | Process not found  |
| 5XX              | Error codes        |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
