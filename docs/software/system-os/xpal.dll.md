# Xpal.dll

`C:\Windows\System32\xpal.dll` is a library used by various programs for obtaining console hardware/system configuration.

---

## Functions

### DllMain / Init

On init (aka load), `xpal.dll` will cache some information about the console.

#### Product Info

It caches the Windows product ID.

```cpp
RtlInitUnicodeString(&name, L"Kernel-ProductInfo");
NtQueryLicenseValue(&name, &valueType, &g_productInfo, 4, &len);
```

**Relevant Product IDs**

| Value | Type                        |
|-------|-----------------------------|
| 0xC0  | PRODUCT_XBOX_SYSTEMOS       |
| 0xC2  | PRODUCT_XBOX_GAMEOS         |
| 0xC3  | PRODUCT_XBOX_ERAOS          |
| 0xC4  | PRODUCT_XBOX_DURANGOHOSTOS  |
| 0xC5  | PRODUCT_XBOX_SCARLETTHOSTOS |
| 0xC6  | PRODUCT_XBOX_KEYSTONE       |

#### Hypervisor Magic

Determines if the `EAX` register returned by `CPUID` leaf `0x40000001` matches the magic value `Xb#1` (`0x31236258` LE) and caches the result. 

#### Console Information

Opens `\\Global??\\XpalSectionData` and reads `0xC08` bytes into a Console Information object.

**Console Information Layout** (Incomplete)

| Offset | Length | Type            | Information                                       |
|--------|--------|-----------------|---------------------------------------------------|
| 0x0000 | 0x0400 | Certificate     | See [Certificate](../../security/certificates.md) |
| 0x0400 | ???    | FactorySettings | Unknown                                           |
| ???    | ???    | ???             | Unknown                                           |
| 0x0C00 | 0x0004 | uint32          | SMCFirmwareID                                     |
| 0x0C04 | 0x0004 | uint32          | SouthbridgeType                                   |

#### Devkit Flags

Sets a few booleans relating to devkits based on the registers returned by `CPUID` leaf `0x40000007` and caches the result. 

```cpp
  if (g_isXboxHypervisor) {
    g_internalDevkit = (Leaf7EAX & 8) != 0; //Is the 4th bit set?
    isExternalDevKit = (unsigned int)Leaf7EDX >> 31;
  }
  else {
    g_internalDevkit = (Leaf7EAX & 3) == 3; //Are the first 2 bits set?
    LOBYTE(isExternalDevKit) = Leaf7EAX & 1;
  }
  g_isExternalDevKit = isExternalDevKit;
```

### XpalIsCapabilityEnabled

- Signature: `N/A - Export`
- Params: `int32 capabilityIdx`
- Returns: `bool`
- Tested OS Version: `10.0.26100.9647`

Uses the result of an asm `CPUID` instruction (using leaf `0x40000007`) to test if `capabilityIdx` is present using a bit `&` (AND) comparison.
The input is the index of the byte across the 128 bits returned from `CPUID`.

Despite accepting an int32, the function is limited to 0-127, anything above that will always return false.

**Capability Flags**

Sourced using `C:\xbdiag\plugins\XpalPlugin.dll`

| Bit | Capability                   |
|-----|------------------------------|
| 0   | AllowRedSignedCode           |
| 1   | AllowKernelModeDebugging     |
| 2   | AllowUserModeDebugging       |
| 3   | AllowTelnetServer            |
| 4   | AllowIOPorts                 |
| 5   | AllowFullMsrSpace            |
| 6   | AllowPerfCounters            |
| 7   | AllowHost512MB               |
| 8   | Reserved0                    |
| 9   | AllowRemoteRecovery          |
| 10  | AllowStreaming               |
| 11  | Reserved1                    |
| 12  | Reserved2                    |
| 13  | AllowProfiling               |
| 14  | Reserved3                    |
| 15  | AllowCrashDump               |
| 16  | Reserved5                    |
| 17  | Reserved6                    |
| 18  | Reserved7                    |
| 19  | AllowTracing                 |
| 20  | AllowRetailGameDump          |
| 21  | Reserved8                    |
| 22  | Reserved9                    |
| 23  | Reserved10                   |
| 24  | AllowNetworkTools            |
| 25  | Reserved11                   |
| 26  | AllowHostNetworkStack        |
| 27  | AllowSystemUpdateTest        |
| 28  | AllowOffChipPerfCtrStreaming |
| 29  | Reserved12                   |
| 30  | AllowSystemDowngrade         |
| 31  | AllowGreenDiskLicenses       |
| 32  | IsLiveConnected              |
| 33  | IsMteBoosted                 |
| 34  | IsQaSlt                      |
| 35  | IsStockImage                 |
| 36  | IsMsTestLab                  |
| 37  | IsRetailDebugger             |
| 38  | IsXvdSrt                     |
| 39  | IsGreenDebug                 |
| 40  | IsHwDevTest                  |
| 41  | AllowDiskLicenses            |
| 42  | AllowInstrumentation         |
| 43  | AllowWifiTester              |
| 44  | AllowWifiTesterDFS           |
| 45  | IsHwTest                     |
| 46  | AllowHostOddTest             |
| 47  | IsLiveUnrestricted           |
| 48  | Reserved13                   |
| 49  | Reserved14                   |
| 50  | OsPerformanceTest            |
| 51  | OsBackCompatTest             |
| 52  | AllowPixCaptures             |
| 53  | AllowGreenHostTelnet         |
| 54  | GreenGameStreaming           |
| 55  | AllowGreenDevkitIni          |
| 56  | GreenPartnerRemoteDebug      |
| 57  | AllowRedCFPU2                |
| 127 | IsDevkit                     |
| 127 | UseAlternateXvd              |
| 127 | MaxCaps                      |

