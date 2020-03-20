# VBI - Virtual Boot Image
There are VBI files for each OS layer: HostOS, SystemOS, EraOS.

Virtual boot images act as a kind of preloader to the respective XVD.

## File format
Total Size: *variable*

| Offset | Length | Type     | Information                    |
| ------ | ------ | -------- | ------------------------------ |
| 0x00   |   0x02 |   ushort | Magic (1IBV)                   |
| 0x02   |    N/A |     N/A  | N/A                            |