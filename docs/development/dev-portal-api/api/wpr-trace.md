### Start WPR trace

**Request**

Starts a WPR performance trace.

| Method | Request URI    |
| :----- | :------------- |
| POST   | /api/wpr/trace |

**URI parameters**

| URI parameter | Description                                                        |
| :------------ | :----------------------------------------------------------------- |
| profile       | (**required**) Name of the performance recording profile to apply. |

**Request headers**

- None

**Request body**

- None

**Response**

Returns the updated WPR session status:

```json
{
  "Status": string
}
```

**Status code**

| HTTP status code | Description     |
| :--------------- | :-------------- |
| 200              | Tracing started |
| 400              | Bad request     |
| 5XX              | Error codes     |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft

<hr>

### Stop WPR trace

**Request**

Stops a WPR performance trace.

| Method | Request URI    |
| :----- | :------------- |
| GET    | /api/wpr/trace |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

Returns the generated Event Trace Log (`.etl`) file as a download attachment.

**Status code**

| HTTP status code | Description         |
| :--------------- | :------------------ |
| 200              | Trace file returned |
| 400              | No trace running    |
| 5XX              | Error codes         |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

**Credits**
Microsoft
