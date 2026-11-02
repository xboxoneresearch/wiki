# Import developer settings

**Request**

Imports developer settings from a settings file.

| Method | Request URI          |
| :----- | :------------------- |
| POST   | /ext/settings/import |

**URI parameters**

- None

**Request headers**

- Content-Type: multipart/form-data (or text/plain)

**Request body**

The settings file containing developer setting definitions to be applied to the console.

**Response**

- None

**Status code**

| HTTP status code | Description                                |
| :--------------- | :----------------------------------------- |
| 200              | Settings successfully imported and applied |
| 4XX              | Error codes                                |
| 5XX              | Error codes                                |

**Available device families**

* Xbox

**Credits**
Microsoft
