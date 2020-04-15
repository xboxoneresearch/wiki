# XCRDutil
Manage XVD/XVC mounting in Host from SystemOS.

Xcrdutil can be used to get info about XVD files as well as mount and create XVD files with some limitations. Via the UWP sandbox, two different XVD files can be mounted, "Updater.xvd" and "SystemTools.xvd".

The tool is located at `C:\Windows\System32\xcrdutil.exe`

## Accepted paths
XCRDutil allows specifying remote paths (in HostOS) via two notations:
- XCRD paths (see below, e.g. `[XUC:]\package.xvd` for **User Content** partition in HostOS)
- Global paths (e.g. `\??\F:\` for **F:** / [XBFS](/xbox-boot-file-system) drive in HostOS)

## XCRD paths
|XCRD Id | XCRD Path | Description
|--------|-----------|-------------------------
|0       |[XTE:]     | HDD Temp
|1       |[XUC:]     | HDD User Content
|2       |[XSS:]     | HDD System Support
|3       |[XSU:]     | HDD System Image
|4       |N/A        | N/A
|5       |[XFG:]     | HDD Future Growth
|6       |N/A        | N/A
|7       |[XTF:]     | XTF Remote storage
|8       |[XBL:]     | Xbox Live storage
|9       |[XOD:]     | XODD (System VM)
|10      |[XVE:]     | N/A
|11      |[XT0:]     | USB Transfer Storage
|12      |[XT1:]     | USB Transfer Storage
|13      |[XT2:]     | USB Transfer Storage
|14      |[XT3:]     | USB Transfer Storage
|15      |[XT4:]     | USB Transfer Storage
|16      |[XT5:]     | USB Transfer Storage
|17      |[XT6:]     | USB Transfer Storage
|18      |[XT7:]     | USB Transfer Storage
|19      |[XE0:]     | USB External Storage
|20      |[XE1:]     | USB External Storage
|21      |[XE2:]     | USB External Storage
|22      |[XE3:]     | USB External Storage
|23      |[XE4:]     | USB External Storage
|24      |[XE5:]     | USB External Storage
|25      |[XE6:]     | USB External Storage
|26      |[XE7:]     | USB External Storage
|27      |[XBX:]     | XBOX (Copy-Over-LAN)
|28      |[XSR:]     | SRA (local or SMB)
|29      |N/A        | N/A
|30      |[XAS:]     | N/A
|31      |[XRT:]     | N/A
|32      |[XRU:]     | N/A
|33      |[XRS:]     | N/A
|34      |[XRI:]     | N/A

## Examples
Mount package

```
xcrdutil -m [XUC:]\targetPackage.xvd
```

Outputs something like:
```
Successfully mounted [XUC:]\targetPackage.xvd
Device Path : \\?\GLOBALROOT\Device\Harddisk21\Partition1
Command completed successfully.
```

Mounted XVD's can be accessed with junctions:

```
mklink /j D:\Folder \\?\GLOBALROOT\Device\Harddisk17\Partition1\
```

Query Info for given XVD:

```
xcrdutil -QueryInfo \??\F:\host.xvd 5
```

Write file to Host layer

```
xcrdutil -write_blob [XUC:]\targetPackage.xvd D:\DevelopmentFiles\localPackage.xvd
```

Read file from Host layer

```
xcrdutil -read_blob [XUC:]\targetPackage.xvd D:\DevelopmentFiles\localPackage.xvd
```

Delete file on Host layer

```
xcrdutil -delete_blob [XUC:]\targetPackage.xvd
```
