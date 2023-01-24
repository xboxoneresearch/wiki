## ODD Update Log Variants
Created on HDD by dashboard-update, placed unencrypted on NTFS partition
```
ODDFW update sequence: 0.
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
```

Misc Error Logs

Typically this happens when you don't have your ODD plugged into the xbox one.
```
ODDFW update sequence: 0.
FAILED to find ODD physical device, status = 0xC000000E.
GetOddPhysicalDevice failed.
COddDevice::_Open failed!
Odd open failed, retry in one second...
```

When you run OSUDT or  a System Update you may encounter this. 
```
ODDFW update failed, hr = 80910002, retry again in two seconds.
FAILED to find ODD physical device, status = 0xC000000E.
GetOddPhysicalDevice failed.
COddDevice::_Open failed!
Odd open failed, retry in one second...
```

When you plug something in, say a HDD in place of the ODD
```
ODDFW update sequence: 2.
FOUND DeviceInstance AHCI\Port\0
Got PDO: \Device\00000017
Unable open ODD PDO \Device\00000017 handle, status = 0xC000000E.
GetOddPhysicalDevice failed.
COddDevice::_Open failed!
Odd open failed, retry in one second...
```

If you have a working Xbox One ODD but the ODD is not the married board you'll see this
```
FOUND DeviceInstance AHCI\Port\0
Got PDO: \Device\00000017
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
Auth IOCTL 000240C4 failed, error = e0e80085
IOddDriverApi::DriveAuthPowerOn failed
ODDFW update failed, hr = 80910008, retry again in two seconds.
```