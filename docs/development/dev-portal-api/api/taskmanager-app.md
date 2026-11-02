### Start an app

**Request**

Starts a modern app.

| Method | Request URI          |
| :----- | :------------------- |
| POST   | /api/taskmanager/app |

**URI parameters**

| URI parameter | Description                                                                                        |
| :------------ | :------------------------------------------------------------------------------------------------- |
| appid         | (**required**) Base64-encoded PRAID (Application User Model ID / Relative ID) of the app to start. |
| package       | (**required**) Base64-encoded Package Full Name of the application package.                        |

**Request headers**

- None

**Request body**

- None

**Response**

- None

**Status code**

| HTTP status code | Description  |
| :--------------- | :----------- |
| 200              | App launched |
| 4XX              | Error codes  |
| 5XX              | Error codes  |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft

<hr>

### Stop an app

**Request**

Stops a modern app.

| Method | Request URI          |
| :----- | :------------------- |
| DELETE | /api/taskmanager/app |

**URI parameters**

| URI parameter | Description                                                                      |
| :------------ | :------------------------------------------------------------------------------- |
| package       | (**required**) Base64-encoded Package Full Name of the target application.       |
| forcestop     | (optional) Set to `true` or `yes` to force stop all child processes immediately. |

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
