# SystemOS - Elevation of privileges via UnattendedUtilities

## Metadata
|                             |                                                     |
|-----------------------------|-----------------------------------------------------|
|Release date                 |                                          10.09.2019 |
|Author                       |                                   Xbox One Research |
|Classification               |                             Elevation of privileges |
|Patched                      |                                                 yes |
|Patch date                   |                                          19/11/2019 |
|First patched system version | 10.0.18363.8119 (19h1_release_xbox_dev_1911.18363.8119.191119-1135) |
|Source                       |     https://github.com/xboxoneresearch/XboxUnattend |
|Download                     |  [Download](files/XboxUnattend-master-20190919.zip) |

## Info
Normally you have limited user rights when connecting via SSH in development mode.
Via WinRT/COM Interop you can access *UnattendedUtilities* assembly and use it's script execution framework.

All commands executed by unattended scripts are done with **local administrator rights**.

## Prerequisites
- Dev Mode

## Instructions
Copy the extracted files to the console and the desired script to execute to the console.

For a script supplied via usb flash drive, execute:
```
xboxunattend.exe -usb
```

For a script in an arbitrary location
```
xboxunattend.exe -script D:\DevelopmentFiles\myscript.cmd
```
