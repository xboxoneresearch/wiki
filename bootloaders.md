<!-- TITLE: Bootloaders -->
<!-- SUBTITLE: A quick summary of Bootloaders -->

# Header
== SPBL ==
Primary bootloader that is used for initialising the Security Processor, decrypting the future stages, verifying the console certificates, fuses and more. This sequence is split into 3 boot stages.
* 0SP : Stored in SP ROM (factory)
* 1SP : Patched into boot.bin
* 2SP : Patched into boot.bin

== SMC ==

== 2BL ==
Started after the SP has completed its boot. Proceeds to intialise the rest of the console and then begins booting into the Host VBI.

== SCP ==
Unknown, somewhere in between 2BL and VBI.

== VBI ==
Final boot stage which initialises the critical components of the operating system and essentially acts as a bootstrap.