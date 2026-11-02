# Provides access to the boot script on the target Xbox One development console.

## Deletes the boot script on the target Xbox One development console.

**Request**

| Method | Request URI                  |
| :----- | :--------------------------- |
| DELETE | /ext/unattendedsetup/default |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

- None

**Status code**

This API has the following expected status codes.

| HTTP status code | Description |
| :--------------- | :---------- |
| 200              | Success     |
| 4XX              | Error codes |
| 5XX              | Error codes |

## Retrieves the boot script on the target Xbox One development console

**Request**

| Method | Request URI                  |
| :----- | :--------------------------- |
| GET    | /ext/unattendedsetup/default |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

If the call is successful, the service will return the script file as a multi-part conforming HTTP body.

**Status code**

This API has the following expected status codes.

| HTTP status code | Description |
| :--------------- | :---------- |
| 204              | Success     |
| 4XX              | Error codes |
| 5XX              | Error codes |

## Runs the boot script on the target Xbox One development console.

**Request**

| Method | Request URI                  |
| :----- | :--------------------------- |
| POST   | /ext/unattendedsetup/default |

**URI parameters**

- None

**Request headers**

- None

**Request body**

- None

**Response**

- None

**Status code**

This API has the following expected status codes.

| HTTP status code | Description |
| :--------------- | :---------- |
| 204              | Success     |
| 4XX              | Error codes |
| 5XX              | Error codes |

**Available device families**

* Xbox

**Credits**
Microsoft
