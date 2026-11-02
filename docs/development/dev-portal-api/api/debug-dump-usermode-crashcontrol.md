### Get sideloaded app crash dump settings

**Request**

Gets crash dump settings for a sideloaded app.

| Method | Request URI                           |
| :----- | :------------------------------------ |
| GET    | /api/debug/dump/usermode/crashcontrol |

**URI parameters**

| URI parameter   | Description                                                 |
| :-------------- | :---------------------------------------------------------- |
| packageFullname | (**required**) Package full name of the target application. |

**Request headers**

- None

**Request body**

- None

**Response**

```json
{
  "DumpType": int,
  "Enabled": bool,
  "MaxDumpCount": int,
  "PackageFullName": string
}
```

**Status code**

| HTTP status code | Description |
| :--------------- | :---------- |
| 200              | OK          |
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

### Enable sideloaded app crash dumps

**Request**

Enables crash dump collection for a sideloaded app.

| Method | Request URI                           |
| :----- | :------------------------------------ |
| POST   | /api/debug/dump/usermode/crashcontrol |

**URI parameters**

| URI parameter   | Description                                                 |
| :-------------- | :---------------------------------------------------------- |
| packageFullname | (**required**) Package full name of the target application. |
| dumpType        | (optional) Integer dump type (1 = Mini, 2 = Full).          |

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

<hr>

### Disable sideloaded app crash dumps

**Request**

Disables crash dump collection for a sideloaded app.

| Method | Request URI                           |
| :----- | :------------------------------------ |
| DELETE | /api/debug/dump/usermode/crashcontrol |

**URI parameters**

| URI parameter   | Description                                                 |
| :-------------- | :---------------------------------------------------------- |
| packageFullname | (**required**) Package full name of the target application. |

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
