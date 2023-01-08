# XDK Transfer Device

The XDK Transfer Device is a special hardware accesory available oficially only to registered Xbox developers. Its main purpose is to allow for very fast trasnfers of data, mainly aimed at trasnfering game builds during the development phase. It is presumably no longer needed for the next generation of consoles (Series X/S) since these natively support fast data transfer rates. These devices are typically sold for cheap on eBay and similar marketplaces since they don't have any real use for normal gamers.

## Hardware

The XDK Transfer Device box contains four TORX head screws located in the back of the device, under the sticker:

![Screw location](./xdk_transfer/XDKTransfer.jpg)

Internally, the device contains two heatsinks for heat disipation when doing data transfers.

![Teardown of the device](./xdk_transfer/xdk_transfer_teardown.png)



## Software

The driver that communicates with the XDK Transfer Device is called `xbtplinkc.sys` and can be found in J:\drivers. Its full name is the `Xbox Transport Protocol Link Client` driver.
