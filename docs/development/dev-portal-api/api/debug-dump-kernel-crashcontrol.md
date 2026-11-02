### Get bugcheck crash control settings

**Request**

Gets bugcheck crash control settings.

| Method | Request URI                         |
| :----- | :---------------------------------- |
| GET    | /api/debug/dump/kernel/crashcontrol |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

The response contains kernel crash control settings:

```json
{
  "AutoReboot": bool,
  "DumpFile": string,
  "DumpType": int,
  "MinidumpDir": string,
  "Overwrite": bool
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

### Set bugcheck crash control settings

**Request**

Sets bugcheck crash control settings.

| Method | Request URI                         |
| :----- | :---------------------------------- |
| POST   | /api/debug/dump/kernel/crashcontrol |

**URI parameters**

| URI parameter | Description                                                                                   |
| :------------ | :-------------------------------------------------------------------------------------------- |
| autoreboot    | (optional) Boolean string (`true` or `false`) to enable auto-reboot after bugcheck.           |
| dumptype      | (optional) Integer dump type (e.g. 1 for complete dump, 2 for kernel dump, 3 for small dump). |
| maxdumpcount  | (optional) Maximum number of dumps to retain.                                                 |
| overwrite     | (optional) Boolean string indicating whether old dumps should be overwritten.                 |

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
