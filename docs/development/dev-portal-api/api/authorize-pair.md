### Complete device pairing

**Request**

Completes device pairing and sets the administrator username and password.

| Method | Request URI         |
| :----- | :------------------ |
| POST   | /api/authorize/pair |

**URI parameters**

| URI parameter | Description                                     |
| :------------ | :---------------------------------------------- |
| pin           | (**required**) The PIN displayed on the device. |
| username      | (**required**) The user name to set.            |
| password      | (**required**) The password to set.             |

**Request headers**

- None

**Request body**

- None

**Response**

- None

**Status code**

| HTTP status code | Description               |
| :--------------- | :------------------------ |
| 200              | Device pairing successful |
| 400              | Invalid PIN or request    |
| 403              | Forbidden                 |
| 5XX              | Error codes               |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
