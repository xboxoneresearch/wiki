### Get registry values

**Request**

Gets registry values under a specified key.

| Method | Request URI                |
| :----- | :------------------------- |
| GET    | /api/registryeditor/values |

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
  "Values": [
    {
      "Name": string,
      "Type": string,
      "Value": string
    }
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
