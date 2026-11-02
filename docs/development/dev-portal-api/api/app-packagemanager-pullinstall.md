### Pull install an app

**Request**

Starts a pull install of an app package from a remote URI.

| Method | Request URI                         |
| :----- | :---------------------------------- |
| POST   | /api/app/packagemanager/pullinstall |

**URI parameters**

- None

**Request headers**

- Content-Type: application/json

**Request body**

```json
{
  "PackageUri": string,
  "Dependencies": [string],
  "CertificateUri": string,
  "ForceUpdateFromAnyVersion": bool
}
```

**Response**

- None

**Status code**

| HTTP status code | Description          |
| :--------------- | :------------------- |
| 200              | Deployment initiated |
| 202              | Accepted             |
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
