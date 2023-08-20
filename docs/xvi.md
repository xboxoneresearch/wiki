# Xvi files
Some sort of metadata file related to [XVD files](../xbox-virtual-drive/), stored next to downloaded xvd files on the hard drive.

## File format
Total size: 0x1000

| Offset | Length | Type     | Information                    |
| ------ | ------ | -------- | ------------------------------ |
| 0x00   | 0x08   | uint64   | Magic (crdi-xvc)               |
| 0x08   | 0x238  | byte[]   | Unknown                        |
| 0x240  | 0x10   | byte[]   | ContentId                      |
| 0x250  | 0x10   | byte[]   | Other Id                       |
| 0x260  | 0xDA0  | byte[]   | Unknown                        |
