# Manages the scripts configured for the front panel display buttons on an Xbox One X Devkit.  

## Changes the script assigned to one of the front panel buttons or runs one of the front panel scripts on the target Xbox One development console.

**Request**

Method      | Request URI
:------     | :-----
Post | /ext/unattendedsetup/quickaction

**URI parameters**

Method      | Format  | Description
:------     | :-----    | :-----
ButtonNumber | number | Optional number of the front panel button we are dealing with. If this is not provided, this is a request to add a new custom script to the console
Name | base64-encoded string | Optional string indicating the name of the script we are applying to a button. If this is not provided then the current script associated with ButtonNumber is run instead.
IsBuiltIn | boolean | Optional bool indicating whether or not the script we are applying is a built in script provided with the system or a custom script previously added to the console by the user.

**Request headers**

- None

**Request body**

- None

**Response**   

If the call is successful and the request was to run the action associated with a button, the service will return a JSON object with the following members:

Method      | Format  | Description
:------     | :-----    | :-----
Output | string | The output from running

If the call was to apply a script to a button or add a new custom script, there is no response body.

**Status code**

This API has the following expected status codes.

HTTP status code      | Description
:------     | :-----
204 | The request to enable Fiddler was accepted. Fiddler will be enabled the next time the device reboots.
4XX | Error codes
5XX | Error codes

## Retrieves the information about the scripts applied to and available to the front panel buttons on the target Xbox One development console.

**Request**

Method      | Request URI
:------     | :-----
Get | /ext/app/quickaction

**URI parameters**

Method      | Format  | Description
:------     | :-----    | :-----
Name | base64-encoded string | Optional string indicating we want the contents of a script.
IsBuiltIn | boolean | Optional bool indicating if this is a built in script provided with the system or a custom script added to the console by the user.

**Request headers**

- None

**Request body**   

- None

**Response**   

If the call is successful and a script was requested by name, the service will return the script file as a multi-part conforming HTTP body.

If a script was not requested, the service will return a JSON object with the following members:

Method      | Format  | Description
:------     | :-----    | :-----
IsAvailable | boolean | Whether or not front panel scripts are available on this console. This will be true for the Xbox One X Devkit and false for other devkit types. If this is false, no other members will be returned.
QuickActions | Array of JSON objects | An array containing all the available quick actions on this console.
QuickActions | Array of JSON objects | An array containing all the available quick actions on this console. | Array of JSON objects | An array containing the 5 quick actions which are assigned to the front panel buttons on this console.

Quick actions JSON objects have the following members:

Method      | Format  | Description
:------     | :-----    | :-----
Name | base64-encoded string | The name of the script on the console.
IsBuiltIn | boolean | Whether or not this is a built in script provided with the system or a custom script added to the console by the user.

**Status code**

This API has the following expected status codes.

HTTP status code      | Description
:------     | :-----
204 | The request to disable Fiddler tracing was successful. Tracing will be disabled on the next reboot of the device.
4XX | Error codes
5XX | Error codes


**Available device families**

* Windows Xbox

**Credits**
Microsoft
