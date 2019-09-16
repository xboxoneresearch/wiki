<!-- TITLE: Optical Disc Drive -->
<!-- SUBTITLE: A quick summary of Optical Disc Drive -->

# Header
== Game discs ==
Xbox One game discs are called '''XGD4''' (Xbox Game Disc Version 4).

== Drive models ==
Following optical disc drive models are known to date:

=== Xbox One (PHAT) ===
* Lite-On DG-6M1S-01B/02B (Codename: ELK)
* Lite-On DG-6M2S-01B     (Codename: CORDOVA)

=== Xbox One S / X ===
* Lite-On DG-6M5S-01B/02B (Codename: MONTEREY)

== Lite-On drives ==
=== General info ===
* Seems to use MTK chipset
* DG-6M1S is NOT detected when connected to a PC, all other models are

=== Known firmware versions ===
* 3253 (July 2013, DG-6M1S-01B)
* 011V (August 2015, DG-6M2S-01B)
* 017V (April 2016, DG-6M5S-01B)

=== Known flash chips ===
* Lite-On DG-6M2S -&gt; MXIC(MX25L8091E) (MenuId: 0xC2, DevId1: 0x20, DevId2: 0x14)

=== oddfwupd log ===
When a dashboard update performs a ODD firmware upgrade, a log file is created on HDD.

Location: SystemSupport\oddfwupd\''&lt;index&gt;''.log

'''&lt;index&gt;''': Variable number

Successful upgrade
 ODDFW update sequence: 9.
 FOUND DeviceInstance AHCI\Port\0
 Got PDO: \Device\00000016
 Drive type detected: Elk.
 Drive is Locked!
 Nvkey is Programmed!
 Found firmware FW_0001.bin.
 Firmware version match, no FW update is needed
 Update is not neccessary.
 Drive is Locked!
 Nvkey is Programmed!
 ODD token found in factory settings, consider ODD is paired.
 PV+ console already locked, skip lock down.
 Got drive auth status : 2
 ODDFW update finished, hr = 00000000

Example of E100 error
 ODDFW update sequence: 7.
 FOUND DeviceInstance AHCI\Port\0
 Got PDO: \Device\00000017
 Drive type detected: Monterey.
 Drive is Locked!
 Nvkey is Programmed!
 Expected firmare version:014R
 Running firmware version:014R
 Already running expected firmware, skipping ODD update
 Update is not neccessary.
 Not Elk drive, no lock down is needed.
 Auth IOCTL 000240C4 failed, error = e0e80085
 IOddDriverApi::DriveAuthPowerOn failed
 ODDFW update failed, hr = 80910008, retry again in two seconds.
 Expected firmare version:014R
 Running firmware version:014R
 Already running expected firmware, skipping ODD update
 Update is not neccessary.
 Not Elk drive, no lock down is needed.
 Auth IOCTL 000240C4 failed, error = e0e80085
 IOddDriverApi::DriveAuthPowerOn failed
 ODDFW update failed, hr = 80910008, retry again in two seconds.
 Expected firmare version:014R
 Running firmware version:014R
 Already running expected firmware, skipping ODD update
 Update is not neccessary.
 Not Elk drive, no lock down is needed.
 Auth IOCTL 000240C4 failed, error = e0e80085
 IOddDriverApi::DriveAuthPowerOn failed
 ODDFW update failed, hr = 80910008, retry again in two seconds.
 ODDFW update finished, hr = 80910008​

Unmatching drive
 ODDFW update sequence: 1.
 FOUND DeviceInstance AHCI\Port\0
 Got PDO: \Device\00000017
 Drive type detected: Elk.
 Drive is Unlocked!
 Nvkey is Not programmed!
 Found firmware FW_0001.bin.
 Firmware version match, no FW update is needed
 Update is not neccessary.
 Drive is Unlocked!
 Nvkey is Not programmed!
 OddSerialNumber from factory settings:
 00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
 -----------------------------------------------
 0000 - 44 39 30 31 42 42 33 35 30 38 30 35 30 30 31 4D D901BB350805001M
 0010 - 36 20 20 20 6 
 
 OddSerialNumber from drive:
 00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
 -----------------------------------------------
 0000 - 44 39 30 33 42 42 34 34 36 38 30 33 30 30 46 36 D903BB44680300F6
 0010 - 30 00 00 00 0...
 
 PV- console not locked, we are done!
 Auth IOCTL 000240C4 failed, error = e0e80085
 IOddDriverApi::DriveAuthPowerOn failed
 ODDFW update failed, hr = 80910008, retry again in two seconds.
 
 ... Lines above are repeated several times ...
 
 ODDFW update finished, hr = 80910008

Again, E100
 ODDFW update sequence: 79
 FOUND DeviceInstance AHCI\Port\0
 Got PDO: \Device\00000017
 Drive type detected: Cordova.
 Drive is Locked!
 Nvkey is Programmed!
 Expected firmare version:045R
 Running firmware version:040R
 Not running expected firmware, update required
 ExclusiveState : None
 CallerName: 
 MenuId: 0xC2, DevId1: 0x20, DevId2: 0x14
 Flash type detected: MXIC(MX25L8091E).
 OddSerialNumber from factory settings:
 00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
 -----------------------------------------------
 0000 - 44 39 30 33 42 42 34 34 31 38 30 33 30 30 30 50 D903BB441803000P
 0010 - 4B 20 20 20 K 
 
 OddSerialNumber from drive:
 00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
 -----------------------------------------------
 0000 - 44 41 30 31 42 42 35 34 33 38 31 32 30 30 38 58 DA01BB543812008X
 0010 - 31 00 00 00 1...
 
 Cannot get pair status or drive is not paired!
 OddFirmwareUpdate error 80910018
 Programming firmware failed
 ExclusiveState : Exclusive
 CallerName: COddDriverApi

 ... Lines above are repeated several times ...
 
 FW update failed!!!
 ODDFW update failed, hr = 80910018, retry again in two seconds.
 ODDFW update finished, hr = 80910018

== Philips / Lite-On PLDS DG-6M1S ==
[[File:Plds_dg6m1s_label.JPG|250px|PDLS DG6M1S Label]]
[[File:Plds_dg6m1s_pcb_mounted.JPG|250px|PDLS DG6M1S PCB mounted]]
[[File:Plds_dg6m1s_pcb_front.JPG|250px|PDLS DG6M1S PCB front]]
[[File:Plds_dg6m1s_pcb_back.JPG|250px|PDLS DG6M1S PCB back]]

== Philips / Lite-On PLDS DG-6M2S ==
[[File:Plds_dg6m2s_label.JPG|250px|PDLS DG6M2S Label]]
[[File:Plds_dg6m2s_pcb_mounted.JPG|250px|PDLS DG6M2S PCB mounted]]
[[File:Plds_dg6m2s_pcb_front.JPG|250px|PDLS DG6M2S PCB front]]
[[File:Plds_dg6m2s_pcb_back.JPG|250px|PDLS DG6M2S PCB back]]