### Download deployment certificate

**Request**

Downloads the root certificate used for app validation.

| Method | Request URI                         |
| :----- | :---------------------------------- |
| GET    | /api/app/packagemanager/certificate |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

Returns the binary certificate file (DER encoded `.cer`) as an attachment.

**Status code**

| HTTP status code | Description          |
| :--------------- | :------------------- |
| 200              | Certificate returned |
| 4XX              | Error codes          |
| 5XX              | Error codes          |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
