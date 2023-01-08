# XDK Transfer Device

The XDK Transfer Device is a special hardware accesory available oficially only to registered Xbox developers. Its main purpose is to allow for very fast trasnfers of data, mainly aimed at transfering game builds during the development phase. It is presumably no longer needed for the next generation of consoles (Series X/S) since these natively support fast data transfer rates thanks to their SSD technology
. These devices are typically sold for cheap on eBay and similar marketplaces since they don't have any real use for normal gamers.

## Hardware

The XDK Transfer Device box contains four TORX head screws located in the back of the device, under the sticker:

<p align="center">
  <img src="./xdk_transfer/XDKTransfer.jpg">
</p>

Internally, the device contains two heatsinks for heat disipation when doing data transfers. The PCB has a rectangular shape.

<p align="center">
  <img src="./xdk_transfer/xdk_transfer_teardown.png">
</p>

The XDK Transfer device contains two `ATMLH532` i2c EEPROMs and two main `CYUSB3014-BZXI` ICs, which are essentially dedicated ARM926 EJ-S cores capable of 5 GBit/s USB speeds. The following is a block diagram depicting the design and main features of these cores. 

<p align="center">
  <img src="https://user-images.githubusercontent.com/100166926/211207446-1af276c8-8679-44a3-9cc1-a3fc845e68ef.png">
</p>

<p align="center">
  <img src="./xdk_transfer/IMG_8965.jpg">
</p>

## Software

The driver that communicates with the XDK Transfer Device is called `xbtplinkc.sys` and can be found in J:\drivers. Its full name is the `Xbox Transport Protocol Link Client` driver.
