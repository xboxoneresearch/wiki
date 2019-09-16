<!-- TITLE: Xbox Operating System -->
<!-- SUBTITLE: Structure of the Xbox Operating System -->

# Xbox Operating System
## Host

The primary operating system known as the Host OS is responsible for
managing the virtual machines, providing drivers for hardware components
and more. It was based on a variation of Windows 8 LNM, a stripped down
operating system for bare minimum requirements, with many customisations
that implement Microsoft's Xbox Virtual Machine stack.

### Host Volumes/Drives

| Partition      | Mount Point | Notes                                                                                                                                                                                                                 |
| -------------- | ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Internal Flash | F:\\        | The flash does not contain a normal file system (See <https://github.com/tuxuser/py-durango-tools/blob/master/nand/NANDOne.py> for structure details) and is exposed as a normal NTFS partition via a special driver. |
| host.xvd       | C:\\        | Host's Windows Installation.                                                                                                                                                                                          |
| User Content   | E:\\        | Direct access to the HDD User Content partition. XVCs are stored here.                                                                                                                                                |
| System Update  | R:\\        | Direct access to the HDD System Update partition. Boot slots and SystemOS XVDs.                                                                                                                                       |
| System Support | G:\\(?)     | Direct access to the HDD System Support partition. Containing SystemOS's settings, temp, etc.                                                                                                                         |

## System

The System OS is built to provide the main visual and interactive layer
of the console. This operating system is currently based on Windows
'OneCoreUAP' with a custom shell, services and other components.

### SRA Virtual Drives

| File Name          | Mount Point | Dev-Only | Read-Only | Desc                                                           |
| ------------------ | ----------- | -------- | --------- | -------------------------------------------------------------- |
| system.xvd         | C:\\        | false    | true      | System Boot.                                                   |
| systemaux.xvd      | X:\\        | false    | true      | Inbox apps.                                                    |
| systemauxf.xvd     | Y:\\        | false    | true      | Inbox apps.                                                    |
| $sosrst.xvd        | T:\\        | false    | true      | Temporary storage.                                             |
| systemtools.xvd    | J:\\        | true     | true      | Developer utilities.                                           |
| settings-saved.xvd | S:\\        | false    | false     | Console settings data. (Licenses, prefetch, registry and more) |
| systemmisc.xvd     | M:\\        | false    | true      | Miscellaneous system boot files.                               |
| user.xvd           | U:\\        | false    | false     | User and application data.                                     |
| user-devkit.xvd    | U:\\        | true     | false     | User and application data.                                     |

## Game/Era

The Game operating system is used exclusively for games that target the
XDK due to the higher allocation of console resources. It is built upon
the same variant of Windows 8 LNM as the Host OS but is essentially
smaller and more efficient.

### ERA Virtual Drives

| File Name    | Mount Point | Notes                                                                                                                                                                                 |
| ------------ | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ERA.xvd      | C:\\        | GameOS's Windows installation. Packaged with games via the XVC's user data. Attempts to read from this partition will result in the hypervisor terminating the ERA VM.                |
| Game.XVC     | G:\\        | Running game's binaries/data. The XVC mounted and decrypted.                                                                                                                          |
| ERATools.xvd | J:\\        | (MS Internal (and ERA Test?) Devkits with XDK recoveries only). Contains tools like ipconfig, telnetd, debug support dlls and dlls needed to connect to the XDK via the XB CLI tools. |

## GameCore

A new operating system that currently appears to be the new foundation
for games developed on Windows 10 devices. Based on a 'headless' Windows
Core OS (WCOS).