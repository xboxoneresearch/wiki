# Code Integrity (CI)

Code integrity is a threat protection feature that checks the drivers and system files on your device for signs of corruption or malicious software.

## Overview

Whilst CI (code integrity) is often used for the detection of corrupt system files and malicious code, it can also be used by enterprises to limit or curate a whitelist of binary signatures allowed to execute into memory. The whitelist approach offers maximum protection against third party non-Microsoft signed, and unsigned, binaries unless specifically defined.

See the following documentation to learn more:

[Virtualization Based Protection](https://learn.microsoft.com/en-us/windows/security/hardware-security/enable-virtualization-based-protection-of-code-integrity)
-- [Archived Web Page](https://web.archive.org/web/20240331191856/https://learn.microsoft.com/en-us/windows/security/hardware-security/enable-virtualization-based-protection-of-code-integrity)

[Device Guard](https://learn.microsoft.com/en-us/archive/blogs/ukplatforms/getting-started-with-windows-10-device-guard-part-2-of-2)
-- [Archived Web Page](https://web.archive.org/web/20221226025453/https://learn.microsoft.com/en-us/archive/blogs/ukplatforms/getting-started-with-windows-10-device-guard-part-2-of-20)

[Catalog Deployment](https://learn.microsoft.com/en-us/windows/security/application-security/application-control/windows-defender-application-control/deployment/deploy-catalog-files-to-support-wdac)
-- [Archived Web Page](https://web.archive.org/web/20240505202455/https://learn.microsoft.com/en-us/windows/security/application-security/application-control/windows-defender-application-control/deployment/deploy-catalog-files-to-support-wdac)

[Xbox Binary Signing](https://learn.microsoft.com/en-us/gaming/gdk/_content/gc/packaging/title-packaging-streaming-install-testing#binary-signing)
-- [Archived Web Page](https://web.archive.org/web/20240505185027/https://learn.microsoft.com/en-us/gaming/gdk/_content/gc/packaging/title-packaging-streaming-install-testing)


## Xbox Hardware Platform Implementation

x86_64 based Xbox Consoles utilize a custom implementation of virtualization based protection baked into the host Xbox hypervisor and enforced by Xbox virtual machine images. CI enforcement can be overridden at the virtual machine and virtual disk level with Host OS access. Intended Host OS access is determined by the [Boot Capability Certificate](../security/certificates.md).

See the following documentation to learn more:

[VBI](../boot/vbi.md)

Prior to Windows 10/11 thresholds Windows Core 8.1 (Durango) based firmware relied heavily on standard CI protection, Xbox OS 10/11 based firmware now adds the addition of XCI (Xbox Code Integrity) to the existing CI chain to validate Xbox specific virtual images, catalogs, and CAB (Cabinet) files.

In addition to Host, System, and GameOS VMs mounting read-only [XVDs](../operating-system/xbox-virtual-drive.md), effectively preventing writes and/or modifications to the file system, each virtual disk also contains the presence of catalog files in the root directory.

## Xbox Catalog Files

Catalog files are generated in the root of every virtual disk on release build firmware and is checked by code integrity enforcement. The Binary Signatures contained within the Catalog files determine the conditions in which a binary matching the signature can execute into memory.

Conditions are as followed:
```
[Universal]

Initiate Base Catalog000.bin Binary Signatures

Determine Current Boot Environment - Retail or Development

Determine Allowed Binary Signature Execution Space - User or Kernel

Approve Binary Signature for User Space Execution.

Approve Binary Signature for Kernel Space Execution.

Allow Execution of Binaries matching Catalog000.bin Binary Signatures


[Retail]

Deny Additional CatalogXXX.bin Binary Signatures

Deny Execution of Binaries Unsigned by Microsoft Certificate Authority


[Development]

Allow Execution of Binaries matching Catalog000.bin Binary Signatures

Initiate Additional CatalogXXX.bin Binary Signatures

Determine Whether Catalog Index Matches Current Boot Capability Certificate

Deny Execution of Binary Signatures with Defined but Unsatisfied Boot Capability

Allow Execution of Binaries matching CatalogXXX.bin Binary Signatures
```


