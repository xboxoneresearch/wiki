# Clip.idx
Stores metadata and info on licenses/keys. It's not entirely clear what purpose it has, as it does not store the actual license data (`<SPLicenseBlock>`) from the `.xml` files. 

## File Format
Total size: `0x4 (COUNT) + (0x54 * COUNT) + 0x20 (HASH)`

| Offset | Length | Type                   | Information                    |
| ------ | ------ | ---------------------- | ------------------------------ |
| 0x00   | 0x04   | uint32                 | Count                          |
| 0x04   | 0x54+  | StoredLicenseRecord[]  | License Data                   |
| 0x58+  | 0x20   | byte[]                 | Content Hash                   |

### StoredLicenseRecord Layout

| Offset | Length | Type           | Information                    |
| ------ | ------ | -------------- | ------------------------------ |
| 0x00   | 0x10   | GUID           | KeyID                          |
| 0x10   | 0x10   | GUID           | LicenseID                      |
| 0x20   | 0x10   | GUID           | UplinkKeyID                    |
| 0x30   | 0x10   | GUID           | BindingToIdentity              |
| 0x40   | 0x08   | double         | AbsoluteBeginDate              |
| 0x48   | 0x08   | double         | AbsoluteExpirationDate         |
| 0x50   | 0x04   | LicenseFlags   | Flags                          |

### License Flags 

| Value  | Name (Estimated)              |
| ------ | ----------------------------- |
| 0x01   | LICENSE_FLAG_UPLINK_PRESENT   |
| 0x02   | LICENSE_FLAG_IDENTITY_BOUND   |
| 0x04   | LICENSE_FLAG_APPLIED          |
| 0x10   | LICENSE_FLAG_PERSISTENT       |
| 0x20   | LICENSE_FLAG_NO_UPLINK_KEY    |

## Location

Created by [MicrosoftXboxSecurityClip.exe](../software/system-os/microsoftXboxSecurityClip.exe.md) and stored at `S:/Clip/clip.idx`