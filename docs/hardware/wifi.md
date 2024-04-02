# Wifi

## Xbox One
First revision of the Xbox One has both chipsets on the same PCB, a 8-pin connection goes from the PCB to the motherboard.

Communication is via 2x USB data-pairs.
**IMPORTANT**: The board is operated via 3,3V, standard USB is 5V!

- Marvell Avastar 88W8897
- Marvell Avastar 88W8782U

### Pinout

- (A / CON3) U.FL - To RF Unit
- (B / CON1) U.FL - NC
- (C / CON2) U.FL - NC

- JST 2x6 Pin connector (JST PHD 2X6P, 2.00mm)

JST Pinout

USB2_ACC - Connectivity for accessories / game-controllers
USB2_WIFI - Connectivity for WiFi

| Pin | Description  | Description  | Pin |
| --- | ------------ | ------------ | --- |
| 1   | 3,3V         | GND          | 2   |
| 3   | USB2_ACC_DP  | USB_ACC_DM   | 4   |
| 5   | GND          | GND          | 6   |
| 7   | USB2_WIFI_DP | USB2_WIFI_DM | 8   |
| 9   | RESET_N      | GND          | 10  |
| 11  | 3,3V         | /            | 12  |

### PCB

Xbox One (PHAT)
![Wifi module PCB PHAT front](../_files/wifi/wifi_module_pcb_phat_front.jpg)
![Wifi module PCB PHAT back](../_files/wifi/wifi_module_pcb_phat_back.jpg)
![Wifi module PCB PHAT decapped](../_files/wifi/wifi_module_pcb_phat_decapped.jpg)
![Wifi module cable PHAT front](../_files/wifi/wifi_module_cable_phat_front.jpg)
![Wifi module cable PHAT front](../_files/wifi/wifi_module_cable_phat_back.jpg)


## Xbox One S
- MediaTek MT7612UN

### Pinout


| Pin | Description           | Description           | Pin |
| --- | --------------------- | --------------------- | --- |
| 1   | WIFI_PEX_SS_100M_CLKP | WIFI_PEX_SS_100M_CLKN | 2   |
| 3   | GND                   | PEX_WIFI_SOC_TP       | 4   |
| 5   | PEX_WIFI_SOC_TN       | GND                   | 6   |
| 7   | PEX_SOC_WIFI_TP_C     | PEX_SOC_WIFI_TN_C     | 8   |
| 9   | GND                   | USB2_WIFI_DN          | 10  |
| 11  | USB2_WIFI_DP          | GND                   | 12  |
| 13  | WIFI_WAKE_N           | WIFI_RESET_N          | 14  |
| 15  | 3,3V                  | 3,3V                  | 16  |


### PCB


Xbox One S
![Wifi module PCB SLIM front](../_files/wifi/wifi_module_pcb_slim_front.jpg)
![Wifi module PCB SLIM back](../_files/wifi/wifi_module_pcb_slim_back.jpg)


## Xbox One X
Unknown

### PCB

Xbox One X (SCORPIO)

## Security considerations
On the conference *ZeroNights 2018* several vulnerabilities in the Marvell Avastar
Wifi chip family (88W8787, 88W8797, 88W8801, 88W8897, and 88W8997) were presented.
Click here for more info: [Link](https://kb.cert.org/vuls/id/730261/)

## Credits
- [Pictures from ifixit.com](https://www.ifixit.com/Search?c-doctype_namespace=product&doctype=product&query=xbox%20one)