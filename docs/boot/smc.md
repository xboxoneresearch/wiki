<!-- TITLE: SMC -->
<!-- SUBTITLE: System management controller -->

# SMC

Firmware loaded by the [Southbridge](../hardware/southbridge.md).

## SMC Fuses

Not to be confused with the SoC fuses! SMC Fuses differ between retail and dev hardware. 


## 0SMCBL (SMC ROM)

Stored in maskrom in the southbridge. Apparently the same between retail and devkits (of same generation).

### 0SMCBL work-/error-flow

SmcFault codes are output via UART1 (SMC UART aka. IR Blaster). This UART port is NOT routed to the [FACET port](../hardware/facet.md); rather needs soldering to testpoints on the mainboard.

1smcbl gets copied from eMMC to `0x2000_0000` (SRAM), size: `0x8000` in one go; **NO** separate HEADER/BODY parsing.

`0x2000_0001` is the entrypoint for 1SMCBL ~~and also our LR/PC hijack / payload destination~~.

Exception handlers set "**DebugData Error code** and then spin infinitely.

**DebugData_ErrorCode** is stored @ `0x1001_7ff8` in ESRAM.


Exception Vector table - Debug Data Error Code (not spewed by UART unfortunately):

- 0x1_0000 - NMI
- 0x2_0000 - Hard fault
- 0x3_0000 - Memory fault
- 0x4_0000 - Bus fault
- 0x5_0000 - Usage fault
- 0x6_0000 - SV call
- 0x7_0000 - Debug monitor
- 0x8_0000 - Pending SV
- 0x9_0000 - Sys Tick

SmcFault codes:

- 0x48 - Exceeded 6 SMC start attempts
- 0x49 - Unknown ResetSrc
- 0x4A - Unexpected ResetSrc
- 0x50 - EFuse_FuseSts_bit0 is unset
- 0x51 - EFuse_FuseSts_bit1 is set
- 0x58 - Invalid EC ID hamming weight
- 0x59 - Invalid ExpDigest1SMCBL Hamming Weight
- 0x5A - Invalid 0SMCBL AesKey/ROMKey hamming weight
- 0x5B - Unexpected error @ fuse verification
- 0x60 - Copy1SMCBLToSRAM fail, XIP error
- 0x68 - Exp1SMCDigest mismatch (only taken if != devkit)
- 0x69 - 1SMCBL plaintext body hash mismatch

Note: Following errors shown as +1 over UART

- 0x70 - Xip / EMMC clock timeout
- 0x80 - (XIP, send flash command) EMMC PState bit 0 != 0
- 0x90 - (XIP, send flash command) EMMC PState bit 1 != 0
- 0xA0 - (XIP, send flash command) EMMC NINTSTS timeout
- 0xB0 - (XIP, send flash command) EMMC EINTSTS timeout
- 0xC0 - (XIP, send flash command) EMMC_RESP_REG0 Error ( & 0xFFF9_8080 != 0)
- 0xD0 - (XIP, send flash command) CMD 0x61B0_0000 timeout
- 0xE0 - (XIP, send flash command) CMD 0x83A0_0010 timeout
- 0xF0 - (XIP, send flash command) General Interrupt error

## 1SMCBL

TBD

## SMCFW

TBD
