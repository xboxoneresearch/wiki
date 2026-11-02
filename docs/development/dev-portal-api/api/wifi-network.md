### Connect or disconnect Wi-Fi network

**Request**

Connects or disconnects a Wi-Fi network on an interface.

| Method | Request URI       |
| :----- | :---------------- |
| POST   | /api/wifi/network |

**URI parameters**

| URI parameter | Description                                                           |
| :------------ | :-------------------------------------------------------------------- |
| interface     | (**required**) Wireless network interface GUID.                       |
| op            | (**required**) Operation type (`connect` or `disconnect`).            |
| ssid          | (**required if op=connect**) SSID of the network to join.             |
| key           | (optional) Pre-shared security key/passphrase for protected networks. |

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
| 400              | Bad request |
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

### Delete Wi-Fi profile

**Request**

Deletes a stored Wi-Fi profile.

| Method | Request URI       |
| :----- | :---------------- |
| DELETE | /api/wifi/network |

**URI parameters**

| URI parameter | Description                                            |
| :------------ | :----------------------------------------------------- |
| interface     | (**required**) Wireless network interface GUID.        |
| profile       | (**required**) Name of the wireless profile to delete. |

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
| 400              | Bad request |
| 5XX              | Error codes |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
