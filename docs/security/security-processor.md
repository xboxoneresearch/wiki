<!-- TITLE: Security Processor -->
<!-- SUBTITLE: AMD Platform security processor -->

# Platform Security processor (AMD PSP)
The [AMD Platform Security Processor (PSP)](https://en.wikipedia.org/wiki/AMD_Platform_Security_Processor) is a self-contained core located on the Xbox CPU die. From official AMD documentation, it's described as an ARM core. However, instead of running TrustZone per AMD's spec, it appears to be running MS customized code.

It seems that the PSP handles crypto for certain things, and also may use keyslots in a way similar to the Xbox 360's keyvault, except, instead of the actual console OS having access to these keys, only code running on the PSP can use them.

The Xbox One HostOS contacts the PSP through the psp.sys driver. For decrypting XVDs, it appears to send the header of the XVD to the PSP, which then (assumably) decrypts the CIK field in the header and sends it back, with the OS performing the rest of the decryption.

psp.sys also has commands which seem to read memory from the PSP instead of sending commands to it. The contents of this memory are unknown, but it's possible (albeit unlikely) that the ODK may be in this area of memory.

## Credits
[Info from emoose's xvdtool](https://github.com/emoose/xvdtool/blob/master/xvd_info.md)