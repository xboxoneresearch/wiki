# Event Tracing (ETW)

## General

Event Tracing is very useful to get deep insights into the operating system as pretty much every component is writing logs / metrics.

On Xbox, there are two mechanisms to write out [ETW](https://learn.microsoft.com/en-us/windows/win32/etw/about-event-tracing) information.

- `xbdiagcap.exe` (`C:\\xbdiag\\xbdiagcap.exe`) - for a predefined set of logging providers
- `xperf.exe` (`C:\\Windows\\System32\\xperf.exe`) - General usage of ETW

To view the logs (*.etl files) on a Desktop Windows, you can use `Windows Performance Analyzer` ([WPA](https://learn.microsoft.com/en-us/windows-hardware/test/wpt/windows-performance-analyzer)).

If you have unsigned code execution in SystemOS, [sealighter](https://github.com/pathtofile/Sealighter) enables you to view the traces in realtime on the cmdline.
Check this page on [how to configure](https://github.com/pathtofile/Sealighter/blob/main/docs/CONFIGURATION.md) sealighter.

## xbdiag

`xbdiagcap` will capture the system-predefined providers and write them out to `T:\\Windows\Temp\XBDiagPackage`.

The console output looks like this

```text
C:\xbdiag>xbdiagcap.exe     
capture started
package capture starting...
package capture at 6 percent.
package capture at 8 percent.
package capture at 11 percent.
package capture at 13 percent.
package capture at 16 percent.
package capture at 18 percent.
package capture at 21 percent.
package capture at 24 percent.
package capture at 26 percent.
package capture at 29 percent.
package capture at 31 percent.
package capture at 34 percent.
package capture at 36 percent.
package capture at 39 percent.
package capture at 42 percent.
package capture at 44 percent.
package capture at 47 percent.
package capture at 49 percent.
package capture at 52 percent.
package capture at 54 percent.
package capture at 57 percent.
package capture at 59 percent.
package capture at 62 percent.
package capture at 65 percent.
package capture at 67 percent.
package capture at 70 percent.
package capture at 72 percent.
package capture at 75 percent.
package capture at 77 percent.
package capture at 80 percent.
package capture at 83 percent.
package capture at 85 percent.
package capture at 88 percent.
package capture at 90 percent.
package capture at 93 percent.
package capture at 95 percent.
package capture at 98 percent.
package capture at 100 percent.
package captured at T:\Windows\Temp\XBDiagPackage
```

## xperf

[xperf](https://learn.microsoft.com/en-us/windows-hardware/test/wpt/xperf-command-line-reference) lets you interface with the ETW ecosystem.

### Example

Here is a small snippet how to start and then stop a logger, writing out the Trace information into an `*.etl` file.

This logs two providers

- Microsoft-Windows-AppXDeployment-Server
- Microsoft-Windows-AppXDeployment

Output file of the log: `D:\TestLogger.etl`

```text
xperf -start TestLogger -on Microsoft-Windows-AppXDeployment-Server+Microsoft-Windows-AppXDeployment
xperf -stop TestLogger -d D:\TestLogger.etl
```

## Providers

Known [providers](https://learn.microsoft.com/en-us/windows/win32/etw/about-event-tracing#providers), as of OS build `10.0.22621.2864` (November 2022)

Generated via `xperf.exe -providers`

```text
Known User Mode Providers: 
       0063715b-eeda-4007-9429-ad526f62696e                              : Microsoft-Windows-Services
       0063715b-eeda-4007-9429-ad526f62696e                              : SCM
       0075e1ab-e1d1-5d1f-35f5-da36fb4f41b1                              : Microsoft-Windows-Network-ExecutionContext
       00b7e1df-b469-4c69-9c41-53a6576e3dad                              : Microsoft-Windows-Security-IdentityStore
       030f2f57-abd0-4427-bcf1-3a3587d7dc7d                              : Microsoft-Windows-Diagnostics-PerfTrack
       044a9015-d96c-5dd1-0199-72d258325298                              : Microsoft-Windows-Dwm-Compositor
       051873f5-8280-4aec-8482-9c520f854769:0x000000007fffffff:0x4       : ShellManaged
       051873f5-8280-4aec-8482-9c520f854769:0x000000007fffffff:0x5       : ShellManagedVerbose
       051873f5-8280-4aec-8482-9c520f854769:0x0000000000000020:0x4       : ShellResponse
       059c3e04-5535-4929-85e1-93030e78f47b                              : ShellServices
       05f02597-fe85-4e67-8542-69567ab8fd4f                              : Microsoft-Windows-LiveId
       06184c97-5201-480e-92af-3a3626c5b140                              : Microsoft-Windows-Services-Svchost
       0657adc1-9ae8-4e18-932d-e6079cda5ab3                              : Microsoft-Windows-TimeBroker
       093da50c-0bb9-4d7d-b95c-3bb9fcda5ee8                              : Microsoft-Windows-Winsock-SQM
       099614a5-5dd7-4788-8bc9-e29f43db28fc                              : Microsoft-Windows-LDAP-Client
       0bd19909-eb6f-4b16-8074-6dce803f091d                              : Microsoft-Windows-UserDataAccess-Poom
       0bd3506a-9030-4f76-9b88-3e8fe1f7cfb6                              : Microsoft-Windows-NWiFi
       0bf2fb94-7b60-4b4d-9766-e82f658df540                              : Microsoft-Windows-Kernel-ShimEngine
       0cc157b3-cf07-4fc2-91ee-31ac92e05fe1                              : Microsoft-Windows-AppSruProv
       0d4fdc09-8c27-494a-bda0-505e4fd8adae                              : Microsoft-Windows-Directory-Services-SAM
       0ead09bd-2157-539a-8d6d-c87f95b64d70                              : Windows Error Reporting
       0f67e49f-fe51-4e9f-b490-6f2948cc6027                              : Microsoft-Windows-Kernel-Processor-Power
       0ff1c24b-7f05-45c0-abdc-3c8521be4f62                              : Microsoft-Windows-Mobile-Broadband-Experience-SmsApi
       10a208dd-a372-421c-9d99-4fad6db68b62                              : Microsoft-Windows-ApplicabilityEngine
       11a377e3-be1e-4ee7-abda-81c6eda62e71                              : DwmAltTab
       121d3da8-baf1-4dcb-929f-2d4c9a47f7ab                              : Microsoft-Windows-Base-Filtering-Engine-Connections
       125f2cf1-2768-4d33-976e-527137d080f8                              : Microsoft-Windows-SmartCard-TPM-VCard-Module
       1277a5d4-31ac-4116-bcc6-b9c658a00393                              : NuiServiceProvider
       152fdb2b-6e9d-4b60-b317-815d5f174c4a                              : Microsoft-Windows-Crypto-RSAEnh
       1540ff4c-3fd7-4bba-9938-1d1bf31573a7                              : DNS
       15ca44ff-4d7a-4baa-bba5-0998955e531e                              : Microsoft-Windows-Kernel-Boot
       15f4cd44-ca53-5422-db17-4e76821b5a69                              : Microsoft-Windows-Privacy-Auditing-CPSS
       16a1adc1-9b7f-4cd9-94b3-d8296ab1b130                              : Microsoft-Windows-Kernel-AppCompat
       17d2a329-4539-5f4d-3435-f510634ce3b9                              : Microsoft-Windows-Kernel-Dump
       17d6e590-f5fe-11dc-95ff-0800200c9a66                              : Microsoft-Windows-ApplicationExperience-SwitchBack
       18f4a5fd-fd3b-40a5-8fc2-e5d261c5d02e                              : Microsoft-Windows-ApplicationExperience-LookupServiceTrigger
       199fe037-2b82-40a9-82ac-e1d46c792b99                              : LsaSrv
       19a4c69a-28eb-4d4b-8d94-5f19055a1b5c                              : Microsoft-Windows-AsynchronousCausality
       19d2c934-ee9b-49e5-aaeb-9cce721d2c65                              : Microsoft-Windows-OLEACC
       19fd58f3-a757-4887-b04a-265a36c58ce9                              : ShellThumbnailCache
       1a870028-f191-4699-8473-6fcd299eab77                              : Microsoft-Windows-Remotefs-Rdbss
       1a9443d4-b099-44d6-8eb1-829b9c2fe290                              : Microsoft-Windows-PCI
       1aa764a5-fcae-4749-8c8b-e00b768c48c3                              : PerfX3
       1b1d4ff4-f27b-4c99-8bd7-da8f1a74051a                              : Summary Level Transaction 2
       1b562e86-b7aa-4131-badc-b6f3a001407e                              : Microsoft-Windows-DistributedCOM
       1bd264a4-4198-4ff5-90d8-9f80e9214e31                              : TraceResume
       1bd672b8-445e-53fc-35ef-09f53672c385                              : Microsoft-Windows-Privacy-Auditing-TailoredExperiences
       1d5990c1-ec62-49f0-9e37-1f4db12db41e                              : Microsoft-Windows-DeviceConfidence
       1de130e1-c026-4cbf-ba0f-ab608e40aeea                              : Microsoft-Windows-BitLocker-Driver-Performance
       1e2462be-b025-48da-8c1f-7b60b8ccae53                              : Microsoft-Windows-AppModel-MessagingDataModel
       1e39b4ce-d1e6-46ce-b65b-5ab05d6cc266                              : Microsoft-Windows-Networking-RealTimeCommunication
       1e9a4978-78c2-441e-8858-75b5d1326bc5                              : Microsoft-Windows-NetworkProvider
       1ee3abdb-c1fc-4b43-9e56-11064abba866                              : Microsoft-Windows-XAudio2
       1f678132-5938-4686-9fdc-c8ff68f15c85                              : Schannel
       206f6dea-d3c5-4d10-bc72-989f03c8b84b                              : Microsoft-Windows-Wininit
       22fb2cd6-0e7b-422b-a0c7-2fad1fd0e716                              : Microsoft-Windows-Kernel-Process
       23f0f2c7-c77c-51ee-0ac1-5ac7796a85df                              : Microsoft-Windows-Privacy-Auditing-OneSettingsClient
       24989972-0967-4e21-a926-93854033638e                              : Microsoft-Windows-RRAS
       25bd019c-3858-4ea4-a7b3-55b9ec8977e5                              : DwmRedir
       27246e9d-b4df-4f20-b969-736fa49ff6ff                              : DFS Filter
       277c9237-51d8-5c1c-b089-f02c683e5ba7                              : Microsoft-Windows-StartNameRes
       28058203-d394-4afc-b2a6-2f9155a3bb95                              : Microsoft-Windows-Proximity-Common
       28cf047a-2437-4b24-b653-b9446a419a69                              : DShow
       2957313d-fcaa-5d4a-2f69-32ce5f0ac44e                              : Microsoft-Windows-COM-RundownInstrumentation
       2a274310-42d5-4019-b816-e4b8c7abe95c                              : Microsoft-Windows-ReadyBoostDriver
       2a49de31-8a5b-4d3a-a904-7fc7409ae90d                              : Microsoft-Windows-MFH264Enc
       2aabd03b-f48b-419a-b4ce-7a14403f4a46                              : Microsoft-Windows-Mobile-Broadband-Experience-Api-Internal
       2c3e6d9f-8298-450f-8e5d-49b724f1216f                              : Microsoft-Windows-TabletPC-Platform-Input-Ninput
       2d4ebca6-ea64-453f-a292-ae2ea0ee513b                              : Microsoft-Windows-Direct3DShaderCache
       2e2bbb16-0c36-4b9b-a567-40924a199fd5                              : Microsoft-Windows-Mobile-Broadband-Experience-Api
       2e35aaeb-857f-4beb-a418-2e6c0e54d988                              : Microsoft-Windows-DriverFrameworks-UserMode
       2ed299d2-2f6b-411d-8d15-f4cc6fde0c70                              : Microsoft-Windows-AllJoyn
       2ed6006e-4729-4609-b423-3ee7bcd678ef                              : Microsoft-Windows-NDIS-PacketCapture
       2f07e2ee-15db-40f1-90ef-9d7ba282188a                              : Microsoft-Windows-TCPIP
       2ff3e6b7-cb90-4700-9621-443f389734ed                              : Microsoft-Windows-Kernel-WDI
       30336ed4-e327-447c-9de0-51b652c86108                              : ShellCore
       305fc87b-002a-5e26-d297-60223012ca9c                              : Microsoft-Windows-User-Diagnostic
       30e1d284-5d88-459c-83fd-6345b39b19ec                              : Microsoft-Windows-USB-USBXHCI
       3121cf5d-c5e6-4f37-be86-57083590c333                              : SrvControl
       315a8872-923e-4ea2-9889-33cd4754bf64                              : Microsoft-Windows-Immersive-Shell
       31f60101-3703-48ea-8143-451f8de779d2                              : DwmDiag
       32254f6c-aa33-46f0-a5e3-1cbcc74bf683                              : Microsoft-Windows-SMBWitnessClient
       3293f985-41d3-4b6a-b187-2ff4aa91f2fc                              : Multimedia-HEVCDECODER
       36008301-e154-466c-acec-5f4cbd6b4694                              : Microsoft-Windows-MMCSS
       362007f7-6e50-4044-9082-dfa078c63a73:0x000000000000ffff:0x5       : MediaFoundation
       362007f7-6e50-4044-9082-dfa078c63a73:0x000000000000ffff:0x1       : MFoundFatal
       362007f7-6e50-4044-9082-dfa078c63a73:0x000000000000ffff:0x2       : MFoundCritical
       362007f7-6e50-4044-9082-dfa078c63a73:0x000000000000ffff:0x3       : MFoundWarning
       362007f7-6e50-4044-9082-dfa078c63a73:0x000000000000ffff:0x4       : MFoundInfo
       362007f7-6e50-4044-9082-dfa078c63a73:0x000000000000ffff:0x5       : MFoundTrace
       362007f7-6e50-4044-9082-dfa078c63a73:0x000000000000ffff:0x6       : MFoundVerbose
       3635d4b6-77e3-4375-8124-d545b7149337                              : Microsoft-Windows-Kernel-WSService-StartServiceTrigger
       36b6f488-aad7-48c2-afe3-d4ec2c8b46fa                              : Microsoft-Windows-Performance-Recorder-Control
       36da592d-e43a-4e28-af6f-4bc57c5a11e8                              : Microsoft-Windows-USB-UCX
       37945dc2-899b-44d1-b79c-dd4a9e57ff98                              : Microsoft-Windows-MPS-CLNT
       39a7b5e0-be85-47fc-b9f5-593a659abac1                              : Mup Drv Instr
       3a718a68-6974-4075-abd3-e8243caef398                              : Microsoft-Windows-Push-To-Install-Service
       3ae1ea61-c002-47fb-b06c-4022a8c98929                              : Microsoft-Windows-WebAuthN
       3cb2a168-fe34-4a4e-bdad-dcf422f34473                              : Microsoft-Windows-SmartScreen
       3e59a529-b0b3-4a11-8129-9ffe6bb46eb9                              : Microsoft-Windows-Fat-SQM
       3eb875eb-8f4a-4800-a00b-e484c97d7551                              : Microsoft-Windows-Network-Connection-Broker
       3f471139-acb7-4a01-b7a7-ff5da4ba2d43                              : Microsoft-Windows-AppXDeployment-Server
       3ff37a1c-a68d-4d6e-8c9b-f79e8b16c482                              : Microsoft-Windows-Ntfs
       40783728-8921-45d0-b231-919037b4b4fd                              : Microsoft-Windows-Security-UserConsentVerifier
       412bdff2-a8c4-470d-8f33-63fe0d8c20e2                              : Microsoft-Windows-Partition
       4180c4f7-e238-5519-338f-ec214f0b49aa                              : Microsoft.Windows.ResourceManager
       4214dcd2-7c33-4f74-9898-719ccceec20f                              : Microsoft-Windows-TunnelDriver-SQM-Provider
       43d1a55c-76d6-4f7e-995c-64c711e5cafe                              : Microsoft-Windows-WinINet
       43dad447-735f-4829-a6ff-9829a87419ff                              : Microsoft-Windows-Crypto-DSSEnh
       43e63da5-41d1-4fbf-aded-1bbed98fdd1d                              : Microsoft-Windows-Subsys-SMSS
       45eec9e5-4a1b-5446-7ad8-a4ab1313c437                              : Microsoft-Windows-Security-LessPrivilegedAppContainer
       478ea8a8-00be-4ba6-8e75-8b9dc7db9f78                              : Microsoft-Windows-ESE
       47bfa2b7-bd54-4fac-b70b-29021084ca8f                              : Application Popup
       4860ea43-3f05-5fb8-20ce-7ba346a44747                              : Microsoft-Windows-WinINet-Pca
       486a5c7c-11cc-46c5-9de7-43dfe0bb57c1                              : Microsoft-Windows-DriverFrameworks-KernelMode-Performance
       494e7a3d-8db9-4ec4-b43e-2844af6e38d6                              : Microsoft-Windows-exFAT-SQM
       49c2c27c-fe2d-40bf-8c4e-c3fb518037e7                              : SearchIndexer
       49f3487a-1cfe-37d6-fcac-571426eb4005                              : Microsoft-Windows-NtfsLog_49f3487a1cfe37d6fcac571426eb4005
       4afddfde-002d-51ac-c109-c3b7897858d0                              : Microsoft-Windows-WER-PayloadHealth
       4b7eac67-fc53-448c-a49d-7cc6db524da7                              : Microsoft-Windows-MediaFoundation-MFReadWrite
       4bd2826e-54a1-4ba9-bf63-92b73ea1ac4a                              : Microsoft-Windows-Diagnostics-LoggingChannel
       4d13548f-c7b8-4174-bb7a-d7f64bf22d29                              : Microsoft-WindowsPhone-LocationServiceProvider
       4de9bc9c-b27a-43c9-8994-0915f1a5e24f                              : Microsoft-Windows-AAD
       4e7a6fd6-0c60-424c-bac2-5447f3ce5585:0x000000007fffffff:0x4       : Sparkle
       4eacb4d0-263b-4b93-8cd6-778a278e5642                              : Microsoft-Windows-GenericRoaming
       4edbe902-9ed3-4cf0-93e8-b8b5fa920299                              : Microsoft-Windows-TunnelDriver
       4ee76bd8-3cf4-44a0-a0ac-3937643e37a3                              : Microsoft-Windows-CodeIntegrity
       50b3e73c-9370-461d-bb9f-26f32d68887d                              : Microsoft-Windows-WebIO
       51311de3-d55e-454a-9c58-43dc7b4c01d2                              : Microsoft-Windows-MSMPEG2ADEC
       52d7e5fb-86d5-4bd1-b03c-f04fbfd649d8                              : PerfX2
       531a35ab-63ce-4bcf-aa98-f88c7a89e455                              : Microsoft-Windows-XAML
       5322d61a-9efa-4bc3-a3f9-14be95c144f8                              : Microsoft-Windows-Kernel-Prefetch
       5322d61a-9efa-4bc3-a3f9-14be95c144f8                              : KernelPrefetch
       5402e5ea-1bdd-4390-82be-e108f1e634f5                              : Microsoft-Windows-WinINet-Config
       54164045-7c50-4905-963f-e5bc1eef0cca                              : Microsoft-Windows-CertificateServicesClient-CertEnroll
       5444519f-2484-45a2-991e-953e4b54c8e0                              : Microsoft-Windows-MPS-SRV
       54849625-5478-4994-a5ba-3e3b0328c30d                              : Microsoft-Windows-Security-Auditing
       548c4417-ce45-41ff-99dd-528f01ce0fe1                              : Microsoft-Windows-KernelStreaming
       55404e71-4db9-4deb-a5f5-8f86e46dde56                              : Microsoft-Windows-Winsock-NameResolution
       555908d1-a6d7-4695-8e1e-26931d2012f4                              : Service Control Manager
       5576f62e-4142-45a8-9516-262a510c13f0                              : IE6
       55ab77f6-fa04-43ef-af45-688fbf500482                              : Microsoft-Windows-GPIO-ClassExtension
       55bacc9f-9ac0-46f5-968a-a5a5dd024f8a                              : Microsoft-Windows-wmvdecod
       56c71c31-cfbd-4cdd-8559-505e042bbbe1                              : Microsoft-Windows-DeviceAssociationService
       56f519ab-9df6-4345-8491-a4ba21ac825b                              : Microsoft-Windows-UserDataAccess-UnifiedStore
       57277741-3638-4a4b-bdba-0ac6e45da56c                              : Microsoft-JScript
       572af238-4757-43dd-82f6-25045d6d7861                              : DwmTest
       5786e035-ef2d-4178-84f2-5a6bbedbb947                              : Microsoft-Windows-DirectManipulation
       58db8e03-0537-45cb-b29b-597f6cbebbfd                              : CD-ROM
       58db8e03-0537-45cb-b29b-597f6cbebbfe                              : Redbook
       59e7a714-73a4-4147-b47e-0957048c75c4                              : Microsoft-Windows-XAML-Diagnostics
       5b004607-1087-4f16-b10e-979685a8d131                              : Microsoft-Windows-DomainJoinManagerTriggerProvider
       5bbca4a8-b209-48dc-a8c7-b23d3e5216fb                              : Microsoft-Windows-CAPI2
       5cad3597-5fec-4c62-9ce1-9d7abc723d3a                              : Microsoft-Windows-PushNotifications-Developer
       5d8087dd-3a9b-4f56-90df-49196cdc4f11                              : Microsoft-Windows-Direct3D12
       5f0e257f-c224-43e5-9555-2adcb8540a58                              : Microsoft-Windows-Immersive-Shell-API
       63b530f8-29c9-4880-a5b4-b8179096e7b8                              : Microsoft-Windows-NlaSvc
       63d2bb1d-e39a-41b8-9a3d-52dd06677588                              : Microsoft-Windows-Shell-AuthUI
       642d9ed0-4fc3-4634-aec0-3d1839abf101                              : Kmixer
       6489b27f-7c43-5886-1d00-0a61bb2a375b                              : Microsoft-Windows-UniversalTelemetryClient
       648a0644-7d62-4fd3-8841-440064762f95                              : Microsoft-Windows-BackgroundTransfer-ContentPrefetcher
       64ef2b1c-4ae1-4e64-8599-1636e441ec88                              : Microsoft-Windows-Devices-Background
       651df93b-5053-4d1e-94c5-f6e6d25908d0                              : Microsoft-Windows-BitLocker-Driver
       6545939f-3398-411a-88b7-6a8914b8cec7                              : Microsoft-Windows-ServiceTriggerPerfEventProvider
       65cd4c8a-0848-4583-92a0-31c0fbaf00c0:0x000000000000ffff:0x5       : DX
       6600e712-c3b6-44a2-8a48-935c511f28c8                              : Microsoft-Windows-Iphlpsvc-Trace
       66a5c15c-4f8e-4044-bf6e-71d896038977                              : Microsoft-Windows-Iphlpsvc
       67d07935-283a-4791-8f8d-fa9117f3e6f2                              : Microsoft-Windows-Wcmsvc
       6ad52b32-d609-4be9-ae07-ce8dae937e39                              : Microsoft-Windows-RPC
       6addabf4-8c54-4eab-bf4f-fbef61b62eb0                              : Microsoft-Windows-AIT
       6ba132c4-da49-415b-a7f4-31870dc9fe25                              : Microsoft-Windows-QoS-qWAVE
       6d8a3a60-40af-445a-98ca-99359e500146                              : Microsoft-Windows-ApplicationExperience-Cache
       6eb8db94-fe96-443f-a366-5fe0cee7fb1c                              : Microsoft-Windows-EapHost
       6ed11b00-c1b5-48cb-aecc-ff72ebefbae8                              : Microsoft-Windows-Wallet
       70e74dd8-39db-5f6f-6fd1-f5581b29e834                              : Microsoft-Windows-Watchdog-Events
       70eb4f03-c1de-4f73-a051-33d13d5413bd                              : Microsoft-Windows-Kernel-Registry
       712880e9-7813-41a3-8e4c-e4e0c4f6580a                              : Microsoft-Windows-WiFiDisplay
       712909c0-6e57-4121-b639-87c8bf9004e0                              : D2D
       73aa0094-facb-4aeb-bd1d-a7b98dd5c799                              : Microsoft-Windows-LimitsManagement
       741bb90c-a7a3-49d6-bd82-1e6b858403f7                              : Microsoft-Windows-CloudStore
       7426a56b-e2d5-4b30-bdef-b31815c1a74a                              : Microsoft-Windows-USB-USBHUB
       75051c9d-2833-4a29-8923-046db7a432ca                              : Microsoft-Windows-DDisplay
       7658dbdf-65c3-4545-a098-40d9f7e8a1e6                              : Microsoft-Windows-Kinect
       7725b5f9-1f2e-4e21-baeb-b2af4690bc87                              : Microsoft-Windows-USB-MAUSBHOST
       77549803-7bb1-418b-a98e-f2e22f35a873                              : Microsoft-Windows-WinMDE
       797fabac-7b58-4796-b924-d51178a59ce4                              : IE7
       7b563579-53c8-44e7-8236-0f87b9fe6594                              : Microsoft-Windows-Kernel-WHEA
       7b6bc78c-898b-4170-bbf8-1a469ea43fc5                              : Microsoft-Windows-HttpEvent
       7b702970-90bc-4584-8b20-c0799086ee5a                              : Microsoft-Windows-NetworkSecurity
       7d29d58a-931a-40ac-8743-48c733045548                              : Microsoft-Windows-SoftwareRestrictionPolicies
       7d30fe49-d67f-42d7-a360-9a0639ec5719                              : Microsoft-Windows-OneCore-MinUser
       7d44233d-3055-4b9c-ba64-0d47ca40a232                              : Microsoft-Windows-WinHttp
       7d99f6a4-1bec-4c09-9703-3aaa8148347f                              : DwmRedirWin8
       7dd42a49-5329-4832-8dfd-43d979153a88                              : Microsoft-Windows-Kernel-Network
       7e7d3382-023c-43cb-95d2-6f0ca6d70381                              : Microsoft-Windows-D3D10Level9
       7e7d3382-023c-43cb-95d2-6f0ca6d70381                              : D3D10Level9
       7f2bd991-ae93-454a-b219-0bc23f02262a                              : Microsoft-Windows-MP4SDECD
       7f54ca8a-6c72-5cbc-b96f-d0ef905b8bce                              : Microsoft-Windows-Kernel-CPU-Starvation
       7f8e35ca-68e8-41b9-86fe-d6adc5b327e7                              : Microsoft-IE-JSDumpHeap
       802ec45a-1e99-4b83-9920-87c98277ba9d                              : Microsoft-Windows-DxgKrnl
       802ec45a-1e99-4b83-9920-87c98277ba9d                              : Dxgkrnl
       811a1ddb-2e69-5f25-adc0-4b186170e760                              : Microsoft-Windows-Privacy-Auditing-PermissiveLearningMode
       8127f6d4-59f9-4abf-8952-3e3a02073d5f                              : Microsoft-Windows-AppXDeployment
       820a42d8-38c4-465d-b64e-d7d56ea1d612                              : Microsoft-Windows-UIAutomationCore
       835b79e2-e76a-44c4-9885-26ad122d3b4d                              : Microsoft-Windows-Narrator
       83a9277a-d2fc-4b34-bf81-8ceb4407824f                              : Microsoft-Windows-UserDataAccess-CEMAPI
       83ed54f0-4d48-4e45-b16e-726ffd1fa4af                              : Microsoft-Windows-Networking-Correlation
       83faaa86-63c8-4dd8-a2da-fbadddfc0655                              : Microsoft-Windows-RTWorkQueue-Extended
       84958368-7da7-49a0-b33d-07fabb879626                              : Microsoft-Windows-OLE-Perf
       85a62a0d-7e17-485f-9d4f-749a287193a6                              : Microsoft-Windows-Audit-CVE
       87a623f0-8db5-5c11-7c80-a2ebbcbe5189                              : Microsoft-Windows-WerKernel
       88cd9180-4491-4640-b571-e3bee2527943                              : Microsoft-Windows-PushNotifications-Platform
       8939299f-2315-4c5c-9b91-abb86aa0627d                              : Microsoft-Windows-KnownFolders
       89592015-d996-4636-8f61-066b5d4dd739                              : Microsoft-Windows-StateRepository
       89b1e9f0-5aff-44a6-9b44-0a07a7ce5845                              : Microsoft-Windows-User Profiles Service
       8c416c79-d49b-4f01-a467-e56d3aa8234c                              : Microsoft-Windows-Win32k
       8c416c79-d49b-4f01-a467-e56d3aa8234c                              : DwmWin32kWin8
       8c9dd1ad-e6e5-4b07-b455-684a9d879900:0x00000000ffffffff:0xffffffff: DwmSchedulerWin7
       8cc44e31-7f28-4f45-9938-4810ff517464:0x00000000ffffffff:0xffffffff: DwmScheduler
       8e6a5303-a4ce-498f-afdb-e03a8a82b077                              : Microsoft-Windows-Ntfs-UBPM
       8f0db3a8-299b-4d64-a4ed-907b409d4584                              : Microsoft-Windows-Runtime-Media
       8f2048e0-f260-4f57-a8d1-932376291682                              : Microsoft-Windows-MediaEngine
       8fc7e81a-f733-42e0-9708-cfdae07ed969                              : MRxSmb
       901d2afa-4ff6-46d7-8d0e-53645e1a47f5                              : Microsoft-Windows-Heap-Snapshot
       9068a924-f97e-5506-c3a3-5c020c00e8e0                              : Microsoft-System-Diagnostics-DiagnosticInvoker
       906b8a99-63ce-58d7-86ab-10989bbd5567                              : Microsoft-Windows-HelloForBusiness
       914ed502-b70d-4add-b758-95692854f8a3                              : Microsoft-Windows-QoS-Pacer
       922cdcf3-6123-42da-a877-1a24f23e39c5                              : Microsoft-WindowsPhone-CoreMessaging
       92aab24d-d9a9-4a60-9f94-201fed3e3e88                              : Microsoft-Windows-EndpointTriggerProvider
       945a8954-c147-4acd-923f-40c45405a658                              : Microsoft-Windows-WindowsUpdateClient
       94a984ef-f525-4bf1-be3c-ef374056a592                              : Spooler
       951b41ea-c830-44dc-a671-e2c9958809b8                              : Microsoft-Windows-Kernel-Interrupt-Steering
       9580d7dd-0379-4658-9870-d5be7d52d6de                              : Microsoft-Windows-WLAN-AutoConfig
       9640427c-7d03-4331-b8ee-fb77625bf381                              : Microsoft-Windows-MSFTEDIT
       96ac7637-5950-4a30-b8f7-e07e8e5734c1                              : Microsoft-Windows-Kernel-BootDiagnostics
       982824e5-e446-46ae-bc74-836401ffb7b6                              : Microsoft-Windows-Media-Streaming
       988c59c5-0a1c-45b6-a555-0c62276e327d                              : Microsoft-Windows-SMBClient
       98bf1cd3-583e-4926-95ee-a61bf3f46470                              : Microsoft-Windows-CertificationAuthorityClient-CertCli
       98e0765d-8c42-44a3-a57b-760d7f93225a                              : Microsoft-Windows-AppHost
       98e6cfcb-ee0a-41e0-a57b-622d4e1b30b1                              : Microsoft-Windows-Security-Kerberos
       99806515-9f51-4c2f-b918-1eae407aa8cb                              : Microsoft-Windows-Superfetch
       99c66ba7-5a97-40d5-aa01-8a07fb3db292                              : Microsoft-Windows-UserDataAccess-PimIndexMaintenance
       9b307223-4e4d-4bf5-9be8-995cd8e7420b                              : Microsoft-Windows-NetworkManagerTriggerProvider
       9b6123dc-9af6-4430-80d7-7d36f054fb9f                              : Microsoft-Windows-CDROM
       9b7e4c0f-342c-4106-a19f-4f2704f689f0                              : D3D10
       9b7e4c8f-342c-4106-a19f-4f2704f689f0                              : D3D10_1
       9c205a39-1250-487d-abd7-e831c6290539                              : KernelPnP
       9c2a37f3-e5fd-5cae-bcd1-43dafeee1ff0                              : Microsoft-Windows-Store
       9d55b53d-449b-4824-a637-24f9d69aa02f                              : Microsoft-Windows-Winsrv
       9de90b19-62c4-511d-a1c5-9e990812d18b                              : Microsoft-Windows-DxgKrnl-SysMm
       9e03f75a-bcbe-428a-8f3c-d46f2a444935                              : Microsoft-Windows-IdleTriggerProvider
       9e22a3ed-7b32-4b99-b6c2-21dd6ace01e1                              : Microsoft-Windows-MF-FrameServer
       9e3b3947-ca5d-4614-91a2-7b624e0e7244                              : Microsoft-IE
       9e3b3947-ca5d-4614-91a2-7b624e0e7244                              : MsHtml
       9e9bba3c-2e38-40cb-99f4-9e8281425164                              : Microsoft-Windows-Dwm-Core
       9e9bba3c-2e38-40cb-99f4-9e8281425164:0x00000000ffffffff:0xffffffff: DwmSchedulerWin8
       9fa5dd5d-999e-466a-8ca9-7b3a66f8882f                              : Microsoft-Windows-DriverFrameworks-UserMode-Performance
       a0af438f-4431-41cb-a675-a265050ee947                              : Microsoft-Windows-Kernel-LicensingSqm
       a0b7550f-4e9a-4f03-ad41-b8042d06a2f7                              : Microsoft-WindowsPhone-CoreUIComponents
       a0e9b465-b939-57d7-b27d-95d8e925ff57                              : Application Error
       a103cabd-8242-4a93-8df5-1cdf3b3f26a6                              : Microsoft-Windows-Kernel-IoTrace
       a111f1c2-5923-47c0-9a68-d0bafb577901                              : Microsoft-Windows-Network-Setup
       a319d300-015c-48be-acdb-47746e154751                              : Microsoft-Windows-FileInfoMinifilter
       a3d95055-34cc-4e4a-b99f-ec88f5370495                              : Microsoft-Windows-CoreWindow
       a4112d1a-6dfa-476e-bb75-e350d24934e1                              : Microsoft-Windows-MediaFoundation-MSVProc
       a42c77db-874f-422e-9b44-6d89fe2bd3e5:0x0000000000000002:0x4       : AvalonPerf
       a42c77db-874f-422e-9b44-6d89fe2bd3e5:0x000000007fffffff:0x5       : AvalonAll
       a67075c2-3e39-4109-b6cd-6d750058a732                              : Microsoft-Windows-IPNAT
       a68ca8b7-004f-d7b6-a698-07e2de0f1f5d                              : Microsoft-Windows-Kernel-General
       a6a00efd-21f2-4a99-807e-9b3bf1d90285:0x000000000000ffff:0x1       : AudEngCritical
       a6a00efd-21f2-4a99-807e-9b3bf1d90285:0x000000000000ffff:0x2       : AudEngEvent
       a6a00efd-21f2-4a99-807e-9b3bf1d90285:0x000000000000ffff:0x3       : AudEngVerbose
       a6ad76e3-867a-4635-91b3-4904ba6374d7                              : Microsoft-Windows-Kernel-StoreMgr
       a6bb9ced-e292-473c-91dd-49f2a04a4abd                              : AntiPhishing
       a6bf0deb-3659-40ad-9f81-e25af62ce3c7                              : Microsoft-Windows-PDC
       a6f32731-9a38-4159-a220-3d9b7fc5fe5d                              : Microsoft-Windows-SharedAccess_NAT
       a70ff94f-570b-4979-ba5c-e59c9feab61b                              : Microsoft-Windows-WinINet-Capture
       a7364e1a-894f-4b3d-a930-2ed9c8c4c811                              : Microsoft-Windows-MF
       a856304b-d089-4617-98e7-20b37c7c9635                              : FileGrabber
       a86f8471-c31d-4fbc-a035-665d06047b03                              : Microsoft-Windows-WinRT-Error
       a8a1f2f6-a13a-45e9-b1fe-3419569e5ef2                              : Microsoft-Windows-MUI
       aabf8b86-7936-4fa2-acb0-63127f879dbf                              : Microsoft-Windows-Diagnosis-PCW
       ab0d8ef9-866d-4d39-b83f-453f3b8f6325                              : Microsoft-Windows-OneX
       abce23e7-de45-4366-8631-84fa6c525952                              : Microsoft-Windows-WER-SystemErrorReporting
       abf1f586-2e50-4ba8-928d-49044e6f0db7                              : Microsoft-Windows-Kernel-IO
       ac43300d-5fcc-4800-8e99-1bd3f85f0320                              : Microsoft-Windows-NTLM
       ac52ad17-cc01-4f85-8df5-4dce4333c99b                              : Microsoft-Windows-USB-USBHUB3
       acd88d21-e1d4-4483-b974-0c1da66cc529                              : Microsoft-Windows-MapControls
       ad8aa069-a01b-40a0-ba40-948d1d8dedc5                              : Microsoft-Windows-WER-Diag
       ae4bd3be-f36f-45b6-8d21-bdd6fb832853                              : Microsoft-Windows-Audio
       ae5cf422-786a-476a-ac96-753b05877c99                              : Microsoft-Windows-MSMPEG2VDEC
       aec5c129-7c10-407d-be97-91a042c61aaa                              : Microsoft-Windows-Containers-Wcifs
       b059b83f-d946-4b13-87ca-4292839dc2f2                              : Microsoft-Windows-User-Loader
       b20e65ac-c905-4014-8f78-1b6a508142eb                              : Microsoft-Windows-MediaFoundation-Performance-Core
       b3eee223-d0a9-40cd-adfc-50f1888138ab                              : Microsoft-Windows-WWAN-NDISUIO-EVENTS
       b675ec37-bdb6-4648-bc92-f3fdc74d3ca2                              : Microsoft-Windows-Kernel-EventTracing
       b6bfcc79-a3af-4089-8d4d-0eecb1b80779                              : Microsoft-Windows-SystemEventsBroker
       b6cc0d55-9ecc-49a8-b929-2b9022426f2a                              : Microsoft-Client-Licensing-Platform
       b80e484e-5fcf-44f7-9e3e-0e93e3af0076                              : Connected Storage Service ETW
       b8197c10-845f-40ca-82ab-9341e98cfc2b                              : Microsoft-Windows-MediaFoundation-MFCaptureEngine
       b865b57b-bdda-4e1d-a2c8-adfa69fe6ab9                              : Microsoft-Windows-ZTraceMaps
       b8d6861b-d20f-4eec-bbae-87e0dd80602b                              : Microsoft-Windows-COM-Perf
       b931ed29-66f4-576e-0579-0b8818a5dc6b                              : Microsoft-Windows-Kernel-Prm
       b97561fe-b27a-4c48-aa3e-7d3addc105b1                              : Microsoft-Windows-Data-Pdf
       b9b2de3c-3fbd-4f42-8ff7-33c3bad35fd4                              : Microsoft-Windows-UserDataAccess-UserDataApis
       ba723d81-0d0c-4f1e-80c8-54740f508ddf                              : Microsoft-Windows-AppxPackagingOM
       bb311100-2d9f-4cd3-b2d6-f4ea3839c548                              : Microsoft-Windows-PlayToManager
       bba3add2-c229-4cdb-ae2b-57eb6966b0c4                              : Kerberos
       bc0669e1-a10d-4a78-834e-1ca3c806c93b                              : Microsoft-Windows-CertificateServicesClient-Lifecycle-System
       bc1bdb57-71a2-581a-147b-e0b49474a2d4                              : Microsoft-Gaming-Services
       bc97b970-d001-482f-8745-b8d7d5759f99                              : Microsoft-Windows-MediaFoundation-Platform
       bcebf131-e4e6-4ba4-82fa-9c406002f769:0x000000007fffffff:0x3       : Shell
       bcebf131-e4e6-4ba4-82fa-9c406002f769:0x000000007fffffff:0x4       : ShellVerbose
       bd12f3b8-fc40-4a61-a307-b7a013a069c1                              : Microsoft-Windows-Servicing
       bd8fea17-5549-4b49-aa03-1981d16396a9                              : Microsoft-Windows-Directory-Services-SAM-Utility
       bde46aea-2357-51fe-7367-d5296f530bd1                              : Microsoft-Windows-Winsock-Sockets
       be3a31ea-aa6c-4196-9dcc-9ca13a49e09f                              : Microsoft-Windows-Photo-Image-Codec
       be967569-e3c8-425b-ad0e-4f2c790b1848                              : Microsoft-Windows-Graphics-Printing3D
       bea18b89-126f-4155-9ee4-d36038b02680                              : Microsoft-Windows-CertificateServicesClient-Lifecycle-User
       bef2aa8e-81cd-11e2-a7bb-5eac6188709b                              : Microsoft-Windows-Kernel-LiveDump
       bf1db390-3e67-4d4d-a287-8958044a3db4                              : Microsoft-Windows-UI-Input-Inking
       bf406804-6afa-46e7-8a48-6c357e1d6d61                              : Microsoft-Windows-COMRuntime
       bff15e13-81bf-45ee-8b16-7cfead00da86                              : Microsoft-Windows-AppModel-State
       c100becc-d33a-4a4b-bf23-bbef4663d017                              : Microsoft-Windows-WCN-Config-Registrar-Secure
       c100becf-d33a-4a4b-bf23-bbef4663d017                              : Microsoft-Windows-WCN-Config-Registrar
       c2e44961-2bcf-44b3-b0cb-c4e53f356583:0x000000000000ffff:0x5       : DcePerf
       c42a2738-2333-40a5-a32f-6acc36449dcc                              : Microsoft-Windows-HttpLog
       c44219d0-f344-11df-a5e2-b307dfd72085                              : Microsoft-Windows-DirectComposition
       c4636a1e-7986-4646-bf10-7bc3b4a76e8e                              : Microsoft-Windows-StorPort
       c4b57d35-0636-4bc3-a262-370f249f9802                              : OpenSSH
       c514638f-7723-485b-bcfc-96565d735d4a                              : Microsoft-Windows-Kernel-Acpi
       c631c3dc-c676-59e4-2db3-5c0af00f9675                              : Application Hang
       c7bde69a-e1e0-4177-b6ef-283ad1525271                              : Microsoft-Windows-Kernel-Disk
       c7e089ac-ba2a-11e0-9af7-68384824019b                              : Microsoft-Windows-Crypto-BCrypt
       c861d0e2-a2c1-4d36-9f9c-970bab943a12                              : ThreadPool
       c88a4ef5-d048-4013-9408-e04b7db2814a                              : Microsoft-Windows-USB-USBPORT
       c92cf544-91b3-4dc0-8e11-c580339a0bf8                              : NT LAN Manager
       ca11c036-0102-4a2d-a6ad-f03cfed5d3c9                              : Microsoft-Windows-DXGI
       ca11c036-0102-4a2d-a6ad-f03cfed5d3c9                              : DXGI
       cc85922f-db41-11d2-9244-006008269001                              : Local Security Authority
       cddc01e2-fdce-479a-b8ee-3c87053fb55e                              : Rdbss
       cdead503-17f5-4a3e-b7ae-df8cc2902eb9                              : Microsoft-Windows-NDIS
       ce8dee0b-d539-4000-b0f8-77bed049c590                              : Microsoft-Windows-UserModePowerService
       cfaa5446-c6c4-4f5c-866f-31c9b55b962d                              : Microsoft-Windows-DCLocator
       d071ce03-0d7b-5b27-e817-b9c12961934e                              : Microsoft-Windows-WinHttp-Pca
       d116f0f2-a6d6-4f1f-bdda-0c88c8d1f2e9                              : Microsoft-Windows-MosHost
       d1bc9aff-2abf-4d71-9146-ecb2a986eb85                              : Microsoft-Windows-Windows Firewall With Advanced Security
       d1d93ef7-e1f2-4f45-9943-03d245fe6c00                              : Microsoft-Windows-Kernel-Memory
       d1f688bf-012f-4aec-a38c-e7d4649f8cd2                              : Microsoft-Windows-UserDataAccess-UserDataUtils
       d2402fde-7526-5a7b-501a-25dc7c9c282e                              : Microsoft-Windows-Media-Protection-PlayReady-Performance
       d29d56ea-4867-4221-b02e-cfd998834075                              : Microsoft-Windows-Dwm-Dwm
       d3610dca-4501-5a5d-21a7-30ca91130711                              : Microsoft-Windows-Privacy-Auditing-DiagnosticData
       d38fb874-33e4-4dcf-911e-1b53bb106d53                              : Microsoft-Windows-DLNA-Namespace
       d39b6336-cfcb-483b-8c76-7c3e7d02bcb8                              : Microsoft-Windows-Build-RegDll
       d41f1fd2-8543-4297-9294-1a6a0859cea5:0x0000000000000001           : ManagedHeapRef
       d41f1fd2-8543-4297-9294-1a6a0859cea5:0x0000000000000003           : ManagedHeapRefStacks
       d41f1fd2-8543-4297-9294-1a6a0859cea5:0x0000000000000005           : ManagedHeapRefSnaps
       d41f1fd2-8543-4297-9294-1a6a0859cea5:0x0000000000000007           : ManagedHeapRefSnapsStacks
       d4263c98-310c-4d97-ba39-b55354f08584                              : Microsoft-Windows-COM
       d48ce617-33a2-4bc3-a5c7-11aa4f29619e                              : Microsoft-Windows-SMBServer
       d49918cf-9489-4bf1-9d7b-014d864cf71f                              : Microsoft-Windows-ProcessStateManager
       d53270e3-c8cf-4707-958a-dad20c90073c                              : Microsoft-Windows-WindowsColorSystem
       d5c25f9a-4d47-493e-9184-40dd397a004d                              : Microsoft-Windows-Winsock-WS2HELP
       d67fbb76-d18a-5ae3-24a3-8c1db52d6c62                              : Microsoft-Windows-Privacy-Auditing
       d781ca11-61c0-4387-b83d-af52d3d2dd6a:0x000000000000000f:0xf       : Win32HeapRanges
       d8975f88-7ddb-4ed0-91bf-3adf48c48e0c                              : Microsoft-Windows-RPCSS
       da1d1dbd-3186-4fa2-bc2d-075efd9e43e2                              : Microsoft-Windows-USBVideo
       daa6a96b-f3e7-4d4d-a0d6-31a350e6a445                              : Microsoft-Windows-WLAN-Driver
       dab01d4d-2d48-477d-b1c3-daad0ce6f06b                              : ACPI Driver
       db00dfb6-29f9-4a9c-9b3b-1f4f9e7d9770                              : Microsoft-Windows-User Profiles General
       db6f6ddb-ac77-4e88-8253-819df9bbf140                              : Microsoft-Windows-Direct3D11
       db6f6ddb-ac77-4e88-8253-819df9bbf140                              : D3D11
       dbe9b383-7cf3-4331-91cc-a3cb16a3b538                              : Winlogon
       dcb453db-c652-48be-a0f8-a64459d5162e                              : D2DWin8
       dd5ef90a-6398-47a4-ad34-4dcecdef795f                              : Microsoft-Windows-HttpService
       dd5ef90a-6398-47a4-ad34-4dcecdef795f                              : Universal Listener
       dd70bc80-ef44-421b-8ac3-cd31da613a4e                              : Ntfs
       dddc1d91-51a1-4a8d-95b5-350c4ee3d809                              : Microsoft-Windows-AuthenticationProvider
       de7b24ea-73c8-4a09-985d-5bdadcfa9017                              : Microsoft-Windows-TaskScheduler
       df63d0dc-97c2-5e48-c1cc-7b46bfd4df88                              : Microsoft-Windows-Devices-Query
       dfa86faa-2c55-4140-bff9-5cc586217a7b                              : Microsoft-Windows-PDFReader
       e02a841c-75a3-4fa7-afc8-ae09cf9b7f23                              : Microsoft-Windows-Kernel-Audit-API-Calls
       e04fe2e0-c6cf-4273-b59d-5c97c9c374a4                              : Microsoft-Windows-WebServices
       e0a40b26-30c4-4656-bc9a-74a5c3a0b2ec                              : Microsoft-Windows-UIAnimation
       e0c6f6de-258a-50e0-ac1a-103482d118bc                              : Microsoft-Windows-Install-Agent
       e13c0d23-ccbc-4e12-931b-d9cc2eee27e4:0x0000000000000001:0x4       : ClrGC
       e13c0d23-ccbc-4e12-931b-d9cc2eee27e4:0x0000000000000002:0x4       : ClrThreadPool
       e13c0d23-ccbc-4e12-931b-d9cc2eee27e4:0x00000000ffffffff:0x5       : ClrAll
       e18d0fc9-9515-4232-98e4-89e456d8551b                              : Microsoft-Windows-RTWorkQueue-Threading
       e1f65b93-f32a-4ed6-aa72-b039e28f1574                              : NLB
       e3bac9f8-27be-4823-8d7f-1cc320c05fa7                              : Microsoft-Windows-MountMgr
       e46eead8-0c54-4489-9898-8fa79d059e0e                              : Microsoft-Windows-Feedback-Service-TriggerProvider
       e53c6823-7bb8-44bb-90dc-3f86090d48a6                              : Microsoft-Windows-Winsock-AFD
       e595f735-b42a-494b-afcd-b68666945cd3                              : Microsoft-Windows-Firewall
       e5ba83f6-07d0-46b1-8bc7-7e669a1d31dc                              : Microsoft-Windows-Security-Netlogon
       e5fc4a0f-7198-492f-9b0f-88fdcbfded48                              : Microsoft-Windows Networking VPN Plugin Platform
       e6307a09-292c-497e-aad6-498f68e2b619                              : Microsoft-Windows-ReadyBoost
       e6835967-e0d2-41fb-bcec-58387404e25a                              : Microsoft-Windows-BrokerInfrastructure
       e6bad16c-fd1c-4e91-98a8-e191f6594d66                              : NuiCorePerformanceProvider
       e6c92fb8-89d7-4d1f-be46-d56e59804783                              : Microsoft-Windows-Security-Vault
       e7558269-3fa5-46ed-9f4d-3c6e282dde55                              : Microsoft-Windows-UAC
       e7aa32fb-77d0-477f-987d-7e83df1b7ed0                              : Microsoft-Windows-Graphics-Printing
       e7db326e-46e4-4079-b69e-61946b8f130e                              : NuiAudioProvider
       e7ef96be-969f-414f-97d7-3ddb7b558ccc                              : DwmWin32k
       e80aa9fe-913d-4ede-af58-73e332dcac8d                              : Summary Level Transaction 1
       e8316a2d-0d94-4f52-85dd-1e15b66c5891                              : Microsoft-Windows-Subsys-Csr
       ea8cd8a5-78ff-4418-b292-aadc6a7181df                              : Microsoft-Windows-SecurityMitigationsBroker
       eb65a492-86c0-406a-bace-9912d595bd69                              : Microsoft-Windows-AppModel-Exec
       ecdaacfa-6fe9-477c-b5f0-85b76f8f50aa                              : Microsoft-Windows-Crashdump
       ed56cd5c-617b-49a5-9b80-eca3e02414bd:0x0000000000000000:0x4       : Dwm
       edd08927-9cc4-4e65-b970-c2560fb5c289                              : Microsoft-Windows-Kernel-File
       ee685ec4-8270-4b08-9e4e-8b356f48f92f                              : WARP
       f029ac39-38f0-4a40-b7de-404d244004cb                              : Microsoft-Windows-Kernel-XDV
       f0be35f8-237b-4814-86b5-ade51192e503                              : Microsoft-Windows-AppReadiness
       f1ef270a-0d32-4352-ba52-dbab41e1d859                              : Microsoft-Windows-AppModel-Runtime
       f1ff64ef-faf3-5699-8e51-f6ec2fbd97d1                              : Microsoft-Windows-DXGIDebug
       f213f1af-5610-46aa-8074-98a686fe1843:0x0000000000000001           : ManagedSymbolTrace
       f213f1af-5610-46aa-8074-98a686fe1843:0x0000000000000005           : EventStackTrace
       f213f1af-5610-46aa-8074-98a686fe1843:0x0000000000000081           : FunctionSummary
       f213f1af-5610-46aa-8074-98a686fe1843:0x0000000000000011           : ModboundTrace
       f213f1af-5610-46aa-8074-98a686fe1843:0x0000000000000009           : FunctionTrace
       f213f1af-5610-46aa-8074-98a686fe1843:0x0000000000000181           : FunctionSummarySuspend
       f213f1af-5610-46aa-8074-98a686fe1843:0x0000000000000111           : ModboundTraceSuspend
       f213f1af-5610-46aa-8074-98a686fe1843:0x0000000000000109           : FunctionTraceSuspend
       f230d19a-5d93-47d9-a83f-53829edfb8df                              : Microsoft-Windows-TriggerEmulatorProvider
       f2c628ae-d26c-4352-9c45-74754e1e2f9f                              : Microsoft-Windows-MPRMSG
       f33959b4-dbec-11d2-895b-00c04f79ab69                              : Active Directory Domain Services: Net Logon
       f3c5e28e-63f6-49c7-a204-e48a1bc4b09d                              : Microsoft-Windows-FilterManager
       f3f53c76-b06d-4f15-b412-61164a0d2b73                              : Microsoft-Windows-VerifyHardwareSecurity
       f404b94e-27e0-4384-bfe8-1d8d390b0aa3                              : Microsoft-Windows-MediaFoundation-Performance
       f498b9f5-9e67-446a-b9b8-1442ffaef434                              : NLB Packet
       f4aed7c7-a898-4627-b053-44a7caa12fcd                              : Microsoft-Windows-RPC-Events
       f4e1897c-bb5d-5668-f1d8-040f4d8dd344                              : Microsoft-Windows-Threat-Intelligence
       f5344219-87a4-4399-b14a-e59cd118abb8                              : Microsoft-Windows-Http-SQM-Provider
       f5528ada-be5f-4f14-8aef-a95de7281161                              : Microsoft-Windows-Kernel-Licensing-StartServiceTrigger
       f5988abb-323a-4098-8a34-85a3613d4638                              : Microsoft-Windows-UserDataAccess-CallHistoryClient
       f8ad09ba-419c-5134-1750-270f4d0fb889                              : Microsoft-Windows-DeliveryOptimization
       f997cd11-0fc9-4ab4-acba-bc742a4c0dd3                              : Microsoft-Windows-RPC-FirewallManager
       fa5cf675-72eb-49e2-b447-de5552faff1c                              : Microsoft-Windows-Runtime-Graphics
       fae10392-f0af-4ac0-b8ff-9f4d920c3cdf                              : Microsoft-Windows-Security-Mitigations
       fb19ee2c-0d22-4a2e-969e-dd41ae0ce1a9                              : Microsoft-Windows-UserDataAccess-UserDataService
       fbcfac3f-8459-419f-8e48-1f0b49cdb85e                              : Microsoft-Windows-NetworkProfile
       fbcfac3f-8460-419f-8e48-1f0b49cdb85e                              : Microsoft-Windows-NetworkProfileTriggerProvider
       fc4b0d39-e8be-4a83-a32f-c0c7c4f61ee4                              : Mup Drv Debug
       fc4e8f51-7a04-4bab-8b91-6321416f72ab                              : Microsoft-Windows-Containers-BindFlt
       fc570986-5967-4641-a6f9-05291bce66c5                              : Mup Drv Perf
       fcbb06bb-6a2a-46e3-abaa-246cb4e508b2                              : Microsoft-Windows-DeviceSetupManager
       fd771d53-8492-4057-8e35-8c02813af49b                              : Microsoft-Windows-ProcessExitMonitor
       ff15e657-4f26-570e-88ab-0796b258d11c                              : Microsoft-Quic
       ff79a477-c45f-4a52-8ae0-2b324346d4e4                              : Windows-ApplicationModel-Store-SDK
       ffdb9886-80f3-4540-aa8b-b85192217ddf                              : Microsoft-PerfTrack-MSHTML

Registered User Mode Providers:
       00000000-0000-0000-0000-000000000002
       1b42986f-288f-4dd7-b7f9-120297715c1e
       Microsoft-Windows-XAML-Diagnostics
       Microsoft-Windows-Direct3DShaderCache
       08b15ce7-c9ff-5e64-0d16-66589573c50f
       9cc9beb7-9d24-47c7-8f9d-ccc9dcac29eb
       0741c7be-daac-4a5b-b00a-4bd9a2d89d0e
       Microsoft-Windows-Subsys-SMSS
       221d444c-d07e-4fde-b425-15b746cf535b
       Microsoft-Windows-Kernel-AppCompat
       Microsoft-Windows-Kernel-Registry
       c4e507b1-7224-4737-bde0-ced9284e7073
       ed5d03b4-5074-4b64-a91b-1627e9674d2b
       4d37f810-4d70-5b33-fef5-1e1c5e33d678
       f0ae506b-805e-434a-a005-7971d555179c
       68a8086a-e68d-4403-9a71-6f46fdde2162
       Microsoft-Windows-Kernel-General
       3ba36315-b05d-405e-8d05-2f994543215f
       aa1b41d3-d193-4660-9b47-dd701ba55841
       763fd754-7086-4dfe-95eb-c01a46faf4ca
       fb7fcbc6-7156-5a5b-eabd-0be47b14f453
       4a16abff-346d-56dc-fa87-eb1e29fe670a
       970407ad-6485-45da-aa30-58e0037770e4
       fb24d716-4503-46ec-bca5-f30168a9e105
       Microsoft-Windows-IdleTriggerProvider
       637a0f36-dff5-4b2f-83dd-b106c1c725e2
       Microsoft-Windows-FilterManager
       4f5d14a2-97bb-454b-b848-6f3ce0df80f1
       7a881c79-ad79-5187-3c97-24e57db0b998
       1bf23073-fe4b-535f-ff6e-e65a864e0979
       393cbb34-cb5c-48fd-b397-defc5a9e46a1
       d72a5df2-1372-45e2-a080-c81221d484d0
       665c9399-01f8-41fc-9bc2-df433b9fcc6c
       ebadf775-48aa-4bf3-8f8e-ec68d113c98e
       fb24d716-4503-46ec-bca5-f30168a9e106
       Microsoft-Windows-WLAN-AutoConfig
       ec6ede49-f40f-5f93-8651-a4edc18afe06
       e27950eb-1768-451f-96ac-cc4e14f6d3d0
       f7270296-a156-4155-8bd8-f53a0ac4af6d
       613e8728-f1cd-5604-c71c-32ab60d68b11
       Microsoft-Client-Licensing-Platform
       f55f7011-988d-4674-a724-e01b39dc7af7
       b673475f-a196-4588-bc2b-c84ab7909a74
       00000000-7ac4-430a-94e4-b0dfd254650f
       cc848ecf-0639-5866-6928-18fa9de5f209
       927821f8-d9e6-42e2-84f2-949e18256f3a
       2ab7abe2-fd6b-49dd-931e-d3339832676a
       7076bf7a-db99-4a63-8afe-0bb2ab92997a
       59dec92c-75a7-5da5-0521-13de8c4bef5e
       ca030134-54cd-4130-9177-dae76a3c5791
       5bbb6c18-aa45-49b1-a15f-085f7ed0aa90
       7a688f0e-f39b-4a7a-bbbb-066e2c1fcb04
       Microsoft-Windows-Winsock-AFD
       d37687e7-8bf0-4d11-b589-a7abe080756a
       a198ad71-4f5e-4bc2-9a60-7cafb76f4e3c
       Microsoft-Windows-WinINet
       Microsoft-Windows-AppxPackagingOM
       ed475bc1-9899-5aca-ba3c-892060fead4f
       e6852bc9-a7b6-4127-ac15-8d5c50be9bd7
       339f227c-579c-4259-860c-f810655e6466
       78c794c6-eae4-48b8-9348-8935b2ee3b24
       eef54e71-0661-422d-9a98-82fd4940b820
       53cc8a8b-3182-5101-7405-8dfc7e5f313e
       810d9efb-88db-54ff-3703-9f5e54cc74fb
       b1642597-285e-560a-7f60-7e02f5da22c0
       e7ba355a-ec20-5993-dd3b-9215e4d8a23c
       27a8fdf4-9b77-575b-be3b-e7163ef159bb
       3720dda7-caea-4af3-a138-375aafc3f1d6
       09a69a38-2680-4bfa-ad01-792ad63a4ff2
       Microsoft-Windows-AppModel-Runtime
       Microsoft-Windows-Networking-RealTimeCommunication
       Microsoft-Windows-NDIS
       52000e1d-a0d3-55cd-dd29-631ed05d560e
       12e9331e-b6d2-4fa6-9c3c-f4c1533b1693
       7005b728-04a6-4fa4-b213-8faab88f877b
       d48533a7-98e4-566d-4956-12474e32a680
       6d925246-8771-5ba9-515d-62b322d5f992
       0419d384-bc3f-5803-c069-ac27ff5c0473
       Microsoft-Windows-UIAutomationCore
       645a72a6-1657-53bb-d5e7-d6526033ef20
       5bbabe0a-b28b-4a7f-b7c1-1071f2d8a176
       d1af2c40-3880-47c9-ade0-0fc1a909be08
       Microsoft-Windows-MMCSS
       5af52b0d-e633-4ead-828a-4b85b8daac2b
       KernelPnP
       8d9c9464-f103-496a-aca0-f12a4f258f7c
       7a55858e-4b38-456d-b418-093c86d92e87
       Microsoft-Windows-NlaSvc
       b341b7b2-d73b-428a-9b5d-c76756b52db6
       6d1f8b4f-1d23-4f48-89fb-fb76e1be10bd
       10adc87e-6cdd-5bcf-662f-7114c1113017
       dc10c74c-f6d9-5656-d77d-ca9047620cb7
       fe1ff234-1f09-50a8-d38d-c44fab43e818
       WARP
       a255f129-8868-57f2-667e-3658223adc2a
       ee5c44b7-501a-5f89-a347-6629cb302a5f
       047311a9-fa52-4a68-a1e4-4e289fbb8d17
       Microsoft-Windows-Containers-Wcifs
       e8675e8d-30c2-47f8-aa15-eeed206ff321
       93112de2-0aa3-4ed7-91e3-4264555220c1
       4eeb8774-6c4c-492f-8f2f-5ee4721b7bf7
       1a2205b0-0e07-42cd-a6f4-01ddd4683d2a
       b2ed3bdb-cd74-5b2c-f660-85079ca074b3
       ff32ada1-5a4b-583c-889e-a3c027b201f5
       cc4ce0cd-dcde-4ed2-8fc3-bd975921ce17
       a1ea5efc-402e-5285-3898-22a5acce1b76
       7cffb6e3-de5a-572a-9ece-998321af6e81
       0adaf93d-4c15-502d-449a-9445aae0d781
       07b7592c-a848-4520-89da-1ab26bc4629f
       ab9ebce4-fe7f-4dab-ace8-b28af18ec32d
       d9131565-e1dd-4c9e-a728-951999c2adb5
       2d7904d8-5c90-4209-ba6a-4c08f409934c
       077e5c98-2ef4-41d6-937b-465a791c682e
       a2d34bf1-70ab-5b21-c819-5a0dd42748fd
       10a875d8-ab5c-5bc3-7a8b-79293816f2c2
       Microsoft-Windows-PushNotifications-Platform
       12d25187-6c0d-4783-ad3a-84caa135acfd
       56c6cef7-0263-438c-af6a-f6c77d9c824a
       cb729f91-4e9b-4698-a6c6-587faa6eaf4a
       ed3f6ce5-9128-43cb-be18-411d3526d7f2
       346d1079-24e3-5e7d-b93b-1806e4774512
       3baab286-806e-5c81-05c3-f554aa36c622
       0b7a6f19-47c4-454e-8c5c-e868d637e4d8
       e883160c-b7a0-426c-9498-0744ff71a478
       057597df-6fd8-438b-bf6d-190cbf0a914c
       cec2553a-8961-4d34-92ca-ab2ecef646c5
       Microsoft-Windows Networking VPN Plugin Platform
       32980f26-c8f5-5767-6b26-635b3fa83c61
       ec044b58-3d13-4880-936f-7b67dfb3e056
       7140345f-b491-497c-98de-0072d12d0fe1
       Microsoft-Windows-Kernel-Dump
       dde441ee-57c1-4571-8bd5-1adc23b819a9
       647b7b19-72a3-4385-b2eb-06400f8898f9
       Microsoft-Windows-TCPIP
       67b768eb-35a1-4f19-8243-bd920f31f7ca
       c75c2ad1-f91c-469e-bac0-18e7b083e330
       74464835-1747-5319-3e05-d5c08b38c983
       Microsoft-Windows-Security-Vault
       48ea4db0-8d7e-419b-b465-e5b572f30305
       c4ac552a-e1eb-4fa2-a651-b200efd7aa91
       0c5a3172-2248-44fd-b9a6-8389cb1dc56a
       d2440861-bf3e-4f20-9fdc-e94e88dbe1f6
       5eb0d4c3-41ef-441a-ba18-ddc05e522cd6
       Microsoft-Windows-Network-Connection-Broker
       c715453b-5d50-4ed1-8304-2ffca01cbd00
       553ca39b-c608-566d-18ae-7b9a03a39acd
       10eb6007-818c-4db6-a694-b518e589d07a
       ba40f892-8b92-47bf-b03b-a9ba39b59d8b
       55e357f8-ef0d-5ffd-a4dd-50e3d8f707cb
       df4cf2e3-435c-4010-9e05-0f54287cdc31
       Microsoft-Windows-MPS-SRV
       106b464a-8043-46b1-8cb8-e92a0cd7a560
       3f30522e-d47a-407c-9067-2e928d00d54e
       Microsoft-Windows-Feedback-Service-TriggerProvider
       9fc5be59-bd4e-4622-833d-24195d8983f9
       485e7df0-0a80-11d8-ad15-505054503030
       ea3f84fc-03bb-540e-b6aa-9664f81a31fb
       Microsoft-Windows-Winsock-NameResolution
       9a2edb8f-5883-499f-aced-6e4b69d43ddf
       487d6e37-1b9d-46d3-a8fd-54ce8bdf8a53
       Microsoft-Windows-ApplicationExperience-Cache
       3a82f218-fcc2-4183-afe9-a0febc4416ee
       c8bde9ff-f31f-59dc-6c27-ca37c516ada5
       30cfd418-1fbe-4bb7-a2fe-de330dfe3993
       Microsoft-Windows-Kernel-IoTrace
       93ba57c6-201d-5390-dacb-86f28825a7f3
       6e7b1892-5288-5fe5-8f34-e3b0dc671fd2
       a61241c7-959b-49c7-8d7d-383a580264ef
       67eb0417-9297-42ae-a1d9-98bfeb359059
       Microsoft-Windows-HelloForBusiness
       2a3004d6-69be-5b33-c3e2-e810e119e55d
       ed1640e7-9dc0-45b5-a1ef-88b70cf1742c
       Microsoft-Windows-AppModel-State
       c7491fe4-66f4-4421-9954-b55f03db3186
       702bb771-f6f6-4b08-adaf-42abe09b4fd1
       f53a23be-ea7d-54ac-d7ab-dd541e945ae8
       Microsoft-Windows-COMRuntime
       24b4f621-1022-48ed-8b93-23fa02191d83
       d905ac1c-65e7-4242-99ea-fe66a8355df8
       d0c9c5ef-166e-5120-7d14-eb037693c807
       7067398c-bae7-4191-bf16-c436de658baf
       Microsoft-WindowsPhone-CoreMessaging
       Microsoft-Windows-RPCSS
       NT LAN Manager
       Microsoft-Windows-User Profiles General
       Microsoft-Windows-WinRT-Error
       Microsoft-Windows-Subsys-Csr
       Microsoft-Windows-KernelStreaming
       c6998471-62cd-424d-a9a3-fe4c1fa378a4
       945186bf-3dd6-4f3f-9c8e-9edd3fc9d558
       Microsoft-Windows-Kernel-IO
       eb004a05-9b1a-11d4-9123-0050047759bc
       5b1c79f0-a7b1-4fb1-a3c7-374528a7b075
       ba44067a-3c4b-459c-a8f6-18f0d3cf0870
       5526aed1-f6e5-5896-cbf0-27d9f59b6be7
       Microsoft-Windows-MediaFoundation-MFReadWrite
       Microsoft-Windows-Kinect
       746622e1-9381-4507-be68-2e6b55f81070
       Microsoft-Quic
       d905ac1d-65e7-4242-99ea-fe66a8355df8
       313e61c4-563b-5dca-3df8-e4e3093e6d53
       Microsoft-Windows-Push-To-Install-Service
       96060c66-8654-4f0f-b04a-328089ac34cf
       592a4df9-d924-4b85-ba54-94f96cfb548c
       46df03df-beab-5f0b-7eb2-e471c1bea993
       335c7161-d9ca-5d26-744a-2c05d4a4f121
       0866b2b8-5cef-5db9-2612-0c0ffd814a44
       2383d505-afdd-4705-85c6-ceb91179929c
       00000010-0dc9-401d-b9b8-05e4eca4977e
       1f81aa20-5e73-5be9-1875-4b87c767808b
       1b9d8490-0675-4a63-8733-ba2a2ed24827
       3b03237a-a0e8-5b77-31f0-74586f01ce6c
       83bda64c-a52c-4b37-8e61-086c22a4cd15
       facb33c4-4513-4c38-ad1e-57c1f6828fc0
       064f02d0-a6c4-4924-841a-f3badc2675f6
       fd66a680-c052-4375-8cc9-225f923cef88
       ad33fa19-f2d2-46d1-8f4c-e3c3087e45ad
       Microsoft-Windows-Store
       077b8c4a-e425-578d-f1ac-6fdf1220ff68
       e6c38788-c835-4d10-b26e-5920c34e5f20
       ab74fbe2-37ef-48c4-b9ba-91ae7804a0b7
       c1fc4970-bc57-4138-b3fb-91ea9848a0e5
       b8efdc71-988b-50be-86bb-0f97b0a3a7c8
       64788b34-e8e5-5664-af50-45afb294a1dc
       099eed30-ef6b-4e21-a651-7fb5b1412ce2
       e733ac63-88e0-450e-b58c-a0957a1b08e8
       07d29996-321e-404b-983a-212d5c571f40
       ed0c10a5-5396-4a96-9ee3-6f4aa0d1120d
       Microsoft-Windows-DeviceAssociationService
       00000011-0dc9-401d-b9b8-05e4eca4977e
       2dd11de3-fdde-4da9-b57a-af6585f74233
       b9f181e1-e221-43c6-9ee4-7f561315472f
       20644520-d1c2-4024-b6f6-311f99aa51ed
       c2f36562-a1e4-4bc3-a6f6-01a7adb643e8
       467c1914-37f0-4c7d-b6db-5cd7dfe7bd5e
       07785021-a524-4ded-8137-8ab5c9390fa8
       585a0dda-c848-4fc9-956f-2df7ca5f2ca9
       bc4ea265-f1e1-440d-abf6-14fae20f7343
       d385f519-44a2-4edf-b2f1-df0b84c8ed06
       62d2ab05-ad55-4f5e-a537-f468b86b05f7
       35167f8e-49b2-4b96-ab86-435b59336b5e
       f168d2fa-5642-58bb-361e-127980c64a1b
       00000012-0dc9-401d-b9b8-05e4eca4977e
       9a7d7195-b713-4092-bdc5-58f4352e9563
       Microsoft-Windows-Privacy-Auditing-CPSS
       106b464d-8043-46b1-8cb8-e92a0cd7a560
       56dd9c57-06cc-48ba-b123-876a6495ba13
       364e2beb-6efc-47dc-b8b1-49aae1d83922
       487060c7-9c26-45a6-9fef-aa03f02a9a1d
       2be9dc6e-bd4f-4bca-8356-00f96cf954fa
       5dd5f9b0-00b6-4ebd-9d9c-31dc95a25ef2
       3e7714aa-f717-4c62-8d4d-b3383e4df090
       930ba82d-224a-47eb-9d2c-7092b4f99897
       fb2a6d3f-0896-532e-77fc-2d9191d1c717
       8c800f35-77ee-4bfa-9ccd-c8e388e27092
       1d988eb8-0133-5903-ae68-4d44ea8abb85
       57d04b7b-550a-49a2-abcc-a7fa15598a30
       f7e83426-2b81-58f9-c5d4-f2db6d0ad473
       f09a0e39-7cc2-475d-94d9-507fa08fc950
       Microsoft-Windows-NDIS-PacketCapture
       aff5d694-bd28-4ffc-ab81-1f8718868057
       d29624ca-200f-44bb-9471-13b01ea15b9e
       2d617ccf-25cb-5351-d434-82c4dfa19059
       f1854a8b-3fd5-5f55-4255-9b3a53565951
       ec330296-d0fc-47f4-92d0-8eef37131fbb
       8e9f5090-2d75-4d03-8a81-e5afbf85daf1
       767f708a-096b-4930-b518-313844360af7
       Microsoft-Windows-DDisplay
       1095638c-8748-4c7a-b39e-baea27b9c589
       d49e68c5-1d4a-4384-b42a-49e6abd6b256
       836d9d37-46c1-41be-a956-09b88f964468
       1f132a04-5c61-573f-d2ed-35a7e77c281c
       53b7f054-68fd-5c77-b92d-e54340f38968
       a323cdc2-81b0-48b2-80c8-b749a221478a
       23b8d46b-67dd-40a3-b636-d43e50552c6d
       3440e16d-c661-5dca-d41d-b05c08b0efbb
       0e0f8532-1f38-50d8-5cd4-34f3869604db
       2bed2d8b-72d4-4d19-b0ac-dc27bf3b24ea
       23218c03-d099-425a-8778-337a4ddc7ba9
       485e7de9-0a80-11d8-ad15-505054503030
       548854b9-da55-403e-b2c7-c3fe8ea02c3c
       Microsoft-Windows-Wininit
       03914e49-f3dd-40b9-bb7f-9445bf46d43e
       Microsoft-Windows-QoS-Pacer
       3eb30880-cc91-5eb0-24a0-50a6a52315fc
       7d97faf2-489e-45b6-b57d-e605898950e6
       8269d78e-14e7-50ba-64ce-dd649dfcd8c5
       41932cab-7e12-40d6-a728-62d30e054593
       85b427e8-a7fc-4df9-8bb1-17150f3e7d69
       cf7f94b3-08dc-5257-422f-497d7dc86ab3
       70f18147-06e6-497b-bbc4-58d60b4760e2
       63bcb611-4446-564a-a4b3-7d65624589ef
       99c9988d-2185-5021-a21d-7a863b8a1a10
       c5f41ba4-d17a-48f1-ae6a-dd4ae119b4d7
       245f975d-909d-49ed-b8f9-9a75691d6b6b
       Microsoft-Windows-StateRepository
       cbf776fd-5b21-5fbc-e4cd-f19fe9acc193
       Microsoft-Windows-Base-Filtering-Engine-Connections
       4b01be74-d810-5994-228e-ee8417be3468
       ea289c62-8c36-4904-9726-15ecd282aed5
       485e7de8-0a80-11d8-ad15-505054503030
       e0910e25-6fcc-4f32-8f5e-a42cf7acc5c3
       Microsoft-Windows-Kernel-CPU-Starvation
       072665fb-8953-5a85-931d-d06aeab3d109
       7c31b52d-98bd-42ee-a1ae-cde9e0a8448f
       4d2092fb-50b4-53f3-e719-fdc87a62fdd0
       13b197bd-7cee-4b4e-8dd0-59314ce374ce
       81f307db-f5fb-4c3e-9b9d-8b39a9cb6198
       6966fe51-e224-4baa-99bc-897b3ed3b823
       2729be56-b41a-54be-8c2a-8da6127a8e38
       Microsoft-Windows-UserModePowerService
       485e7deb-0a80-11d8-ad15-505054503030
       d0b639e0-e650-4d1d-8f39-1580ade72784
       Microsoft-Windows-Kernel-Process
       b92d1ff0-92ec-444d-b7ec-c016f971c000
       86750899-3dab-45e2-8f95-59dbefa0a7d6
       Microsoft-Windows-RTWorkQueue-Threading
       27b577e4-806e-5536-9996-c6a2015563d0
       628cd108-ad48-4db0-b286-1a55a14022a7
       9ee22e19-9672-4625-a9ff-c2b711ad923f
       41b5f6e6-f53c-4645-a991-135c2011c074
       fa47059e-b524-4461-86c1-7fdaafa20f7d
       485e7dea-0a80-11d8-ad15-505054503030
       98177d7f-7d3a-51ef-2d41-2414bb2c0bdb
       6c6d5103-b4ab-46b1-b4cf-7d330f4c81e6
       7b3b9d0a-ac64-4cbd-b658-e1ec8b4cb416
       Microsoft-Windows-StorPort
       1bc8d94b-7838-49f8-b675-01df9678a963
       514775e1-fa95-459f-b6d4-b86ad1c5b49e
       2216b6de-b82c-56a0-5760-0ce1b6322c13
       9502cbc6-aa74-4eff-ba91-d9329bcce758
       Microsoft-Windows-Immersive-Shell
       6e65c8fc-3cfe-412a-b793-d36d2185a831
       aa7f59e5-9792-58e7-c92a-a7d12af3222b
       8488bcf1-412d-4a22-b161-d714f98cf46c
       2955e23c-4e0b-45ca-a181-6ee442ca1fc0
       a14cafa7-a31f-4993-ad02-279f410a19d7
       ed092a80-0125-4403-92ac-4c06632420f8
       485e7ded-0a80-11d8-ad15-505054503030
       3fd9da1a-5a54-46c5-9a26-9bd7c0685056
       Microsoft-Windows-Crypto-BCrypt
       0f81ec00-9e52-48e6-b899-eb3bbeede741
       3595ab5c-042a-4c8e-b942-2d059bfeb1b1
       Microsoft-Windows-Remotefs-Rdbss
       0cbb6922-f6b6-4aca-8bf0-81624b491364
       Ntfs
       Microsoft-Windows-Kernel-Network
       a76c2fad-7ac8-44d3-8fb4-fe9cfe6ce98b
       1a961d6e-9b5e-436f-9876-91983ca27fbb
       00000008-0dc9-401d-b9b8-05e4eca4977e
       Microsoft-Windows-AppReadiness
       b21e0d82-6fe3-57fa-8002-62a8b508ba41
       Microsoft-Windows-WindowsUpdateClient
       Microsoft-Windows-CoreWindow
       c0183094-fdc6-493f-a3e8-697224f83f6f
       00000009-0dc9-401d-b9b8-05e4eca4977e
       d76203c4-8c1b-4e53-afab-c22865594f3f
       52134415-75c1-4df9-9118-8b2bd00cc6e2
       0998dfb7-59d7-4e82-92ce-8a83e7c0bb3e
       Service Control Manager
       4e7add1a-6945-435a-82b6-612688ba9f57
       bde5a307-3888-46cc-851e-5c151fcebd05
       Microsoft-Windows-Kernel-File
       d8f29c0d-526c-5148-2167-9be755ad812d
       af5c9658-6b92-4f83-8b6a-1447549fb878
       Microsoft-WindowsPhone-CoreUIComponents
       d80fd405-6d50-44e9-be8f-6b097e56db62
       8e73361c-cae2-4db0-b585-27c41ebc84b2
       0bca4784-8257-51a0-d9ec-24fe1fe4c90d
       964356af-d038-468a-b27f-798f338eb3cb
       b89fa39d-0d71-41c6-ba55-effb40eb2098
       e3368fca-e5e8-4853-bf25-dc780bf7ee2f
       58086964-516f-53f5-d197-71bc0c5e34b7
       e58123f6-f32f-4d9f-a3f6-8f39ece9e112
       f818ebb3-fbc4-4191-96d6-4e5c37c8a237
       5a8a94f3-249f-49f8-86d1-e6527c80622b
       485e7def-0a80-11d8-ad15-505054503030
       e8ed09dc-100c-45e2-9fc8-b53399ec1f70
       Microsoft-Windows-EndpointTriggerProvider
       8d8551e7-55df-4f9e-b8cc-c6ee1653f004
       Microsoft-Windows-Kernel-Prefetch
       e9f2d03a-747c-41c2-bb9a-02c62b6d5fcb
       Microsoft-Windows-Ntfs
       6d1b249d-131b-468a-899b-fb0ad9551772
       ba696cfe-f69c-431b-81c4-68a83567a600
       c99ee62f-d6e3-45eb-8f03-c61495a48c15
       c69317b7-1688-4007-880c-ee57210327ef
       36c39bd1-5eb9-4785-a06e-c6d8de073cb0
       cc79cf77-70d9-4082-9b52-23f3a3e92fe4
       63b6c2d2-0440-44de-a674-aa51a251b123
       a0ab5aac-e0a4-4f10-83c6-31939c604fd9
       Microsoft-Windows-UserDataAccess-UserDataUtils
       Microsoft-Windows-CloudStore
       f77a815e-6103-4bc2-b570-f5a37f849949
       1a211ee8-52db-4af0-bb66-fb8c9f20b0e2
       Microsoft-Windows-NetworkSecurity
       acc49822-f0b2-49ff-bff2-1092384822b6
       Microsoft-Windows-Direct3D11
       485e7dee-0a80-11d8-ad15-505054503030
       544d4c9d-942c-46d5-bf50-df5cd9524a50
       b2fc00c4-2941-4d11-983b-b16e8aa4e25d
       96c57851-af06-470f-8635-9c5e463e5f0c
       Microsoft-Windows-Security-Mitigations
       Microsoft-Windows-Security-LessPrivilegedAppContainer
       aa878788-4721-571b-ed72-c33e53b76057
       Microsoft-Windows-OneX
       1c95126e-7eea-49a9-a3fe-a378b03ddb4d
       01578f96-c270-4602-ade0-578d9c29fc0c
       cb8b7862-eae7-4f30-9574-9453076ebaab
       Microsoft-Windows-Wcmsvc
       f631b6d5-7300-5ec6-0fd3-e7a84d2de669
       Microsoft-Windows-Runtime-Media
       3b11f303-2e4f-4856-9a63-1de8c1baebfb
       9da404c3-cbe8-5bd4-4fb4-ebfe33986e71
       153efe57-afa7-5d33-1f91-17d13727b6ad
       d64f50d2-fda8-5f3b-b949-89145bf739d1
       6f72e560-ef48-5597-9970-e83a697071ac
       9bed1243-5176-45f7-baac-120097930530
       393ff4cc-f02d-5d0a-4180-b79bf8da529d
       fbdc4594-a4a9-5f04-af86-7bd18a7938b9
       6b4e98da-b103-588e-d0db-c7a111582066
       d8fa2e77-a77c-4494-9297-ace3c12907f6
       00000004-0dc9-401d-b9b8-05e4eca4977e
       Microsoft-Windows-WinHttp
       8857cd15-8821-498e-9c38-de67f0e51e1a
       37d2c3cd-c5d4-4587-8531-4696c44244c8
       c59673d8-b796-58df-fbf8-a70bad656dca
       Microsoft-Windows-DxgKrnl
       28dcc28b-3e31-527b-efd6-b4cc4d73d158
       28dcc28b-3e31-527b-efd6-b4cc4d73d157
       af2ae1c8-cf6d-4268-8159-fcce3c2e67db
       7efbf076-8109-51aa-2575-c23f42881cea
       47f97aea-ad83-4ab7-8895-0d73f9a86a6a
       7228ecc6-0f60-4c79-9391-93f56d9ad432
       Microsoft-Windows-NetworkProfileTriggerProvider
       02db1e80-8296-5d13-91b2-3d6bdf0bc162
       6d7051a0-9c83-5e52-cf8f-0ecaf5d5f6fd
       81fd9aa4-34b7-5415-4e8c-fc7484d4da55
       aef66a73-a765-4421-b348-b7e0fc8c9898
       afe0ae07-66a7-55bb-12ff-01116bc08c1b
       21e0ae07-56a7-55b5-12f9-011e6bc08ccb
       00000005-0dc9-401d-b9b8-05e4eca4977e
       7913ac64-a5cd-40cd-b096-4e8c4028eaab
       c8706191-05aa-529a-64f1-c13a4674c8af
       8d8551e8-55df-4f9e-b8cc-c6ee1653f004
       8b9b46ca-778f-5cc2-4255-3a6b1e69ae24
       Microsoft-Windows-Kernel-Memory
       79b2c597-f613-55f1-8411-d4ef99569e80
       5dc8f4f8-07b3-46fb-a5c8-6881776a0268
       9345df93-4fab-4047-bc9a-7056dd9893c2
       d0034f5e-3686-5a74-dc48-5a22dd4f3d5b
       eadb8f1b-577d-4d09-8104-b61a3d9036e5
       82fe78cc-ff52-4e2f-a7bb-5c90636d14ba
       84ce2437-370f-4b0e-b7f9-7ceb550e572e
       Microsoft-Windows-WebIO
       Microsoft-Windows-UniversalTelemetryClient
       00000006-0dc9-401d-b9b8-05e4eca4977e
       Microsoft-Windows-Crypto-RSAEnh
       169ec169-5b77-4a3e-9db6-441799d5cacb
       Microsoft-Windows-CDROM
       1491f89f-c57d-4135-8e05-76f0f68124a8
       4f2ec0d2-e724-4a7a-a742-49b40b691672
       2c7c2ec1-93d1-4919-b776-9c00bd6f88cc
       57a77336-f39e-4fe3-9bd7-ab58696e5000
       b117acb6-f2da-4c4b-bfb6-6cbfc9928b67
       30dd1049-5862-4ec9-9f03-872e2e44a43b
       1aff130c-7154-4379-a18a-6d6e22dd5b16
       2fdb1f25-8de1-4bc1-bac2-e445e5b38743
       Microsoft-Windows-PushNotifications-Developer
       af9f58ec-0c04-4be9-9eb5-55ff6dbe72d7
       9bfa0c89-0339-4bd1-b631-e8cd1d909c41
       3da494e4-0fe2-415c-b895-fb5265c5c83b
       Microsoft-Windows-SMBClient
       a9da4dcc-e78e-5ce7-4078-411a9928f082
       1fd216eb-201e-4b4d-93ca-41f33d5a04ec
       89fe8f40-cdce-464e-8217-15ef97d4c7c3
       LsaSrv
       267e4a12-6a1e-53c3-30b0-600ce7cc3e11
       Microsoft-Windows-ServiceTriggerPerfEventProvider
       Microsoft-Windows-PDC
       22e533d4-10d8-450f-bada-b6c5adf44edf
       00000007-0dc9-401d-b9b8-05e4eca4977e
       8ba07c99-d49b-486a-af63-3cf0f677d80c
       2da32862-3bba-43ad-9ec8-e1999da3c376
       Microsoft-Windows-Devices-Background
       5c3e3aa8-3ba4-43cd-a7de-3bf5f70f9ca4
       880e5d98-55d3-50c7-f8b7-b1feafdb7fd2
       905a29f8-4571-4926-9be1-cbffce287814
       Microsoft-Windows-Performance-Recorder-Control
       00000000-0dc9-401d-b9b8-05e4eca4977e
       bd2f4252-5e1e-49fc-9a30-f3978ad89ee2
       Microsoft-Windows-Dwm-Core
       Microsoft-Windows-Directory-Services-SAM
       9cee36a6-3e83-4ef3-b8d0-4b6c81e16014
       09996b9b-504e-44d8-89ab-3f26c030b3e2
       e267207d-66dd-4246-b8cd-e77ec4878888
       4bc9f3e3-1c6c-44d8-a5f7-bd59f6d356a6
       3fe506f8-3223-494f-b6ae-2f50b1c6f806
       aadd3984-67ee-4354-94a1-18f762026c86
       8d37b4a3-2c54-560f-7b2e-b992d023682a
       4779b699-4aa0-4518-aa0c-bb664f890b33
       64566244-b596-4a35-aae5-7159a478b02f
       45cc5c7c-3409-419b-a789-46cc4e91d1b4
       ab7e1fbf-4623-5160-7d97-83167cf2bd39
       aba0b84d-4ead-4dc0-84df-08d439679dec
       a66a8706-ae1e-4a26-a15b-27d924c43063
       28d62fb0-2131-41d6-84e8-e2325867964c
       5c8bb950-959e-4309-8908-67961a1205d5
       00000001-0dc9-401d-b9b8-05e4eca4977e
       96f4a050-7e31-453c-88be-9634f4e02139
       5bc69579-c5e2-4bc8-9a9b-b2795c6b9cbb
       Microsoft-Windows-Threat-Intelligence
       Microsoft-Windows-Kernel-Disk
       0c8ef845-83f1-4a15-9988-6e1630db4d32
       a07eb5c4-4c73-58ac-14b4-825b3ea8a5a4
       2bb574fe-645a-4f36-80a4-124b7960c45d
       da7abd3e-3687-4d04-8ba2-38446f5226df
       46deb98e-b7d7-4578-a15a-e3f365c73ddb
       0074ef5a-9763-5659-c04d-8d3e64b77bea
       Microsoft-Windows-AppXDeployment-Server
       Microsoft-Windows-ProcessStateManager
       1d258d7c-4c9c-511a-e390-ebfd5ec5251a
       2f50c5d0-e25e-4f89-ab4a-31c63b518d7a
       NuiCorePerformanceProvider
       8819ca17-7faa-4184-afb7-a4120ca793cd
       Microsoft-Windows-Media-Streaming
       4c223afe-54fc-5875-d676-10c54a023e78
       0eff663f-8b6e-4e6d-8182-087a8eaa29cb
       Microsoft-Windows-HttpLog
       0a9a90c8-9417-482d-b517-df1774c8f404
       f64bf471-cbde-4203-8974-afc7381a2862
       c2ba06e2-f7ce-44aa-9e7e-62652cdefe97
       Microsoft-Windows-FileInfoMinifilter
       703fcc13-b66f-5868-ddd9-e2db7f381ffb
       7c4c4d7c-fadd-41fb-a1dd-7137de22357e
       afc8a033-e28a-415c-acff-030e4b113a35
       3e0d88de-ae5c-438a-bb1c-c2e627f8aecb
       00000002-0dc9-401d-b9b8-05e4eca4977e
       94061ca0-fb42-5b87-f7f1-254b0a86f9fd
       abb10a7f-67b4-480c-8834-8b049c428715
       2e16b12a-b093-468a-86fa-f002e013b6a6
       401b5439-6b0c-45cd-9c08-7080760bd043
       e064d4a7-07cc-4517-a7bc-5d2b9397746a
       Microsoft-Windows-ESE
       9ec8977f-83d0-4458-9e2e-41e96eb40f38
       Microsoft-Windows-SMBServer
       6bd96334-dc49-441a-b9c4-41425ba628d8
       00000003-0dc9-401d-b9b8-05e4eca4977e
       5a90c24c-ed5f-4053-94a1-3c65980e6fc9
       bc71577f-76e9-583a-ecd6-62d0250d900f
       Microsoft-Windows-Containers-BindFlt
       d0f1a5c6-fc43-48ae-99bf-efb1c38be9d1
       de5a9d0a-c195-504d-0175-039ac1243837
       e75a83ec-ef30-4e3c-a5fb-1e7626e48f43
       Microsoft-Windows-Heap-Snapshot
       331c3b3a-2005-44c2-ac5e-77220c37d6b4
       e9de3642-8f23-4a16-b7e6-33dcc9adda7f
       a4196372-c3c4-42d5-87bf-7edb2e9bcc27
       Microsoft-Windows-Kernel-Audit-API-Calls
       9b89baa4-0253-5e71-26d5-182a4e690463
       c2125bcd-a5b0-46bf-bb95-740599aa8f9b
       4e8f98a2-3dc0-4dd8-bb6f-7335068650a5
       93ea71e9-c552-4709-89c9-80ffad4e87aa
       7b52746e-241b-52c9-8f0b-4e5e25e54507
       bb86e31d-f955-40f3-9e68-ad0b49e73c27
       9401b890-ed5c-493d-8efd-3f135d7dd797
       caa8cfe8-7cec-451e-b49f-6e60af56061e
       fda3d86b-1600-5f85-614f-cc4a2aa6f2d4
       3be31812-5523-5239-5fc6-534f8e558f40
       b87cf16b-0bf8-4492-a510-d5f59626b033
       a0b6be33-b959-50c3-3c92-8451b6f965c3
       bd59a9a8-cafb-4503-845e-d85fb72ae2e1
       e941009c-7403-48ae-b5b3-df1fcaa62a60
       Microsoft-Windows-WinINet-Pca
       Microsoft-Windows-Dwm-Compositor
       7c29709d-3c02-47fb-8a39-d8287522fadb
       d92ef8ac-99dd-4ab8-b91d-c6eba85f3755
       80df111f-178d-44fb-afb4-5d179de9d4ec
       Microsoft-Windows-Devices-Query
       7565c249-c0d1-5701-5569-30c12d7b1f51
       c31e3c2c-0867-5334-34af-93b3dfdee3b8
       Microsoft-Windows-NWiFi
       c95fd9ab-d373-473b-80b7-3a90b8dd5bc2
       8cb49c14-b9f8-4d6c-a328-10f76fc39839
       7db49c14-b9f8-4d6c-a328-10f76fc39839
       3be89602-989c-4862-9d5d-dd87a3e5d2b6
       39e1f56f-a1fb-5767-d7b7-8763e3ddb9c2
       310385de-0fde-448a-9198-a46cf14252c7
       b3466ff2-1f1c-44e2-94a1-a47b1b4b39b5
       81b213eb-73a8-4b62-95bc-354477c97a6f
       a99b2eb4-5620-44f5-9b02-f9d2eebf2e96
       fa4269f1-d5ad-47b0-b4cd-7df3091b9422
       3ff44415-ee99-4f03-bc9e-e4a1d1833418
       3b3d62ec-652a-4b24-8295-78b32507cc9c
       Microsoft-Windows-WinINet-Capture
       da995380-18dc-5612-a0db-161c5db2c2c1
       10ff35f4-901f-493f-b272-67afb81008d4
       6da4ddca-0901-4bae-9ad4-7e6030bab531
       e68e254c-44d6-4433-b1e3-b61a0a831b10
       c973cad7-01c4-51bd-faad-50cac8ebafe4
       3c302a2a-f195-4fed-bd7b-c91ba3f33879
       Microsoft-Windows-Winsock-Sockets
       6b510852-3583-4e2d-affe-a67f9f223438
       e9eaf418-0c07-464c-ad14-a7f353349a00
       53aa67a2-dee7-4561-aa17-7d304e4053e3
       8bd47a05-1380-43b8-b36c-ce8f17799c0c
       Windows-ApplicationModel-Store-SDK
       Microsoft-Windows-NetworkProfile
       2b87e57e-7bd0-43a3-a278-02e62d59b2b1
       5814d278-a0cb-5ebc-1f12-1a5e4d8c34ac
       35b65f6b-fb4e-57d6-2927-7c63ad03dbcb
       98368b31-33e1-5b91-5dee-351eec67c9e4
       d44a2098-821f-5808-4cea-1e24e982ca37
       49592c0f-5a05-516d-aa4b-a64e02026c89
       ClrGC
       cb18e7b3-f5b0-412f-9f18-5d87fefcd662
       Microsoft-Windows-DirectManipulation
       cb18e7b3-f5b0-412f-9f18-5d87fefcd663
       2f669506-de7f-4807-9f05-61ac44ec3465
       07a29c3d-26a4-41e2-856a-095b3eb8b6ef
       d71e5030-761b-51ed-c569-a89d4c503c4f
       Microsoft-Windows-Services-Svchost
       75638a28-e9ed-42b2-9f8f-c2b1f89cf5ee
       21063878-2959-42ea-a85a-0da1ab119c03
       aa3a221d-9a6f-4cf9-904e-897100ce8915
       23abc8a8-859a-4db2-a278-d12cb28a23d1
       f2760c9a-bf66-4871-b779-fff1e923d96b
       fc70fab8-0cf6-40a1-abc2-cd9c879beb9e
       2daffee6-51d5-4c61-aaf1-8c107be12ef9
       Microsoft-Windows-MediaFoundation-Platform
       8c3e3b78-4e27-48ea-b52c-7bcdc9cc2da9
       29cfb5c5-e518-4960-a985-e18e570f935b
       46aa338f-f274-48bb-9975-a58fc1ace7e0
       973c694b-79a6-480e-89a5-c8c20745d461
       8360d517-2805-4654-aa04-e9985b4433b4
       ab604427-d048-4139-8494-1246c81f09d5
       Microsoft-Windows-NetworkProvider
       Microsoft-Windows-Diagnosis-PCW
       6c0ebbbb-c292-457d-9675-dfcc1c0d58b0
       946473dc-c1b7-5697-6c2d-8ad664f95cec
       Microsoft-Windows-Kernel-WSService-StartServiceTrigger
       b895a8ee-76c9-4fb5-af4b-6beb6b4e05a0
       86a13cf3-bbd2-5f61-8c90-36214e710948
       b52c4e12-a9fc-4add-a76e-423c2aa43744
       a011308e-e43b-4120-ad04-c023bb14f2b6
       db519e07-124b-5112-eeeb-f595813754fd
       c148cf1d-b652-56c2-a964-2db0c5686ccf
       e7dd6e77-d38a-5bd2-4092-3a965959b6fc
       cbb61b6d-a2cf-471a-9a58-a4cd5c08ffba
       4ee5bf9a-3e8f-540b-8bfb-12457a2854b6
       2e5dba47-a3d2-4d16-8ee0-6671ffdcd7b5
       02f42b1b-4b78-48ce-8cdf-d98f8b443b93
       0fffb788-b827-4730-ad87-f48da61795cd
       e159fc63-02fe-42f3-a234-028b9b8561cb
       dcef5411-1f98-5ee7-238b-5abd0e078e97
       0001376b-930d-50cd-2b29-491ca938cd54
       f2969c49-b484-4485-b3b0-b908da73cebb
       f3a71a4b-6118-4257-8ccb-39a33ba059d4
       edeee0b4-6123-4bb0-bb21-7df3c83ac490
       5c7051bd-bedc-52df-b54e-f6f2706f346a
       7efe4ab3-990d-4350-a878-cd8772888199
       db6c92cc-6bb4-4258-a772-d9597bbdcaf7
       8d19519d-6f8e-5733-e16b-e1b15639777d
       93c05d69-51a3-485e-877f-1806a8731346
       eb161d01-21d9-4ab1-82e3-141e3fee37a5
       d236a4a0-253f-58c9-5616-2b576ce9331a
       75ff6f72-f47e-5568-7e22-5f865793737a
       b6acef34-fab6-5909-6b6b-b1c2cc84057f
       Microsoft-Windows-MSFTEDIT
       43fa1797-adcc-42ce-b216-776e8c81dc74
       af2ca688-62aa-48e9-8bf6-a0ca0cae2354
       012616ab-ff6d-4503-a6f0-effd0523ace6
       1ee4093e-d437-4847-8312-acfc2f05e6ec
       3d8e0e0a-54db-46d1-94ba-7ff7209d6a31
       Microsoft-Windows-Dwm-Dwm
       bb8dd8e5-3650-5ca7-4fea-46f75f152414
       Microsoft-Windows-VerifyHardwareSecurity
       Microsoft-Windows-RPC-Events
       deb96c0a-d2d9-5868-a5d5-50ee13513c8b
       5e85651d-3ff2-4733-b0a2-e83dfa96d757
       Microsoft-Windows-Directory-Services-SAM-Utility
       767166e4-869c-5cc7-4f54-b13d12274111
       0641786e-14af-542a-3bce-a628df5b2332
       63ff4fdd-4126-5b4a-763d-231c2852372c
       58c83e82-babb-4b14-aa65-2ac73525fd3a
       23e0d3d9-6334-4edd-9c80-54d3d7cfa8da
       950d4eda-1729-47cc-8f1e-d9ed5aa17642
       6b49c222-9715-4285-bb0b-76ab6a4e2b6c
       6eaa8566-66f9-5c32-c995-05cbb0b423ac
       f4c19371-9e73-45ef-96de-2efb32299a79
       Microsoft-Windows-TimeBroker
       Microsoft-Windows-TaskScheduler
       b4eab216-103a-4bb0-8e83-cf51c4480ae3
       df75c1c9-c494-4f12-8c30-fd9337b14027
       df271536-4298-45e1-b0f2-e88f78619c5d
       8f8942e2-66b4-5650-8cf1-de723ca48565
       Microsoft-Windows-AppXDeployment
       969e8d6b-df02-56e3-a058-ec3bef103534
       31d1351e-5c89-4254-b36a-171cc2ace7f4
       1a6e901d-124c-441c-8c8e-bf8c3ae2fe11
       50109fbd-6d85-5815-731e-c907eca1607b
       dbf307fb-02e9-4935-b062-f63f05d58dc8
       e90cb4c0-c7b6-4f18-a53a-187934ad4b55
       Microsoft-Windows-ReadyBoost
       7c109ac5-8971-4b39-aa88-ecf239827664
       0616f7dd-722a-4df1-b87a-414fa870d8b7
       19d78d7d-476c-47b6-a484-285d1290a1f3
       f9fdd5a0-85ea-46bd-a4ba-fbeec97c558c
       Microsoft-Windows-COM-RundownInstrumentation
       1aff6089-e863-4d36-bdfd-3581f07440be
       c8b53346-95c2-50cb-c63d-9f9d259a1c45
       772013fb-617e-4269-a691-66a6847d2856
       9e2e5009-1313-49de-ab00-d2eb56e0e217
       ebcca1c2-ab46-4a1d-8c2a-906c2ff25f39
       6f3ad6f8-7da4-4311-a551-c263de1b2950
       8eb79eb6-8701-4d39-9196-9efc81a31489
       Microsoft-Windows-Audio
       9ac9593a-8e9e-5c4c-6407-43c56769851b
       e8b5322e-be62-5f6d-0093-c096abf1d898
       1a01ab65-1f99-5d23-475f-02075cc655f4
       23ea6c85-7f23-4a0e-9a68-bd3054d032e7
       31442aba-1fd2-5680-a7e1-87bfa73b43a8
       afbd9bfb-785c-515d-8ede-c31081bf8872
       c7971fef-9c5d-49e3-92ec-d203487ee016
       9086d719-aed7-4ffb-9d82-9299bbc1183c
       Microsoft-Windows-MediaFoundation-Performance
       accfd0da-d325-5532-2f78-d52f7851d177
       ea6e1609-01b5-52b4-85ae-3169911ad302
       54732ee5-61ca-4727-9da1-10be5a4f773d
       63bca7a1-77ec-4ea7-95d0-98d3f0c0ebf7
       18608e62-a628-49d9-8c02-55972e097d24
       20c46239-d059-4214-a11e-7d6769cbe020
       Microsoft-Windows-CodeIntegrity
       Microsoft-Windows-Ntfs-UBPM
       54d5ac20-e14f-4fda-92da-ebf7556ff176
       bda92ae8-9f11-4d49-ba1d-a4c2abca692e
       b1a37fe6-6431-56aa-33fd-cdb90c3b695e
       Microsoft-Windows-ApplicationExperience-LookupServiceTrigger
       5b4f162a-a36c-402b-b2e4-a3db1c9b7f33
       26a07136-ea23-42d8-b420-d475894d3aab
       38e52276-1c65-434b-8425-92ef7febb194
       797e4878-22cf-452a-86ff-3872d880f93b
       5fe36556-c4cd-509a-8c3e-2a547ea568ae
       0cbef367-5546-406a-bd24-6240f55d4981
       4d5a5784-b063-4c87-8def-dbf683902ce3
       7765ec18-099f-424b-85f0-c639eb677de2
       1941f2b9-0939-5d15-d529-cd333c8fed83
       4a743cbb-3286-435c-a674-b428328940e4
       ca967c75-04bf-40b5-9a16-98b5f9332a92
       5fb75eac-9f0b-550c-339f-fc21fde966cd
       3cfee9ea-a82c-43f7-b5bb-93da1ad79b05
       350e99a3-8d61-45d3-9f71-1bbb746a0aba
       883b9247-ab6e-5068-59bb-eeb519d551b6
       74b959af-83b4-43fc-9682-6b64e4843cf3
       9dd93434-0865-5629-c753-70c27ff40dc7
       5828b13b-49ca-4017-9455-7e6c0c36eb6a
       2266b8d6-11dd-5bfe-d5f2-067e37b194b8
       369f0950-bf83-53a7-b3f0-771a8926329d
       f167074d-66e3-53ec-3adf-11ebfe132c3b
       4fea5d20-9853-424d-8ce9-bd8ed5d584f8
       e176aa66-5cc8-4321-9624-f9c1d2b7bf06
       5a1600d2-68e5-4de7-bcf4-1c2d215fe0fe
       a076f707-4472-5083-d14f-826d0ef75c78
       9ca335ed-c0a6-4b4d-b084-9c9b5143aff0
       Microsoft-Windows-Security-Kerberos
       46486b01-4dc0-4bca-b74c-8d10dc2c9801
       daa76f6a-2d11-4399-a646-1d62b7380f15
       37a3e5d6-9edb-46d7-baec-6b841d4e89e7
       7614521c-4d0b-4341-bfc9-873082c0f1d3
       Microsoft-Windows-SystemEventsBroker
       3ee18f84-0b52-4411-b705-c914cbd229ac
       df5cb104-5359-4140-806e-f18db7a3ef70
       e1fe3f3c-39e5-4f12-8b6d-0cdd79039b9b
       59d94052-3c18-4af7-be4e-f08adfb4a9b4
       2e8d9ec5-a712-48c4-8ce0-631eb0c1cd65
       cc3df8e3-4111-48d0-9b21-7631021f7ca6
       1bf43430-9464-4b83-b7fb-e2638876aeef
       Microsoft-Windows-AuthenticationProvider
       6039f834-c297-4cba-b965-0a99b116735e
       Microsoft-Windows-MountMgr
       739d5b75-383e-5a24-9b67-fa343b8df1ba
       6ecb0bf3-c4d3-52e5-81df-704c4a8686ac
       1377561d-9312-452c-ad13-c4a1c9c906e0
       3c42000f-cc27-48c3-a005-48f6e38b131f
       9f89bc9c-c762-4bd0-8b9e-077b5e4183c1
       c9ba2a84-d3ca-5e19-2bd6-776a0910cb9d
       8a36782f-4949-4980-ba6e-acadf0fe679a
       3e23bf66-c4bb-5b52-16f3-f216271e4142
       08f93b14-1608-4a72-9cfa-457eecedbba7
       40072234-0cf5-4761-acfc-6e86c11a64f3
       15a7a4f8-0072-4eab-abab-f98a4d666aed
       63ede161-b6d4-4ba4-83f5-60a11ac37370
       Microsoft-Windows-OneCore-MinUser
       Microsoft-Windows-DXGI
       ac69ae5b-5b21-405f-8266-4424944a43e9
       1d44957b-7181-4835-b70a-d0b16112a4de
       496b3c19-9dca-51a5-187c-5c746785fe4e
       ffd1d811-6488-4d44-82af-c31d372609a9
       d75df9f1-5f3d-49d0-9d15-2a55bd1c012e
       ee845016-ebe1-41eb-be52-5e3ae58339f2
       7654d661-b51d-4bd4-89ed-017919b9f02d
       15a7a4f8-0072-4eab-abad-f98a4d666aed
       fb351192-a754-46af-a2f8-775188d37b34
       a63641db-9f6d-5407-3211-c781a84e7cb1
       783823c4-ccda-523a-238c-0dba91c07ec7
       36082273-7635-44a5-8d35-d2a266538b00
       10706d4f-ca0a-47aa-b093-5b5218a6308c
       Microsoft-Windows-Privacy-Auditing
       25fd0e1f-689b-4ea0-9599-a1f47cfbbed1
       988ce33b-dde5-44eb-9816-ee156b443ff1
       ec3ca551-21e9-47d0-9742-1195429831bb
       1dd9b8c9-e078-4075-b9de-4e5125071a18
       Microsoft-Windows-LiveId
       Microsoft-Windows-NetworkManagerTriggerProvider
       8652e513-7e81-4f6b-aeac-ac4051d478f8
       19ab2471-af8b-47e9-b50f-4adc2282cc23
       3cb40aaa-1145-4fb8-b27b-7e30f0454316
       3a2e5a5c-9cac-5e49-f93a-fbe76451b4ad
       329cc1e5-3d02-4c6f-b411-0299be591cd7
       3a5f2396-5c8f-4f1f-9b67-6cca6c990e61
       7fdd167c-79e5-4403-8c84-b7c0bb9923a1
       94d45e2e-4777-467e-91f4-1c67a6b167d5
       5eb60b36-6206-5538-e60a-0a7af8a1e59d
       43ac453b-97cd-4b51-4376-db7c9bb963ac
       Microsoft-Windows-DirectComposition
       daf2c08d-5ac9-5066-ff0b-2d3d95275779
       Microsoft-Windows-BitLocker-Driver
       a26461d1-9f79-419b-8da6-610c0bba0398
       5444c7b1-d849-5543-0279-5faed419f036
       d3bb8507-fc66-5186-9e6c-00f311c8a389
       1548ce96-3c0d-5775-556b-7f60a0c81161
       f0372af2-cc46-56c0-2bb9-db2e31b2423d
       9f4cc6dc-1bab-5772-0c71-a89954718d66
       d3b2e9cc-e7cd-481c-a6ab-9425084e2f17
       638705b0-17a5-4e43-9516-ae6c2f8819f6
       Microsoft-Windows-EapHost
       60523747-6516-48b7-84b1-3264fa2cb359
       b749553b-d950-5e03-6282-3145a61b1002
       3d1d28b1-73f5-5937-3446-0de4df173ff5
       121d6825-4d66-41b6-87cd-2070eb75ba5b
       2e1eb30a-c39f-453f-b25f-74e14862f946
       6b4db0bc-9a3d-467d-81b9-a84c6f2f3d40
       92765247-03a9-4ae3-a575-b42264616e78
       061c37c3-1363-5c1b-b8ed-f3d8f74633ce
       Microsoft-Windows-Audit-CVE
       ad5c7a10-4e08-45e1-81b5-cb5eb6ec8917
       7ceded3a-7359-5861-5b43-1959577103e4
       c5de1495-f0e2-563d-9e67-2944064d8103
       1701c7dc-045c-45c0-8cd6-4d42e3bbf387
       1d4081b1-2c3d-4aa3-8a1b-0513698d1408
       8aef5633-dae7-43e9-bd1d-c620598e56d0
       22e3eeb5-4a58-ce86-7cd9-0caaa14d4f98
       fe762fb1-341a-4dd4-b399-be1868b3d918
       47eba62c-87e6-4564-9946-0dd4e361ed9b
       Microsoft-Windows-MPS-CLNT
       014de49f-ce63-4779-ba2b-d616f6963a87
       D2DWin8
       dd7a21e6-a651-46d4-b7c2-66543067b869
       f2d06f08-592d-508c-c3aa-76f396fe18bd
       a1a15804-996b-5593-4ca6-ec5153f2f490
       314de49f-ce63-4779-ba2b-d616f6963a88
       da08847d-387e-457d-a78f-e79a9488cb48
       568a9b18-e829-44c3-b977-63d4f8f88493
       cf5838d7-9fdc-5907-a62c-abd41de9d862
       DNS
       f57021fb-b93d-59ba-4807-03397f6e89c3
       f6280407-b355-4d7e-86aa-0c8fe5964086
       Microsoft-Windows-DCLocator
       dac9773a-b374-42b7-9f03-00a5e02a393e
       736ec865-856c-4c63-bd9d-15eb85634c42
       Microsoft-Windows-RTWorkQueue-Extended
       b3a7698a-0c45-44da-b73d-e181c9b5c8e6
       6e31f252-a41c-41d7-a9e2-3a20162247ec
       3c74afb9-8d82-44e3-b52c-365dbf48382a
       aa1f73e8-15fd-45d2-abfd-e7f64f78eb11
       a51ee86b-8ea5-454c-9a7d-37b6655a535d
       b27a2c15-40f4-4ea3-9637-628fc612a1d0
       beb2c2d2-250f-4b62-889c-3d4024ebcc01
       0c478c5b-0351-41b1-8c58-4a6737da32e3
       f4d81b4a-af0b-46c4-baaf-5522ca1ebf35
       5e688780-0502-4cea-b277-c99f41619301
       f6a774e5-2fc7-5151-6220-e514f1f387b6
       0bcf268a-9493-50d1-4139-6813694a4aa9
       0a6eaeee-4b93-43b1-b7d7-4ed7f8403a24
       786396cd-2ff3-53d3-d1ca-43e41d9fb73b
       0b9b891e-ff74-49ac-a582-4c58bdf12d8b
       a40b455c-253c-4311-ac6d-6e667edccefc
       Microsoft-Windows-HttpService
       de441ffa-fafa-4495-977f-2e9d2509746d
       221a8b88-4fb1-4d57-8027-3b148b43c8b9
       0bb8e5ca-316f-4b0f-9100-debbc6671308
       Windows Error Reporting
       Microsoft-Windows-COM-Perf
       f0558438-f56a-5987-47da-040ca75aef05
       a3064fc9-4d22-54c9-0003-1f90594554d3
       Microsoft-Windows-Kernel-StoreMgr
       d1203402-8724-5781-c2ba-a2a2967925ae
       b4ff0aa1-a4a0-4e7e-b9d3-23840a28268b
       166d2c82-4c89-53aa-a9ee-d558d0ce0362
       9409a994-86b7-41c8-9c7f-e3b9cdfc5752
       be928fd4-50ba-57ca-b6b8-925dab19c3bf
       7acf487e-104b-533e-f68a-a7e9b0431edb
       5cc4fd14-93bf-4f68-988f-a42f005bb92d
       d1d7d72d-00d5-4e56-8bac-23fac0f9ed4e
       4f28a611-e7f9-4fa6-8bf1-8698d06336e9
       28c9f48f-d244-45a8-842f-dc9fbc9b6e92
       Microsoft-Windows-User Profiles Service
       4d9dfb91-4337-465a-a8b5-05a27d930d48
       7e6b69b9-2aec-4fb3-9426-69a0f2b61a86
       Microsoft-Windows-User-Diagnostic
       4e12ef08-06e8-42ec-b81c-88736b506727
       Microsoft-Windows-BitLocker-Driver-Performance
       2839ff94-8f12-4e1b-82e3-af7af77a450f
       8bba4c4c-1fc2-4905-8cdb-fcd9f1a660cb
       82f95b40-7eb9-4d58-a5d5-0c85efa9dd57
       Microsoft.Windows.ResourceManager
       fb2eed18-349e-543a-4313-c12ef6ac71c8
       41d92334-b49c-4938-85f1-3c22595db157
       4e749b6a-667d-4c72-80ef-373ee3246b08
       20f61733-57f1-4127-9f48-4ab7a9308ae2
       Microsoft-Windows-MF
       f860141e-94e0-418e-a8a6-2321623c3018
       7e32a1c4-d502-5b7c-39e8-2b7b0b5f0424
       98c32c7a-945f-4a88-a832-0157b9fbfa35
       86cc27ea-6f87-47f7-8b43-3473527d4a87
       Local Security Authority
       Microsoft-Windows-DxgKrnl-SysMm
       Microsoft-Windows-Partition
       Microsoft-Windows-Networking-Correlation
       a27b9863-9b2c-4f89-84fc-7d98bf921da1
       565b2d4b-a640-42d5-ba97-8d8dc5087810
       0c5c1b70-3ddb-4d10-bf6b-7c0c6031e8ff
       84f1c38f-4a24-5831-76af-c69d69173744
       Microsoft-Windows-DomainJoinManagerTriggerProvider
       a1bfb17e-1942-485e-8137-3015091b91f7
       10bd04a0-61bc-4a60-9936-70ff316aefee
       Microsoft-Windows-WindowsColorSystem
       ceb93324-0dc4-4d12-a466-9926716f2b2a
       4e986783-1269-5610-f47c-4c882b4df7a3
       Microsoft-Windows-XAML
       e2dc32e8-e569-5fb5-232d-151bd7a70c7f
       82c7d3df-434d-44fc-a7cc-453a8075144e
       da789108-1311-4dc9-89fb-eeab65e2cee1
       a3a7b70d-a430-4f3e-ac8b-32dc24e12d7e
       9af106fc-dc26-42e1-a0f1-0c538f78f553
       551ff9b3-0b7e-4408-b008-0068c8da2ff1
       0efa15ec-78b4-4e02-9b8c-aed6b64bc4ce
       0efa15ec-78b4-4e02-9b8c-aed6b64bc4cf
       1070f044-721c-504b-c01c-671dadcbc77d
       803cb23a-e32b-4200-bd82-d8a15919ac1b
       66ba1a86-43c6-41ac-955b-28b520db532a
       03bbe5b8-c788-4d0b-b47e-5b5731398a89
       91cc1150-71aa-47e2-ae18-c96e61736b6f
       Microsoft-Windows-Winsock-WS2HELP
       c7e09e2a-c663-5399-af79-2fccd321d19a
       5b3a3ed4-78f2-4882-ab48-e34638737af2
       d14e883c-c62a-450f-9a3d-ac55797cd8b2
       ab67b0f3-ae94-452d-b595-307667142420
       c34eefdb-d72f-5786-6247-78a1e39be7fa
       3d2b6366-47a4-5e10-6974-e5f7de0d3f28
       2aa2b8df-8a4e-52a7-8cc7-c72f28293393
       de9eff74-82cc-4cc9-a57d-a035a859dbdf
       cbd57d06-3b9f-5374-ed53-cfbcc23cf44f
       a669021c-c450-4609-a035-5af59af4df18
       0410d3ad-d839-4a75-9698-e6a9b4121bdc
       dfa6e32a-095f-5f57-d025-0887d33507a1
       5100ef35-4747-4d3f-92a1-4ed6d661c3fb
       Microsoft-Windows-MediaFoundation-Performance-Core
       fa386406-8e25-47f7-a03f-413635a55dc0
       Microsoft-Windows-Immersive-Shell-API
       a74efe00-14be-4ef9-9da9-1484d5473305
       a74efe00-14be-4ef9-9da9-1484d5473301
       a74efe00-14be-4ef9-9da9-1484d5473302
       51734b23-5b7e-4892-ba8e-45bc110b735c
       64f77ad3-710c-4c2c-abcb-a7b682d07b81
       ddd9464f-84f5-4536-9f80-03e9d3254e5b
       fa8de7c4-acde-4443-9994-c4e2359a9edb
       54cb22ff-26b4-4393-a8c2-6b0715912c5f
       a74efe00-14be-4ef9-9da9-1484d5473303
       485ff7d9-11d9-4e52-8ca3-4c273a80ef36
       d3b1d17d-a2b5-40f2-9b21-40f0a5417bf6
       06d801a0-2851-4a34-8494-0b47c2385045
       30ad9f59-ec19-54b2-4bdf-76dbfc7404a6
       47c3ba0c-77f1-4eb0-8d4d-aef447f16a85
       Winlogon
       f4190f32-f96e-479c-a45d-d485cffe42e6
       5f31090b-d990-4e91-b16d-46121d0255aa
       Microsoft-Windows-Security-Netlogon
       b9da9fe6-ae5f-4f3e-b2fa-8e623c11dc75
       b8ddcea7-b520-4909-bceb-e0170c9f0e99
       Microsoft-Windows-CAPI2
       ce20d1cc-faee-4ef6-9bf2-2837cef71258
       Microsoft-Windows-StartNameRes
       Microsoft-Windows-Watchdog-Events
       e3e0e2f0-c9c5-11e0-8ab9-9ebc4824019b
       79f45527-ee95-50f1-0e6a-c48bcb22f29b
       0d641fb9-a0e3-42e3-9e9d-501d33a6fa79
       029769ee-ed48-4166-894e-357918a77e68
       218d658a-f29e-41b6-bc37-144bd03f018d
       1870fbb0-2247-44d8-bf46-b02130a8a477
       Microsoft-Windows-Runtime-Graphics
       b781b9cc-9bcc-486c-a036-d7bf98040a6b
       Microsoft-Windows-Windows Firewall With Advanced Security
       2acf2633-ed1b-41fd-a17e-9f98719cdb36
       248cbd0d-4137-442e-8d6d-530dcfd43dff
       609151dd-04f5-4da7-974c-fc6947eaa323
       ac7ff34d-58da-490c-843e-57baeb1bafef
       8a4fc74e-b158-4fc1-a266-f7670c6aa75d
       de5dcaee-6f88-585a-05ee-d8b05b912772
       f5d05b38-80a6-4653-825d-c414e4ab3c68
       5836994d-a677-53e7-1389-588ad1420cc5
       3f996403-b3c8-46b6-8172-015fb228f8c6
       d18b846e-15f5-4b07-9351-0ed470b4515c
       27445658-7f9c-465c-a1e9-894c5cb6cd59
       67d781bd-cbd2-4bd2-ad1f-6152fb891246
       19c13211-dec8-42d5-885a-c4cfa82ea1ed
       b7a19fcd-15ba-41ba-a3d7-dc352d5f79ba
       6af9e939-1d95-430a-afa3-7526fadee37d
       db909c62-75e6-5440-fa0d-c303473cb35f
       e4ad554c-63b2-441b-9f86-fe66d8084963
       1d665082-c852-4ab0-a1b2-c26488454c41
       69023bdd-86d7-4aac-9160-744c22fc665e
       Microsoft-Windows-AsynchronousCausality
       8b86727c-e587-4b89-8fc5-d1f24d43f69c
       48dcc4b8-1a33-4625-b042-95ce02602863
       1f930301-f484-4e01-a8a7-264354c4b8e3
       64284690-218b-458a-afaa-89d24daf8cb9
       Microsoft-Windows-LDAP-Client
       35fbbc9c-77dc-5e1d-a7a4-f9a45deed26f
       d48679eb-8aa3-4138-be24-f1648c874e49
       13020f14-3a73-4db1-8be0-679e16ce17c2
       86bf288b-fe8c-4174-98aa-0ea625a0bea6
       2b1bbe78-bf8d-57c1-007a-e8628f64e8b3
       Microsoft-Windows-Direct3D12
       b1945e15-4933-460f-8103-aa611ddb663a
       5eefebdb-e90c-423a-8abf-0241e7c5b87d
       Microsoft-Windows-Services
       b6fd710b-f783-4b1c-ab9c-c68099dcc0c7
       72a4952f-db5c-4d90-8f9d-0ed3465b315e
       57a6ed1a-79f7-5011-b242-4784e5620cf7
       2f294903-5481-4aa0-b4ef-14784cc95ce6
       Microsoft-Windows-ReadyBoostDriver
       19aa5291-c1aa-4f3c-b0d5-1126f1faf3a5
       Microsoft-Windows-Kernel-EventTracing
       02585802-c33c-4f5d-bf6b-a63cbb29dea5
       Microsoft-Windows-Install-Agent
       3ea5a289-edbe-5392-518b-24979c559029
       3e2a6b5f-e713-4517-96a3-939720f60eb4
       0a647a8d-b0ba-572f-13f3-74ad1e2e40c9
       bc6a63f5-2da6-5394-8657-e7b5efad1315
       c9f9ecd3-6d24-46d8-b23f-37b53fa6447b
       6a1f212d-9fc8-4878-bcf4-4be623b84525
       16f53577-e41d-43d4-b47e-c17025bf4025
       ca1d0166-619f-4177-a6c5-6faae46b42ef
       Microsoft-Windows-Iphlpsvc
       319fdc69-a626-5289-be4d-1f508a8c9a3b
       f85b4793-1347-5620-7572-b79d5a28da82
       Microsoft-Windows-KnownFolders
       5b429d66-5d8a-42d6-a4f7-74da3304f704
       Microsoft-Windows-WebAuthN
       c9c074d2-ff9b-410f-8ac6-81c7b8e60d0f
       253f4cd1-9475-4642-88e0-6790d7a86cde
       8215e965-d26e-548e-af0e-940c1f06f250
       Microsoft-Windows-WER-PayloadHealth
       Microsoft-Windows-RPC
       0086eae4-652e-4dc7-b58f-11fa44f927b4
       1db23b62-601e-481b-905b-76771770ac3d
       1123dc81-0423-4f27-bf57-6619e6bf85cc
       5c803f5a-71cb-4c04-9d8c-b7803765bc59
       d1c95b67-b319-527b-e068-5058e5882f90
       68d75e07-eda4-5c96-2f34-b9a5f7e811d2
       6ade59e8-a7c0-53d6-c3e0-8fe89759ca13
       9891e0a7-f966-547f-eb21-d98616bf72ee
       c63eb0d1-57ca-5619-8901-0bd86edc8557
       Microsoft-Windows-Diagnostics-PerfTrack
       289e2456-ee16-4c81-aaf1-7414d66ca0be
       55d407f6-b994-49f1-95e7-9a3e4b628f46
       8e598056-8993-11d2-819e-0000f875a064
       77811378-e885-4ac2-a580-bc86e4f1bc93
       Kerberos
       8aa41f62-e9cd-4291-bae1-94daa9a3ac26
       ShellCore
       Microsoft-Windows-Win32k
       8944a53c-a561-4e53-a0c6-d565414745fc
       252d9ecc-1c9f-4917-8760-f872a83bf018
       90e869f0-d503-40d8-8c33-88aa43b1537c
       1fa33c5a-2dc0-48d4-bd4e-d5eb9b8e1fb2
       0e7e8596-d648-5c94-adbd-3d780faa58e8
       Connected Storage Service ETW
       b2e2553a-31b5-5629-b3b3-cb6540e30d2c
       c9ba2a95-d3ca-5e19-2bd6-776a0910cb9d
       bc1826c8-369c-5b0b-4cd1-3c6ae5bfe2e7
       ed795972-60e8-4815-8634-cfaa21a89de7
       Microsoft-Windows-Security-IdentityStore
       c3d66fc7-5736-46d5-b942-c404f502dde4
       Microsoft-Windows-Superfetch
       Microsoft-Windows-SMBWitnessClient
       63665931-a4ee-47b3-874d-5155a5cfb415
       107cf38f-b01b-4ffc-bf6b-d0ed96d8ecc6
       Microsoft-Windows-BrokerInfrastructure
       Microsoft-Windows-AppModel-Exec
       9956c4cc-7b21-4d55-b22d-3a0ea2bddeb9
       8ccca27d-f1d8-4dda-b5dd-339aee937731
       Microsoft-Windows-Privacy-Auditing-PermissiveLearningMode
       4dab1c21-6842-4376-b7aa-6629aa5e0d2c
       37dee19b-05fb-49eb-8796-85e599cb186b
       4ef79621-73ba-4bc1-8ad9-222f6facdb65
       6a1f2b00-6a90-4c38-95a5-5cab3b056778
       ed07ce1c-cee3-41e0-93e2-eeb312301848
       AudEngCritical
       e8109b99-3a2c-4961-aa83-d1a7a148ada8
       Microsoft-Windows-DriverFrameworks-UserMode
       9d2a53b2-1411-5c1c-d88c-f2bf057645bb
       45ac0c12-fa92-4407-bc96-577642890490
       05f95efe-7f75-49c7-a994-60a55cc09571
       Microsoft-Windows-AIT
       35d22b34-04d6-40a8-a0fe-64993c7efa6b
       030fa765-f1ae-448e-955b-44d76073e1dc
       b518d5bd-106c-4f6f-9b2f-1972f5968bdd
       dc749491-822a-4043-9789-2c68d3a477d9
       53e76add-9160-41dd-b67d-2f4534d3e5bd
       eae83d31-ea4a-440a-b72d-d4a2333be8c2
       19e464a4-7408-49bd-b960-53446ae47820
       Microsoft-Windows-TriggerEmulatorProvider
       e8f90fe5-8c92-4146-a764-305aaf12b066
       8f1ebc88-8917-5ee3-66d9-0570c60676be
       b3a0c2c8-83bb-4ddf-9f8d-4b22d3c38ad7
       7e9e8b9c-406c-5d73-e566-0f50ea3ade3e
       9474a749-a98d-4f52-9f45-5b20247e4f01
       181dd5de-a365-453e-a34f-78f927053f95
       7a653c44-a930-4288-a6c3-317aeda0cb36
       Microsoft-Windows-Iphlpsvc-Trace
       97945555-b04c-47c0-b399-e453d509a5f0
       d375f14e-9624-5a18-f53e-5bce2043a97f
       6cbac6da-5657-4f56-a94d-d6459be75412
       98ccaad9-6464-48d7-9a66-c13718226668
       3b3877a1-ae3b-54f1-0101-1e2424f6fcbb

PerfTrack Providers:

UTC Providers:
       2d4ebca6-ea64-453f-a292-ae2ea0ee513b:0x0000800000000000:0xff      : Microsoft-Windows-Direct3DShaderCache
       08b15ce7-c9ff-5e64-0d16-66589573c50f:0x0000800000000000:0xff      : 08b15ce7-c9ff-5e64-0d16-66589573c50f
       221d444c-d07e-4fde-b425-15b746cf535b:0x0000800000000000:0xff      : 221d444c-d07e-4fde-b425-15b746cf535b
       613e8728-f1cd-5604-c71c-32ab60d68b11:0x0000800000000000:0xff      : 613e8728-f1cd-5604-c71c-32ab60d68b11
       ec044b58-3d13-4880-936f-7b67dfb3e056:0x0000800000000000:0xff      : ec044b58-3d13-4880-936f-7b67dfb3e056
       32980f26-c8f5-5767-6b26-635b3fa83c61:0x0000800000000000:0xff      : 32980f26-c8f5-5767-6b26-635b3fa83c61
       dde441ee-57c1-4571-8bd5-1adc23b819a9:0x0000800000000000:0xff      : dde441ee-57c1-4571-8bd5-1adc23b819a9
       53cc8a8b-3182-5101-7405-8dfc7e5f313e:0x0000800000000000:0xff      : 53cc8a8b-3182-5101-7405-8dfc7e5f313e
       647b7b19-72a3-4385-b2eb-06400f8898f9:0x0000e00000000000:0xff      : 647b7b19-72a3-4385-b2eb-06400f8898f9
       f3c5e28e-63f6-49c7-a204-e48a1bc4b09d:0x0000800000000000:0xff      : Microsoft-Windows-FilterManager
       b673475f-a196-4588-bc2b-c84ab7909a74:0x0000e00000000000:0xff      : b673475f-a196-4588-bc2b-c84ab7909a74
       c4e507b1-7224-4737-bde0-ced9284e7073:0x0000800000000000:0xff      : c4e507b1-7224-4737-bde0-ced9284e7073
       4a16abff-346d-56dc-fa87-eb1e29fe670a:0x0000800000000000:0xff      : 4a16abff-346d-56dc-fa87-eb1e29fe670a
       9580d7dd-0379-4658-9870-d5be7d52d6de:0x0000000080000000:0xff      : Microsoft-Windows-WLAN-AutoConfig
       2ab7abe2-fd6b-49dd-931e-d3339832676a:0x0000800000000000:0xff      : 2ab7abe2-fd6b-49dd-931e-d3339832676a
       b1642597-285e-560a-7f60-7e02f5da22c0:0x0000800000000000:0xff      : b1642597-285e-560a-7f60-7e02f5da22c0
       d72a5df2-1372-45e2-a080-c81221d484d0:0x0000e00000000000:0xff      : d72a5df2-1372-45e2-a080-c81221d484d0
       fb24d716-4503-46ec-bca5-f30168a9e106:0x0000e00000000000:0xff      : fb24d716-4503-46ec-bca5-f30168a9e106
       7a881c79-ad79-5187-3c97-24e57db0b998:0x0000800000000000:0xff      : 7a881c79-ad79-5187-3c97-24e57db0b998
       59dec92c-75a7-5da5-0521-13de8c4bef5e:0x0000800000000000:0xff      : 59dec92c-75a7-5da5-0521-13de8c4bef5e
       7a688f0e-f39b-4a7a-bbbb-066e2c1fcb04:0x0000800000000000:0xff      : 7a688f0e-f39b-4a7a-bbbb-066e2c1fcb04
       fb24d716-4503-46ec-bca5-f30168a9e105:0x0000e00000000000:0xff      : fb24d716-4503-46ec-bca5-f30168a9e105
       339f227c-579c-4259-860c-f810655e6466:0x0000800000000000:0xff      : 339f227c-579c-4259-860c-f810655e6466
       3720dda7-caea-4af3-a138-375aafc3f1d6:0x0000800000000000:0xff      : 3720dda7-caea-4af3-a138-375aafc3f1d6
       7005b728-04a6-4fa4-b213-8faab88f877b:0x0000800000000000:0xff      : 7005b728-04a6-4fa4-b213-8faab88f877b
       6d925246-8771-5ba9-515d-62b322d5f992:0x0000800000000000:0xff      : 6d925246-8771-5ba9-515d-62b322d5f992
       3ba36315-b05d-405e-8d05-2f994543215f:0x0000800000000000:0xff      : 3ba36315-b05d-405e-8d05-2f994543215f
       27a8fdf4-9b77-575b-be3b-e7163ef159bb:0x0000800000000000:0xff      : 27a8fdf4-9b77-575b-be3b-e7163ef159bb
       dc10c74c-f6d9-5656-d77d-ca9047620cb7:0x0000800000000000:0xff      : dc10c74c-f6d9-5656-d77d-ca9047620cb7
       4d37f810-4d70-5b33-fef5-1e1c5e33d678:0x0000800000000000:0xff      : 4d37f810-4d70-5b33-fef5-1e1c5e33d678
       e7ba355a-ec20-5993-dd3b-9215e4d8a23c:0x0000800000000000:0xff      : e7ba355a-ec20-5993-dd3b-9215e4d8a23c
       645a72a6-1657-53bb-d5e7-d6526033ef20:0x0000800000000000:0xff      : 645a72a6-1657-53bb-d5e7-d6526033ef20
       6d1f8b4f-1d23-4f48-89fb-fb76e1be10bd:0x0000800000000000:0xff      : 6d1f8b4f-1d23-4f48-89fb-fb76e1be10bd
       fe1ff234-1f09-50a8-d38d-c44fab43e818:0x0000800000000000:0xff      : fe1ff234-1f09-50a8-d38d-c44fab43e818
       93112de2-0aa3-4ed7-91e3-4264555220c1:0x0000800000000000:0xff      : 93112de2-0aa3-4ed7-91e3-4264555220c1
       810d9efb-88db-54ff-3703-9f5e54cc74fb:0x0000800000000000:0xff      : 810d9efb-88db-54ff-3703-9f5e54cc74fb
       4eeb8774-6c4c-492f-8f2f-5ee4721b7bf7:0x0000800000000000:0xff      : 4eeb8774-6c4c-492f-8f2f-5ee4721b7bf7
       cc4ce0cd-dcde-4ed2-8fc3-bd975921ce17:0x0000e00000000000:0xff      : cc4ce0cd-dcde-4ed2-8fc3-bd975921ce17
       a1ea5efc-402e-5285-3898-22a5acce1b76:0x0000800000000000:0xff      : a1ea5efc-402e-5285-3898-22a5acce1b76
       7cffb6e3-de5a-572a-9ece-998321af6e81:0x0000800000000000:0xff      : 7cffb6e3-de5a-572a-9ece-998321af6e81
       ebadf775-48aa-4bf3-8f8e-ec68d113c98e:0x0000800000000000:0xff      : ebadf775-48aa-4bf3-8f8e-ec68d113c98e
       a198ad71-4f5e-4bc2-9a60-7cafb76f4e3c:0x0000800000000000:0xff      : a198ad71-4f5e-4bc2-9a60-7cafb76f4e3c
       09a69a38-2680-4bfa-ad01-792ad63a4ff2:0x0000800000000000:0xff      : 09a69a38-2680-4bfa-ad01-792ad63a4ff2
       cdead503-17f5-4a3e-b7ae-df8cc2902eb9:0x0000800000000000:0xff      : Microsoft-Windows-NDIS
       fb7fcbc6-7156-5a5b-eabd-0be47b14f453:0x0000800000000000:0xff      : fb7fcbc6-7156-5a5b-eabd-0be47b14f453
       88cd9180-4491-4640-b571-e3bee2527943:0x0000800000000000:0xff      : Microsoft-Windows-PushNotifications-Platform
       e6852bc9-a7b6-4127-ac15-8d5c50be9bd7:0x0000800000000000:0xff      : e6852bc9-a7b6-4127-ac15-8d5c50be9bd7
       78c794c6-eae4-48b8-9348-8935b2ee3b24:0x0000800000000000:0xff      : 78c794c6-eae4-48b8-9348-8935b2ee3b24
       7a55858e-4b38-456d-b418-093c86d92e87:0x0000e00000000000:0xff      : 7a55858e-4b38-456d-b418-093c86d92e87
       ee5c44b7-501a-5f89-a347-6629cb302a5f:0x0000800000000000:0xff      : ee5c44b7-501a-5f89-a347-6629cb302a5f
       ff32ada1-5a4b-583c-889e-a3c027b201f5:0x0000800000000000:0xff      : ff32ada1-5a4b-583c-889e-a3c027b201f5
       cc848ecf-0639-5866-6928-18fa9de5f209:0x0000800000000000:0xff      : cc848ecf-0639-5866-6928-18fa9de5f209
       0adaf93d-4c15-502d-449a-9445aae0d781:0x0000800000000000:0xff      : 0adaf93d-4c15-502d-449a-9445aae0d781
       07b7592c-a848-4520-89da-1ab26bc4629f:0x0000800000000000:0xff      : 07b7592c-a848-4520-89da-1ab26bc4629f
       cb729f91-4e9b-4698-a6c6-587faa6eaf4a:0x0000800000000000:0xff      : cb729f91-4e9b-4698-a6c6-587faa6eaf4a
       346d1079-24e3-5e7d-b93b-1806e4774512:0x0000800000000000:0xff      : 346d1079-24e3-5e7d-b93b-1806e4774512
       ab9ebce4-fe7f-4dab-ace8-b28af18ec32d:0x0000800000000000:0xff      : ab9ebce4-fe7f-4dab-ace8-b28af18ec32d
       3baab286-806e-5c81-05c3-f554aa36c622:0x0000800000000000:0xff      : 3baab286-806e-5c81-05c3-f554aa36c622
       e883160c-b7a0-426c-9498-0744ff71a478:0x0000800000000000:0xff      : e883160c-b7a0-426c-9498-0744ff71a478
       057597df-6fd8-438b-bf6d-190cbf0a914c:0x0000800000000000:0xff      : 057597df-6fd8-438b-bf6d-190cbf0a914c
       8d9c9464-f103-496a-aca0-f12a4f258f7c:0x0000800000000000:0xff      : 8d9c9464-f103-496a-aca0-f12a4f258f7c
       5fe36556-c4cd-509a-8c3e-2a547ea568ae:0x0000800000000000:0xff      : 5fe36556-c4cd-509a-8c3e-2a547ea568ae
       d236a4a0-253f-58c9-5616-2b576ce9331a:0x0000800000000000:0xff      : d236a4a0-253f-58c9-5616-2b576ce9331a
       deb96c0a-d2d9-5868-a5d5-50ee13513c8b:0x0000800000000000:0xff      : deb96c0a-d2d9-5868-a5d5-50ee13513c8b
       1aff6089-e863-4d36-bdfd-3581f07440be:0x0000800000000000:0xff      : 1aff6089-e863-4d36-bdfd-3581f07440be
       e941009c-7403-48ae-b5b3-df1fcaa62a60:0x0000800000000000:0xff      : e941009c-7403-48ae-b5b3-df1fcaa62a60
       edeee0b4-6123-4bb0-bb21-7df3c83ac490:0x0000800000000000:0xff      : edeee0b4-6123-4bb0-bb21-7df3c83ac490
       9ac9593a-8e9e-5c4c-6407-43c56769851b:0x0000800000000000:0xff      : 9ac9593a-8e9e-5c4c-6407-43c56769851b
       6c0ebbbb-c292-457d-9675-dfcc1c0d58b0:0x0000e00000000000:0xff      : 6c0ebbbb-c292-457d-9675-dfcc1c0d58b0
       3ff44415-ee99-4f03-bc9e-e4a1d1833418:0x0000800000000000:0xff      : 3ff44415-ee99-4f03-bc9e-e4a1d1833418
       10ff35f4-901f-493f-b272-67afb81008d4:0x0000800000000000:0xff      : 10ff35f4-901f-493f-b272-67afb81008d4
       eb161d01-21d9-4ab1-82e3-141e3fee37a5:0x0000e00000000000:0xff      : eb161d01-21d9-4ab1-82e3-141e3fee37a5
       3d8e0e0a-54db-46d1-94ba-7ff7209d6a31:0x0000800000000000:0xff      : 3d8e0e0a-54db-46d1-94ba-7ff7209d6a31
       bb8dd8e5-3650-5ca7-4fea-46f75f152414:0x0000800000000000:0xff      : bb8dd8e5-3650-5ca7-4fea-46f75f152414
       6eaa8566-66f9-5c32-c995-05cbb0b423ac:0x0000800000000000:0xff      : 6eaa8566-66f9-5c32-c995-05cbb0b423ac
       aa3a221d-9a6f-4cf9-904e-897100ce8915:0x0000800000000000:0xff      : aa3a221d-9a6f-4cf9-904e-897100ce8915
       50109fbd-6d85-5815-731e-c907eca1607b:0x0000800000000000:0xff      : 50109fbd-6d85-5815-731e-c907eca1607b
       8127f6d4-59f9-4abf-8952-3e3a02073d5f:0x0000800000000000:0xff      : Microsoft-Windows-AppXDeployment
       3b3d62ec-652a-4b24-8295-78b32507cc9c:0x0000800000000000:0xff      : 3b3d62ec-652a-4b24-8295-78b32507cc9c
       3c302a2a-f195-4fed-bd7b-c91ba3f33879:0x0000800000000000:0xff      : 3c302a2a-f195-4fed-bd7b-c91ba3f33879
       0001376b-930d-50cd-2b29-491ca938cd54:0x0000800000000000:0xff      : 0001376b-930d-50cd-2b29-491ca938cd54
       767166e4-869c-5cc7-4f54-b13d12274111:0x0000800000000000:0xff      : 767166e4-869c-5cc7-4f54-b13d12274111
       0616f7dd-722a-4df1-b87a-414fa870d8b7:0x0000800000000000:0xff      : 0616f7dd-722a-4df1-b87a-414fa870d8b7
       9e2e5009-1313-49de-ab00-d2eb56e0e217:0x0000800000000000:0xff      : 9e2e5009-1313-49de-ab00-d2eb56e0e217
       afbd9bfb-785c-515d-8ede-c31081bf8872:0x0000800000000000:0xff      : afbd9bfb-785c-515d-8ede-c31081bf8872
       bd59a9a8-cafb-4503-845e-d85fb72ae2e1:0x0000800000000000:0xff      : bd59a9a8-cafb-4503-845e-d85fb72ae2e1
       b6acef34-fab6-5909-6b6b-b1c2cc84057f:0x0000e00000000000:0xff      : b6acef34-fab6-5909-6b6b-b1c2cc84057f
       21063878-2959-42ea-a85a-0da1ab119c03:0x0000800000000000:0xff      : 21063878-2959-42ea-a85a-0da1ab119c03
       fa4269f1-d5ad-47b0-b4cd-7df3091b9422:0x0000800000000000:0xff      : fa4269f1-d5ad-47b0-b4cd-7df3091b9422
       86a13cf3-bbd2-5f61-8c90-36214e710948:0x0000800000000000:0xff      : 86a13cf3-bbd2-5f61-8c90-36214e710948
       5e85651d-3ff2-4733-b0a2-e83dfa96d757:0x0000800000000000:0xff      : 5e85651d-3ff2-4733-b0a2-e83dfa96d757
       43fa1797-adcc-42ce-b216-776e8c81dc74:0x0000800000000000:0xff      : 43fa1797-adcc-42ce-b216-776e8c81dc74
       0fffb788-b827-4730-ad87-f48da61795cd:0x0000800000000000:0xff      : 0fffb788-b827-4730-ad87-f48da61795cd
       e90cb4c0-c7b6-4f18-a53a-187934ad4b55:0x0000800000000000:0xff      : e90cb4c0-c7b6-4f18-a53a-187934ad4b55
       ab604427-d048-4139-8494-1246c81f09d5:0x0000800000000000:0xff      : ab604427-d048-4139-8494-1246c81f09d5
       06184c97-5201-480e-92af-3a3626c5b140:0x0000800000000000:0xff      : Microsoft-Windows-Services-Svchost
       02f42b1b-4b78-48ce-8cdf-d98f8b443b93:0x0000800000000000:0xff      : 02f42b1b-4b78-48ce-8cdf-d98f8b443b93
       7c109ac5-8971-4b39-aa88-ecf239827664:0x0000800000000000:0xff      : 7c109ac5-8971-4b39-aa88-ecf239827664
       c7971fef-9c5d-49e3-92ec-d203487ee016:0x0000e00000000000:0xff      : c7971fef-9c5d-49e3-92ec-d203487ee016
       9086d719-aed7-4ffb-9d82-9299bbc1183c:0x0000800000000000:0xff      : 9086d719-aed7-4ffb-9d82-9299bbc1183c
       e9eaf418-0c07-464c-ad14-a7f353349a00:0x0000800000000000:0xff      : e9eaf418-0c07-464c-ad14-a7f353349a00
       8f8942e2-66b4-5650-8cf1-de723ca48565:0x0000800000000000:0xff      : 8f8942e2-66b4-5650-8cf1-de723ca48565
       e68e254c-44d6-4433-b1e3-b61a0a831b10:0x0000800000000000:0xff      : e68e254c-44d6-4433-b1e3-b61a0a831b10
       d71e5030-761b-51ed-c569-a89d4c503c4f:0x0000800000000000:0xff      : d71e5030-761b-51ed-c569-a89d4c503c4f
       c8b53346-95c2-50cb-c63d-9f9d259a1c45:0x0000800000000000:0xff      : c8b53346-95c2-50cb-c63d-9f9d259a1c45
       31442aba-1fd2-5680-a7e1-87bfa73b43a8:0x0000800000000000:0xff      : 31442aba-1fd2-5680-a7e1-87bfa73b43a8
       ea6e1609-01b5-52b4-85ae-3169911ad302:0x0000800000000000:0xff      : ea6e1609-01b5-52b4-85ae-3169911ad302
       63bca7a1-77ec-4ea7-95d0-98d3f0c0ebf7:0x0000e00000000000:0xff      : 63bca7a1-77ec-4ea7-95d0-98d3f0c0ebf7
       973c694b-79a6-480e-89a5-c8c20745d461:0x0000800000000000:0xff      : 973c694b-79a6-480e-89a5-c8c20745d461
       4ee5bf9a-3e8f-540b-8bfb-12457a2854b6:0x0000800000000000:0xff      : 4ee5bf9a-3e8f-540b-8bfb-12457a2854b6
       f3a71a4b-6118-4257-8ccb-39a33ba059d4:0x0000800000000000:0xff      : f3a71a4b-6118-4257-8ccb-39a33ba059d4
       5c7051bd-bedc-52df-b54e-f6f2706f346a:0x0000800000000000:0xff      : 5c7051bd-bedc-52df-b54e-f6f2706f346a
       7c29709d-3c02-47fb-8a39-d8287522fadb:0x0000800000000000:0xff      : 7c29709d-3c02-47fb-8a39-d8287522fadb
       a99b2eb4-5620-44f5-9b02-f9d2eebf2e96:0x0000800000000000:0xff      : a99b2eb4-5620-44f5-9b02-f9d2eebf2e96
       dbf307fb-02e9-4935-b062-f63f05d58dc8:0x0000800000000000:0xff      : dbf307fb-02e9-4935-b062-f63f05d58dc8
       950d4eda-1729-47cc-8f1e-d9ed5aa17642:0x0000800000000000:0xff      : 950d4eda-1729-47cc-8f1e-d9ed5aa17642
       6b49c222-9715-4285-bb0b-76ab6a4e2b6c:0x0000800000000000:0xff      : 6b49c222-9715-4285-bb0b-76ab6a4e2b6c
       18608e62-a628-49d9-8c02-55972e097d24:0x0000800000000000:0xff      : 18608e62-a628-49d9-8c02-55972e097d24
       3be31812-5523-5239-5fc6-534f8e558f40:0x0000800000000000:0xff      : 3be31812-5523-5239-5fc6-534f8e558f40
       21e0ae07-56a7-55b5-12f9-011e6bc08ccb:0x0000800000000000:0xff      : 21e0ae07-56a7-55b5-12f9-011e6bc08ccb
       af9f58ec-0c04-4be9-9eb5-55ff6dbe72d7:0x0000800000000000:0xff      : af9f58ec-0c04-4be9-9eb5-55ff6dbe72d7
       9cee36a6-3e83-4ef3-b8d0-4b6c81e16014:0x0000800000000000:0xff      : 9cee36a6-3e83-4ef3-b8d0-4b6c81e16014
       8857cd15-8821-498e-9c38-de67f0e51e1a:0x0000800000000000:0xff      : 8857cd15-8821-498e-9c38-de67f0e51e1a
       b87cf16b-0bf8-4492-a510-d5f59626b033:0x0000800000000000:0xff      : b87cf16b-0bf8-4492-a510-d5f59626b033
       a0b6be33-b959-50c3-3c92-8451b6f965c3:0x0000000000000001:0x5       : a0b6be33-b959-50c3-3c92-8451b6f965c3
       a6bf0deb-3659-40ad-9f81-e25af62ce3c7:0x0000000000000010:0x4       : Microsoft-Windows-PDC
       9bfa0c89-0339-4bd1-b631-e8cd1d909c41:0x0000e00000000000:0xff      : 9bfa0c89-0339-4bd1-b631-e8cd1d909c41
       905a29f8-4571-4926-9be1-cbffce287814:0x0000800000000000:0xff      : 905a29f8-4571-4926-9be1-cbffce287814
       bc71577f-76e9-583a-ecd6-62d0250d900f:0x0000800000000000:0xff      : bc71577f-76e9-583a-ecd6-62d0250d900f
       267e4a12-6a1e-53c3-30b0-600ce7cc3e11:0x0000800000000000:0xff      : 267e4a12-6a1e-53c3-30b0-600ce7cc3e11
       331c3b3a-2005-44c2-ac5e-77220c37d6b4:0x0000000000000041:0x4       : 331c3b3a-2005-44c2-ac5e-77220c37d6b4
       3f471139-acb7-4a01-b7a7-ff5da4ba2d43:0x0000800000000000:0xff      : Microsoft-Windows-AppXDeployment-Server
       28dcc28b-3e31-527b-efd6-b4cc4d73d157:0x0000800000000000:0xff      : 28dcc28b-3e31-527b-efd6-b4cc4d73d157
       c8706191-05aa-529a-64f1-c13a4674c8af:0x0000800000000000:0xff      : c8706191-05aa-529a-64f1-c13a4674c8af
       5bc69579-c5e2-4bc8-9a9b-b2795c6b9cbb:0x0000800000000000:0xff      : 5bc69579-c5e2-4bc8-9a9b-b2795c6b9cbb
       94061ca0-fb42-5b87-f7f1-254b0a86f9fd:0x0000800000000000:0xff      : 94061ca0-fb42-5b87-f7f1-254b0a86f9fd
       e75a83ec-ef30-4e3c-a5fb-1e7626e48f43:0x0000800000000000:0xff      : e75a83ec-ef30-4e3c-a5fb-1e7626e48f43
       c2125bcd-a5b0-46bf-bb95-740599aa8f9b:0x0000800000000000:0xff      : c2125bcd-a5b0-46bf-bb95-740599aa8f9b
       7b52746e-241b-52c9-8f0b-4e5e25e54507:0x0000800000000000:0xff      : 7b52746e-241b-52c9-8f0b-4e5e25e54507
       5c3e3aa8-3ba4-43cd-a7de-3bf5f70f9ca4:0x0000800000000000:0xff      : 5c3e3aa8-3ba4-43cd-a7de-3bf5f70f9ca4
       7228ecc6-0f60-4c79-9391-93f56d9ad432:0x0000800000000000:0xff      : 7228ecc6-0f60-4c79-9391-93f56d9ad432
       8b9b46ca-778f-5cc2-4255-3a6b1e69ae24:0x0000800000000000:0xff      : 8b9b46ca-778f-5cc2-4255-3a6b1e69ae24
       6d7051a0-9c83-5e52-cf8f-0ecaf5d5f6fd:0x0000800000000000:0xff      : 6d7051a0-9c83-5e52-cf8f-0ecaf5d5f6fd
       84ce2437-370f-4b0e-b7f9-7ceb550e572e:0x0000800000000000:0xff      : 84ce2437-370f-4b0e-b7f9-7ceb550e572e
       880e5d98-55d3-50c7-f8b7-b1feafdb7fd2:0x0000000000000010:0x1       : 880e5d98-55d3-50c7-f8b7-b1feafdb7fd2
       28d62fb0-2131-41d6-84e8-e2325867964c:0x0000800000000000:0xff      : 28d62fb0-2131-41d6-84e8-e2325867964c
       28dcc28b-3e31-527b-efd6-b4cc4d73d158:0x0000800000000000:0xff      : 28dcc28b-3e31-527b-efd6-b4cc4d73d158
       c59673d8-b796-58df-fbf8-a70bad656dca:0x0000800000000000:0xff      : c59673d8-b796-58df-fbf8-a70bad656dca
       eadb8f1b-577d-4d09-8104-b61a3d9036e5:0x0000800000000000:0xff      : eadb8f1b-577d-4d09-8104-b61a3d9036e5
       82fe78cc-ff52-4e2f-a7bb-5c90636d14ba:0x0000800000000000:0xff      : 82fe78cc-ff52-4e2f-a7bb-5c90636d14ba
       a9da4dcc-e78e-5ce7-4078-411a9928f082:0x0000800000000000:0xff      : a9da4dcc-e78e-5ce7-4078-411a9928f082
       aba0b84d-4ead-4dc0-84df-08d439679dec:0x0000800000000000:0xff      : aba0b84d-4ead-4dc0-84df-08d439679dec
       a66a8706-ae1e-4a26-a15b-27d924c43063:0x0000800000000000:0xff      : a66a8706-ae1e-4a26-a15b-27d924c43063
       a07eb5c4-4c73-58ac-14b4-825b3ea8a5a4:0x0000800000000000:0xff      : a07eb5c4-4c73-58ac-14b4-825b3ea8a5a4
       2f50c5d0-e25e-4f89-ab4a-31c63b518d7a:0x0000800000000000:0xff      : 2f50c5d0-e25e-4f89-ab4a-31c63b518d7a
       81fd9aa4-34b7-5415-4e8c-fc7484d4da55:0x0000800000000000:0xff      : 81fd9aa4-34b7-5415-4e8c-fc7484d4da55
       2fdb1f25-8de1-4bc1-bac2-e445e5b38743:0x0000800000000000:0xff      : 2fdb1f25-8de1-4bc1-bac2-e445e5b38743
       0a9a90c8-9417-482d-b517-df1774c8f404:0x0000800000000000:0xff      : 0a9a90c8-9417-482d-b517-df1774c8f404
       abb10a7f-67b4-480c-8834-8b049c428715:0x0000800000000000:0xff      : abb10a7f-67b4-480c-8834-8b049c428715
       57a77336-f39e-4fe3-9bd7-ab58696e5000:0x0000800000000000:0xff      : 57a77336-f39e-4fe3-9bd7-ab58696e5000
       401b5439-6b0c-45cd-9c08-7080760bd043:0x0000800000000000:0xff      : 401b5439-6b0c-45cd-9c08-7080760bd043
       4c223afe-54fc-5875-d676-10c54a023e78:0x0000800000000000:0xff      : 4c223afe-54fc-5875-d676-10c54a023e78
       ab7e1fbf-4623-5160-7d97-83167cf2bd39:0x0000800000000000:0xff      : ab7e1fbf-4623-5160-7d97-83167cf2bd39
       96f4a050-7e31-453c-88be-9634f4e02139:0x0000000000000001:0x4       : 96f4a050-7e31-453c-88be-9634f4e02139
       1491f89f-c57d-4135-8e05-76f0f68124a8:0x0000800000000000:0xff      : 1491f89f-c57d-4135-8e05-76f0f68124a8
       d0f1a5c6-fc43-48ae-99bf-efb1c38be9d1:0x0000800000000000:0xff      : d0f1a5c6-fc43-48ae-99bf-efb1c38be9d1
       fda3d86b-1600-5f85-614f-cc4a2aa6f2d4:0x0000800000000000:0xff      : fda3d86b-1600-5f85-614f-cc4a2aa6f2d4
       e064d4a7-07cc-4517-a7bc-5d2b9397746a:0x0000800000000000:0xff      : e064d4a7-07cc-4517-a7bc-5d2b9397746a
       703fcc13-b66f-5868-ddd9-e2db7f381ffb:0x0000800000000000:0xff      : 703fcc13-b66f-5868-ddd9-e2db7f381ffb
       3fe506f8-3223-494f-b6ae-2f50b1c6f806:0x0000800000000000:0xff      : 3fe506f8-3223-494f-b6ae-2f50b1c6f806
       496b3c19-9dca-51a5-187c-5c746785fe4e:0x0000800000000000:0xff      : 496b3c19-9dca-51a5-187c-5c746785fe4e
       ffd1d811-6488-4d44-82af-c31d372609a9:0x0000800000000000:0xff      : ffd1d811-6488-4d44-82af-c31d372609a9
       1bf43430-9464-4b83-b7fb-e2638876aeef:0x0000800000000000:0xff      : 1bf43430-9464-4b83-b7fb-e2638876aeef
       6ecb0bf3-c4d3-52e5-81df-704c4a8686ac:0x0000800000000000:0xff      : 6ecb0bf3-c4d3-52e5-81df-704c4a8686ac
       10706d4f-ca0a-47aa-b093-5b5218a6308c:0x0000800000000000:0xff      : 10706d4f-ca0a-47aa-b093-5b5218a6308c
       061c37c3-1363-5c1b-b8ed-f3d8f74633ce:0x0000800000000000:0xff      : 061c37c3-1363-5c1b-b8ed-f3d8f74633ce
       9dd93434-0865-5629-c753-70c27ff40dc7:0x0000800000000000:0xff      : 9dd93434-0865-5629-c753-70c27ff40dc7
       1d4081b1-2c3d-4aa3-8a1b-0513698d1408:0x0000800000000000:0xff      : 1d4081b1-2c3d-4aa3-8a1b-0513698d1408
       3d1d28b1-73f5-5937-3446-0de4df173ff5:0x0000800000000000:0xff      : 3d1d28b1-73f5-5937-3446-0de4df173ff5
       22e3eeb5-4a58-ce86-7cd9-0caaa14d4f98:0x0000800000000000:0xff      : 22e3eeb5-4a58-ce86-7cd9-0caaa14d4f98
       a076f707-4472-5083-d14f-826d0ef75c78:0x0000800000000000:0xff      : a076f707-4472-5083-d14f-826d0ef75c78
       fe762fb1-341a-4dd4-b399-be1868b3d918:0x0000800000000000:0xff      : fe762fb1-341a-4dd4-b399-be1868b3d918
       568a9b18-e829-44c3-b977-63d4f8f88493:0x0000800000000000:0xff      : 568a9b18-e829-44c3-b977-63d4f8f88493
       329cc1e5-3d02-4c6f-b411-0299be591cd7:0x0000800000000000:0xff      : 329cc1e5-3d02-4c6f-b411-0299be591cd7
       7614521c-4d0b-4341-bfc9-873082c0f1d3:0x0000800000000000:0xff      : 7614521c-4d0b-4341-bfc9-873082c0f1d3
       883b9247-ab6e-5068-59bb-eeb519d551b6:0x0000800000000000:0xff      : 883b9247-ab6e-5068-59bb-eeb519d551b6
       cf5838d7-9fdc-5907-a62c-abd41de9d862:0x0000800000000000:0xff      : cf5838d7-9fdc-5907-a62c-abd41de9d862
       d75df9f1-5f3d-49d0-9d15-2a55bd1c012e:0x0000800000000000:0xff      : d75df9f1-5f3d-49d0-9d15-2a55bd1c012e
       5eb60b36-6206-5538-e60a-0a7af8a1e59d:0x0000800000000000:0xff      : 5eb60b36-6206-5538-e60a-0a7af8a1e59d
       7765ec18-099f-424b-85f0-c639eb677de2:0x0000800000000000:0xff      : 7765ec18-099f-424b-85f0-c639eb677de2
       1dd9b8c9-e078-4075-b9de-4e5125071a18:0x0000800000000000:0xff      : 1dd9b8c9-e078-4075-b9de-4e5125071a18
       05f02597-fe85-4e67-8542-69567ab8fd4f:0x0000800000000000:0xff      : Microsoft-Windows-LiveId
       b749553b-d950-5e03-6282-3145a61b1002:0x0000800000000000:0xff      : b749553b-d950-5e03-6282-3145a61b1002
       dac9773a-b374-42b7-9f03-00a5e02a393e:0x0000800000000000:0xff      : dac9773a-b374-42b7-9f03-00a5e02a393e
       736ec865-856c-4c63-bd9d-15eb85634c42:0x0000800000000000:0xff      : 736ec865-856c-4c63-bd9d-15eb85634c42
       15a7a4f8-0072-4eab-abab-f98a4d666aed:0x0000800000000000:0xff      : 15a7a4f8-0072-4eab-abab-f98a4d666aed
       3e23bf66-c4bb-5b52-16f3-f216271e4142:0x0000800000000000:0xff      : 3e23bf66-c4bb-5b52-16f3-f216271e4142
       60523747-6516-48b7-84b1-3264fa2cb359:0x0000800000000000:0xff      : 60523747-6516-48b7-84b1-3264fa2cb359
       59d94052-3c18-4af7-be4e-f08adfb4a9b4:0x0000800000000000:0xff      : 59d94052-3c18-4af7-be4e-f08adfb4a9b4
       6e31f252-a41c-41d7-a9e2-3a20162247ec:0x0000800000000000:0xff      : 6e31f252-a41c-41d7-a9e2-3a20162247ec
       3c74afb9-8d82-44e3-b52c-365dbf48382a:0x0000800000000000:0xff      : 3c74afb9-8d82-44e3-b52c-365dbf48382a
       9f4cc6dc-1bab-5772-0c71-a89954718d66:0x0000800000000000:0xff      : 9f4cc6dc-1bab-5772-0c71-a89954718d66
       786396cd-2ff3-53d3-d1ca-43e41d9fb73b:0x0000800000000000:0xff      : 786396cd-2ff3-53d3-d1ca-43e41d9fb73b
       74b959af-83b4-43fc-9682-6b64e4843cf3:0x0000800000000000:0xff      : 74b959af-83b4-43fc-9682-6b64e4843cf3
       f6280407-b355-4d7e-86aa-0c8fe5964086:0x0000800000000000:0xff      : f6280407-b355-4d7e-86aa-0c8fe5964086
       a51ee86b-8ea5-454c-9a7d-37b6655a535d:0x0000800000000000:0xff      : a51ee86b-8ea5-454c-9a7d-37b6655a535d
       8aef5633-dae7-43e9-bd1d-c620598e56d0:0x0000800000000000:0xff      : 8aef5633-dae7-43e9-bd1d-c620598e56d0
       f57021fb-b93d-59ba-4807-03397f6e89c3:0x0000800000000000:0xff      : f57021fb-b93d-59ba-4807-03397f6e89c3
       8a36782f-4949-4980-ba6e-acadf0fe679a:0x0000800000000000:0xff      : 8a36782f-4949-4980-ba6e-acadf0fe679a
       dcb453db-c652-48be-a0f8-a64459d5162e:0x0000800000000000:0xff      : D2DWin8
       f6a774e5-2fc7-5151-6220-e514f1f387b6:0x0000800000000000:0xff      : f6a774e5-2fc7-5151-6220-e514f1f387b6
       0b9b891e-ff74-49ac-a582-4c58bdf12d8b:0x0000800000000000:0xff      : 0b9b891e-ff74-49ac-a582-4c58bdf12d8b
       9ca335ed-c0a6-4b4d-b084-9c9b5143aff0:0x0000800000000000:0xff      : 9ca335ed-c0a6-4b4d-b084-9c9b5143aff0
       da08847d-387e-457d-a78f-e79a9488cb48:0x0000800000000000:0xff      : da08847d-387e-457d-a78f-e79a9488cb48
       a40b455c-253c-4311-ac6d-6e667edccefc:0x0000800000000000:0xff      : a40b455c-253c-4311-ac6d-6e667edccefc
       de441ffa-fafa-4495-977f-2e9d2509746d:0x0000800000000000:0xff      : de441ffa-fafa-4495-977f-2e9d2509746d
       7654d661-b51d-4bd4-89ed-017919b9f02d:0x0000800000000000:0xff      : 7654d661-b51d-4bd4-89ed-017919b9f02d
       2266b8d6-11dd-5bfe-d5f2-067e37b194b8:0x0000800000000000:0xff      : 2266b8d6-11dd-5bfe-d5f2-067e37b194b8
       f0372af2-cc46-56c0-2bb9-db2e31b2423d:0x0000800000000000:0xff      : f0372af2-cc46-56c0-2bb9-db2e31b2423d
       1701c7dc-045c-45c0-8cd6-4d42e3bbf387:0x0000800000000000:0xff      : 1701c7dc-045c-45c0-8cd6-4d42e3bbf387
       2e1eb30a-c39f-453f-b25f-74e14862f946:0x0000800000000000:0xff      : 2e1eb30a-c39f-453f-b25f-74e14862f946
       4fea5d20-9853-424d-8ce9-bd8ed5d584f8:0x0000800000000000:0xff      : 4fea5d20-9853-424d-8ce9-bd8ed5d584f8
       08f93b14-1608-4a72-9cfa-457eecedbba7:0x0000800000000000:0xff      : 08f93b14-1608-4a72-9cfa-457eecedbba7
       739d5b75-383e-5a24-9b67-fa343b8df1ba:0x0000800000000000:0xff      : 739d5b75-383e-5a24-9b67-fa343b8df1ba
       ca967c75-04bf-40b5-9a16-98b5f9332a92:0x0000800000000000:0xff      : ca967c75-04bf-40b5-9a16-98b5f9332a92
       02585802-c33c-4f5d-bf6b-a63cbb29dea5:0x0000800000000000:0xff      : 02585802-c33c-4f5d-bf6b-a63cbb29dea5
       3ea5a289-edbe-5392-518b-24979c559029:0x0000e00000000000:0xff      : 3ea5a289-edbe-5392-518b-24979c559029
       6ade59e8-a7c0-53d6-c3e0-8fe89759ca13:0x0000800000000000:0xff      : 6ade59e8-a7c0-53d6-c3e0-8fe89759ca13
       37dee19b-05fb-49eb-8796-85e599cb186b:0x0000e00000000000:0xff      : 37dee19b-05fb-49eb-8796-85e599cb186b
       13020f14-3a73-4db1-8be0-679e16ce17c2:0x0000800000000000:0xff      : 13020f14-3a73-4db1-8be0-679e16ce17c2
       48dcc4b8-1a33-4625-b042-95ce02602863:0x0000800000000000:0xff      : 48dcc4b8-1a33-4625-b042-95ce02602863
       c9f9ecd3-6d24-46d8-b23f-37b53fa6447b:0x0000800000000000:0xff      : c9f9ecd3-6d24-46d8-b23f-37b53fa6447b
       b1945e15-4933-460f-8103-aa611ddb663a:0x0000800000000000:0xff      : b1945e15-4933-460f-8103-aa611ddb663a
       8215e965-d26e-548e-af0e-940c1f06f250:0x0000800000000000:0xff      : 8215e965-d26e-548e-af0e-940c1f06f250
       5c803f5a-71cb-4c04-9d8c-b7803765bc59:0x0000800000000000:0xff      : 5c803f5a-71cb-4c04-9d8c-b7803765bc59
       2b1bbe78-bf8d-57c1-007a-e8628f64e8b3:0x0000800000000000:0xff      : 2b1bbe78-bf8d-57c1-007a-e8628f64e8b3
       1db23b62-601e-481b-905b-76771770ac3d:0x0000800000000000:0xff      : 1db23b62-601e-481b-905b-76771770ac3d
       7e9e8b9c-406c-5d73-e566-0f50ea3ade3e:0x0000800000000000:0xff      : 7e9e8b9c-406c-5d73-e566-0f50ea3ade3e
       8ccca27d-f1d8-4dda-b5dd-339aee937731:0x0000800000000000:0xff      : 8ccca27d-f1d8-4dda-b5dd-339aee937731
       030fa765-f1ae-448e-955b-44d76073e1dc:0x0000800000000000:0xff      : 030fa765-f1ae-448e-955b-44d76073e1dc
       eb65a492-86c0-406a-bace-9912d595bd69:0x0000800000000000:0xff      : Microsoft-Windows-AppModel-Exec
       ca1d0166-619f-4177-a6c5-6faae46b42ef:0x0000800000000000:0xff      : ca1d0166-619f-4177-a6c5-6faae46b42ef
       d375f14e-9624-5a18-f53e-5bce2043a97f:0x0000800000000000:0xff      : d375f14e-9624-5a18-f53e-5bce2043a97f
       3b3877a1-ae3b-54f1-0101-1e2424f6fcbb:0x0000800000000000:0xff      : 3b3877a1-ae3b-54f1-0101-1e2424f6fcbb
       2f294903-5481-4aa0-b4ef-14784cc95ce6:0x0000800000000000:0xff      : 2f294903-5481-4aa0-b4ef-14784cc95ce6
       3e2a6b5f-e713-4517-96a3-939720f60eb4:0x0000800000000000:0xff      : 3e2a6b5f-e713-4517-96a3-939720f60eb4
       77811378-e885-4ac2-a580-bc86e4f1bc93:0x0000800000000000:0xff      : 77811378-e885-4ac2-a580-bc86e4f1bc93
       f85b4793-1347-5620-7572-b79d5a28da82:0x0000800000000000:0xff      : f85b4793-1347-5620-7572-b79d5a28da82
       ed795972-60e8-4815-8634-cfaa21a89de7:0x0000800000000000:0xff      : ed795972-60e8-4815-8634-cfaa21a89de7
       30336ed4-e327-447c-9de0-51b652c86108:0x0000000004000000:0x4       : ShellCore
       8aa41f62-e9cd-4291-bae1-94daa9a3ac26:0x0000800000000000:0xff      : 8aa41f62-e9cd-4291-bae1-94daa9a3ac26
       4dab1c21-6842-4376-b7aa-6629aa5e0d2c:0x0000800000000000:0xff      : 4dab1c21-6842-4376-b7aa-6629aa5e0d2c
       57a6ed1a-79f7-5011-b242-4784e5620cf7:0x0000800000000000:0xff      : 57a6ed1a-79f7-5011-b242-4784e5620cf7
       289e2456-ee16-4c81-aaf1-7414d66ca0be:0x0000800000000000:0xff      : 289e2456-ee16-4c81-aaf1-7414d66ca0be
       8944a53c-a561-4e53-a0c6-d565414745fc:0x0000800000000000:0xff      : 8944a53c-a561-4e53-a0c6-d565414745fc
       1f930301-f484-4e01-a8a7-264354c4b8e3:0x0000800000000000:0xff      : 1f930301-f484-4e01-a8a7-264354c4b8e3
       9956c4cc-7b21-4d55-b22d-3a0ea2bddeb9:0x0000800000000000:0xff      : 9956c4cc-7b21-4d55-b22d-3a0ea2bddeb9
       05f95efe-7f75-49c7-a994-60a55cc09571:0x0000800000000000:0xff      : 05f95efe-7f75-49c7-a994-60a55cc09571
       35d22b34-04d6-40a8-a0fe-64993c7efa6b:0x0000800000000000:0xff      : 35d22b34-04d6-40a8-a0fe-64993c7efa6b
       b518d5bd-106c-4f6f-9b2f-1972f5968bdd:0x0000800000000000:0xff      : b518d5bd-106c-4f6f-9b2f-1972f5968bdd
       dc749491-822a-4043-9789-2c68d3a477d9:0x0000800000000000:0xff      : dc749491-822a-4043-9789-2c68d3a477d9
       35fbbc9c-77dc-5e1d-a7a4-f9a45deed26f:0x0000800000000000:0xff      : 35fbbc9c-77dc-5e1d-a7a4-f9a45deed26f
       5b429d66-5d8a-42d6-a4f7-74da3304f704:0x0000800000000000:0xff      : 5b429d66-5d8a-42d6-a4f7-74da3304f704
       55d407f6-b994-49f1-95e7-9a3e4b628f46:0x0000800000000000:0xff      : 55d407f6-b994-49f1-95e7-9a3e4b628f46
       c9ba2a95-d3ca-5e19-2bd6-776a0910cb9d:0x0000800000000000:0xff      : c9ba2a95-d3ca-5e19-2bd6-776a0910cb9d
       53e76add-9160-41dd-b67d-2f4534d3e5bd:0x0000800000000000:0xff      : 53e76add-9160-41dd-b67d-2f4534d3e5bd
       45ac0c12-fa92-4407-bc96-577642890490:0x0000800000000000:0xff      : 45ac0c12-fa92-4407-bc96-577642890490
       8f1ebc88-8917-5ee3-66d9-0570c60676be:0x0000800000000000:0xff      : 8f1ebc88-8917-5ee3-66d9-0570c60676be
       19aa5291-c1aa-4f3c-b0d5-1126f1faf3a5:0x0000800000000000:0xff      : 19aa5291-c1aa-4f3c-b0d5-1126f1faf3a5
       319fdc69-a626-5289-be4d-1f508a8c9a3b:0xffffffffffffffff:0x5       : 319fdc69-a626-5289-be4d-1f508a8c9a3b
       bc1826c8-369c-5b0b-4cd1-3c6ae5bfe2e7:0x0000800000000000:0xff      : bc1826c8-369c-5b0b-4cd1-3c6ae5bfe2e7
       72a4952f-db5c-4d90-8f9d-0ed3465b315e:0x0000800000000000:0xff      : 72a4952f-db5c-4d90-8f9d-0ed3465b315e
       d48679eb-8aa3-4138-be24-f1648c874e49:0x0000800000000000:0xff      : d48679eb-8aa3-4138-be24-f1648c874e49
       86bf288b-fe8c-4174-98aa-0ea625a0bea6:0x0000800000000000:0xff      : 86bf288b-fe8c-4174-98aa-0ea625a0bea6
       9891e0a7-f966-547f-eb21-d98616bf72ee:0x0000800000000000:0xff      : 9891e0a7-f966-547f-eb21-d98616bf72ee
       0a647a8d-b0ba-572f-13f3-74ad1e2e40c9:0x0000800000000000:0xff      : 0a647a8d-b0ba-572f-13f3-74ad1e2e40c9
       9d2a53b2-1411-5c1c-d88c-f2bf057645bb:0x0000800000000000:0xff      : 9d2a53b2-1411-5c1c-d88c-f2bf057645bb
       0e7e8596-d648-5c94-adbd-3d780faa58e8:0x0000800000000000:0xff      : 0e7e8596-d648-5c94-adbd-3d780faa58e8
       b6fd710b-f783-4b1c-ab9c-c68099dcc0c7:0x0000800000000000:0xff      : b6fd710b-f783-4b1c-ab9c-c68099dcc0c7
       dfa6e32a-095f-5f57-d025-0887d33507a1:0x0000800000000000:0xff      : dfa6e32a-095f-5f57-d025-0887d33507a1
       2aa2b8df-8a4e-52a7-8cc7-c72f28293393:0x0000800000000000:0xff      : 2aa2b8df-8a4e-52a7-8cc7-c72f28293393
       5100ef35-4747-4d3f-92a1-4ed6d661c3fb:0x0000800000000000:0xff      : 5100ef35-4747-4d3f-92a1-4ed6d661c3fb
       ce20d1cc-faee-4ef6-9bf2-2837cef71258:0x0000800000000000:0xff      : ce20d1cc-faee-4ef6-9bf2-2837cef71258
       da789108-1311-4dc9-89fb-eeab65e2cee1:0x0000800000000000:0xff      : da789108-1311-4dc9-89fb-eeab65e2cee1
       79f45527-ee95-50f1-0e6a-c48bcb22f29b:0x0000800000000000:0xff      : 79f45527-ee95-50f1-0e6a-c48bcb22f29b
       8a4fc74e-b158-4fc1-a266-f7670c6aa75d:0x0000800000000000:0xff      : 8a4fc74e-b158-4fc1-a266-f7670c6aa75d
       5836994d-a677-53e7-1389-588ad1420cc5:0x0000800000000000:0xff      : 5836994d-a677-53e7-1389-588ad1420cc5
       be928fd4-50ba-57ca-b6b8-925dab19c3bf:0x0000800000000000:0xff      : be928fd4-50ba-57ca-b6b8-925dab19c3bf
       0efa15ec-78b4-4e02-9b8c-aed6b64bc4ce:0x0000e00000000000:0xff      : 0efa15ec-78b4-4e02-9b8c-aed6b64bc4ce
       5b3a3ed4-78f2-4882-ab48-e34638737af2:0x0000800000000000:0xff      : 5b3a3ed4-78f2-4882-ab48-e34638737af2
       b781b9cc-9bcc-486c-a036-d7bf98040a6b:0x0000800000000000:0xff      : b781b9cc-9bcc-486c-a036-d7bf98040a6b
       27445658-7f9c-465c-a1e9-894c5cb6cd59:0x0000800000000000:0xff      : 27445658-7f9c-465c-a1e9-894c5cb6cd59
       19c13211-dec8-42d5-885a-c4cfa82ea1ed:0x0000800000000000:0xff      : 19c13211-dec8-42d5-885a-c4cfa82ea1ed
       f0558438-f56a-5987-47da-040ca75aef05:0x0000800000000000:0xff      : f0558438-f56a-5987-47da-040ca75aef05
       7e6b69b9-2aec-4fb3-9426-69a0f2b61a86:0x0000800000000000:0xff      : 7e6b69b9-2aec-4fb3-9426-69a0f2b61a86
       551ff9b3-0b7e-4408-b008-0068c8da2ff1:0x0000800000000000:0xff      : 551ff9b3-0b7e-4408-b008-0068c8da2ff1
       dbe9b383-7cf3-4331-91cc-a3cb16a3b538:0x0000000000080000:0x4       : Winlogon
       db909c62-75e6-5440-fa0d-c303473cb35f:0x0000800000000000:0xff      : db909c62-75e6-5440-fa0d-c303473cb35f
       f4190f32-f96e-479c-a45d-d485cffe42e6:0x0000800000000000:0xff      : f4190f32-f96e-479c-a45d-d485cffe42e6
       1070f044-721c-504b-c01c-671dadcbc77d:0x0000800000000000:0xff      : 1070f044-721c-504b-c01c-671dadcbc77d
       8bba4c4c-1fc2-4905-8cdb-fcd9f1a660cb:0x0000800000000000:0xff      : 8bba4c4c-1fc2-4905-8cdb-fcd9f1a660cb
       0d641fb9-a0e3-42e3-9e9d-501d33a6fa79:0x0000800000000000:0xff      : 0d641fb9-a0e3-42e3-9e9d-501d33a6fa79
       fa386406-8e25-47f7-a03f-413635a55dc0:0x0000800000000000:0xff      : fa386406-8e25-47f7-a03f-413635a55dc0
       3f996403-b3c8-46b6-8172-015fb228f8c6:0x0000800000000000:0xff      : 3f996403-b3c8-46b6-8172-015fb228f8c6
       67d781bd-cbd2-4bd2-ad1f-6152fb891246:0xffffffffffffffff:0x4       : 67d781bd-cbd2-4bd2-ad1f-6152fb891246
       ab67b0f3-ae94-452d-b595-307667142420:0x0000800000000000:0xff      : ab67b0f3-ae94-452d-b595-307667142420
       b4ff0aa1-a4a0-4e7e-b9d3-23840a28268b:0x0000800000000000:0xff      : b4ff0aa1-a4a0-4e7e-b9d3-23840a28268b
       2839ff94-8f12-4e1b-82e3-af7af77a450f:0x0000000000000002:0xff      : 2839ff94-8f12-4e1b-82e3-af7af77a450f
       03bbe5b8-c788-4d0b-b47e-5b5731398a89:0x0000800000000000:0xff      : 03bbe5b8-c788-4d0b-b47e-5b5731398a89
       3d2b6366-47a4-5e10-6974-e5f7de0d3f28:0x0000800000000000:0xff      : 3d2b6366-47a4-5e10-6974-e5f7de0d3f28
       4f28a611-e7f9-4fa6-8bf1-8698d06336e9:0x0000800000000000:0xff      : 4f28a611-e7f9-4fa6-8bf1-8698d06336e9
       b8ddcea7-b520-4909-bceb-e0170c9f0e99:0x0000800000000000:0xff      : b8ddcea7-b520-4909-bceb-e0170c9f0e99
       d1203402-8724-5781-c2ba-a2a2967925ae:0x0000800000000000:0xff      : d1203402-8724-5781-c2ba-a2a2967925ae
       a3064fc9-4d22-54c9-0003-1f90594554d3:0x0000e00000000000:0xff      : a3064fc9-4d22-54c9-0003-1f90594554d3
       218d658a-f29e-41b6-bc37-144bd03f018d:0x0000800000000000:0xff      : 218d658a-f29e-41b6-bc37-144bd03f018d
       a27b9863-9b2c-4f89-84fc-7d98bf921da1:0x0000800000000000:0xff      : a27b9863-9b2c-4f89-84fc-7d98bf921da1
       e2dc32e8-e569-5fb5-232d-151bd7a70c7f:0x0000800000000000:0xff      : e2dc32e8-e569-5fb5-232d-151bd7a70c7f
       4d9dfb91-4337-465a-a8b5-05a27d930d48:0x0000800000000000:0xff      : 4d9dfb91-4337-465a-a8b5-05a27d930d48
       7e32a1c4-d502-5b7c-39e8-2b7b0b5f0424:0x0000800000000000:0xff      : 7e32a1c4-d502-5b7c-39e8-2b7b0b5f0424
       c7e09e2a-c663-5399-af79-2fccd321d19a:0x0000800000000000:0xff      : c7e09e2a-c663-5399-af79-2fccd321d19a
       029769ee-ed48-4166-894e-357918a77e68:0x0000800000000000:0xff      : 029769ee-ed48-4166-894e-357918a77e68
       1870fbb0-2247-44d8-bf46-b02130a8a477:0x0000800000000000:0xff      : 1870fbb0-2247-44d8-bf46-b02130a8a477
       86cc27ea-6f87-47f7-8b43-3473527d4a87:0x0000800000000000:0xff      : 86cc27ea-6f87-47f7-8b43-3473527d4a87
       4180c4f7-e238-5519-338f-ec214f0b49aa:0x0000800000000000:0xff      : Microsoft.Windows.ResourceManager
       4e986783-1269-5610-f47c-4c882b4df7a3:0x0000800000000000:0xff      : 4e986783-1269-5610-f47c-4c882b4df7a3
       221a8b88-4fb1-4d57-8027-3b148b43c8b9:0x0000800000000000:0xff      : 221a8b88-4fb1-4d57-8027-3b148b43c8b9
       9af106fc-dc26-42e1-a0f1-0c538f78f553:0x0000800000000000:0xff      : 9af106fc-dc26-42e1-a0f1-0c538f78f553
       66ba1a86-43c6-41ac-955b-28b520db532a:0x0000800000000000:0xff      : 66ba1a86-43c6-41ac-955b-28b520db532a
       485ff7d9-11d9-4e52-8ca3-4c273a80ef36:0x0000800000000000:0xff      : 485ff7d9-11d9-4e52-8ca3-4c273a80ef36
       de5dcaee-6f88-585a-05ee-d8b05b912772:0x0000800000000000:0xff      : de5dcaee-6f88-585a-05ee-d8b05b912772
       0bb8e5ca-316f-4b0f-9100-debbc6671308:0x0000800000000000:0xff      : 0bb8e5ca-316f-4b0f-9100-debbc6671308
       ddd9464f-84f5-4536-9f80-03e9d3254e5b:0x0000800000000000:0xff      : ddd9464f-84f5-4536-9f80-03e9d3254e5b
       30ad9f59-ec19-54b2-4bdf-76dbfc7404a6:0x0000800000000000:0xff      : 30ad9f59-ec19-54b2-4bdf-76dbfc7404a6
       7acf487e-104b-533e-f68a-a7e9b0431edb:0x0000800000000000:0xff      : 7acf487e-104b-533e-f68a-a7e9b0431edb
       c8bde9ff-f31f-59dc-6c27-ca37c516ada5:0x0000e00000000000:0xff      : c8bde9ff-f31f-59dc-6c27-ca37c516ada5
       702bb771-f6f6-4b08-adaf-42abe09b4fd1:0x0000800000000000:0xff      : 702bb771-f6f6-4b08-adaf-42abe09b4fd1
       5526aed1-f6e5-5896-cbf0-27d9f59b6be7:0x0000800000000000:0xff      : 5526aed1-f6e5-5896-cbf0-27d9f59b6be7
       1f81aa20-5e73-5be9-1875-4b87c767808b:0x0000800000000000:0xff      : 1f81aa20-5e73-5be9-1875-4b87c767808b
       8c800f35-77ee-4bfa-9ccd-c8e388e27092:0x0000e00000000000:0xff      : 8c800f35-77ee-4bfa-9ccd-c8e388e27092
       3f30522e-d47a-407c-9067-2e928d00d54e:0x0000800000000000:0xff      : 3f30522e-d47a-407c-9067-2e928d00d54e
       93ba57c6-201d-5390-dacb-86f28825a7f3:0x0000800000000000:0xff      : 93ba57c6-201d-5390-dacb-86f28825a7f3
       3eb30880-cc91-5eb0-24a0-50a6a52315fc:0x0000800000000000:0xff      : 3eb30880-cc91-5eb0-24a0-50a6a52315fc
       67eb0417-9297-42ae-a1d9-98bfeb359059:0x0000800000000000:0xff      : 67eb0417-9297-42ae-a1d9-98bfeb359059
       2a3004d6-69be-5b33-c3e2-e810e119e55d:0x0000800000000000:0xff      : 2a3004d6-69be-5b33-c3e2-e810e119e55d
       46df03df-beab-5f0b-7eb2-e471c1bea993:0x0000800000000000:0xff      : 46df03df-beab-5f0b-7eb2-e471c1bea993
       ed0c10a5-5396-4a96-9ee3-6f4aa0d1120d:0x0000800000000000:0xff      : ed0c10a5-5396-4a96-9ee3-6f4aa0d1120d
       ab74fbe2-37ef-48c4-b9ba-91ae7804a0b7:0x0000800000000000:0xff      : ab74fbe2-37ef-48c4-b9ba-91ae7804a0b7
       55e357f8-ef0d-5ffd-a4dd-50e3d8f707cb:0x0000800000000000:0xff      : 55e357f8-ef0d-5ffd-a4dd-50e3d8f707cb
       553ca39b-c608-566d-18ae-7b9a03a39acd:0x0000800000000000:0xff      : 553ca39b-c608-566d-18ae-7b9a03a39acd
       53b7f054-68fd-5c77-b92d-e54340f38968:0x0000800000000000:0xff      : 53b7f054-68fd-5c77-b92d-e54340f38968
       6e7b1892-5288-5fe5-8f34-e3b0dc671fd2:0x0000800000000000:0xff      : 6e7b1892-5288-5fe5-8f34-e3b0dc671fd2
       83bda64c-a52c-4b37-8e61-086c22a4cd15:0x0000800000000000:0xff      : 83bda64c-a52c-4b37-8e61-086c22a4cd15
       fd66a680-c052-4375-8cc9-225f923cef88:0x0000800000000000:0xff      : fd66a680-c052-4375-8cc9-225f923cef88
       1d988eb8-0133-5903-ae68-4d44ea8abb85:0x0000800000000000:0xff      : 1d988eb8-0133-5903-ae68-4d44ea8abb85
       7d97faf2-489e-45b6-b57d-e605898950e6:0x0000800000000000:0xff      : 7d97faf2-489e-45b6-b57d-e605898950e6
       67b768eb-35a1-4f19-8243-bd920f31f7ca:0x0000e00000000000:0xff      : 67b768eb-35a1-4f19-8243-bd920f31f7ca
       8269d78e-14e7-50ba-64ce-dd649dfcd8c5:0x0000800000000000:0xff      : 8269d78e-14e7-50ba-64ce-dd649dfcd8c5
       cf7f94b3-08dc-5257-422f-497d7dc86ab3:0x0000800000000000:0xff      : cf7f94b3-08dc-5257-422f-497d7dc86ab3
       64788b34-e8e5-5664-af50-45afb294a1dc:0x0000800000000000:0xff      : 64788b34-e8e5-5664-af50-45afb294a1dc
       f168d2fa-5642-58bb-361e-127980c64a1b:0x0000800000000000:0xff      : f168d2fa-5642-58bb-361e-127980c64a1b
       70f18147-06e6-497b-bbc4-58d60b4760e2:0x0000800000000000:0xff      : 70f18147-06e6-497b-bbc4-58d60b4760e2
       746622e1-9381-4507-be68-2e6b55f81070:0x0000800000000000:0xff      : 746622e1-9381-4507-be68-2e6b55f81070
       d0c9c5ef-166e-5120-7d14-eb037693c807:0x0000800000000000:0xff      : d0c9c5ef-166e-5120-7d14-eb037693c807
       bff15e13-81bf-45ee-8b16-7cfead00da86:0x0000800000000000:0xff      : Microsoft-Windows-AppModel-State
       7067398c-bae7-4191-bf16-c436de658baf:0x0000800000000000:0xff      : 7067398c-bae7-4191-bf16-c436de658baf
       3b03237a-a0e8-5b77-31f0-74586f01ce6c:0x0000800000000000:0xff      : 3b03237a-a0e8-5b77-31f0-74586f01ce6c
       c6998471-62cd-424d-a9a3-fe4c1fa378a4:0x0000800000000000:0xff      : c6998471-62cd-424d-a9a3-fe4c1fa378a4
       077b8c4a-e425-578d-f1ac-6fdf1220ff68:0x0000800000000000:0xff      : 077b8c4a-e425-578d-f1ac-6fdf1220ff68
       3a82f218-fcc2-4183-afe9-a0febc4416ee:0x0000800000000000:0xff      : 3a82f218-fcc2-4183-afe9-a0febc4416ee
       487d6e37-1b9d-46d3-a8fd-54ce8bdf8a53:0x0000800000000000:0xff      : 487d6e37-1b9d-46d3-a8fd-54ce8bdf8a53
       30cfd418-1fbe-4bb7-a2fe-de330dfe3993:0x0000800000000000:0xff      : 30cfd418-1fbe-4bb7-a2fe-de330dfe3993
       24b4f621-1022-48ed-8b93-23fa02191d83:0x0000800000000000:0xff      : 24b4f621-1022-48ed-8b93-23fa02191d83
       364e2beb-6efc-47dc-b8b1-49aae1d83922:0x0000800000000000:0xff      : 364e2beb-6efc-47dc-b8b1-49aae1d83922
       9fc5be59-bd4e-4622-833d-24195d8983f9:0x0000800000000000:0xff      : 9fc5be59-bd4e-4622-833d-24195d8983f9
       487060c7-9c26-45a6-9fef-aa03f02a9a1d:0x0000800000000000:0xff      : 487060c7-9c26-45a6-9fef-aa03f02a9a1d
       57d04b7b-550a-49a2-abcc-a7fa15598a30:0x0000800000000000:0xff      : 57d04b7b-550a-49a2-abcc-a7fa15598a30
       ec330296-d0fc-47f4-92d0-8eef37131fbb:0x0000800000000000:0xff      : ec330296-d0fc-47f4-92d0-8eef37131fbb
       836d9d37-46c1-41be-a956-09b88f964468:0x0000800000000000:0xff      : 836d9d37-46c1-41be-a956-09b88f964468
       3440e16d-c661-5dca-d41d-b05c08b0efbb:0x0000800000000000:0xff      : 3440e16d-c661-5dca-d41d-b05c08b0efbb
       fb2a6d3f-0896-532e-77fc-2d9191d1c717:0x0000800000000000:0xff      : fb2a6d3f-0896-532e-77fc-2d9191d1c717
       df4cf2e3-435c-4010-9e05-0f54287cdc31:0x0000800000000000:0xff      : df4cf2e3-435c-4010-9e05-0f54287cdc31
       aff5d694-bd28-4ffc-ab81-1f8718868057:0x0000800000000000:0xff      : aff5d694-bd28-4ffc-ab81-1f8718868057
       9a2edb8f-5883-499f-aced-6e4b69d43ddf:0x0000800000000000:0xff      : 9a2edb8f-5883-499f-aced-6e4b69d43ddf
       f7e83426-2b81-58f9-c5d4-f2db6d0ad473:0x0000800000000000:0xff      : f7e83426-2b81-58f9-c5d4-f2db6d0ad473
       d29624ca-200f-44bb-9471-13b01ea15b9e:0x0000800000000000:0xff      : d29624ca-200f-44bb-9471-13b01ea15b9e
       2f07e2ee-15db-40f1-90ef-9d7ba282188a:0x0000800000000000:0xff      : Microsoft-Windows-TCPIP
       ed1640e7-9dc0-45b5-a1ef-88b70cf1742c:0x0000800000000000:0xff      : ed1640e7-9dc0-45b5-a1ef-88b70cf1742c
       514775e1-fa95-459f-b6d4-b86ad1c5b49e:0x0000800000000000:0xff      : 514775e1-fa95-459f-b6d4-b86ad1c5b49e
       0998dfb7-59d7-4e82-92ce-8a83e7c0bb3e:0x0000800000000000:0xff      : 0998dfb7-59d7-4e82-92ce-8a83e7c0bb3e
       98177d7f-7d3a-51ef-2d41-2414bb2c0bdb:0x0000800000000000:0xff      : 98177d7f-7d3a-51ef-2d41-2414bb2c0bdb
       6966fe51-e224-4baa-99bc-897b3ed3b823:0x0000800000000000:0xff      : 6966fe51-e224-4baa-99bc-897b3ed3b823
       0bca4784-8257-51a0-d9ec-24fe1fe4c90d:0x0000800000000000:0xff      : 0bca4784-8257-51a0-d9ec-24fe1fe4c90d
       072665fb-8953-5a85-931d-d06aeab3d109:0x0000800000000000:0xff      : 072665fb-8953-5a85-931d-d06aeab3d109
       22fb2cd6-0e7b-422b-a0c7-2fad1fd0e716:0x0000000000000800:0x4       : Microsoft-Windows-Kernel-Process
       13b197bd-7cee-4b4e-8dd0-59314ce374ce:0x0000800000000000:0xff      : 13b197bd-7cee-4b4e-8dd0-59314ce374ce
       964356af-d038-468a-b27f-798f338eb3cb:0x0000800000000000:0xff      : 964356af-d038-468a-b27f-798f338eb3cb
       d8f29c0d-526c-5148-2167-9be755ad812d:0x0000800000000000:0xff      : d8f29c0d-526c-5148-2167-9be755ad812d
       4b01be74-d810-5994-228e-ee8417be3468:0x0000800000000000:0xff      : 4b01be74-d810-5994-228e-ee8417be3468
       a0ab5aac-e0a4-4f10-83c6-31939c604fd9:0x0000800000000000:0xff      : a0ab5aac-e0a4-4f10-83c6-31939c604fd9
       315a8872-923e-4ea2-9889-33cd4754bf64:0x0000800000000000:0xff      : Microsoft-Windows-Immersive-Shell
       96c57851-af06-470f-8635-9c5e463e5f0c:0x0000800000000000:0xff      : 96c57851-af06-470f-8635-9c5e463e5f0c
       63b6c2d2-0440-44de-a674-aa51a251b123:0x0000800000000000:0xff      : 63b6c2d2-0440-44de-a674-aa51a251b123
       b89fa39d-0d71-41c6-ba55-effb40eb2098:0x0000800000000000:0xff      : b89fa39d-0d71-41c6-ba55-effb40eb2098
       ab0d8ef9-866d-4d39-b83f-453f3b8f6325:0x0000800000000000:0xff      : Microsoft-Windows-OneX
       3b11f303-2e4f-4856-9a63-1de8c1baebfb:0x0000800000000000:0xff      : 3b11f303-2e4f-4856-9a63-1de8c1baebfb
       acc49822-f0b2-49ff-bff2-1092384822b6:0x0000800000000000:0xff      : acc49822-f0b2-49ff-bff2-1092384822b6
       2729be56-b41a-54be-8c2a-8da6127a8e38:0x0000800000000000:0xff      : 2729be56-b41a-54be-8c2a-8da6127a8e38
       c99ee62f-d6e3-45eb-8f03-c61495a48c15:0x0000800000000000:0xff      : c99ee62f-d6e3-45eb-8f03-c61495a48c15
       153efe57-afa7-5d33-1f91-17d13727b6ad:0x0000800000000000:0xff      : 153efe57-afa7-5d33-1f91-17d13727b6ad
       c5f41ba4-d17a-48f1-ae6a-dd4ae119b4d7:0x0000800000000000:0xff      : c5f41ba4-d17a-48f1-ae6a-dd4ae119b4d7
       d64f50d2-fda8-5f3b-b949-89145bf739d1:0x0000800000000000:0xff      : d64f50d2-fda8-5f3b-b949-89145bf739d1
       6f72e560-ef48-5597-9970-e83a697071ac:0x0000800000000000:0xff      : 6f72e560-ef48-5597-9970-e83a697071ac
       f77a815e-6103-4bc2-b570-f5a37f849949:0x0000800000000000:0xff      : f77a815e-6103-4bc2-b570-f5a37f849949
       fa47059e-b524-4461-86c1-7fdaafa20f7d:0x0000800000000000:0xff      : fa47059e-b524-4461-86c1-7fdaafa20f7d
       ea289c62-8c36-4904-9726-15ecd282aed5:0x0000800000000000:0xff      : ea289c62-8c36-4904-9726-15ecd282aed5
       b92d1ff0-92ec-444d-b7ec-c016f971c000:0x0000800000000000:0xff      : b92d1ff0-92ec-444d-b7ec-c016f971c000
       a76c2fad-7ac8-44d3-8fb4-fe9cfe6ce98b:0x0000800000000000:0xff      : a76c2fad-7ac8-44d3-8fb4-fe9cfe6ce98b
       58086964-516f-53f5-d197-71bc0c5e34b7:0x0000800000000000:0xff      : 58086964-516f-53f5-d197-71bc0c5e34b7
       6e65c8fc-3cfe-412a-b793-d36d2185a831:0x0000800000000000:0xff      : 6e65c8fc-3cfe-412a-b793-d36d2185a831
       9bed1243-5176-45f7-baac-120097930530:0x0000800000000000:0xff      : 9bed1243-5176-45f7-baac-120097930530
       af5c9658-6b92-4f83-8b6a-1447549fb878:0x0000800000000000:0xff      : af5c9658-6b92-4f83-8b6a-1447549fb878
       393ff4cc-f02d-5d0a-4180-b79bf8da529d:0x0000800000000000:0xff      : 393ff4cc-f02d-5d0a-4180-b79bf8da529d
       99c9988d-2185-5021-a21d-7a863b8a1a10:0x0000800000000000:0xff      : 99c9988d-2185-5021-a21d-7a863b8a1a10
       fbdc4594-a4a9-5f04-af86-7bd18a7938b9:0x0000800000000000:0xff      : fbdc4594-a4a9-5f04-af86-7bd18a7938b9
       89592015-d996-4636-8f61-066b5d4dd739:0x0000800000000000:0xff      : Microsoft-Windows-StateRepository
       6b4e98da-b103-588e-d0db-c7a111582066:0x0000800000000000:0xff      : 6b4e98da-b103-588e-d0db-c7a111582066
       cbf776fd-5b21-5fbc-e4cd-f19fe9acc193:0x0000800000000000:0xff      : cbf776fd-5b21-5fbc-e4cd-f19fe9acc193
       ce8dee0b-d539-4000-b0f8-77bed049c590:0x0000800000000000:0xff      : Microsoft-Windows-UserModePowerService
       6c6d5103-b4ab-46b1-b4cf-7d330f4c81e6:0x0000800000000000:0xff      : 6c6d5103-b4ab-46b1-b4cf-7d330f4c81e6
       8488bcf1-412d-4a22-b161-d714f98cf46c:0x0000800000000000:0xff      : 8488bcf1-412d-4a22-b161-d714f98cf46c
       7c31b52d-98bd-42ee-a1ae-cde9e0a8448f:0x0000800000000000:0xff      : 7c31b52d-98bd-42ee-a1ae-cde9e0a8448f
       4d2092fb-50b4-53f3-e719-fdc87a62fdd0:0x0000800000000000:0xff      : 4d2092fb-50b4-53f3-e719-fdc87a62fdd0
       4e7add1a-6945-435a-82b6-612688ba9f57:0x0000800000000000:0xff      : 4e7add1a-6945-435a-82b6-612688ba9f57
       52134415-75c1-4df9-9118-8b2bd00cc6e2:0x0000800000000000:0xff      : 52134415-75c1-4df9-9118-8b2bd00cc6e2
       63bcb611-4446-564a-a4b3-7d65624589ef:0x0000800000000000:0xff      : 63bcb611-4446-564a-a4b3-7d65624589ef
       7b3b9d0a-ac64-4cbd-b658-e1ec8b4cb416:0x0000800000000000:0xff      : 7b3b9d0a-ac64-4cbd-b658-e1ec8b4cb416
       5a8a94f3-249f-49f8-86d1-e6527c80622b:0x0000800000000000:0xff      : 5a8a94f3-249f-49f8-86d1-e6527c80622b
       6d1b249d-131b-468a-899b-fb0ad9551772:0x0000800000000000:0xff      : 6d1b249d-131b-468a-899b-fb0ad9551772
       cc79cf77-70d9-4082-9b52-23f3a3e92fe4:0x0000800000000000:0xff      : cc79cf77-70d9-4082-9b52-23f3a3e92fe4
       41b5f6e6-f53c-4645-a991-135c2011c074:0x0000800000000000:0xff      : 41b5f6e6-f53c-4645-a991-135c2011c074
       aa7f59e5-9792-58e7-c92a-a7d12af3222b:0x0000800000000000:0xff      : aa7f59e5-9792-58e7-c92a-a7d12af3222b
       1a211ee8-52db-4af0-bb66-fb8c9f20b0e2:0x0000800000000000:0xff      : 1a211ee8-52db-4af0-bb66-fb8c9f20b0e2
       d76203c4-8c1b-4e53-afab-c22865594f3f:0x0000800000000000:0xff      : d76203c4-8c1b-4e53-afab-c22865594f3f
       56dc463b-97e8-4b59-e836-ab7c9bb96301:0x0000000200000000:0x5       :

Kernel Flags: 
       PROC_THREAD         : Process and Thread create/delete
       LOADER              : Kernel and user mode Image Load/Unload events
       PROFILE             : CPU Sample profile
       CSWITCH             : Context Switch
       COMPACT_CSWITCH     : Compact Context Switch
       DISPATCHER          : CPU Scheduler
       DPC                 : DPC Events
       IDEAL_PROC          : Ideal processor events
       INTERRUPT           : Interrupt events
       INTERRUPT_STEER     : Interrupt Steering events
       WDF_DPC             : WDF DPC events
       WDF_INTERRUPT       : WDF Interrupt events
       SYSCALL             : System calls
       PRIORITY            : Priority change events
       SPINLOCK            : Spinlock Collisions
       SYNCOBJECTS         : Synchronization Objects
       KQUEUE              : Kernel Queue Enqueue/Dequeue
       ALPC                : Advanced Local Procedure Call
       PERF_COUNTER        : Process Perf Counters
       DISK_IO             : Disk I/O
       DISK_IO_INIT        : Disk I/O Initiation
       FILE_IO             : File system operation end times and results
       FILE_IO_INIT        : File system operation (create/open/close/read/write)
       HARD_FAULTS         : Hard Page Faults
       FILENAME            : FileName (e.g., FileName create/delete/rundown)
       SPLIT_IO            : Split I/O
       REGISTRY            : Registry tracing
       REGISTRY_NOTIF      : Registry change notification
       REG_HIVE            : Registry hive tracing
       DRIVERS             : Driver events
       POWER               : Power management events
       CC                  : Cache manager events
       NETWORKTRACE        : Network events (e.g., tcp/udp send/receive)
       VIRT_ALLOC          : Virtual allocation reserve and release
       MEMINFO             : Memory List Info
       ALL_FAULTS          : All page faults including hard, Copy on write, demand zero faults, etc.
       MEMINFO_WS          : Working set Info
       VAMAP               : MapFile info
       FOOTPRINT           : Support footprint analysis (i.e., flush workingset on FlushMark)
       MEMORY              : Memory tracing
       NONTRADEABLE_MEMORY : Memory tracing (NONTRADEABLE)
       REFSET              : Support footprint analysis (i.e., flush workingset on FlushMark and trace start)
       HIBERRUNDOWN        : Rundown(s) during hibernate
       CONTMEMGEN          : Contiguous Memory Generation
       POOL                : Pool tracing
       SHOULDYIELD         : Tracing for the cooperative DPC mechanism
       VTL_CHANGE          : VTL1 Entry and Exit
       SPEC_CONTROL        : Tracing of speculation control events
       CLUSTER_OFF         : Turn off Hard page fault clustering
       WS                  : Support workingset analysis
       CPU_CONFIG          : NUMA topology, Processor Group and Processor Index to Number mapping. By default it is always enabled.
       SESSION             : Session rundown/create/delete events.
       ANTI_STARVATION     : Events tracking boosts for Ready threads for several seconds
       IDLE_STATES         : CPU Idle States
       TIMER               : Timer settings and its expiration
       CLOCKINT            : Clock Interrupt Events
       IPI                 : Inter-processor Interrupt Events
       OPTICAL_IO          : Optical I/O
       OPTICAL_IO_INIT     : Optical I/O Initiation
       FLT_IO_INIT         : Minifilter callback initiation
       FLT_IO              : Minifilter callback completion
       FLT_FASTIO          : Minifilter fastio callback completion
       FLT_IO_FAILURE      : Minifilter callback completion with failure
       PROCESS_FREEZE      : Process Freeze/Thaw events
       WAKE_COUNTER        : Process Wake Counter events
       WAKE_DROP           : Process Wake Charges dropped
       WAKE_EVENT          : Process Wake Events
       OB_HANDLE           : Object handle events
       OB_OBJECT           : Object events
       KE_CLOCK            : Clock Configuration events
       PMC_PROFILE         : PMC sampling events
       DPC_QUEUE           : DPC queue events
       CACHE_FLUSH         : Cache flush events
       DEBUG_EVENTS        : Debugger scheduling events
       HV_CALLOUTS         : NT Hypercalls into HyperV Events
       BYPASSIO_VETO       : Bypass IO suspend during tracing events

Kernel Groups:
       Base           : PROC_THREAD+LOADER+DISK_IO+HARD_FAULTS+PROFILE+MEMINFO+MEMINFO_WS
       Diag           : PROC_THREAD+LOADER+DISK_IO+HARD_FAULTS+DPC+INTERRUPT+CSWITCH+PERF_COUNTER+COMPACT_CSWITCH
       DiagEasy       : PROC_THREAD+LOADER+DISK_IO+HARD_FAULTS+DPC+INTERRUPT+CSWITCH+PERF_COUNTER
       Latency        : PROC_THREAD+LOADER+DISK_IO+HARD_FAULTS+DPC+INTERRUPT+CSWITCH+PROFILE
       FileIO         : PROC_THREAD+LOADER+DISK_IO+HARD_FAULTS+FILE_IO+FILE_IO_INIT
       IOTrace        : PROC_THREAD+LOADER+DISK_IO+HARD_FAULTS+CSWITCH
       ResumeTrace    : PROC_THREAD+LOADER+DISK_IO+HARD_FAULTS+PROFILE+POWER
       SysProf        : PROC_THREAD+LOADER+PROFILE
       MemoryAnalysis : PROC_THREAD+LOADER+DISK_IO+HARD_FAULTS+MEMORY+MEMINFO+ALL_FAULTS+VIRT_ALLOC+PROFILE+FOOTPRINT+VAMAP+SESSION
       WorkingSet     : PROC_THREAD+LOADER+HARD_FAULTS+VIRT_ALLOC+MEMINFO+VAMAP+SESSION+MEMINFO_WS+WS
       ResidentSet    : PROC_THREAD+LOADER+DISK_IO+HARD_FAULTS+MEMORY+MEMINFO+VAMAP+SESSION+VIRT_ALLOC
       ReferenceSet   : PROC_THREAD+LOADER+HARD_FAULTS+MEMORY+FOOTPRINT+VIRT_ALLOC+MEMINFO+VAMAP+SESSION+REFSET+MEMINFO_WS
       Network        : PROC_THREAD+LOADER+NETWORKTRACE
       TraceOn4       : PROC_THREAD+LOADER+DISK_IO+HARD_FAULTS+CSWITCH+MEMORY+REGISTRY+PROFILE
```


## Loggers

Known loggers as of OS build `10.0.22621.2864` (November 2022)

Generated via `xperf.exe -Loggers`

```text
Logger Name           : Applications
Logger Id             : 4
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 15
Minimum Buffers       : 15
Number of Buffers     : 15
Free Buffers          : 14
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : f7270296-a156-4155-8bd8-f53a0ac4af6d:0xffffffffffffffff:0x4+ed475bc1-9899-5aca-ba3c-892060fead4f:0xffffffffffffffff:0x5+12e9331e-b6d2-4fa6-9c3c-f4c1533b1693:0xffffffffffffffff:0x4+10adc87e-6cdd-5bcf-662f-7114c1113017:0xffffffffffffffff:0x5+ff32ada1-5a4b-583c-889e-a3c027b201f5:0x200880048:0x4+cc4ce0cd-dcde-4ed2-8fc3-bd975921ce17:0xffffffffffffffff:0x5+ed3f6ce5-9128-43cb-be18-411d3526d7f2:0xffffffffffffffff:0x4+c75c2ad1-f91c-469e-bac0-18e7b083e330:0xffffffffffffffff:0x4+74464835-1747-5319-3e05-d5c08b38c983:0xffffffffffffffff:0x4+a61241c7-959b-49c7-8d7d-383a580264ef:0xffffffffffffffff:0x4+e733ac63-88e0-450e-b58c-a0957a1b08e8:0xffffffffffffffff:0x5+07d29996-321e-404b-983a-212d5c571f40:0xffffffffffffffff:0x4+62d2ab05-ad55-4f5e-a537-f468b86b05f7:0xffffffffffffffff:0x4+930ba82d-224a-47eb-9d2c-7092b4f99897:0xffffffffffffffff:0x4+f1854a8b-3fd5-5f55-4255-9b3a53565951:0xffffffffffffffff:0x4+ec330296-d0fc-47f4-92d0-8eef37131fbb:0xffffffffffffffff:0x4+27b577e4-806e-5536-9996-c6a2015563d0:0xffffffffffffffff:0x5+b21e0d82-6fe3-57fa-8002-62a8b508ba41:0xffffffffffffffff:0x5+d80fd405-6d50-44e9-be8f-6b097e56db62:0xffffffffffffffff:0x4+8e73361c-cae2-4db0-b585-27c41ebc84b2:0xffffffffffffffff:0x4+0bca4784-8257-51a0-d9ec-24fe1fe4c90d:0xffffffffffffffff:0x4+9da404c3-cbe8-5bd4-4fb4-ebfe33986e71:0xffffffffffffffff:0x4+d0034f5e-3686-5a74-dc48-5a22dd4f3d5b:0xffffffffffffffff:0x5+8ba07c99-d49b-486a-af63-3cf0f677d80c:0xffffffffffffffff:0x4+2da32862-3bba-43ad-9ec8-e1999da3c376:0xffffffffffffffff:0x4+64566244-b596-4a35-aae5-7159a478b02f:0xffffffffffffffff:0x4+45cc5c7c-3409-419b-a789-46cc4e91d1b4:0xffffffffffffffff:0x4+1d258d7c-4c9c-511a-e390-ebfd5ec5251a:0xffffffffffffffff:0x4+39e1f56f-a1fb-5767-d7b7-8763e3ddb9c2:0xffffffffffffffff:0x5+310385de-0fde-448a-9198-a46cf14252c7:0xffffffffffffffff:0x4+98368b31-33e1-5b91-5dee-351eec67c9e4:0xffffffffffffffff:0x4+db519e07-124b-5112-eeeb-f595813754fd:0xffffffffffffffff:0x5+c148cf1d-b652-56c2-a964-2db0c5686ccf:0xffffffffffffffff:0x5+8d19519d-6f8e-5733-e16b-e1b15639777d:0xffffffffffffffff:0x5+63ff4fdd-4126-5b4a-763d-231c2852372c:0xffffffffffffffff:0x4+31d1351e-5c89-4254-b36a-171cc2ace7f4:0xffffffffffffffff:0x4+e8b5322e-be62-5f6d-0093-c096abf1d898:0xffffffffffffffff:0x4+1a01ab65-1f99-5d23-475f-02075cc655f4:0xffffffffffffffff:0x5+38e52276-1c65-434b-8425-92ef7febb194:0xffffffffffffffff:0x4+9f89bc9c-c762-4bd0-8b9e-077b5e4183c1:0xffffffffffffffff:0x4+fb351192-a754-46af-a2f8-775188d37b34:0xffffffffffffffff:0x4+a63641db-9f6d-5407-3211-c781a84e7cb1:0xffffffffffffffff:0x4+783823c4-ccda-523a-238c-0dba91c07ec7:0xffffffffffffffff:0x4+1d4081b1-2c3d-4aa3-8a1b-0513698d1408:0xffffffffffffffff:0x4+0bcf268a-9493-50d1-4139-6813694a4aa9:0xffffffffffffffff:0x4+9409a994-86b7-41c8-9c7f-e3b9cdfc5752:0xffffffffffffffff:0x4+de9eff74-82cc-4cc9-a57d-a035a859dbdf:0xffffffffffffffff:0x4+d3b1d17d-a2b5-40f2-9b21-40f0a5417bf6:0xffffffffffffffff:0x4+d18b846e-15f5-4b07-9351-0ed470b4515c:0xffffffffffffffff:0x4+64284690-218b-458a-afaa-89d24daf8cb9:0xffffffffffffffff:0x4+d1c95b67-b319-527b-e068-5058e5882f90:0xffffffffffffffff:0x4+68d75e07-eda4-5c96-2f34-b9a5f7e811d2:0xffffffffffffffff:0x5+b2e2553a-31b5-5629-b3b3-cb6540e30d2c:0xffffffffffffffff:0x4

Logger Name           : AppModel
Logger Id             : 5
Logger Thread Id      : 0000000000000000
Buffer Size           : 64
Maximum Buffers       : 8
Minimum Buffers       : 8
Number of Buffers     : 8
Free Buffers          : 7
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 5526aed1-f6e5-5896-cbf0-27d9f59b6be7:0xffffffffffffffff:0x5+cf7f94b3-08dc-5257-422f-497d7dc86ab3:0xffffffffffffffff:0x5+"Microsoft-Windows-Immersive-Shell":0xffffffffffffffff:0x4+"Microsoft-Windows-AppReadiness":0xffffffffffffffff:0x5+"Microsoft-WindowsPhone-CoreUIComponents":0xffffffdeffffffff:0x5+63b6c2d2-0440-44de-a674-aa51a251b123:0xffffffffffffffff:0x4+"Microsoft-Windows-ProcessStateManager":0xffffffffffffffff:0x4+caa8cfe8-7cec-451e-b49f-6e60af56061e:0xffffffffffffffff:0x5+969e8d6b-df02-56e3-a058-ec3bef103534:0xffffffffffffffff:0x5+369f0950-bf83-53a7-b3f0-771a8926329d:0xffffffffffffffff:0x4+3c42000f-cc27-48c3-a005-48f6e38b131f:0xffffffffffffffff:0x4+329cc1e5-3d02-4c6f-b411-0299be591cd7:0xffffffffffffffff:0x5+cf5838d7-9fdc-5907-a62c-abd41de9d862:0xffffffffffffffff:0x5+f6a774e5-2fc7-5151-6220-e514f1f387b6:0x8:0x4+029769ee-ed48-4166-894e-357918a77e68:0xffffffffffffffff:0x5+"Microsoft-Windows-AppModel-Exec":0xffffffffffffffff:0x5+9956c4cc-7b21-4d55-b22d-3a0ea2bddeb9:0xffffffffffffffff:0x5+98ccaad9-6464-48d7-9a66-c13718226668:0xffffffffffffffff:0x4+3b3877a1-ae3b-54f1-0101-1e2424f6fcbb:0xffffffffffffffff:0x4

Logger Name           : AppPlat
Logger Id             : 6
Logger Thread Id      : 0000000000000000
Buffer Size           : 64
Maximum Buffers       : 8
Minimum Buffers       : 8
Number of Buffers     : 8
Free Buffers          : 7
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : aa1b41d3-d193-4660-9b47-dd701ba55841:0xffffffffffffffff:0x3+"Microsoft-Windows-AppxPackagingOM":0xffffffffffffffff:0x4+67b768eb-35a1-4f19-8243-bd920f31f7ca:0xffffffffffffffff:0x5+ba44067a-3c4b-459c-a8f6-18f0d3cf0870:0xffffffffffffffff:0x3+7c31b52d-98bd-42ee-a1ae-cde9e0a8448f:0xffffffffffffffff:0x5+"Microsoft-Windows-AppXDeployment-Server":0xffffffffffffffff:0x4+9401b890-ed5c-493d-8efd-3f135d7dd797:0xffffffffffffffff:0x5+"Microsoft-Windows-AppXDeployment":0xffffffffffffffff:0x3+568a9b18-e829-44c3-b977-63d4f8f88493:0xffffffffffffffff:0x4+5e688780-0502-4cea-b277-c99f41619301:0xffffffffffffffff:0x5+5c803f5a-71cb-4c04-9d8c-b7803765bc59:0xffffffffffffffff:0x4+"Connected Storage Service ETW":0xffffffffffffffff:0x5

Logger Name           : AudioXbdiag
Logger Id             : 7
Logger Thread Id      : 0000000000000000
Buffer Size           : 1024
Maximum Buffers       : 3
Minimum Buffers       : 3
Number of Buffers     : 3
Free Buffers          : 2
Buffers Written       : 0
Events Lost           : 1
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown SystemLogger NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : PROC_THREAD
PoolTagFilter         : *

Logger Name           : BlackBox
Logger Id             : 8
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 8
Minimum Buffers       : 8
Number of Buffers     : 8
Free Buffers          : 7
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : "Microsoft-Windows-Kernel-General":0x10:0x4+"Microsoft-Windows-WLAN-AutoConfig":0x400000000414:0x4+"Microsoft-Windows-NDIS":0x4000:0x4+"Microsoft-Windows-NlaSvc":0x20:0x4+"Microsoft-Windows-TCPIP":0x2000:0x4+bc4ea265-f1e1-440d-abf6-14fae20f7343:0xffffffffffffffff:0x5+3e7714aa-f717-4c62-8d4d-b3383e4df090:0xffffff:0xff+af5c9658-6b92-4f83-8b6a-1447549fb878:0xffffdfffffffffff:0x5+cc79cf77-70d9-4082-9b52-23f3a3e92fe4:0xffffffffffffffff:0x5+"Microsoft-Windows-Wcmsvc":0x20:0x4+3e0d88de-ae5c-438a-bb1c-c2e627f8aecb:0xffffffffffffffff:0x5+bb86e31d-f955-40f3-9e68-ad0b49e73c27:0x18:0x5+"Microsoft-Windows-NetworkProfile":0x20:0x4+2b87e57e-7bd0-43a3-a278-02e62d59b2b1:0xffffffffffffffff:0x5+3ee18f84-0b52-4411-b705-c914cbd229ac:0xffffff:0xff+1377561d-9312-452c-ad13-c4a1c9c906e0:0xffffffffffffffff:0x5+7654d661-b51d-4bd4-89ed-017919b9f02d:0xffffffffffffffff:0x5+15a7a4f8-0072-4eab-abad-f98a4d666aed:0x200000000001:0x4+3cb40aaa-1145-4fb8-b27b-7e30f0454316:0x20:0x4+1701c7dc-045c-45c0-8cd6-4d42e3bbf387:0xffffffffffffffff:0xff+314de49f-ce63-4779-ba2b-d616f6963a88:0x20:0x4+90e869f0-d503-40d8-8c33-88aa43b1537c:0xffffffffffffffff:0x5+97945555-b04c-47c0-b399-e453d509a5f0:0xffffffffffffffff:0x5

Logger Name           : Diagtrack-Listener
Logger Id             : 9
Logger Thread Id      : 00000000000000AC
Buffer Size           : 64
Maximum Buffers       : 38
Minimum Buffers       : 16
Number of Buffers     : 16
Free Buffers          : 16
Buffers Written       : 207
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 300
Age Limit             : 0
Real Time Mode        : Enabled
Log File Mode         : UseMsecFlushTimer PersistOnHybridShutdown IndependentSession
Maximum File Size     : 32
Log Filename          :
Trace Flags           : "Microsoft-Windows-Direct3DShaderCache":0x800000000000:0xff+08b15ce7-c9ff-5e64-0d16-66589573c50f:0x800000000000:0xff+221d444c-d07e-4fde-b425-15b746cf535b:0x800000000000:0xff+c4e507b1-7224-4737-bde0-ced9284e7073:0x800000000000:0xff+ed5d03b4-5074-4b64-a91b-1627e9674d2b:0x800000000000:0xff+4d37f810-4d70-5b33-fef5-1e1c5e33d678:0x800000000000:0xff+3ba36315-b05d-405e-8d05-2f994543215f:0x800000000000:0xff+fb7fcbc6-7156-5a5b-eabd-0be47b14f453:0x800000000000:0xff+4a16abff-346d-56dc-fa87-eb1e29fe670a:0x800000000000:0xff+fb24d716-4503-46ec-bca5-f30168a9e105:0xe00000000000:0xff+"Microsoft-Windows-FilterManager":0x800000000000:0xff+7a881c79-ad79-5187-3c97-24e57db0b998:0x800000000000:0xff+d72a5df2-1372-45e2-a080-c81221d484d0:0xe00000000000:0xff+ebadf775-48aa-4bf3-8f8e-ec68d113c98e:0x800000000000:0xff+fb24d716-4503-46ec-bca5-f30168a9e106:0xe00000000000:0xff+"Microsoft-Windows-WLAN-AutoConfig":0x80000000:0xff+613e8728-f1cd-5604-c71c-32ab60d68b11:0x800000000000:0xff+b673475f-a196-4588-bc2b-c84ab7909a74:0xe00000000000:0xff+cc848ecf-0639-5866-6928-18fa9de5f209:0x800000000000:0xff+2ab7abe2-fd6b-49dd-931e-d3339832676a:0x800000000000:0xff+59dec92c-75a7-5da5-0521-13de8c4bef5e:0x800000000000:0xff+7a688f0e-f39b-4a7a-bbbb-066e2c1fcb04:0x800000000000:0xff+a198ad71-4f5e-4bc2-9a60-7cafb76f4e3c:0x800000000000:0xff+e6852bc9-a7b6-4127-ac15-8d5c50be9bd7:0x800000000000:0xff+339f227c-579c-4259-860c-f810655e6466:0x800000000000:0xff+78c794c6-eae4-48b8-9348-8935b2ee3b24:0x800000000000:0xff+53cc8a8b-3182-5101-7405-8dfc7e5f313e:0x800000000000:0xff+810d9efb-88db-54ff-3703-9f5e54cc74fb:0x800000000000:0xff+b1642597-285e-560a-7f60-7e02f5da22c0:0x800000000000:0xff+e7ba355a-ec20-5993-dd3b-9215e4d8a23c:0x800000000000:0xff+27a8fdf4-9b77-575b-be3b-e7163ef159bb:0x800000000000:0xff+3720dda7-caea-4af3-a138-375aafc3f1d6:0x800000000000:0xff+09a69a38-2680-4bfa-ad01-792ad63a4ff2:0x800000000000:0xff+"Microsoft-Windows-NDIS":0x800000000000:0xff+bc8b2c32-e484-5ee8-fe64-f7a94cbd4093:0x800000000000:0xff+7005b728-04a6-4fa4-b213-8faab88f877b:0x800000000000:0xff+645a72a6-1657-53bb-d5e7-d6526033ef20:0x800000000000:0xff+8d9c9464-f103-496a-aca0-f12a4f258f7c:0x800000000000:0xff+7a55858e-4b38-456d-b418-093c86d92e87:0xe00000000000:0xff+6d1f8b4f-1d23-4f48-89fb-fb76e1be10bd:0x800000000000:0xff+dc10c74c-f6d9-5656-d77d-ca9047620cb7:0x800000000000:0xff+fe1ff234-1f09-50a8-d38d-c44fab43e818:0x800000000000:0xff+ee5c44b7-501a-5f89-a347-6629cb302a5f:0x800000000000:0xff+93112de2-0aa3-4ed7-91e3-4264555220c1:0x800000000000:0xff+4eeb8774-6c4c-492f-8f2f-5ee4721b7bf7:0x800000000000:0xff+ff32ada1-5a4b-583c-889e-a3c027b201f5:0x800000000000:0xff+cc4ce0cd-dcde-4ed2-8fc3-bd975921ce17:0xe00000000000:0xff+a1ea5efc-402e-5285-3898-22a5acce1b76:0x800000000000:0xff+7cffb6e3-de5a-572a-9ece-998321af6e81:0x800000000000:0xff+0adaf93d-4c15-502d-449a-9445aae0d781:0x800000000000:0xff+07b7592c-a848-4520-89da-1ab26bc4629f:0x800000000000:0xff+ab9ebce4-fe7f-4dab-ace8-b28af18ec32d:0x800000000000:0xff+"Microsoft-Windows-PushNotifications-Platform":0x800000000000:0xff+cb729f91-4e9b-4698-a6c6-587faa6eaf4a:0x800000000000:0xff+346d1079-24e3-5e7d-b93b-1806e4774512:0x800000000000:0xff+3baab286-806e-5c81-05c3-f554aa36c622:0x800000000000:0xff+e883160c-b7a0-426c-9498-0744ff71a478:0x800000000000:0xff+057597df-6fd8-438b-bf6d-190cbf0a914c:0x800000000000:0xff+32980f26-c8f5-5767-6b26-635b3fa83c61:0x800000000000:0xff+ec044b58-3d13-4880-936f-7b67dfb3e056:0x800000000000:0xff+dde441ee-57c1-4571-8bd5-1adc23b819a9:0x800000000000:0xff+647b7b19-72a3-4385-b2eb-06400f8898f9:0xe00000000000:0xff+"Microsoft-Windows-TCPIP":0x800000000000:0xff+67b768eb-35a1-4f19-8243-bd920f31f7ca:0xe00000000000:0xff+553ca39b-c608-566d-18ae-7b9a03a39acd:0x800000000000:0xff+55e357f8-ef0d-5ffd-a4dd-50e3d8f707cb:0x800000000000:0xff+df4cf2e3-435c-4010-9e05-0f54287cdc31:0x800000000000:0xff+3f30522e-d47a-407c-9067-2e928d00d54e:0x800000000000:0xff+9fc5be59-bd4e-4622-833d-24195d8983f9:0x800000000000:0xff+9a2edb8f-5883-499f-aced-6e4b69d43ddf:0x800000000000:0xff+487d6e37-1b9d-46d3-a8fd-54ce8bdf8a53:0x800000000000:0xff+3a82f218-fcc2-4183-afe9-a0febc4416ee:0x800000000000:0xff+c8bde9ff-f31f-59dc-6c27-ca37c516ada5:0xe00000000000:0xff+30cfd418-1fbe-4bb7-a2fe-de330dfe3993:0x800000000000:0xff+93ba57c6-201d-5390-dacb-86f28825a7f3:0x800000000000:0xff+6e7b1892-5288-5fe5-8f34-e3b0dc671fd2:0x800000000000:0xff+67eb0417-9297-42ae-a1d9-98bfeb359059:0x800000000000:0xff+2a3004d6-69be-5b33-c3e2-e810e119e55d:0x800000000000:0xff+ed1640e7-9dc0-45b5-a1ef-88b70cf1742c:0x800000000000:0xff+"Microsoft-Windows-AppModel-State":0x800000000000:0xff+702bb771-f6f6-4b08-adaf-42abe09b4fd1:0x800000000000:0xff+24b4f621-1022-48ed-8b93-23fa02191d83:0x800000000000:0xff+d0c9c5ef-166e-5120-7d14-eb037693c807:0x800000000000:0xff+7067398c-bae7-4191-bf16-c436de658baf:0x800000000000:0xff+c6998471-62cd-424d-a9a3-fe4c1fa378a4:0x800000000000:0xff+5526aed1-f6e5-5896-cbf0-27d9f59b6be7:0x800000000000:0xff+746622e1-9381-4507-be68-2e6b55f81070:0x800000000000:0xff+46df03df-beab-5f0b-7eb2-e471c1bea993:0x800000000000:0xff+74093e1d-dbe3-4019-b97d-54edcb02cfed:0x800000000000:0xff+1f81aa20-5e73-5be9-1875-4b87c767808b:0x800000000000:0xff+3b03237a-a0e8-5b77-31f0-74586f01ce6c:0x800000000000:0xff+83bda64c-a52c-4b37-8e61-086c22a4cd15:0x800000000000:0xff+fd66a680-c052-4375-8cc9-225f923cef88:0x800000000000:0xff+077b8c4a-e425-578d-f1ac-6fdf1220ff68:0x800000000000:0xff+ab74fbe2-37ef-48c4-b9ba-91ae7804a0b7:0x800000000000:0xff+64788b34-e8e5-5664-af50-45afb294a1dc:0x800000000000:0xff+ed0c10a5-5396-4a96-9ee3-6f4aa0d1120d:0x800000000000:0xff+f168d2fa-5642-58bb-361e-127980c64a1b:0x800000000000:0xff+364e2beb-6efc-47dc-b8b1-49aae1d83922:0x800000000000:0xff+487060c7-9c26-45a6-9fef-aa03f02a9a1d:0x800000000000:0xff+fb2a6d3f-0896-532e-77fc-2d9191d1c717:0x800000000000:0xff+8c800f35-77ee-4bfa-9ccd-c8e388e27092:0xe00000000000:0xff+1d988eb8-0133-5903-ae68-4d44ea8abb85:0x800000000000:0xff+57d04b7b-550a-49a2-abcc-a7fa15598a30:0x800000000000:0xff+f7e83426-2b81-58f9-c5d4-f2db6d0ad473:0x800000000000:0xff+aff5d694-bd28-4ffc-ab81-1f8718868057:0x800000000000:0xff+d29624ca-200f-44bb-9471-13b01ea15b9e:0x800000000000:0xff+ec330296-d0fc-47f4-92d0-8eef37131fbb:0x800000000000:0xff+836d9d37-46c1-41be-a956-09b88f964468:0x800000000000:0xff+53b7f054-68fd-5c77-b92d-e54340f38968:0x800000000000:0xff+3440e16d-c661-5dca-d41d-b05c08b0efbb:0x800000000000:0xff+3eb30880-cc91-5eb0-24a0-50a6a52315fc:0x800000000000:0xff+7d97faf2-489e-45b6-b57d-e605898950e6:0x800000000000:0xff+8269d78e-14e7-50ba-64ce-dd649dfcd8c5:0x800000000000:0xff+cf7f94b3-08dc-5257-422f-497d7dc86ab3:0x800000000000:0xff+70f18147-06e6-497b-bbc4-58d60b4760e2:0x800000000000:0xff+63bcb611-4446-564a-a4b3-7d65624589ef:0x800000000000:0xff+99c9988d-2185-5021-a21d-7a863b8a1a10:0x800000000000:0xff+c5f41ba4-d17a-48f1-ae6a-dd4ae119b4d7:0x800000000000:0xff+"Microsoft-Windows-StateRepository":0x800000000000:0xff+cbf776fd-5b21-5fbc-e4cd-f19fe9acc193:0x800000000000:0xff+4b01be74-d810-5994-228e-ee8417be3468:0x800000000000:0xff+ea289c62-8c36-4904-9726-15ecd282aed5:0x800000000000:0xff+072665fb-8953-5a85-931d-d06aeab3d109:0x800000000000:0xff+7c31b52d-98bd-42ee-a1ae-cde9e0a8448f:0x800000000000:0xff+4d2092fb-50b4-53f3-e719-fdc87a62fdd0:0x800000000000:0xff+13b197bd-7cee-4b4e-8dd0-59314ce374ce:0x800000000000:0xff+6966fe51-e224-4baa-99bc-897b3ed3b823:0x800000000000:0xff+2729be56-b41a-54be-8c2a-8da6127a8e38:0x800000000000:0xff+"Microsoft-Windows-UserModePowerService":0x800000000000:0xff+"Microsoft-Windows-Kernel-Process":0x800:0x4+b92d1ff0-92ec-444d-b7ec-c016f971c000:0x800000000000:0xff+41b5f6e6-f53c-4645-a991-135c2011c074:0x800000000000:0xff+fa47059e-b524-4461-86c1-7fdaafa20f7d:0x800000000000:0xff+98177d7f-7d3a-51ef-2d41-2414bb2c0bdb:0x800000000000:0xff+6c6d5103-b4ab-46b1-b4cf-7d330f4c81e6:0x800000000000:0xff+7b3b9d0a-ac64-4cbd-b658-e1ec8b4cb416:0x800000000000:0xff+514775e1-fa95-459f-b6d4-b86ad1c5b49e:0x800000000000:0xff+"Microsoft-Windows-Immersive-Shell":0x800000000000:0xff+6e65c8fc-3cfe-412a-b793-d36d2185a831:0x800000000000:0xff+aa7f59e5-9792-58e7-c92a-a7d12af3222b:0x800000000000:0xff+8488bcf1-412d-4a22-b161-d714f98cf46c:0x800000000000:0xff+a76c2fad-7ac8-44d3-8fb4-fe9cfe6ce98b:0x800000000000:0xff+d76203c4-8c1b-4e53-afab-c22865594f3f:0x800000000000:0xff+52134415-75c1-4df9-9118-8b2bd00cc6e2:0x800000000000:0xff+0998dfb7-59d7-4e82-92ce-8a83e7c0bb3e:0x800000000000:0xff+4e7add1a-6945-435a-82b6-612688ba9f57:0x800000000000:0xff+d8f29c0d-526c-5148-2167-9be755ad812d:0x800000000000:0xff+af5c9658-6b92-4f83-8b6a-1447549fb878:0x800000000000:0xff+0bca4784-8257-51a0-d9ec-24fe1fe4c90d:0x800000000000:0xff+964356af-d038-468a-b27f-798f338eb3cb:0x800000000000:0xff+b89fa39d-0d71-41c6-ba55-effb40eb2098:0x800000000000:0xff+58086964-516f-53f5-d197-71bc0c5e34b7:0x800000000000:0xff+5a8a94f3-249f-49f8-86d1-e6527c80622b:0x800000000000:0xff+6d1b249d-131b-468a-899b-fb0ad9551772:0x800000000000:0xff+c99ee62f-d6e3-45eb-8f03-c61495a48c15:0x800000000000:0xff+cc79cf77-70d9-4082-9b52-23f3a3e92fe4:0x800000000000:0xff+63b6c2d2-0440-44de-a674-aa51a251b123:0x800000000000:0xff+a0ab5aac-e0a4-4f10-83c6-31939c604fd9:0x800000000000:0xff+1a211ee8-52db-4af0-bb66-fb8c9f20b0e2:0x800000000000:0xff+acc49822-f0b2-49ff-bff2-1092384822b6:0x800000000000:0xff+96c57851-af06-470f-8635-9c5e463e5f0c:0x800000000000:0xff+"Microsoft-Windows-OneX":0x800000000000:0xff+3b11f303-2e4f-4856-9a63-1de8c1baebfb:0x800000000000:0xff+153efe57-afa7-5d33-1f91-17d13727b6ad:0x800000000000:0xff+d64f50d2-fda8-5f3b-b949-89145bf739d1:0x800000000000:0xff+6f72e560-ef48-5597-9970-e83a697071ac:0x800000000000:0xff+9bed1243-5176-45f7-baac-120097930530:0x800000000000:0xff+393ff4cc-f02d-5d0a-4180-b79bf8da529d:0x800000000000:0xff+fbdc4594-a4a9-5f04-af86-7bd18a7938b9:0x800000000000:0xff+6b4e98da-b103-588e-d0db-c7a111582066:0x800000000000:0xff+8857cd15-8821-498e-9c38-de67f0e51e1a:0x800000000000:0xff+c59673d8-b796-58df-fbf8-a70bad656dca:0x800000000000:0xff+28dcc28b-3e31-527b-efd6-b4cc4d73d158:0x800000000000:0xff+28dcc28b-3e31-527b-efd6-b4cc4d73d157:0x800000000000:0xff+7228ecc6-0f60-4c79-9391-93f56d9ad432:0x800000000000:0xff+6d7051a0-9c83-5e52-cf8f-0ecaf5d5f6fd:0x800000000000:0xff+81fd9aa4-34b7-5415-4e8c-fc7484d4da55:0x800000000000:0xff+21e0ae07-56a7-55b5-12f9-011e6bc08ccb:0x800000000000:0xff+c8706191-05aa-529a-64f1-c13a4674c8af:0x800000000000:0xff+8b9b46ca-778f-5cc2-4255-3a6b1e69ae24:0x800000000000:0xff+9345df93-4fab-4047-bc9a-7056dd9893c2:0xe00000000000:0xff+eadb8f1b-577d-4d09-8104-b61a3d9036e5:0x800000000000:0xff+82fe78cc-ff52-4e2f-a7bb-5c90636d14ba:0x800000000000:0xff+84ce2437-370f-4b0e-b7f9-7ceb550e572e:0x800000000000:0xff+1491f89f-c57d-4135-8e05-76f0f68124a8:0x800000000000:0xff+57a77336-f39e-4fe3-9bd7-ab58696e5000:0x800000000000:0xff+2fdb1f25-8de1-4bc1-bac2-e445e5b38743:0x800000000000:0xff+af9f58ec-0c04-4be9-9eb5-55ff6dbe72d7:0x800000000000:0xff+9bfa0c89-0339-4bd1-b631-e8cd1d909c41:0xe00000000000:0xff+a9da4dcc-e78e-5ce7-4078-411a9928f082:0x800000000000:0xff+267e4a12-6a1e-53c3-30b0-600ce7cc3e11:0x800000000000:0xff+"Microsoft-Windows-PDC":0x10:0x4+5c3e3aa8-3ba4-43cd-a7de-3bf5f70f9ca4:0x800000000000:0xff+880e5d98-55d3-50c7-f8b7-b1feafdb7fd2:0x10:0x1+905a29f8-4571-4926-9be1-cbffce287814:0x800000000000:0xff+9cee36a6-3e83-4ef3-b8d0-4b6c81e16014:0x800000000000:0xff+3fe506f8-3223-494f-b6ae-2f50b1c6f806:0x800000000000:0xff+ab7e1fbf-4623-5160-7d97-83167cf2bd39:0x800000000000:0xff+aba0b84d-4ead-4dc0-84df-08d439679dec:0x800000000000:0xff+a66a8706-ae1e-4a26-a15b-27d924c43063:0x800000000000:0xff+28d62fb0-2131-41d6-84e8-e2325867964c:0x800000000000:0xff+96f4a050-7e31-453c-88be-9634f4e02139:0x1:0x4+5bc69579-c5e2-4bc8-9a9b-b2795c6b9cbb:0x800000000000:0xff+a07eb5c4-4c73-58ac-14b4-825b3ea8a5a4:0x800000000000:0xff+2f50c5d0-e25e-4f89-ab4a-31c63b518d7a:0x800000000000:0xff+4c223afe-54fc-5875-d676-10c54a023e78:0x800000000000:0xff+0a9a90c8-9417-482d-b517-df1774c8f404:0x800000000000:0xff+703fcc13-b66f-5868-ddd9-e2db7f381ffb:0x800000000000:0xff+94061ca0-fb42-5b87-f7f1-254b0a86f9fd:0x800000000000:0xff+abb10a7f-67b4-480c-8834-8b049c428715:0x800000000000:0xff+401b5439-6b0c-45cd-9c08-7080760bd043:0x800000000000:0xff+e064d4a7-07cc-4517-a7bc-5d2b9397746a:0x800000000000:0xff+bc71577f-76e9-583a-ecd6-62d0250d900f:0x800000000000:0xff+d0f1a5c6-fc43-48ae-99bf-efb1c38be9d1:0x800000000000:0xff+e75a83ec-ef30-4e3c-a5fb-1e7626e48f43:0x800000000000:0xff+331c3b3a-2005-44c2-ac5e-77220c37d6b4:0x41:0x4+c2125bcd-a5b0-46bf-bb95-740599aa8f9b:0x800000000000:0xff+7b52746e-241b-52c9-8f0b-4e5e25e54507:0x800000000000:0xff+fda3d86b-1600-5f85-614f-cc4a2aa6f2d4:0x800000000000:0xff+3be31812-5523-5239-5fc6-534f8e558f40:0x800000000000:0xff+b87cf16b-0bf8-4492-a510-d5f59626b033:0x800000000000:0xff+a0b6be33-b959-50c3-3c92-8451b6f965c3:0x1:0x5+bd59a9a8-cafb-4503-845e-d85fb72ae2e1:0x800000000000:0xff+e941009c-7403-48ae-b5b3-df1fcaa62a60:0x800000000000:0xff+7c29709d-3c02-47fb-8a39-d8287522fadb:0x800000000000:0xff+b5361807-6783-4295-a34e-a714865cccee:0x800000000000:0xff+a99b2eb4-5620-44f5-9b02-f9d2eebf2e96:0x800000000000:0xff+fa4269f1-d5ad-47b0-b4cd-7df3091b9422:0x800000000000:0xff+3ff44415-ee99-4f03-bc9e-e4a1d1833418:0x800000000000:0xff+3b3d62ec-652a-4b24-8295-78b32507cc9c:0x800000000000:0xff+10ff35f4-901f-493f-b272-67afb81008d4:0x800000000000:0xff+e68e254c-44d6-4433-b1e3-b61a0a831b10:0x800000000000:0xff+3c302a2a-f195-4fed-bd7b-c91ba3f33879:0x800000000000:0xff+e9eaf418-0c07-464c-ad14-a7f353349a00:0x800000000000:0xff+d71e5030-761b-51ed-c569-a89d4c503c4f:0x800000000000:0xff+"Microsoft-Windows-Services-Svchost":0x800000000000:0xff+21063878-2959-42ea-a85a-0da1ab119c03:0x800000000000:0xff+aa3a221d-9a6f-4cf9-904e-897100ce8915:0x800000000000:0xff+4331556e-1bcb-5b8f-1fb6-0896d9ab2afb:0x800000000000:0xff+973c694b-79a6-480e-89a5-c8c20745d461:0x800000000000:0xff+ab604427-d048-4139-8494-1246c81f09d5:0x800000000000:0xff+6c0ebbbb-c292-457d-9675-dfcc1c0d58b0:0xe00000000000:0xff+86a13cf3-bbd2-5f61-8c90-36214e710948:0x800000000000:0xff+4ee5bf9a-3e8f-540b-8bfb-12457a2854b6:0x800000000000:0xff+02f42b1b-4b78-48ce-8cdf-d98f8b443b93:0x800000000000:0xff+0fffb788-b827-4730-ad87-f48da61795cd:0x800000000000:0xff+0001376b-930d-50cd-2b29-491ca938cd54:0x800000000000:0xff+f3a71a4b-6118-4257-8ccb-39a33ba059d4:0x800000000000:0xff+edeee0b4-6123-4bb0-bb21-7df3c83ac490:0x800000000000:0xff+5c7051bd-bedc-52df-b54e-f6f2706f346a:0x800000000000:0xff+d236a4a0-253f-58c9-5616-2b576ce9331a:0x800000000000:0xff+43fa1797-adcc-42ce-b216-776e8c81dc74:0x800000000000:0xff+3d8e0e0a-54db-46d1-94ba-7ff7209d6a31:0x800000000000:0xff+bb8dd8e5-3650-5ca7-4fea-46f75f152414:0x800000000000:0xff+deb96c0a-d2d9-5868-a5d5-50ee13513c8b:0x800000000000:0xff+5e85651d-3ff2-4733-b0a2-e83dfa96d757:0x800000000000:0xff+767166e4-869c-5cc7-4f54-b13d12274111:0x800000000000:0xff+950d4eda-1729-47cc-8f1e-d9ed5aa17642:0x800000000000:0xff+6b49c222-9715-4285-bb0b-76ab6a4e2b6c:0x800000000000:0xff+6eaa8566-66f9-5c32-c995-05cbb0b423ac:0x800000000000:0xff+8f8942e2-66b4-5650-8cf1-de723ca48565:0x800000000000:0xff+"Microsoft-Windows-AppXDeployment":0x800000000000:0xff+50109fbd-6d85-5815-731e-c907eca1607b:0x800000000000:0xff+dbf307fb-02e9-4935-b062-f63f05d58dc8:0x800000000000:0xff+e90cb4c0-c7b6-4f18-a53a-187934ad4b55:0x800000000000:0xff+7c109ac5-8971-4b39-aa88-ecf239827664:0x800000000000:0xff+0616f7dd-722a-4df1-b87a-414fa870d8b7:0x800000000000:0xff+1aff6089-e863-4d36-bdfd-3581f07440be:0x800000000000:0xff+c8b53346-95c2-50cb-c63d-9f9d259a1c45:0x800000000000:0xff+9e2e5009-1313-49de-ab00-d2eb56e0e217:0x800000000000:0xff+9ac9593a-8e9e-5c4c-6407-43c56769851b:0x800000000000:0xff+31442aba-1fd2-5680-a7e1-87bfa73b43a8:0x800000000000:0xff+afbd9bfb-785c-515d-8ede-c31081bf8872:0x800000000000:0xff+c7971fef-9c5d-49e3-92ec-d203487ee016:0xe00000000000:0xff+9086d719-aed7-4ffb-9d82-9299bbc1183c:0x800000000000:0xff+ea6e1609-01b5-52b4-85ae-3169911ad302:0x800000000000:0xff+63bca7a1-77ec-4ea7-95d0-98d3f0c0ebf7:0xe00000000000:0xff+18608e62-a628-49d9-8c02-55972e097d24:0x800000000000:0xff+5fe36556-c4cd-509a-8c3e-2a547ea568ae:0x800000000000:0xff+7765ec18-099f-424b-85f0-c639eb677de2:0x800000000000:0xff+ca967c75-04bf-40b5-9a16-98b5f9332a92:0x800000000000:0xff+883b9247-ab6e-5068-59bb-eeb519d551b6:0x800000000000:0xff+74b959af-83b4-43fc-9682-6b64e4843cf3:0x800000000000:0xff+9dd93434-0865-5629-c753-70c27ff40dc7:0x800000000000:0xff+2266b8d6-11dd-5bfe-d5f2-067e37b194b8:0x800000000000:0xff+4fea5d20-9853-424d-8ce9-bd8ed5d584f8:0x800000000000:0xff+a076f707-4472-5083-d14f-826d0ef75c78:0x800000000000:0xff+9ca335ed-c0a6-4b4d-b084-9c9b5143aff0:0x800000000000:0xff+7614521c-4d0b-4341-bfc9-873082c0f1d3:0x800000000000:0xff+59d94052-3c18-4af7-be4e-f08adfb4a9b4:0x800000000000:0xff+1bf43430-9464-4b83-b7fb-e2638876aeef:0x800000000000:0xff+739d5b75-383e-5a24-9b67-fa343b8df1ba:0x800000000000:0xff+6ecb0bf3-c4d3-52e5-81df-704c4a8686ac:0x800000000000:0xff+9f89bc9c-c762-4bd0-8b9e-077b5e4183c1:0x800000000000:0xff+8a36782f-4949-4980-ba6e-acadf0fe679a:0x800000000000:0xff+3e23bf66-c4bb-5b52-16f3-f216271e4142:0x800000000000:0xff+08f93b14-1608-4a72-9cfa-457eecedbba7:0x800000000000:0xff+15a7a4f8-0072-4eab-abab-f98a4d666aed:0x800000000000:0xff+496b3c19-9dca-51a5-187c-5c746785fe4e:0x800000000000:0xff+ffd1d811-6488-4d44-82af-c31d372609a9:0x800000000000:0xff+d75df9f1-5f3d-49d0-9d15-2a55bd1c012e:0x800000000000:0xff+7654d661-b51d-4bd4-89ed-017919b9f02d:0x800000000000:0xff+10706d4f-ca0a-47aa-b093-5b5218a6308c:0x800000000000:0xff+1dd9b8c9-e078-4075-b9de-4e5125071a18:0x800000000000:0xff+"Microsoft-Windows-LiveId":0x800000000000:0xff+329cc1e5-3d02-4c6f-b411-0299be591cd7:0x800000000000:0xff+5eb60b36-6206-5538-e60a-0a7af8a1e59d:0x800000000000:0xff+f0372af2-cc46-56c0-2bb9-db2e31b2423d:0x800000000000:0xff+ca176a4a-f27e-51f6-a0f6-8af13b973ef6:0x800000000000:0xff+9f4cc6dc-1bab-5772-0c71-a89954718d66:0x800000000000:0xff+60523747-6516-48b7-84b1-3264fa2cb359:0x800000000000:0xff+b749553b-d950-5e03-6282-3145a61b1002:0x800000000000:0xff+3d1d28b1-73f5-5937-3446-0de4df173ff5:0x800000000000:0xff+2e1eb30a-c39f-453f-b25f-74e14862f946:0x800000000000:0xff+061c37c3-1363-5c1b-b8ed-f3d8f74633ce:0x800000000000:0xff+1701c7dc-045c-45c0-8cd6-4d42e3bbf387:0x800000000000:0xff+1d4081b1-2c3d-4aa3-8a1b-0513698d1408:0x800000000000:0xff+8aef5633-dae7-43e9-bd1d-c620598e56d0:0x800000000000:0xff+22e3eeb5-4a58-ce86-7cd9-0caaa14d4f98:0x800000000000:0xff+"D2DWin8":0x800000000000:0xff+da08847d-387e-457d-a78f-e79a9488cb48:0x800000000000:0xff+568a9b18-e829-44c3-b977-63d4f8f88493:0x800000000000:0xff+cf5838d7-9fdc-5907-a62c-abd41de9d862:0x800000000000:0xff+f57021fb-b93d-59ba-4807-03397f6e89c3:0x800000000000:0xff+f6280407-b355-4d7e-86aa-0c8fe5964086:0x800000000000:0xff+dac9773a-b374-42b7-9f03-00a5e02a393e:0x800000000000:0xff+736ec865-856c-4c63-bd9d-15eb85634c42:0x800000000000:0xff+6e31f252-a41c-41d7-a9e2-3a20162247ec:0x800000000000:0xff+3c74afb9-8d82-44e3-b52c-365dbf48382a:0x800000000000:0xff+a51ee86b-8ea5-454c-9a7d-37b6655a535d:0x800000000000:0xff+f6a774e5-2fc7-5151-6220-e514f1f387b6:0x800000000000:0xff+786396cd-2ff3-53d3-d1ca-43e41d9fb73b:0x800000000000:0xff+0b9b891e-ff74-49ac-a582-4c58bdf12d8b:0x800000000000:0xff+a40b455c-253c-4311-ac6d-6e667edccefc:0x800000000000:0xff+de441ffa-fafa-4495-977f-2e9d2509746d:0x800000000000:0xff+221a8b88-4fb1-4d57-8027-3b148b43c8b9:0x800000000000:0xff+0bb8e5ca-316f-4b0f-9100-debbc6671308:0x800000000000:0xff+f0558438-f56a-5987-47da-040ca75aef05:0x800000000000:0xff+a3064fc9-4d22-54c9-0003-1f90594554d3:0xe00000000000:0xff+d1203402-8724-5781-c2ba-a2a2967925ae:0x800000000000:0xff+b4ff0aa1-a4a0-4e7e-b9d3-23840a28268b:0x800000000000:0xff+be928fd4-50ba-57ca-b6b8-925dab19c3bf:0x800000000000:0xff+7acf487e-104b-533e-f68a-a7e9b0431edb:0x800000000000:0xff+4f28a611-e7f9-4fa6-8bf1-8698d06336e9:0x800000000000:0xff+4d9dfb91-4337-465a-a8b5-05a27d930d48:0x800000000000:0xff+7e6b69b9-2aec-4fb3-9426-69a0f2b61a86:0x800000000000:0xff+2839ff94-8f12-4e1b-82e3-af7af77a450f:0x2:0xff+8bba4c4c-1fc2-4905-8cdb-fcd9f1a660cb:0x800000000000:0xff+"Microsoft.Windows.ResourceManager":0x800000000000:0xff+7e32a1c4-d502-5b7c-39e8-2b7b0b5f0424:0x800000000000:0xff+86cc27ea-6f87-47f7-8b43-3473527d4a87:0x800000000000:0xff+a27b9863-9b2c-4f89-84fc-7d98bf921da1:0x800000000000:0xff+4e986783-1269-5610-f47c-4c882b4df7a3:0x800000000000:0xff+e2dc32e8-e569-5fb5-232d-151bd7a70c7f:0x800000000000:0xff+da789108-1311-4dc9-89fb-eeab65e2cee1:0x800000000000:0xff+9af106fc-dc26-42e1-a0f1-0c538f78f553:0x800000000000:0xff+551ff9b3-0b7e-4408-b008-0068c8da2ff1:0x800000000000:0xff+0efa15ec-78b4-4e02-9b8c-aed6b64bc4ce:0xe00000000000:0xff+1070f044-721c-504b-c01c-671dadcbc77d:0x800000000000:0xff+66ba1a86-43c6-41ac-955b-28b520db532a:0x800000000000:0xff+03bbe5b8-c788-4d0b-b47e-5b5731398a89:0x800000000000:0xff+c7e09e2a-c663-5399-af79-2fccd321d19a:0x800000000000:0xff+5b3a3ed4-78f2-4882-ab48-e34638737af2:0x800000000000:0xff+ab67b0f3-ae94-452d-b595-307667142420:0x800000000000:0xff+3d2b6366-47a4-5e10-6974-e5f7de0d3f28:0x800000000000:0xff+2aa2b8df-8a4e-52a7-8cc7-c72f28293393:0x800000000000:0xff+e8f7748f-d38f-4f0d-8f5d-090e3918fcd6:0x800000000000:0xff+dfa6e32a-095f-5f57-d025-0887d33507a1:0x800000000000:0xff+5100ef35-4747-4d3f-92a1-4ed6d661c3fb:0x800000000000:0xff+fa386406-8e25-47f7-a03f-413635a55dc0:0x800000000000:0xff+ddd9464f-84f5-4536-9f80-03e9d3254e5b:0x800000000000:0xff+485ff7d9-11d9-4e52-8ca3-4c273a80ef36:0x800000000000:0xff+30ad9f59-ec19-54b2-4bdf-76dbfc7404a6:0x800000000000:0xff+"Winlogon":0x80000:0x4+f4190f32-f96e-479c-a45d-d485cffe42e6:0x800000000000:0xff+b8ddcea7-b520-4909-bceb-e0170c9f0e99:0x800000000000:0xff+ce20d1cc-faee-4ef6-9bf2-2837cef71258:0x800000000000:0xff+79f45527-ee95-50f1-0e6a-c48bcb22f29b:0x800000000000:0xff+0d641fb9-a0e3-42e3-9e9d-501d33a6fa79:0x800000000000:0xff+029769ee-ed48-4166-894e-357918a77e68:0x800000000000:0xff+218d658a-f29e-41b6-bc37-144bd03f018d:0x800000000000:0xff+1870fbb0-2247-44d8-bf46-b02130a8a477:0x800000000000:0xff+b781b9cc-9bcc-486c-a036-d7bf98040a6b:0x800000000000:0xff+8a4fc74e-b158-4fc1-a266-f7670c6aa75d:0x800000000000:0xff+de5dcaee-6f88-585a-05ee-d8b05b912772:0x800000000000:0xff+5836994d-a677-53e7-1389-588ad1420cc5:0x800000000000:0xff+3f996403-b3c8-46b6-8172-015fb228f8c6:0x800000000000:0xff+27445658-7f9c-465c-a1e9-894c5cb6cd59:0x800000000000:0xff+67d781bd-cbd2-4bd2-ad1f-6152fb891246:0xffffffffffffffff:0x4+19c13211-dec8-42d5-885a-c4cfa82ea1ed:0x800000000000:0xff+db909c62-75e6-5440-fa0d-c303473cb35f:0x800000000000:0xff+48dcc4b8-1a33-4625-b042-95ce02602863:0x800000000000:0xff+1f930301-f484-4e01-a8a7-264354c4b8e3:0x800000000000:0xff+13020f14-3a73-4db1-8be0-679e16ce17c2:0x800000000000:0xff+86bf288b-fe8c-4174-98aa-0ea625a0bea6:0x800000000000:0xff+2b1bbe78-bf8d-57c1-007a-e8628f64e8b3:0x800000000000:0xff+b1945e15-4933-460f-8103-aa611ddb663a:0x800000000000:0xff+b6fd710b-f783-4b1c-ab9c-c68099dcc0c7:0x800000000000:0xff+72a4952f-db5c-4d90-8f9d-0ed3465b315e:0x800000000000:0xff+57a6ed1a-79f7-5011-b242-4784e5620cf7:0x800000000000:0xff+2f294903-5481-4aa0-b4ef-14784cc95ce6:0x800000000000:0xff+19aa5291-c1aa-4f3c-b0d5-1126f1faf3a5:0x800000000000:0xff+02585802-c33c-4f5d-bf6b-a63cbb29dea5:0x800000000000:0xff+3ea5a289-edbe-5392-518b-24979c559029:0xe00000000000:0xff+3e2a6b5f-e713-4517-96a3-939720f60eb4:0x800000000000:0xff+0a647a8d-b0ba-572f-13f3-74ad1e2e40c9:0x800000000000:0xff+c9f9ecd3-6d24-46d8-b23f-37b53fa6447b:0x800000000000:0xff+ca1d0166-619f-4177-a6c5-6faae46b42ef:0x800000000000:0xff+319fdc69-a626-5289-be4d-1f508a8c9a3b:0xffffffffffffffff:0x5+f85b4793-1347-5620-7572-b79d5a28da82:0x800000000000:0xff+5b429d66-5d8a-42d6-a4f7-74da3304f704:0x800000000000:0xff+8215e965-d26e-548e-af0e-940c1f06f250:0x800000000000:0xff+1db23b62-601e-481b-905b-76771770ac3d:0x800000000000:0xff+5c803f5a-71cb-4c04-9d8c-b7803765bc59:0x800000000000:0xff+6ade59e8-a7c0-53d6-c3e0-8fe89759ca13:0x800000000000:0xff+9891e0a7-f966-547f-eb21-d98616bf72ee:0x800000000000:0xff+289e2456-ee16-4c81-aaf1-7414d66ca0be:0x800000000000:0xff+55d407f6-b994-49f1-95e7-9a3e4b628f46:0x800000000000:0xff+77811378-e885-4ac2-a580-bc86e4f1bc93:0x800000000000:0xff+8aa41f62-e9cd-4291-bae1-94daa9a3ac26:0x800000000000:0xff+"ShellCore":0x4000000:0x4+8944a53c-a561-4e53-a0c6-d565414745fc:0x800000000000:0xff+0e7e8596-d648-5c94-adbd-3d780faa58e8:0x800000000000:0xff+dd2e708d-f725-5c93-d0d1-91c985457612:0x800000000000:0xff+c9ba2a95-d3ca-5e19-2bd6-776a0910cb9d:0x800000000000:0xff+bc1826c8-369c-5b0b-4cd1-3c6ae5bfe2e7:0x800000000000:0xff+ed795972-60e8-4815-8634-cfaa21a89de7:0x800000000000:0xff+"Microsoft-Windows-AppModel-Exec":0x800000000000:0xff+9956c4cc-7b21-4d55-b22d-3a0ea2bddeb9:0x800000000000:0xff+8ccca27d-f1d8-4dda-b5dd-339aee937731:0x800000000000:0xff+4dab1c21-6842-4376-b7aa-6629aa5e0d2c:0x800000000000:0xff+37dee19b-05fb-49eb-8796-85e599cb186b:0xe00000000000:0xff+9d2a53b2-1411-5c1c-d88c-f2bf057645bb:0x800000000000:0xff+45ac0c12-fa92-4407-bc96-577642890490:0x800000000000:0xff+05f95efe-7f75-49c7-a994-60a55cc09571:0x800000000000:0xff+35d22b34-04d6-40a8-a0fe-64993c7efa6b:0x800000000000:0xff+030fa765-f1ae-448e-955b-44d76073e1dc:0x800000000000:0xff+b518d5bd-106c-4f6f-9b2f-1972f5968bdd:0x800000000000:0xff+dc749491-822a-4043-9789-2c68d3a477d9:0x800000000000:0xff+53e76add-9160-41dd-b67d-2f4534d3e5bd:0x800000000000:0xff+8f1ebc88-8917-5ee3-66d9-0570c60676be:0x800000000000:0xff+7e9e8b9c-406c-5d73-e566-0f50ea3ade3e:0x800000000000:0xff+d375f14e-9624-5a18-f53e-5bce2043a97f:0x800000000000:0xff+3b3877a1-ae3b-54f1-0101-1e2424f6fcbb:0x800000000000:0xff

Logger Name           : EraControl
Logger Id             : a
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 8
Minimum Buffers       : 8
Number of Buffers     : 8
Free Buffers          : 7
Buffers Written       : 0
Events Lost           : 74
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 68a8086a-e68d-4403-9a71-6f46fdde2162:0xffffffffffffffff:0x4+fb24d716-4503-46ec-bca5-f30168a9e106:0xffffffffffffffff:0x5+647b7b19-72a3-4385-b2eb-06400f8898f9:0xffffffffffffffff:0x4+2216b6de-b82c-56a0-5760-0ce1b6322c13:0xffffffffffffffff:0x5+4bc9f3e3-1c6c-44d8-a5f7-bd59f6d356a6:0xffffffffffffffff:0x4+3fe506f8-3223-494f-b6ae-2f50b1c6f806:0xffffffffffffffff:0x5+b52c4e12-a9fc-4add-a76e-423c2aa43744:0xffffffffffffffff:0x5+c5de1495-f0e2-563d-9e67-2944064d8103:0xffffffffffffffff:0x5+b4ff0aa1-a4a0-4e7e-b9d3-23840a28268b:0xffffffffffffffff:0x5+3f996403-b3c8-46b6-8172-015fb228f8c6:0xffffffffffffffff:0x5

Logger Name           : GameStreaming
Logger Id             : b
Logger Thread Id      : 0000000000000000
Buffer Size           : 128
Maximum Buffers       : 2
Minimum Buffers       : 2
Number of Buffers     : 2
Free Buffers          : 2
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 86750899-3dab-45e2-8f95-59dbefa0a7d6:0xffffffffffffffff:0x4+36c39bd1-5eb9-4785-a06e-c6d8de073cb0:0xffffffffffffffff:0x4+cb8b7862-eae7-4f30-9574-9453076ebaab:0xffffffffffffffff:0x4+afc8a033-e28a-415c-acff-030e4b113a35:0xffffffffffffffff:0x4+1f930301-f484-4e01-a8a7-264354c4b8e3:0xffffffffffffffff:0x5

Logger Name           : GlobalSpeech
Logger Id             : c
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 2
Minimum Buffers       : 2
Number of Buffers     : 2
Free Buffers          : 2
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 56c6cef7-0263-438c-af6a-f6c77d9c824a:0xff:0x5+f4d81b4a-af0b-46c4-baaf-5522ca1ebf35:0xff:0x5

Logger Name           : HvSocket
Logger Id             : d
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 4
Minimum Buffers       : 4
Number of Buffers     : 4
Free Buffers          : 3
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : b2ed3bdb-cd74-5b2c-f660-85079ca074b3:0xffffffffffffffff:0x5

Logger Name           : InputService
Logger Id             : e
Logger Thread Id      : 0000000000000000
Buffer Size           : 64
Maximum Buffers       : 8
Minimum Buffers       : 8
Number of Buffers     : 8
Free Buffers          : 7
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : ebadf775-48aa-4bf3-8f8e-ec68d113c98e:0xbffff:0x5+592a4df9-d924-4b85-ba54-94f96cfb548c:0xffffffffffffffff:0x5

Logger Name           : Networking
Logger Id             : f
Logger Thread Id      : 0000000000000000
Buffer Size           : 64
Maximum Buffers       : 48
Minimum Buffers       : 48
Number of Buffers     : 48
Free Buffers          : 47
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : "Microsoft-Windows-Kernel-General":0x10:0x4+"Microsoft-Windows-WLAN-AutoConfig":0x400000000414:0x4+"Microsoft-Windows-WinINet":0x100:0x4+"Microsoft-Windows-Networking-RealTimeCommunication":0x1:0x4+"Microsoft-Windows-NDIS":0x4000:0x4+"Microsoft-Windows-NlaSvc":0x20:0x4+"Microsoft-Windows-PushNotifications-Platform":0x405100:0x4+12d25187-6c0d-4783-ad3a-84caa135acfd:0x20:0x4+"Microsoft-Windows-TCPIP":0x2000:0x4+"Microsoft-Windows-Network-Connection-Broker":0x1:0x4+eb004a05-9b1a-11d4-9123-0050047759bc:0x100000:0xff+bc4ea265-f1e1-440d-abf6-14fae20f7343:0xffffffffffffffff:0x5+3e7714aa-f717-4c62-8d4d-b3383e4df090:0xffffff:0xff+514775e1-fa95-459f-b6d4-b86ad1c5b49e:0xffffffffffffffff:0xff+"Microsoft-Windows-Immersive-Shell":0x40:0x4+af5c9658-6b92-4f83-8b6a-1447549fb878:0xffffdfffffffffff:0x5+"Microsoft-Windows-OneX":0x100:0x4+1c95126e-7eea-49a9-a3fe-a378b03ddb4d:0x10000000:0x4+01578f96-c270-4602-ade0-578d9c29fc0c:0x100:0x4+"Microsoft-Windows-Wcmsvc":0x20:0x4+"Microsoft-Windows-NWiFi":0x2000:0x4+"Microsoft-Windows-NetworkProfile":0x20:0x4+fc70fab8-0cf6-40a1-abc2-cd9c879beb9e:0x10000000:0xff+df271536-4298-45e1-b0f2-e88f78619c5d:0x10:0x4+74b959af-83b4-43fc-9682-6b64e4843cf3:0xffffffffffffffff:0x5+"Microsoft-Windows-SystemEventsBroker":0x1:0x4+3ee18f84-0b52-4411-b705-c914cbd229ac:0xffffff:0xff+7654d661-b51d-4bd4-89ed-017919b9f02d:0xffffffffffffffff:0x5+15a7a4f8-0072-4eab-abad-f98a4d666aed:0x200000000001:0x4+3cb40aaa-1145-4fb8-b27b-7e30f0454316:0x20:0x4+1701c7dc-045c-45c0-8cd6-4d42e3bbf387:0xffffffffffffffff:0xff+314de49f-ce63-4779-ba2b-d616f6963a88:0x20:0x4+0c478c5b-0351-41b1-8c58-4a6737da32e3:0x10:0x4+1fa33c5a-2dc0-48d4-bd4e-d5eb9b8e1fb2:0xffffffffffffffff:0x5+"Microsoft-Windows-BrokerInfrastructure":0x4:0x4+7a653c44-a930-4288-a6c3-317aeda0cb36:0xffffffffffffffff:0x5+"Microsoft-Windows-Iphlpsvc-Trace":0x80:0x5

Logger Name           : NetworkTransferManager
Logger Id             : 10
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 8
Minimum Buffers       : 8
Number of Buffers     : 8
Free Buffers          : 8
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 57a77336-f39e-4fe3-9bd7-ab58696e5000:0xffffffffffffffff:0x5

Logger Name           : Notifications
Logger Id             : 11
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 4
Minimum Buffers       : 4
Number of Buffers     : 4
Free Buffers          : 3
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : f0ae506b-805e-434a-a005-7971d555179c:0xff:0xff+b92d1ff0-92ec-444d-b7ec-c016f971c000:0xffffffffffffffff:0x5+ee845016-ebe1-41eb-be52-5e3ae58339f2:0xffffffffffffffff:0x5

Logger Name           : NPSM
Logger Id             : 12
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 4
Minimum Buffers       : 4
Number of Buffers     : 4
Free Buffers          : 4
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 7b52746e-241b-52c9-8f0b-4e5e25e54507:0xffffffffffffffff:0x5+883b9247-ab6e-5068-59bb-eeb519d551b6:0xffffffffffffffff:0x5+7ceded3a-7359-5861-5b43-1959577103e4:0xffffffffffffffff:0x5

Logger Name           : ParentalControls
Logger Id             : 13
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 2
Minimum Buffers       : 2
Number of Buffers     : 2
Free Buffers          : 1
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 2d617ccf-25cb-5351-d434-82c4dfa19059:0xffffffffffffffff:0xff+1bc8d94b-7838-49f8-b675-01df9678a963:0x7:0xff+d8f29c0d-526c-5148-2167-9be755ad812d:0xffffffffffffffff:0xff+c69317b7-1688-4007-880c-ee57210327ef:0x7:0xff+02db1e80-8296-5d13-91b2-3d6bdf0bc162:0xffffffffffffffff:0xff+2bb574fe-645a-4f36-80a4-124b7960c45d:0x7:0xff+93ea71e9-c552-4709-89c9-80ffad4e87aa:0x7:0xff+6ecb0bf3-c4d3-52e5-81df-704c4a8686ac:0xffffffffffffffff:0xff+bc6a63f5-2da6-5394-8657-e7b5efad1315:0xffffffffffffffff:0xff

Logger Name           : PDC
Logger Id             : 14
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 2
Minimum Buffers       : 2
Number of Buffers     : 2
Free Buffers          : 1
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : d29624ca-200f-44bb-9471-13b01ea15b9e:0xffffffffffffffff:0x5

Logger Name           : ResourceManager
Logger Id             : 15
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 2
Minimum Buffers       : 2
Number of Buffers     : 2
Free Buffers          : 1
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : "Microsoft.Windows.ResourceManager":0x8:0x4

Logger Name           : ShellService
Logger Id             : 16
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 8
Minimum Buffers       : 8
Number of Buffers     : 8
Free Buffers          : 7
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 4d37f810-4d70-5b33-fef5-1e1c5e33d678:0xffffffffffffffff:0x5+dde441ee-57c1-4571-8bd5-1adc23b819a9:0xffffffffffffffff:0x5+5eb0d4c3-41ef-441a-ba18-ddc05e522cd6:0xffffffffffffffff:0x5+739d5b75-383e-5a24-9b67-fa343b8df1ba:0xffffffffffffffff:0x5+d3bb8507-fc66-5186-9e6c-00f311c8a389:0xffffffffffffffff:0x5+1548ce96-3c0d-5775-556b-7f60a0c81161:0xffffffffffffffff:0x5+79f45527-ee95-50f1-0e6a-c48bcb22f29b:0xffffffffffffffff:0x5+3ea5a289-edbe-5392-518b-24979c559029:0xffffffffffffffff:0x5+3e2a6b5f-e713-4517-96a3-939720f60eb4:0xffffffffffffffff:0x5+0a647a8d-b0ba-572f-13f3-74ad1e2e40c9:0xffffffffffffffff:0x5

Logger Name           : SocialPlat
Logger Id             : 17
Logger Thread Id      : 0000000000000000
Buffer Size           : 64
Maximum Buffers       : 16
Minimum Buffers       : 16
Number of Buffers     : 16
Free Buffers          : 16
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : d72a5df2-1372-45e2-a080-c81221d484d0:0xffffffffffffffff:0x5+665c9399-01f8-41fc-9bc2-df433b9fcc6c:0xffffffffffffffff:0x5+ab74fbe2-37ef-48c4-b9ba-91ae7804a0b7:0xffffffffffffffff:0x5+5dd5f9b0-00b6-4ebd-9d9c-31dc95a25ef2:0xffffffffffffffff:0x5+aff5d694-bd28-4ffc-ab81-1f8718868057:0xffffffffffffffff:0x5+85b427e8-a7fc-4df9-8bb1-17150f3e7d69:0xffffffffffffffff:0x5+e267207d-66dd-4246-b8cd-e77ec4878888:0xffffffffffffffff:0x4+a07eb5c4-4c73-58ac-14b4-825b3ea8a5a4:0xffffffffffffffff:0x4+4e8f98a2-3dc0-4dd8-bb6f-7335068650a5:0x10a40a81:0x5+b895a8ee-76c9-4fb5-af4b-6beb6b4e05a0:0x140000:0xff+86a13cf3-bbd2-5f61-8c90-36214e710948:0xffffffffffffffff:0x4+19ab2471-af8b-47e9-b50f-4adc2282cc23:0xffffffffffffffff:0x5+5444c7b1-d849-5543-0279-5faed419f036:0xffffffffffffffff:0x5+181dd5de-a365-453e-a34f-78f927053f95:0xffffffffffffffff:0x4

Logger Name           : Speech
Logger Id             : 18
Logger Thread Id      : 0000000000000000
Buffer Size           : 64
Maximum Buffers       : 2
Minimum Buffers       : 2
Number of Buffers     : 2
Free Buffers          : 1
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 393cbb34-cb5c-48fd-b397-defc5a9e46a1:0xffffffffffffffff:0x5+e6c38788-c835-4d10-b26e-5920c34e5f20:0xffffffffffffffff:0x5+9345df93-4fab-4047-bc9a-7056dd9893c2:0xffffffffffffffff:0x5+7c4c4d7c-fadd-41fb-a1dd-7137de22357e:0xffffffffffffffff:0x5+f2760c9a-bf66-4871-b779-fff1e923d96b:0xffffffffffffffff:0x5+8eb79eb6-8701-4d39-9196-9efc81a31489:0xffffffffffffffff:0x5+26a07136-ea23-42d8-b420-d475894d3aab:0xffffffffffffffff:0x5

Logger Name           : TvLoggers
Logger Id             : 19
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 2
Minimum Buffers       : 2
Number of Buffers     : 2
Free Buffers          : 2
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 96060c66-8654-4f0f-b04a-328089ac34cf:0xffffffffffffffff:0x4+585a0dda-c848-4fc9-956f-2df7ca5f2ca9:0xffffffffffffffff:0x5+2be9dc6e-bd4f-4bca-8356-00f96cf954fa:0xffffffffffffffff:0x5+5dc8f4f8-07b3-46fb-a5c8-6881776a0268:0xffffffffffffffff:0x5+2c7c2ec1-93d1-4919-b776-9c00bd6f88cc:0xffffffffffffffff:0x5+22e533d4-10d8-450f-bada-b6c5adf44edf:0xffffffffffffffff:0x4+09996b9b-504e-44d8-89ab-3f26c030b3e2:0xffffffffffffffff:0x5+23abc8a8-859a-4db2-a278-d12cb28a23d1:0xffffffffffffffff:0x5+db6c92cc-6bb4-4258-a772-d9597bbdcaf7:0xffffffffffffffff:0x5+df75c1c9-c494-4f12-8c30-fd9337b14027:0xffffffffffffffff:0x5+6f3ad6f8-7da4-4311-a551-c263de1b2950:0xffffffffffffffff:0x4+5b4f162a-a36c-402b-b2e4-a3db1c9b7f33:0xffffffffffffffff:0x5+350e99a3-8d61-45d3-9f71-1bbb746a0aba:0xffffffffffffffff:0x5+8652e513-7e81-4f6b-aeac-ac4051d478f8:0xffffffffffffffff:0x5+beb2c2d2-250f-4b62-889c-3d4024ebcc01:0xffffffffffffffff:0x5+82f95b40-7eb9-4d58-a5d5-0c85efa9dd57:0xffffffffffffffff:0x4+a1bfb17e-1942-485e-8137-3015091b91f7:0xffffffffffffffff:0x5+10bd04a0-61bc-4a60-9936-70ff316aefee:0xffffffffffffffff:0x5

Logger Name           : UBPM
Logger Id             : 1a
Logger Thread Id      : 00000000000000B0
Buffer Size           : 2
Maximum Buffers       : 100
Minimum Buffers       : 2
Number of Buffers     : 2
Free Buffers          : 2
Buffers Written       : 18
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 20
Age Limit             : 0
Real Time Mode        : Enabled
Log File Mode         : UseMsecFlushTimer NonStoppable Secure PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 10
Log Filename          :
Trace Flags           : "Microsoft-Windows-IdleTriggerProvider":0xffffffffffffffff:0xff+2d7904d8-5c90-4209-ba6a-4c08f409934c:0xffffffffffffffff:0xff+"Microsoft-Windows-Feedback-Service-TriggerProvider":0xffffffffffffffff:0xff+"Microsoft-Windows-EndpointTriggerProvider":0xffffffffffffffff:0xff+"Microsoft-Windows-NetworkProfileTriggerProvider":0xffffff:0xff+bd2f4252-5e1e-49fc-9a30-f3978ad89ee2:0xffffffffffffffff:0xff+"Microsoft-Windows-Kernel-WSService-StartServiceTrigger":0xffffff:0xff+"Microsoft-Windows-Directory-Services-SAM-Utility":0xffffff:0xff+54732ee5-61ca-4727-9da1-10be5a4f773d:0xffffffffffffffff:0xff+"Microsoft-Windows-ApplicationExperience-LookupServiceTrigger":0xffffff:0xff+"Microsoft-Windows-NetworkManagerTriggerProvider":0xffffffffffffffff:0xff+aa1f73e8-15fd-45d2-abfd-e7f64f78eb11:0xffffffffffffffff:0xff+"Microsoft-Windows-DomainJoinManagerTriggerProvider":0xffffff:0xff+"Microsoft-Windows-StartNameRes":0xffffffffffffffff:0xff+"Microsoft-Windows-TriggerEmulatorProvider":0xffffffffffffffff:0xff

Logger Name           : UserManager
Logger Id             : 1b
Logger Thread Id      : 0000000000000000
Buffer Size           : 64
Maximum Buffers       : 32
Minimum Buffers       : 32
Number of Buffers     : 32
Free Buffers          : 31
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : a198ad71-4f5e-4bc2-9a60-7cafb76f4e3c:0xffffffffffffffff:0x4+077b8c4a-e425-578d-f1ac-6fdf1220ff68:0xffffffffffffffff:0x4+a76c2fad-7ac8-44d3-8fb4-fe9cfe6ce98b:0xffffffffffffffff:0x5+bb86e31d-f955-40f3-9e68-ad0b49e73c27:0xffffffffffffffff:0x4+5e85651d-3ff2-4733-b0a2-e83dfa96d757:0xffffffffffffffff:0x5+ebcca1c2-ab46-4a1d-8c2a-906c2ff25f39:0xb00100000000000:0x4+b1a37fe6-6431-56aa-33fd-cdb90c3b695e:0xffffffffffffffff:0x5+"Microsoft-Windows-LiveId":0xffffffffffffffff:0x4+8bba4c4c-1fc2-4905-8cdb-fcd9f1a660cb:0xffffffffffffffff:0x5+5836994d-a677-53e7-1389-588ad1420cc5:0xffffffffffffffff:0x4    

Logger Name           : UtcWorkaround
Logger Id             : 1c
Logger Thread Id      : 0000000000000000
Buffer Size           : 4
Maximum Buffers       : 8
Minimum Buffers       : 8
Number of Buffers     : 8
Free Buffers          : 8
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : "Microsoft-Windows-Kernel-Process":0x1000000000000000:0x5

Logger Name           : WinStore
Logger Id             : 1d
Logger Thread Id      : 00000000000000B4
Buffer Size           : 64
Maximum Buffers       : 16
Minimum Buffers       : 16
Number of Buffers     : 16
Free Buffers          : 9
Buffers Written       : 13
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Circular PersistOnHybridShutdown
Maximum File Size     : 8
Log Filename          : \\?\T:\Windows\System32\Logfiles\WMI\RtBackup\StoreOperational.etl
Trace Flags           : "Microsoft-Windows-Push-To-Install-Service":0xffffffffffffffff:0x5+"Microsoft-Windows-Store":0xffffffffffffffff:0x3+"Windows-ApplicationModel-Store-SDK":0xffffffffffffffff:0x4+"Microsoft-Windows-Install-Agent":0xffffffffffffffff:0x4

Logger Name           : xbdiag
Logger Id             : 1e
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 8
Minimum Buffers       : 8
Number of Buffers     : 8
Free Buffers          : 7
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : ed5d03b4-5074-4b64-a91b-1627e9674d2b:0xffffffffffffffff:0x5+cc79cf77-70d9-4082-9b52-23f3a3e92fe4:0xffffffffffffffff:0x5+3e0d88de-ae5c-438a-bb1c-c2e627f8aecb:0xffffffffffffffff:0x5+2b87e57e-7bd0-43a3-a278-02e62d59b2b1:0xffffffffffffffff:0x5+b4eab216-103a-4bb0-8e83-cf51c4480ae3:0xffffffffffffffff:0x5+1377561d-9312-452c-ad13-c4a1c9c906e0:0xffffffffffffffff:0x5+84f1c38f-4a24-5831-76af-c69d69173744:0xffffffffffffffff:0x5+97945555-b04c-47c0-b399-e453d509a5f0:0xffffffffffffffff:0x5

Logger Name           : XboxAppModel
Logger Id             : 1f
Logger Thread Id      : 0000000000000000
Buffer Size           : 64
Maximum Buffers       : 8
Minimum Buffers       : 8
Number of Buffers     : 8
Free Buffers          : 7
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 7a881c79-ad79-5187-3c97-24e57db0b998:0xffffffffffffffff:0x5+1bf23073-fe4b-535f-ff6e-e65a864e0979:0xffffffffffffffff:0x5+"Microsoft-Windows-AppModel-Runtime":0xffffffffffffffff:0x3+7a55858e-4b38-456d-b418-093c86d92e87:0xffffffffffffffff:0x5+c99ee62f-d6e3-45eb-8f03-c61495a48c15:0xffffffffffffffff:0x5+7228ecc6-0f60-4c79-9391-93f56d9ad432:0xffffffffffffffff:0x5+c2125bcd-a5b0-46bf-bb95-740599aa8f9b:0xffffffffffffffff:0x5+9e2e5009-1313-49de-ab00-d2eb56e0e217:0xffffffffffffffff:0x5+d1203402-8724-5781-c2ba-a2a2967925ae:0xffffffffffffffff:0x5+0c5c1b70-3ddb-4d10-bf6b-7c0c6031e8ff:0xffffffffffffffff:0x5

Logger Name           : XboxAppModelState
Logger Id             : 20
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 4
Minimum Buffers       : 4
Number of Buffers     : 4
Free Buffers          : 3
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 072665fb-8953-5a85-931d-d06aeab3d109:0xffffffffffffffff:0x4+47f97aea-ad83-4ab7-8895-0d73f9a86a6a:0xffffffffffffffff:0x5+1db23b62-601e-481b-905b-76771770ac3d:0xffffffffffffffff:0x4

Logger Name           : XboxUI
Logger Id             : 21
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 16
Minimum Buffers       : 16
Number of Buffers     : 16
Free Buffers          : 15
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 8d9c9464-f103-496a-aca0-f12a4f258f7c:0xffffffffffffffff:0x5+1a2205b0-0e07-42cd-a6f4-01ddd4683d2a:0xffffffffffffffff:0x4+aa878788-4721-571b-ed72-c33e53b76057:0xffffffffffffffff:0x4+7efbf076-8109-51aa-2575-c23f42881cea:0xffffffffffffffff:0x4+79b2c597-f613-55f1-8411-d4ef99569e80:0xffffffffffffffff:0x4+4f2ec0d2-e724-4a7a-a742-49b40b691672:0xffffffffffffffff:0x4+0c8ef845-83f1-4a15-9988-6e1630db4d32:0xffffffffffffffff:0x5+9b89baa4-0253-5e71-26d5-182a4e690463:0xffffffffffffffff:0x4+c31e3c2c-0867-5334-34af-93b3dfdee3b8:0xffffffffffffffff:0x3+946473dc-c1b7-5697-6c2d-8ad664f95cec:0xffffffffffffffff:0x4+d75df9f1-5f3d-49d0-9d15-2a55bd1c012e:0xffffffffffffffff:0x5+a26461d1-9f79-419b-8da6-610c0bba0398:0xffffffffffffffff:0x4+a1a15804-996b-5593-4ca6-ec5153f2f490:0xffffffffffffffff:0x4+a27b9863-9b2c-4f89-84fc-7d98bf921da1:0xffffffffffffffff:0x5+565b2d4b-a640-42d5-ba97-8d8dc5087810:0xffffffffffffffff:0x4+485ff7d9-11d9-4e52-8ca3-4c273a80ef36:0xffffffffffffffff:0x4+48dcc4b8-1a33-4625-b042-95ce02602863:0xffffffffffffffff:0x5+02585802-c33c-4f5d-bf6b-a63cbb29dea5:0xffffffffffffffff:0x4+35d22b34-04d6-40a8-a0fe-64993c7efa6b:0xffffffffffffffff:0x5

Logger Name           : XvdStreamSvc
Logger Id             : 22
Logger Thread Id      : 0000000000000000
Buffer Size           : 32
Maximum Buffers       : 2
Minimum Buffers       : 2
Number of Buffers     : 2
Free Buffers          : 2
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : 7565c249-c0d1-5701-5569-30c12d7b1f51:0xffffffffffffffff:0x5

Logger Name           : xVMCOM
Logger Id             : 23
Logger Thread Id      : 0000000000000000
Buffer Size           : 64
Maximum Buffers       : 8
Minimum Buffers       : 8
Number of Buffers     : 8
Free Buffers          : 7
Buffers Written       : 0
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 0
Age Limit             : 0
Log File Mode         : Buffered LocalSeqNo PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 100
Log Filename          :
Trace Flags           : bda92ae8-9f11-4d49-ba1d-a4c2abca692e:0x3:0x3+9474a749-a98d-4f52-9f45-5b20247e4f01:0x3:0x3

Logger Name           : EtxUploader
Logger Id             : 24
Logger Thread Id      : 00000000000007EC
Buffer Size           : 64
Maximum Buffers       : 38
Minimum Buffers       : 16
Number of Buffers     : 16
Free Buffers          : 16
Buffers Written       : 17
Events Lost           : 0
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 1
Age Limit             : 0
Real Time Mode        : Enabled
Log File Mode         : PersistOnHybridShutdown
Maximum File Size     : 0
Log Filename          :
Trace Flags           : b673475f-a196-4588-bc2b-c84ab7909a74:0xffffffffffffffff:0x5+67b768eb-35a1-4f19-8243-bd920f31f7ca:0xffffffffffffffff:0x5+8c800f35-77ee-4bfa-9ccd-c8e388e27092:0xffffffffffffffff:0x5+9345df93-4fab-4047-bc9a-7056dd9893c2:0xffffffffffffffff:0x5+c7971fef-9c5d-49e3-92ec-d203487ee016:0xffffffffffffffff:0x5+0efa15ec-78b4-4e02-9b8c-aed6b64bc4cf:0xffffffffffffffff:0x5+37dee19b-05fb-49eb-8796-85e599cb186b:0xffffffffffffffff:0x5

Logger Name           : SfrLogger
Logger Id             : 25
Logger Thread Id      : 0000000000000460
Buffer Size           : 16
Maximum Buffers       : 2
Minimum Buffers       : 2
Number of Buffers     : 0
Free Buffers          : 0
Buffers Written       : 0
Events Lost           : 74
Log Buffers Lost      : 0
Real Time Buffers Lost: 0
Flush Timer           : 1
Age Limit             : 0
Real Time Mode        : Enabled
Log File Mode         : Secure <0x40000> PersistOnHybridShutdown NoPerProcessorBuffering
Maximum File Size     : 0
Log Filename          :
Trace Flags           : fb24d716-4503-46ec-bca5-f30168a9e106:0xffffffffffffffff:0x5
```
