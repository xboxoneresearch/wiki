### Register an app in a loose folder

**Request**

You can register an app in a loose folder by using the following request format.

| Method      | Request URI |
| :------     | :----- |
| POST | /api/appx/packagemanager/networkapp |

**URI parameters**

- None

**Request headers**

- None

**Request body**

```json
{
    "mainpackage" :
    {
        "networkshare" : "\\some\share\path",
        "username" : "optional_username",
        "password" : "optional_password"
    }
}
```

**Response**

**Status code**

This API has the following expected status codes.

|  HTTP status code      | Description | 
| :------     | :----- |
| 200 | Deploy request accepted and being processed |
| 4XX | Error codes |
| 5XX | Error codes |

**Available device families**

* Windows Desktop
* Xbox
* HoloLens
* IoT

<hr>

### Register a related set in loose file folders

**Request**

You can register a [related set](https://blogs.msdn.microsoft.com/appinstaller/2017/05/12/tooling-to-create-a-related-set/) in loose folders by using the following request format.

| Method      | Request URI |
| :------     | :----- |
| POST | /api/appx/packagemanager/networkapp |

**URI parameters**

- None

**Request headers**

- None

**Request body**

```json
{
    "mainpackage" :
    {
        "networkshare" : "\\some\share\path",
        "username" : "optional_username",
        "password" : "optional_password"
    },
    "optionalpackages" :
    [
        {
            "networkshare" : "\\some\share\path2",
            "username" : "optional_username2",
            "password" : "optional_password2"
        },
        ...
    ]
}
```

**Response**

**Status code**

This API has the following expected status codes.

|  HTTP status code      | Description | 
| :------     | :----- |
| 200 | Deploy request accepted and being processed |
| 4XX | Error codes |
| 5XX | Error codes |

**Available device families**

* Windows Desktop
* Xbox
* HoloLens
* IoT

**Note**
Appears to be a duplicate of `/api/app/packagemanager/networkapp`
**Credits**
Microsoft
