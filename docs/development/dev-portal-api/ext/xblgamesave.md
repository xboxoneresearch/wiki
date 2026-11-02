# Xbox Live Game Save API reference

Manages cloud and local Xbox Live game save container data for installed titles.

## Reset game save data

**Request**

Resets Xbox Live save container data for a title.

| Method | Request URI      |
| :----- | :--------------- |
| POST   | /ext/xblgamesave |

**Request body**

```json
{
  "Type": "Reset",
  "SCID": string,
  "MSA": string,
  "PFN": string,
  "Provider": string
}
```

**Response**

- None

**Status code**

| HTTP status code | Description     |
| :--------------- | :-------------- |
| 200              | Save data reset |
| 4XX              | Error codes     |
| 5XX              | Error codes     |

<hr>

## Delete game save data

**Request**

Deletes Xbox Live save container data for a title.

| Method | Request URI      |
| :----- | :--------------- |
| POST   | /ext/xblgamesave |

**Request body**

```json
{
  "Type": "Delete",
  "SCID": string,
  "MSA": string,
  "PFN": string,
  "Provider": string
}
```

**Response**

- None

**Status code**

| HTTP status code | Description       |
| :--------------- | :---------------- |
| 200              | Save data deleted |
| 4XX              | Error codes       |
| 5XX              | Error codes       |

<hr>

## Import game save data

**Request**

Imports Xbox Live save container data from a file.

| Method | Request URI                                                          |
| :----- | :------------------------------------------------------------------- |
| POST   | /ext/xblgamesave?Type=Import&MSA=<msa>&PFN=<pfn>&Provider=<provider> |

**URI parameters**

| URI parameter | Description                       |
| :------------ | :-------------------------------- |
| Type          | `Import`                          |
| MSA           | Membername (Microsoft Account).   |
| PFN           | Package Family Name of the title. |
| Provider      | Target save provider identifier.  |

**Request body**

Multipart form data containing the input save file (`.json` or `.xml`).

**Response**

- None

**Status code**

| HTTP status code | Description        |
| :--------------- | :----------------- |
| 200              | Save data imported |
| 4XX              | Error codes        |
| 5XX              | Error codes        |

<hr>

## Export game save data

**Request**

Exports Xbox Live save container data to a file.

| Method | Request URI                                                  |
| :----- | :----------------------------------------------------------- |
| GET    | /ext/xblgamesave?Type=Export&SCID=<scid>&MSA=<msa>&PFN=<pfn> |

**URI parameters**

| URI parameter | Description                                                                      |
| :------------ | :------------------------------------------------------------------------------- |
| Type          | `Export`                                                                         |
| SCID          | Service Configuration ID.                                                        |
| MSA           | Membername (Microsoft Account).                                                  |
| PFN           | Package Family Name of the title.                                                |
| testData      | (optional) Set to `true` to test connectivity prior to initiating file download. |

**Response**

Returns the serialized save container file as a download attachment.

**Status code**

| HTTP status code | Description   |
| :--------------- | :------------ |
| 200              | File returned |
| 4XX              | Error codes   |
| 5XX              | Error codes   |

<hr>

## Generate dummy game save data

**Request**

Generates simulated game save data containers.

| Method | Request URI                                                                                                               |
| :----- | :------------------------------------------------------------------------------------------------------------------------ |
| GET    | /ext/xblgamesave?Type=Generate&SCID=<scid>&MSA=<msa>&PFN=<pfn>&containerCount=<c>&blobCount=<b>&blobSize=<s>&Format=<fmt> |

**URI parameters**

| URI parameter  | Description                                       |
| :------------- | :------------------------------------------------ |
| Type           | `Generate`                                        |
| SCID           | Service Configuration ID.                         |
| MSA            | Membername (Microsoft Account).                   |
| PFN            | Package Family Name.                              |
| containerCount | Number of containers to generate (default 2).     |
| blobCount      | Number of blobs per container (default 3).        |
| blobSize       | Size of each blob in bytes (default 1024).        |
| Format         | Save data serialization format (`json` or `xml`). |

**Response**

Returns generated dummy save data file.

**Status code**

| HTTP status code | Description |
| :--------------- | :---------- |
| 200              | OK          |
| 5XX              | Error codes |

<hr>

## Get supported providers

**Request**

Gets the list of supported save game platform providers.

| Method | Request URI                    |
| :----- | :----------------------------- |
| GET    | /ext/xblgamesave?Type=platform |

**Response**

Returns a list of supported save game platform providers:

```json
{
  "Providers": [
    string
  ]
}
```

**Status code**

| HTTP status code | Description |
| :--------------- | :---------- |
| 200              | OK          |
| 5XX              | Error codes |

**Available device families**

* Xbox

**Credits**
Microsoft
