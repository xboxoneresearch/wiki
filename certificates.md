<!-- TITLE: Certificates -->
<!-- SUBTITLE: A quick summary of Certificates -->

# Certificates
For verification of the console and as well as a method of securely
determining the capabalities to enable.

## Console Certificate

Per-console certificate to verify and define the device. Stored in
**sp_s.cfg** (offset: 0x5400) inside [XBFS](xbox-boot-file-system).

Total Size: 0x400 bytes

| Offset | Length | Type     | Information                    |
| ------ | ------ | -------- | ------------------------------ |
| 0x00   | 0x02   | ushort   | Magic (CC)                     |
| 0x02   | 0x02   | ushort   | Size                           |
| 0x04   | 0x02   | ushort   | IssuerKeyId                    |
| 0x06   | 0x02   | ushort   | ProtocolVersion                |
| 0x08   | 0x04   | uint32   | IssueDate                      |
| 0x0C   | 0x04   | uint32   | PspRevisionId                  |
| 0x10   | 0x10   | byte\[\] | SocId                          |
| 0x20   | 0x02   | ushort   | GenerationId                   |
| 0x22   | 0x01   | byte     | ConsoleRegion                  |
| 0x23   | 0x01   | byte     | Reserved0                      |
| 0x24   | 0x04   | uint32   | Reserved1                      |
| 0x28   | 0x08   | byte\[\] | VendorId                       |
| 0x30   | 0x100  | byte\[\] | AttestationPublicKey           |
| 0x130  | 0x100  | byte\[\] | ReservedPublicKey              |
| 0x230  | 0x0C   | byte\[\] | ConsoleSerialNumber            |
| 0x23C  | 0x08   | byte\[\] | ConsoleSku                     |
| 0x244  | 0x20   | byte\[\] | ConsoleSettingsDigest (SHA256) |
| 0x264  | 0x0C   | byte\[\] | ConsolePartNumber              |
| 0x270  | 0x10   | byte\[\] | HwSpecificData                 |
| 0x280  | 0x180  | byte\[\] | RsaSignature                   |

## Boot Capability Certificate

Used to determine what type of developer features the console can use.
Stored in **certkeys.bin** inside [XBFS](xbox-boot-file-system).

Total Size: 0x180 bytes

| Offset | Length | Type       | Information       |
| ------ | ------ | ---------- | ----------------- |
| 0x00   | 0x02   | ushort     | Magic (CP)        |
| 0x02   | 0x02   | ushort     | Size              |
| 0x04   | 0x02   | ushort     | ProtocolVersion   |
| 0x06   | 0x02   | ushort     | IssuerKeyId       |
| 0x08   | 0x08   | uint64     | Issue Date        |
| 0x10   | 0x10   | byte\[\]   | SoC ID            |
| 0x20   | 0x02   | ushort     | GenerationId      |
| 0x22   | 0x01   | byte       | AllowedStates     |
| 0x23   | 0x01   | byte       | LastCapability    |
| 0x24   | 0x04   | uint       | Flags             |
| 0x28   | 0x01   | byte       | ExpireCentury     |
| 0x29   | 0x01   | byte       | ExpireYear        |
| 0x2A   | 0x01   | byte       | ExpireMonth       |
| 0x2B   | 0x01   | byte       | ExpireDayOfMonth  |
| 0x2C   | 0x01   | byte       | ExpireHour        |
| 0x2D   | 0x01   | byte       | ExpireMinute      |
| 0x2E   | 0x01   | byte       | ExpireSecond      |
| 0x2F   | 0x01   | byte       | MinimumSpVersion  |
| 0x30   | 0x08   | uint64     | Minimum2blVersion |
| 0x38   | 0x10   | byte\[\]   | Nonce             |
| 0x48   | 0x38   | byte\[\]   | Reserved          |
| 0x80   | 0x200  | ushort\[\] | Capabilities      |
| 0x280  | 0x180  | byte\[\]   | RsaSignature      |