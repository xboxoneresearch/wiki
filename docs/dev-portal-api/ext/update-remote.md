# Gets a Boolean value that indicates whether the specified AppXManifest is for an ERA title.


**Request**

Method      | Request URI
:------     | :------
POST | /ext/update/remote
<br />

**URI parameters**

Parameter      |  Format |  Description
:------     | :-----  | :-----
networkshare  | base64-encoded string | The network share location of the system update packages. This network share should be base64-encoded.

**Request headers**

- None

**Request body**

if credentials are required to access the network share, the request must contain a JSON body that contains optional username and password parameters and a Boolean parameter AllowSameBuild that indicates whether the recovery should be allowed to proceed even if the console is already on this build. The JSON should also contain an array named RecoverOptions which contains ParamName to ParamValue key-value pairs specifying the following update options:

- X-UpdateDownloadPolicy : 1 or 0, where 0 means the console will show an update prompt and 1 supresses that prompt. 

- X-ForceFactoryReset : bool indicating if a factory reset should be performed.

- X-FactoryResetOptions : 0xdededede if performing a factory reset, 0 otherwise. 

- X-HostName : should be set to `“<save>”` to preserve the hostname, even in factory reset scenarios. 

- X-InhibitIdleTimeout : bool indicating if the screen dim settings should be respected while updating. 

- X-SandboxId : the sandbox id to set as part of the recovery. 

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


**Available device families**

* Windows Xbox

**Credits**
Microsoft