### XpalIsCapabilityEnabledByVm

- Signature: `N/A - Export`
- Params: `int32 capabilityIdx, int32 vmType`
- Returns: `int32(?)`
- Tested OS Version: `10.0.26100.9647`

Nearly identical to [XpalIsCapabilityEnabled](#xpaliscapabilityenabled), 
however it uses `vmType` to rotate the caller leaf target before performing a bit test on `capabilityIdx`:

**VmType Values**

| VmType | Leaf         |
|--------|--------------|
| Other  | `0x40000007` |
| 2      | `0x40000008` |
| 3      | `0x40000009` |

### XpalGetCapabilities

- Signature: `N/A - Export`
- Params: `XpalCapabilities* capabilitiesOut`
- Returns: `void?`
- Tested OS Version: `10.0.26100.9647`

Collects the 128 bit result of a `CPUID` instruction using leaf `0x40000007` in a XpalCapabilities struct (Estimated name).

**XpalCapabilities Layout**

| Offset | Length | Type   | Information |
|--------|--------|--------|-------------|
| 0x00   | 0x04   | uint32 | EAX         |
| 0x04   | 0x04   | uint32 | EBX         |
| 0x08   | 0x04   | uint32 | ECX         |
| 0x0C   | 0x04   | uint32 | EDX         |

### XpalGetVmType

- Signature: `N/A - Export`
- Params: `None`
- Returns: `uint8`
- Tested OS Version: `10.0.26100.9647`

Gets VmType from the lower 8 bits of the `ECX` register returned by `CPUID` leaf `0x40000007`.

I.e. `0x00000002` -> `0x02` on UWP-Devkit

### XpalGetConsoleMode

- Signature: `N/A - Export`
- Params: `None`
- Returns: `uint16`
- Tested OS Version: `10.0.26100.9647`

Gets ConsoleMode from the upper 16 bits of the `ECX` register returned by `CPUID` leaf `0x4000000D`.

I.e. `0x00640064` -> `0x64` on UWP-Devkit

### XpalGetSystemType

- Signature: `N/A - Export`
- Params: `None`
- Returns: `uint16`
- Tested OS Version: `10.0.26100.9647`

Gets SystemType from the lower 16 bits of the `ECX` register returned by `CPUID` leaf `0x4000000D`.

I.e. `0x00640064` -> `0x64` on UWP-Devkit

### XpalGetGenerationType

- Signature: `N/A - Export`
- Params: `None`
- Returns: `uint16`
- Tested OS Version: `10.0.26100.9647`

Nearly identical to [XpalGetSystemType](#xpalgetsystemtype).
Checks if the lower 16 bits of the `ECX` register returned by `CPUID` leaf `0x4000000D` is < `0x60`.

**Return Values**

| Value | Information |
|-------|-------------|
| 8     | Xbox One    |
| 9     | Xbox Series |

### XpalGetHostOsInformation

- Signature: `N/A - Export`
- Params: `None`
- Returns: `uint64`
- Tested OS Version: `10.0.26100.9647`

Returns flags from the merged `EAX`, `EBX`, and `EDX` registers returned by `CPUID` leaf `0x4000000D`.

### XpalIsGen8 && XpalIsGen9

- Signature: `N/A - Export`
- Params: `None`
- Returns: `bool`
- Tested OS Version: `10.0.26100.9647`

Nearly identical to [XpalGetGenerationType](#xpalgetgenerationtype), just returning true/false for 8/9.

### XpalGetServerType

- Signature: `N/A - Export`
- Params: `None`
- Returns: `uint8`
- Tested OS Version: `10.0.26100.9647`

If [XpalIsCapabilityEnabled](#xpaliscapabilityenabled) returns false for `0x0` (AllowRedSignedCode), this just returns `0x0`. 
Otherwise, it'll get SystemType from the middle-lower 8 bits (16-23) of the `EDX` register returned by `CPUID` leaf `0x4000000D`.

I.e. `0x00002222` -> `0x00` on UWP-Devkit (despite having AllowRedSignedCode)

### XpalGetFactorySettings

- Signature: `N/A - Export`
- Params: `wchar_t* bufOut, int64 bufLen`
- Returns: `FactorySettings*`
- Tested OS Version: `10.0.26100.9647`

Returns a pointer to the factory settings (layout unknown) contained in the [Console Information](#console-information) object (cached at init).

### XpalGetConsoleCertificate

- Signature: `N/A - Export`
- Params: `wchar_t* bufOut, int64 bufLen`
- Returns: `Certificate*`
- Tested OS Version: `10.0.26100.9647`

Returns a pointer to the [Certificate](../../security/certificates.md) contained in the [Console Information](#console-information) object (cached at init).

### XpalGetConsoleIdCch

- Signature: `N/A - Export`
- Params: `wchar_t* bufOut, int64 bufLen`
- Returns: `bool`
- Tested OS Version: `10.0.26100.9647`

Uses stored [Console Information](#console-information) (cached at init) and formats the console `SocID` into `XXXXXXXX.XXXXXXXX.XXXXXXXX.XXXXXXXX.XX`.
If the certificate does not contain the magic `CC`, it'll fall back to `00000000.00000000.00000000.00000000.00`.

Returns true if `bufLen >= 0`;

### XpalGetConsoleSerialNumberCch

- Signature: `N/A - Export`
- Params: `wchar_t* bufOut, int64 bufLen`
- Returns: `bool`
- Tested OS Version: `10.0.26100.9647`

Uses stored [Console Information](#console-information) (cached at init) and formats the console `ConsoleSerialNumber` into 12 or 14 byte string.
If the certificate does not contain the magic `CC`, it'll fall back to `000000000000`.

Returns true if `bufLen >= 0`;

### XpalGetSmcFirmwareId

- Signature: `N/A - Export`
- Params: `None`
- Returns: `uint32`
- Tested OS Version: `10.0.26100.9647`

Uses stored [Console Information](#console-information) (cached at init) and returns the `SMCFirmwareID` (offset `0xC00`).

### XpalGetSouthBridgeType

- Signature: `N/A - Export`
- Params: `None`
- Returns: `uint32`
- Tested OS Version: `10.0.26100.9647`

Uses stored [Console Information](#console-information) (cached at init) and returns the `SouthbridgeType` (offset `0xC04`).

### XpalIsInternalDevkit

- Signature: `N/A - Export`
- Params: `None`
- Returns: `bool`
- Tested OS Version: `10.0.26100.9647`

Returns the stored `g_internalDevkit` flag stored from [devkit](#devkit-flags).

### XpalIsExternalDevkit

- Signature: `N/A - Export`
- Params: `None`
- Returns: `bool`
- Tested OS Version: `10.0.26100.9647`

Returns the stored `g_isExternalDevKit` flag stored from [devkit](#devkit-flags).

### XpalIsFactorySettingEnabled

- Signature: `N/A - Export`
- Params: `int32 settingIdx`
- Returns: `bool`
- Tested OS Version: `10.0.26100.9647`

Uses the result of an asm `CPUID` instruction (using leaf `0x4000000E`) to test if `settingIdx` is present using a bit `&` (AND) comparison.
The input is the index of the byte across the 128 bits returned from `CPUID`.

Only accepts values 0-2.

**Factory Setting Mapping**

Sourced using `C:\xbdiag\plugins\XpalPlugin.dll`

| Value | Feature          |
|-------|------------------|
| 0     | IsServerSku      |
| 1     | IsNoOdd          |
| 2     | IsDevKitHardware |

### XpalIsFeatureEnabled

- Signature: `N/A - Export`
- Params: `int32 featureIdx`
- Returns: `bool`
- Tested OS Version: `10.0.26100.9647`

Performs a bunch of conditional checks, some using `CPUID`, some using cached data. Only processes a `featureIdx` between 0-15.

**Feature Mapping**

Sourced using `C:\xbdiag\plugins\XpalPlugin.dll`

| Value | Feature             | Condition                                                                                                                           |
|-------|---------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| 0     | XboxHypervisor      | See [Hypervisor Magic](#hypervisor-magic)                                                                                           |
| 1     | LocalGamePlay       | [ProductId](#product-info) != `KEYSTONE`                                                                                            |
| 2     | NoOdd               | [XpalIsFactorySettingEnabled](#xpalisfactorysettingenabled)(`IsNoOdd`)                                                              |
| 3     | SecondaryEthernet   | SystemType == `0x58`                                                                                                                |
| 4     | ServerSku           | [XpalIsFactorySettingEnabled](#xpalisfactorysettingenabled)(`IsServerSku`)                                                          |
| 5     | DevkitSku           | [XpalIsFactorySettingEnabled](#xpalisfactorysettingenabled)(`IsDevKitHardware`)                                                     |
| 6     | HdmiIn              | Is Xbox One && ! [XpalIsFactorySettingEnabled](#xpalisfactorysettingenabled)(`IsNoOdd`) && [ProductId](#product-info) != `KEYSTONE` |
| 7     | Kinect              | Is Xbox One && ! [XpalIsFactorySettingEnabled](#xpalisfactorysettingenabled)(`IsNoOdd`) && [ProductId](#product-info) != `KEYSTONE` |
| 8     | GameDvr             | [ProductId](#product-info) != `KEYSTONE`                                                                                            |
| 9     | QuickResume         | AllowRemoteRecovery                                                                                                                 |
| 10    | ImplicitQuickResume | Is Xbox Series                                                                                                                      |
| 11    | ???                 |                                                                                                                                     |
| 12    | ???                 | Is Xbox One && [ProductId](#product-info) != `KEYSTONE`                                                                             |
| 13    | ???                 | SystemType != `0x10` && [ProductId](#product-info) != `KEYSTONE`                                                                    |
| 14    | ???                 | Is Xbox Series && [ProductId](#product-info) != `KEYSTONE`                                                                          |
| 15    | ???                 | [ProductId](#product-info) != `KEYSTONE`                                                                                            |

### XpalGetXConfig

- Signature: `N/A - Export`
- Params: `uint32 configId, void* bufOut, uint32 bufLen, uint32* byteCount`
- Returns: `NTSTATUS`
- Tested OS Version: `10.0.26100.9647`

Wrapper around `\\Device\\XConfig`.

Performs an IOCTL request of `0x22600E` using `configId` and `bufOut` as the input.

If [XpalIsFactorySettingEnabled](#xpalisfactorysettingenabled)(`IsServerSku`) && [XpalIsCapabilityEnabled](#xpaliscapabilityenabled)(`IsMteBoosted`), the start of the returned buffer will have `0x865` flipped via a bit `|` (OR) op.

### XpalSetXConfig

- Signature: `N/A - Export`
- Params: `uint32 configId, const void* configData, uint32 configDataSize`
- Returns: `NTSTATUS`
- Tested OS Version: `10.0.26100.9647`

Wrapper around `\\Device\\XConfig`.

Performs an IOCTL request of `0x22A011` using `configId` and `configData` as the input.

### XpalQueryTitleVmInfo

- Signature: `N/A - Export`
- Params: `XpalTitleVmInfo* infoOut`
- Returns: `NTSTATUS`
- Tested OS Version: `10.0.26100.9647`

Wrapper around `\\\\.\\XVmCtrl` (`C:\Windows\System32\Drivers\xvmctrl.sys`).

Performs an IOCTL request of `0x150114` ([QUERY_TITLE_VM_INFO](../../games/launching.md#query_title_vm_info-command)).

This does not return the same `0x214` struct layout as documented [here](../../games/launching.md#query_title_vm_info-command). It shifted the layout around, need to look more into it...

### XpalWaitForTitleVmTermination

### XpalInitiateSystemShutdown

### XpalSetInformation

### XpalInitiatePowerStateToggle

### XpalSetSystemTime

### XpalQueryPowerToggleSource

### XpalReportUem

### XpalIsTransitioningToConnectedStandby

### XpalIsSilentBootMode

### XpalInitiateDump

### XpalRefreshPowerChimeMode

### XpalIsInForcedCs

### XpalNotifyForcedCsHeartbeat

### XpalIsRebootRequested

### XpalSetWakeupTimer
