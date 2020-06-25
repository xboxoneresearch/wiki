### Install an app

**Request**

You can install an app by using the following request format.

| Method      | Request URI |
| :------     | :----- |
| POST | /api/appx/packagemanager/package |

**URI parameters**

You can specify the following additional parameters on the request URI:

| URI parameter | Description |
| :------          | :------ |
| package   | (**required**) The file name of the package to be installed. |

**Request headers**

- None

**Request body**

- The .appx or .appxbundle file, as well as any dependencies the app requires. 
- The certificate used to sign the app, if the device is IoT or Windows Desktop. Other platforms do not require the certificate. 

**Response**

**Status code**

This API has the following expected status codes.

|  HTTP status code      | Description | 
| :------     | :----- |
| 200 | Deploy request accepted and being processed |
| 4XX | Error codes |
| 5XX | Error codes |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

<hr>

### Install a related set

**Request**

You can install a [related set](https://blogs.msdn.microsoft.com/appinstaller/2017/05/12/tooling-to-create-a-related-set/) by using the following request format.

| Method      | Request URI |
| :------     | :------ |
| POST | /api/appx/packagemanager/package |

**URI parameters**

You can specify the following additional parameters on the request URI:

| URI parameter | Description |
| :------          | :------ |
| package   | (**required**) The file names of the packages to be installed. |

**Request headers**

- None

**Request body** 
- Add ".opt" to the optional package file names when specifying them as a parameter, like so: "foo.appx.opt" or "bar.appxbundle.opt". 
- The .appx or .appxbundle file, as well as any dependencies the app requires. 
- The certificate used to sign the app, if the device is IoT or Windows Desktop. Other platforms do not require the certificate. 

**Response**

**Status code**

This API has the following expected status codes.

|  HTTP status code      | Description | 
| :------     | :----- |
| 200 | Deploy request accepted and being processed |
| 4XX | Error codes |
| 5XX | Error codes |

**Available device families**

* Windows Mobile
* Windows Desktop
* Xbox
* HoloLens
* IoT

<hr>

**Notes**

This is appears to be a duplicate of `/api/app/packagemanager/package`