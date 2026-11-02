### Get registry root keys

**Request**

Gets registry root keys.

| Method | Request URI                  |
| :----- | :--------------------------- |
| GET    | /api/registryeditor/rootkeys |

**URI parameters**

| URI parameter | Description                                                        |
| :------------ | :----------------------------------------------------------------- |
| containerId   | (optional) Container ID if querying a containerized registry hive. |

**Request headers**

- None

**Request body**

- None

**Response**

```json
{
  "RootKeys": [
    "HKEY_CLASSES_ROOT",
    "HKEY_CURRENT_CONFIG",
    "HKEY_CURRENT_USER",
    "HKEY_LOCAL_MACHINE",
    "HKEY_USERS"
  ]
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
