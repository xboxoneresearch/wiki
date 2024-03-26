# Uploads the contents of the specified folder to the Title Scratch Drive (or to a subfolder within that folder).


**Request**

Method      | Request URI
:------     | :------
POST | /ext/app/packagemanager/era/upload
<br />

**URI parameters**

Parameter      |  Format |  Description
:------     | :-----  | :-----
destinationFolder  | base64-encoded string | Name of the folder to create on the Title Scratch drive. This folder name should be base64-encoded as it may contain path separators if the folder is a subfolder under Title Scratch.

**Request headers**

- None

**Request body**

The request must contain the multi-part conforming HTTP body of the directory contents.

###Response

**Response body**

- Unknown

**Status code**

This API has the following expected status codes.

HTTP status code      | Description
:------     | :-----
200 | Success
4XX | Error codes
5XX | Error codes

**Remarks**

The recommended way to copy a folder to the Title Scratch drive is to use the SMB share via \IP_Address\TitleScratch, or to use the XDK. This RESTful API is intended for use from a browser or when File Explorer is not available.

**Available device families**

* Windows Xbox

**Credits**
Microsoft