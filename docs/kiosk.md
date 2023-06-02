# Kiosk Mode

The Xbox One family of consoles features an obscure mode of operation called `Kiosk Mode`. This mode was and is still used to this day to turn the console into a locked down multimedia device to be used at retail stores.

## History

As part of the marketing effort for the console, special units were shipped to videogame stores, airports, big malls and other locations, which showed promotional videos of games, or that allowed to play latest releases and demos of upcoming games. These stations are known as "Kiosk Consoles" or simply "Kiosks", which are fairly common in the gamming world.

![a](https://i.ytimg.com/vi/A3zvWoPEBRw/maxresdefault.jpg)

## How to enter Kiosk Mode

To access Kiosk Mode, a file named `MSXB_Kiosk` (no extension) has to be placed in the root of an NTFS USB drive. Then you must reboot the console. Sometimes it might reboot again after the first reboot, to finally enter Kiosk mode.

If the file `MSXB_Kiosk` is a valid unsigned XVD of content type Kiosk, it will be mounted on the system when the console boots into Kiosk mode. This file was usually provided with the Microsoft USB drives, and typically contains promotional videos from upcoming games. A leaked `MSXB_Kiosk` file can be found in [Archive.org](https://archive.org/download/msxb-kiosk), as well as a complete image of an USB drive [here](https://archive.org/details/msxb-kiosk-console-lock-mode-en-gs-esrb-v-6/Front.jpg)

## Limitations of Kiosk Mode

TODO

## Exploits

Presumably, an exploit in Kiosk mode allowed to mount any XVD in the console and browse its contents. However, it has not been possible to reproduce this behaviour, even when trying with old consoles. If you have information about this exploit or similar techniques, please get in contact.
