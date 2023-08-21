# External VBI Loading

## Metadata
|                             |                                                     |
|-----------------------------|-----------------------------------------------------|
|Release date                 |                                          19.09.2019 |
|Author                       |                                   Xbox One Research |
|Classification               |                                      Code Execution |
|Patched                      |                                                 Yes |
|Patch date                   |                                          01.07.2017 |
|First patched system version |                                                 N/A |
|Source                       |                                                 N/A |
|Download                     |                                                 N/A |

## Info
Force the console to load an arbritary VBI on bootup. By placing a VBI file on the User Content partition of the hard drive and using either of the following names "system.vbi" or "era.vbi" will be used to boot their according virtual machines upon console boot. This is done by the XVMM driver in the Host operating system which checks the locations "E:\\system.vbi" and/or "E:\\era.vbi" for any valid binaries. If any of these exist then it will default to using them rather than using the VBI from the OS XVD user data section.

## Prerequisites
- Access to console hard drive
- Access to specific VBI

## Instructions
 - Place the custom VBI on the User Content partition of the hard drive 
 - Plug hard drive back into the console
 - Reboot the console 