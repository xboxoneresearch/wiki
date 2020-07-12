<!-- TITLE: Devkit Types -->
<!-- SUBTITLE: A quick summary of Devkit Types -->

# Devkit types
There are different types of devkits

| Name             | Identification | Description                                                                                                                                                                                |
| ---------------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| SRA Devkit       | 0x2001         | SRA (Shared Resources Access) devkit, is a legacy kit used to develop WinRT (Windows 8) SRA App. |
| UWA Devkit       | 0x2001         | This is the "$20" devkit, and allows for the development and debugging of UWP apps on SystemOS. This is the most common devkit certificate by far and expires every week. 
| ERA Devkit       | 0x4001         | This is the devkit most people think of when they picture a Xbox One devkit. ERA devkits in addition to the UWA capabilites, also allows for the activation of the ERA VM partition in Devmode. This allows for  the development, debugging and profiling of XDK based games. This is also the lowest devkit that is able to connect to the PC XDK, due to the XTF services running on GameOS and SystemOS.        
| MS Devkit        | 0x6001         | In addition to all the capabilities above, MS internal devkits enable a SYSTEM level telnet shell on all 3 operating systems (SystemOS, GameOS, and HostOS), however they are unable to run "Green" (Production) content like most games, and production builds of the Xbox OS. These certificates generally never expire.   
| SP Devkit        | 0x8001         | SP devkits are the top-tier of the standard capability certificates. In addition to all the aforementioned abilities, they also allow for custom code to be ran on the PSP/Security Processor. This includes debug versions of the bootloaders like 2BL, and PSP firmware such as 1SP. Due to this ability, most SP devkits are not converted from standard retails and instead prepared from a virgin factory board (which has yet to have the PSP programmed.) These certificates also generally never expire.
| Retail Devkit    | Unknown        | These devkits are Green versions of MS internal devkits. This allows them to debug retail games, run production versions of the Xbox OS, etc while all retaining the aforementioned mentioned capabilities. |   
| Godbox           | Unknown        |  Godboxes are a mysterious devkit type that appear to be temporary versions of Retail consoles using "MTE Boosting".