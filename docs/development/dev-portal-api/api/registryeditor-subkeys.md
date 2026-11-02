### Get registry subkeys

**Request**

Gets registry subkeys under a specified path.

| Method | Request URI                 |
| :----- | :-------------------------- |
| GET    | /api/registryeditor/subkeys |

**URI parameters**

| URI parameter | Description                                                   |
| :------------ | :------------------------------------------------------------ |
| rootkey       | (**required**) The root key hive (e.g. `HKEY_LOCAL_MACHINE`). |
| regkey        | (optional) Subkey path under the root key.                    |
| containerId   | (optional) Target container ID.                               |

**Request headers**

- None

**Request body**

- None

**Response**

```json
{
  "SubKeys": [
    string
  ]
}
```

**Status code**

| HTTP status code | Description   |
| :--------------- | :------------ |
| 200              | OK            |
| 404              | Key not found |
| 5XX              | Error codes   |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
