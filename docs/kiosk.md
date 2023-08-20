# Kiosk Mode

The Xbox One family of consoles features an obscure mode of operation called `Kiosk Mode`. This mode was and is still used to this day to turn the console into a locked down multimedia device to be used at retail stores.

## History

As part of the marketing effort for the console, special units were shipped to videogame stores, airports, big malls and other locations, which showed promotional videos of games, or that allowed to play latest releases and demos of upcoming games. These stations are known as "Kiosk Consoles" or simply "Kiosks", which are fairly common in the gamming world.

![Kiosk Console](kiosk-mode/kiosk_console.jpg)

## How to enter Kiosk Mode

To access Kiosk Mode, a file named `MSXB_Kiosk` (no extension) has to be placed in the root of an NTFS USB drive. Then you must reboot the console. Sometimes it might reboot again after the first reboot, to finally enter Kiosk mode.

If the file `MSXB_Kiosk` is a valid unsigned XVD of content type Kiosk, it will be mounted on the system when the console boots into Kiosk mode. This file was usually provided with the Microsoft USB drives, and typically contains promotional videos from upcoming games. A leaked `MSXB_Kiosk` file can be found in [Archive.org](https://archive.org/download/msxb-kiosk), as well as a complete image of an USB drive [here](https://archive.org/details/msxb-kiosk-console-lock-mode-en-gs-esrb-v-6/Front.jpg)

If `MSXB_Kiosk` is not a valid XVD file, the console will enter anyways in Kiosk Mode, but no promotional content will be available in the system, since no XVD has been mounted.

There exists special game discs which contained demos, to be used alongside Kiosk Units.

It is presumed that while in Kiosk Mode, **regular disc games still work, but this needs verification.**

## Limitations of Kiosk Mode

Kiosk mode locks down the console in the following ways:
* Disables networking
* Prevents the home menu app from showing most applications (although these remain installed in the system)
* Sets a flag that indicates Kiosk mode is enabled. Available apps like settings, check this flag and even though the app itself boots, it will refuse to operate when the Kiosk flag is detected.

Additionally, as of 2023 [it is possible to make a developer console / developer kit enter Kiosk Mode](https://twitter.com/TorusHyperV/status/1665308047030337537?s=20) too. In this scenario, the system is even more limited, since Dev Mode prevents any retail games from loading / being decrypted.

## Exploits

Presumably, an exploit in Kiosk mode allowed to mount any XVD in the console and browse its contents. However, it has not been possible to reproduce this behaviour, even when trying with old consoles. If you have information about this exploit or similar techniques, please issue a Pull Request documenting it.
