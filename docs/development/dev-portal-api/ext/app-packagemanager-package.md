# Uninstall an application package

**Request**

Uninstalls an app package from the console.

| Method | Request URI                     |
| :----- | :------------------------------ |
| DELETE | /ext/app/packagemanager/package |

**URI parameters**

| URI parameter | Description                                                                  |
| :------------ | :--------------------------------------------------------------------------- |
| package       | (**required**) The package full name of the target application to uninstall. |

**Request headers**

- None

**Request body**

- None

**Response**

- None

**Status code**

| HTTP status code | Description                                      |
| :--------------- | :----------------------------------------------- |
| 200              | Package uninstall request accepted and processed |
| 4XX              | Error codes                                      |
| 5XX              | Error codes                                      |

**Available device families**

* Xbox

**Credits**
Microsoft
