# XCRDutil
Manage mounting of XVD/XVC files in HostOS, from SystemOS.

Xcrdutil can be used to get info about XVD files (and other formats) as well as mount and create XVD files with some limitations. Via the UWP sandbox, two different XVD files can be mounted, "Updater.xvd" and "SystemTools.xvd".

The tool is located at `C:\Windows\System32\xcrdutil.exe`

## Accepted paths
XCRDutil allows specifying remote paths, in HostOS, via two notations:
- XCRD paths (see below, e.g. `[XUC:]\package.xvd` for **User Content** partition in HostOS). These paths are an abstraction to the HostOS filesystem, allowing to refer to .xvd's without knowing their exact location, and possibly also allowing for security / permission checks.
- Global paths (e.g. `\??\F:\` for **F:** / [XBFS](../xbox-boot-file-system) drive in HostOS). These refer to a physical volume (like a disk partition, the flash, etc) in HostOS.

Not all the options/arguments for XCRDUtil expect the same format for the paths. Some options are able to work with paths pointing to the SystemOS's filesystem, while others may only work with remote paths to HostOS, in either one of the two types just specified previously:
*  XCRD paths.
* "global" paths pointing to a HostOS volume, which start with the non-standard "\\??\\" prefix

Following is a table describing what options XCRDUtil has, and kind of path each option expects. Examples are provided at the end of the page:
| Option | Option description  | Arg1 Path type | Arg2 Path type 
|-------------|----------|-------------|-------------
| write_blob  | Writes the contents of an .xvd (from a SystemOS path) to an .xvd in the HostOS's filesystem, represented by a XCRD path  | XCRD | SystemOS
| read_blob   | reads one .xvd (from a HostOS XCRD path) and writes it to SystemOS's filesystem.  | XCRD | SystemOS
| QueryInfo   | Gives information about an XVD (either mounted or unmounted) accesible to HostOS | Global HostOS path / XCRD | N/A

To be completed.

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
|0x80070002   | File/path not found         | This error appears whenever an invalid path to a file is used (either XCRD, native \\??\\ path, or SystemOS path). | ```xcrdutil -m [XUC:]\idontexist.xvd```
|0x80070570   | Possible permission error |This error appears when an operation is denied due to insufficient permissions. Examples include trying to mount host.xvd. | ```xcrdutil -m \??\F:\host.xvd``` or ```xcrdutil -QueryInfo \??\F:\host.xvd 3```   
|0x8007048F   | Path not found         |This error appears when trying to create/access a file in a XCRD path that does not exist. | ```xcrdutil -c [XE0:]\someinvalidpath```  
|0x80070032   | Unknown | Possibly meaning the passed XVD does not have region information | ```xcrdutil -Specifiers [XUC:]\someXvdYouveMounted```  
