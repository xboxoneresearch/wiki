# Deployment of self-signed UWP apps

## General

The "20$ Devkit License" is meant exactly for this case - developing and debugging your self-written UWP applications.

Luckily, by reaching into SystemOS in Retail world, we can attempt to achieve the same thing.

The main component dealing with UWP app deployment in SystemOS is `AppxDeploymentServer.dll` which has some interesting checks on certain registry keys.

| Path                                                          | Key                               | Type      | Value | Purpose |
| --------------------------------------------------------------| ----------------------------------| ----------| ----- | ------- |
| HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock | AllowDevelopmentWithoutDevLicense | REG_DWORD |     1 |         |
| HKLM\SOFTWARE\Policies\Microsoft\Windows\Appx                 | AllowDevelopmentWithoutDevLicense | REG_DWORD |     1 |         |
| HKLM\OSDATA\SOFTWARE\Microsoft\SecurityManager                | InternalDevUnlock                 | REG_DWORD |     4 |         |

## Creation of UWP packages

For retail mode to accept our custom app containers, they need to signed and encrypted!

**Encryption**

The only key that we can freely use for encryption is the **global test key**, which is hardcoded into Windows SDK's `makeappx.exe` tool.
It gets used with the `/kt` switch (key-test).

NOTE: Dependencies/Libraries DO NOT need to encrypted! (NOTE: Maybe a loophole for Series-family consoles?)

See: [Microsoft Docs](https://learn.microsoft.com/en-us/windows/win32/appxpkg/make-appx-package--makeappx-exe-#to-encrypt-a-package-with-a-global-test-key)

**Signing**

The package also needs to be signed and the respective signing public key has to be imported into the console's certificate storage.


## Installing a package

There are basically two commandline options to install an application package:

- MinDeployAppx.exe (as SYSTEM user)
- deployutil.exe (as DefaultAccount user)

Sample invocations

```
deployutil /install D:\mypackage.eappx
```

```
MinDeployAppx.exe /Add /PackagePath:"D:\mypackage.eappx"
```

## Blacklisting of apps (emulators, etc.)

Microsoft [started blocking](https://www.theverge.com/2023/4/7/23674707/microsoft-xbox-emulators-ban-nintendo) emulators and other applications in May 2023.
The did so by distributing blocklists via Xbox Live's `LiveSettings` that would then be stored in the registry of the console.

With appropriate access we can simply change/delete those entries!

Set

| Path                                                          | Key                               | Type      | Value | Purpose                         |
| --------------------------------------------------------------| ----------------------------------| ----------| ----- | ------------------------------- |
| HKLM\OSDATA\Software\Microsoft\Durango\LiveSettings           | BlockEmulatorsEnabled             | REG_DWORD |     0 | Set to zero to disable blocking |

Delete

| Path                                                          | Key                                   | Type      |
| --------------------------------------------------------------| --------------------------------------| ----------|
| HKLM\OSDATA\Software\Microsoft\Durango\LiveSettings           | BlockEmulatorsRestrictedExeSubstrings | REG_SZ    |
| HKLM\OSDATA\Software\Microsoft\Durango\LiveSettings           | BlockEmulatorsLogOnlyExeSubstrings    | REG_SZ    |
| HKLM\OSDATA\Software\Microsoft\Durango\LiveSettings           | BlockEmulatorsPublisherPackageStrings | REG_SZ    |

### Series consoles

Unfortunately this flow mentioned above does not work for the Series-family of Xbox consoles yet.

Current assumption is that the **global test key** is not supported there anymore.

This is currently being investigated.


### References

- [Github - Retail UWP Deployment](https://github.com/xboxoneresearch/retail-uwp-deployment) - Scripts for deploying UWP apps in retail mode
