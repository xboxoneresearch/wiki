# File Explorer - Symbolic links vulnerability

## Metadata
|                             |                                                     |
|-----------------------------|-----------------------------------------------------|
|Release date                 |                                          02.06.2017 |
|Author                       |                                            xenomega |
|Classification               |                                         File Access |
|Patched                      |                                                 yes |
|Patch date                   |                                          05.05.2017 |
|First patched system version | 10.0.15063.2022 (RS2_RELEASE_XBOX_1704.170501-1052) |
|Source                       |                https://github.com/Xenomega/xsymlink |
|Download                     |                      [Download](files/xsymlink.zip) |

## Info
Access restricted/encrypted volumes using the Xbox File Explorer.

- Patched as of 5/5/2017: 10.0.15063.2022 (RS2_RELEASE_XBOX_1704.170501-1052).  Thus in accordance with responsible disclosure.
- The Xbox One File Explorer does not check if a path is a symbolic link elsewhere, allowing an attacker to browse/read/write to mounted volumes which are normally restricted.
- This includes any encrypted virtual harddisk partitions (XVD files) which the console mounts for content such as gamesaves, etc.

## Prerequisites
- Download Windows Server 2003 Resource Kit Tools, from which you'll need the "linkd" utility, as the program relies on it to create links, since mklink does not link to paths that do not exists, and the paths we intend to link to are likely non-existent on your computer.

## Instructions
 - Change the drive letter to your USB drive letter in Program.cs  
 - Run it  
 - Plug it into Xbox, use File Browser to browse through the symlinks, which will link to other parts of the system.

## Manual instructions

The following snippet assume that your usb flash drive is mounted to `E:\` on your computer that's executing linkd.

```
mkdir E:\symlinks
linkd.exe E:\symlinks\Volume0\ \\?\GLOBALROOT\Device\HarddiskVolume0\
linkd.exe E:\symlinks\Volume1\ \\?\GLOBALROOT\Device\HarddiskVolume1\
linkd.exe E:\symlinks\Volume2\ \\?\GLOBALROOT\Device\HarddiskVolume2\
linkd.exe E:\symlinks\Volume3\ \\?\GLOBALROOT\Device\HarddiskVolume3\
linkd.exe E:\symlinks\Volume4\ \\?\GLOBALROOT\Device\HarddiskVolume4\
linkd.exe E:\symlinks\Volume5\ \\?\GLOBALROOT\Device\HarddiskVolume5\
... etc ...
```

**NOTE**: You might be able to use [`junction.exe` from Sysinternals](https://learn.microsoft.com/en-us/sysinternals/downloads/junction) too!
