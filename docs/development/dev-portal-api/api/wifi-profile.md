### Delete Wi-Fi network profile

**Request**

Deletes a stored Wi-Fi profile.

| Method | Request URI       |
| :----- | :---------------- |
| DELETE | /api/wifi/profile |

**URI parameters**

| URI parameter | Description                                 |
| :------------ | :------------------------------------------ |
| interface     | (**required**) Network interface GUID.      |
| profile       | (**required**) Base64-encoded profile name. |

**Request headers**

- None

**Request body**

- None

**Response**

- None

**Status code**

| HTTP status code | Description     |
| :--------------- | :-------------- |
| 200              | Profile deleted |
| 400              | Bad request     |
| 5XX              | Error codes     |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
