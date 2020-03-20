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

### Format
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

### Capabilities
```
enum CERTIFICATE_CAPABILITIES : ushort {
    SRA_DEVKIT = 0x2001,
    SRA_DEVKIT_DEBUG = 0x2002,
    SRA_FILE_IO = 0x2003,
    SRA_STREAM = 0x2004,
    SRA_PUSH_DEPLOY = 0x2005,
    SRA_PULL_DEPLOY = 0x2006,
    SRA_PROFILING = 0x2007,
    SRA_JS_PROFILING = 0x2008,
    RECOVERY = 0x3001,
    VS_CRASH_DUMP = 0x3002,
    CRASH_DUMP = 0x3003,
    REMOTE_MGMT = 0x3004,
    VIEW_TRACING = 0x3005,
    TCR_TOOL = 0x3006,
    XSTUDIO = 0x3007,
    GESTURE_BUILDER = 0x3008,
    SPEECH_LAB = 0x3009,
    SMARTGLASS_STUDIO = 0x300A,
    NETWORK_FIDDLER = 0x300B,
    ERA_DEVKIT = 0x4001,
    HW_BERSINGSEA_DEBUG = 0x4002,
    ERA_DEVKIT_DEBUG = 0x4003,
    ERA_FILE_IO = 0x4004,
    ERA_STREAM = 0x4005,
    ERA_PUSH_DEPLOY = 0x4006,
    ERA_PULL_DEPLOY = 0x4007,
    ERA_EXTRA_MEM = 0x4008,
    ERA_PROFILING = 0x4009,
    MS_DEVKIT = 0x6001,
    HW_CPU_DEBUG = 0x6002,
    HW_FW_DEBUG = 0x6003,
    HW_POWER_DEBUG = 0x6004,
    MEMENC_DISABLED = 0x6005,
    MEMENC_FIXED_KEY = 0x6006,
    MEMENC_KEY_0 = 0x6007,
    CERT_MTE_BOOST = 0x6008,
    CERT_RIO_BOOST = 0x6009,
    CERT_TEST_BOOST = 0x600A,
    UPDATE_TESTER = 0x600B,
    RED_CPU_CODE = 0x600C,
    OS_PREVIEW = 0x600D,
    RETAIL_DEBUGGER = 0x600E,
    OFFLINE = 0x600F,
    IGNORE_UPDATESEQUENCE = 0x6010,
    CERT_QASLT = 0x6011,
    GPU_FENCE_DEBUG = 0x6013,
    HW_EN_MEM_SPEED_RETEST = 0x6014,
    HW_EN_MEM_1GB_RETEST = 0x6015,
    HW_EN_FUSE_READ = 0x6016,
    HW_EN_POST_CODE_SECURE = 0x6017,
    HW_EN_FUSE_OVR_RETEST = 0x6018,
    HW_EN_MEM_UNLIM_RETEST = 0x6019,
    ICT_TESTER = 0x601A,
    LOADXVD_TESTER = 0x601B,
    WIDE_THERMAL_THRESHOLDS = 0x601C,
    MS_TESTLAB = 0x601D,
    ALLOW_DISK_LICENSE = 0x601E,
    ALLOW_SYSTEM_DOWNGRADE = 0x601F,
    WIFI_TESTER = 0x6020,
    GREEN_FIDDLER = 0x6021,
    KIOSK_MODE = 0x6022,
    FULL_MEDIA_AUTH = 0x6023,
    HW_DEVTEST = 0x6024,
    ALLOW_FUSE_FA = 0x6025,
    ALLOW_SERIAL_CERT_UPLOAD = 0x6026,
    ALLOW_INSTRUMENTATION = 0x6027,
    WIFI_TESTER_DFS = 0x6028,
    HOSTOS_HW_TEST = 0x6029,
    HOSTOS_ODD_TEST = 0x602A,
    REDUCE_MODE_TESTER = 0x7002,
    SP_DEVKIT = 0x8001,
    HW_SP_DEBUG = 0x8002,
    SCP_DEBUG = 0x8003,
    HW_SDF = 0x8004,
    HW_ALL_DEBUG = 0x8005,
    HW_AEB_DEBUG = 0x8006,
    HW_BTG = 0x8007,
    SP_TESTER = 0x8008,
    SP_DEBUG_BUILD = 0x8009,
    NO_FUSE_BLOW = 0x800A,
    HW_DIS_N_CALIB_RETEST = 0x800B,
    HW_DIS_CRIT_FUSE_CHK_RETEST = 0x800C,
    GREEN_SRA_DEBUG = 0x800D,
    GREEN_ERA_DEBUG = 0x800E,
    HW_DIS_RNG_CHK_SECURE = 0x800F,
    HW_EN_FUSE_OVRD_SECURE = 0x8010,
    GREEN_HOST_DEBUG = 0x8011,
    GREEN_ALLOW_DISK_LICENSES = 0x8012,
    VIRT_CAP_DEVKIT_ANY_EQUIV = 0xF001,
    VIRT_CAP_DEVKIT_INTERNAL_EQUIV = 0xF002,
    VIRT_CAP_SP_DEVKIT_EQUIV = 0xF003
};
```

Information about capabilities gathered from: `C:\Windows\DefaultApp\XboxOneExtensions.dll`