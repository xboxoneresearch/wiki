### Set SSL security state

**Request**

Sets whether the web management connection requires HTTPS or allows HTTP.

| Method | Request URI                |
| :----- | :------------------------- |
| GET    | /api/authorize/setSslState |

**URI parameters**

| URI parameter | Description                                          |
| :------------ | :--------------------------------------------------- |
| sslState      | (**required**) Desired SSL mode (`http` or `https`). |
| remember      | (optional) `true` to save the selection.             |

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
| 302              | Redirected  |
| 5XX              | Error codes |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
