<!-- TITLE: Xbox Boot File System -->
<!-- SUBTITLE: A quick summary of Xbox Boot File System -->

# Header
box Boot File System, or XBFS for short, refers to the console flash filesystem.

== XBFS Header offsets ==
The Flash can contain 3 different revisions of filetables, differentiated via its sequence number. Highest sequence number is the active one.

Checking if a filetable exists is done by checking for XBFS_HEADER-&gt;Magic.

Absolute offsets:
 0x10000
 0x810000
 0x820000

== Checking for file existance ==
Iterate through the array of XBFS_FILE_ENTRY and check if XBFS_FILE_ENTRY.Size &gt; 0.

== XBFS Structures ==
Byteorder: Little endian

FILE_COUNT: variable

PAGE_SIZE: 0x1000

=== XBFS_HEADER ===
Size: 0x400
{|class=&quot;wikitable&quot;
!colspan=&quot;1&quot;|Offset
!colspan=&quot;1&quot;|Length
!colspan=&quot;1&quot;|Type
!colspan=&quot;6&quot;|Information
|-
|0x00
|0x04
|uint
|Magic (SFBX)
|-
|0x04
|0x01
|byte
|Format Version
|-
|0x05
|0x01
|byte
|Sequence Version*
|-
|0x06
|0x02
|ushort
|Layout Version
|-
|0x08
|0x08
|uint64
|Unknown
|-
|0x10
|0x08
|uint64
|Unknown
|-
|0x18
|0x08
|uint64
|Unknown
|-
|0x20
|FILE_COUNT * sizeof(XBFS_FILE_ENTRY)
|struct XBFS_FILE_ENTRY
|File Entries
|-
|0x3D0
|0x10
|byte[]
|UUID
|-
|0x3E0
|0x20
|byte[]
|SHA256 Hash
|-
|}

* Sequence number: Wraps around, aka 0xFF -&gt; 0x00. 0x00 would be latest.

=== XBFS_FILE_ENTRY ===
Size: 0x10
{|class=&quot;wikitable&quot;
!colspan=&quot;1&quot;|Offset
!colspan=&quot;1&quot;|Length
!colspan=&quot;1&quot;|Type
!colspan=&quot;6&quot;|Information
|-
|0x00
|0x04
|uint32
|Offset (page count)
|-
|0x04
|0x04
|uint32
|Size (page count)
|-
|0x08
|0x08
|uint64
|Unknown
|-
|}

== File Entries ==
{|class=&quot;wikitable&quot;
!colspan=&quot;1&quot;|Index
!colspan=&quot;1&quot;|Name
!colspan=&quot;6&quot;|Information
|-
|01
|1smcbl_a.bin
|SMC bootloader, slot A
|-
|02
|header.bin
|Flash header
|-
|03
|devkit.ini
|devkit init
|-
|04
|mtedata.cfg
|MTE data ???
|-
|05
|certkeys.bin
|Certificate keys
|-
|06
|smcerr.log
|SMC error log
|-
|07
|system.xvd
|SystemOS xvd
|-
|08
|$sosrst.xvd
|SystemOS reset ???
|-
|09
|download.xvd
|Download xvd ???
|-
|10
|smc_s.cfg
|SMC config - signed
|-
|11
|sp_s.cfg
|SP config - signed
|-
|12
|os_s.cfg
|OS config - signed
|-
|13
|smc_d.cfg
|SMC config - decrypted
|-
|14
|sp_d.cfg
|SP config - decrypted
|-
|15
|os_d.cfg
|OS config - decrypted
|-
|16
|smcfw.bin
|SMC firmware
|-
|17
|boot.bin
|Main Bootloader ???
|-
|18
|host.xvd
|HostOS xvd
|-
|19
|settings.xvd
|Settings xvd
|-
|20
|1smcbl_b.bin
|SMC bootloader, slot B
|-
|21
|bootanim.dat
|Bootanimation
|-
|22
|sostmpl.xvd
|SystemOS template xvd
|-
|23
|update.cfg
|Update config / log?
|-
|24
|sosinit.xvd
|SystemOS init xvd
|-
|25
|hwinit.cfg
|Hardware init config
|-
|}

== Access via Developer Mode ==