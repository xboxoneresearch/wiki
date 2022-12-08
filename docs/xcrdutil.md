# XCRDutil
Manage mounting of XVD/XVC files in HostOS, from SystemOS.

Xcrdutil can be used to get info about XVD files (and other formats) as well as mount and create XVD files with some limitations. Via the UWP sandbox, two different XVD files can be mounted, "Updater.xvd" and "SystemTools.xvd".

The tool is located at `C:\Windows\System32\xcrdutil.exe`

## Accepted paths
XCRDutil allows specifying remote paths, in HostOS, via two notations:
- XCRD paths (see below, e.g. `[XUC:]\package.xvd` for **User Content** partition in HostOS)
- Global paths (e.g. `\??\F:\` for **F:** / [XBFS](../xbox-boot-file-system) drive in HostOS)

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
|10      |[XVE:]     | Used for so-called "paths to embedded XVDs"
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
|29      |[XFA:]     | Unknown
|30      |[XAS:]     | N/A
|31      |[XRT:]     | N/A
|32      |[XRU:]     | N/A
|33      |[XRS:]     | N/A
|34      |[XRI:]     | N/A

## Examples

Create new XCRD Path in the HDD Temp partition
```
xcrdutil -bxp 0 mytestpath
```

Outputs something like:
```
Successfully built XCRD Path: [XTE:]\mytestpath
Command completed successfully.
```

So called "paths to embedded XVDs" can also be created
```
xcrdutil -bxp 0 mytestembeddedpath -exvd_path
```

Outputs something like:
```
Successfully built XCRD Path: [XVE:]\[XTE:]\mytestembeddedpath
Command completed successfully.
```

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

## Error Codes
|Error Number | Meaning  | Description | How to obtain it 
|-------------|----------|-------------|-----------------
|0x80070002   |File not found |This error appears when the path to a non-existent .xvd (either a XCRD type path, or a native \\??\\ path) is passed. | ```xcrdutil -m [XUC:]\idontexist.xvd```
|0x80070570   |Possible permission error |This error appears when trying to mount host.xvd. It could be a "access denied" or "permissions insuficient" error. | ```xcrdutil -m \??\F:\host.xvd``` or ```xcrdutil -QueryInfo \??\F:\host.xvd 3```   
|0x8007048F   |Path not found |This error appears when trying to creat/accesse a file in a XCRD path that does not exist. | ```xcrdutil -c [XE0:]\someinvalidpath```  
|0x8007   | TBD |TBD. | ``TBD```  

Note: some of these error are not consistent. For example, trying to mount host.xvd results in a 0x80070570 possible permissions error, but trying to unmount it results in a 0x80070002 file not found, which does not make sense. Maybe 0x80070002 is a generic "command has failed" error?
