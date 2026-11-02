### Get app content groups

**Request**

Gets content groups for an installed streaming app in dev mode.

| Method | Request URI                           |
| :----- | :------------------------------------ |
| GET    | /api/app/packagemanager/contentgroups |

**URI parameters**

| URI parameter | Description                                                 |
| :------------ | :---------------------------------------------------------- |
| package       | (**required**) Package full name of the streamable package. |

**Request headers**

- None

**Request body**

- None

**Response**

The response includes an array of content groups and their staging status:

```json
{
  "ContentGroups": [
    {
      "Name": string,
      "PercentStaged": int,
      "State": string,
      "Required": bool
    }
  ]
}
```

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

### Set app content groups

**Request**

Sets content group state and percent-staged for a streaming app.

| Method | Request URI                           |
| :----- | :------------------------------------ |
| POST   | /api/app/packagemanager/contentgroups |

**URI parameters**

| URI parameter | Description                                                 |
| :------------ | :---------------------------------------------------------- |
| package       | (**required**) Package full name of the streamable package. |

**Request headers**

- None

**Request body**

```json
{
  "ContentGroups": [
    {
      "Name": string,
      "PercentStaged": int,
      "State": string
    }
  ]
}
```

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
