# Export developer settings

**Request**

Exports developer settings to a text file.

| Method | Request URI          |
| :----- | :------------------- |
| GET    | /ext/settings/export |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

Returns a text file attachment (`settings.txt`) containing key-value configuration lines for all developer settings on the console.

**Status code**

| HTTP status code | Description            |
| :--------------- | :--------------------- |
| 200              | Settings file returned |
| 5XX              | Error codes            |

**Available device families**

* Xbox

**Credits**
Microsoft
