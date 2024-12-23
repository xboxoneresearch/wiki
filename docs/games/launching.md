# Launching Game OS & Game Executables

A new instance of Game OS is created everytime a game is launched, the coordination of which is handled by System OS with the assistance of Host OS.  There is not a single Game OS image, instead each game has the ability to include its own Game OS image as part of its XCRD user content (`[XUC:]`).

## Launch Sequence

``` mermaid
sequenceDiagram
  autonumber

  box Grey SystemOS<br>(user)
    participant gamecontroller as Game Controller<br>(?)
    participant eraproxy as ERA Proxy UWP App<br>(eraproxyapp.exe)
    participant eracontrol as ERA Control Service<br>(eracontrol.exe)
    participant eracontrol2 as ERA Control Service<br>(background thread)
  end
  box Grey SystemOS<br>(kernel)
    participant xvmctrl as Xbox VM Control<br>(xvmctrl.sys)
  end

  participant hostos as HostOS

  box Grey GameOS (EraOS)
    participant xamss as Xamss<br>(xamss.exe)
    participant comsrvhost as ComSrvHost<br>(comsrvhost.exe)
    participant game as Game Process<br>(ActivatableApplication)
  end

gamecontroller->>eraproxy: Create UWP Process
eraproxy->>eracontrol: StartEraVm(EraCreationRequest)<br>(IXboxEraControlManager)
activate eraproxy
note over eracontrol: Create EraAppControl instance
eracontrol->>eracontrol: EraAppControl.Activate()
activate eracontrol
eracontrol->>xvmctrl: Launch Era VM<br>(0x150100)
xvmctrl->>hostos: Launch ERA VM
note over hostos: Kickoff GameOS VM Startup
xvmctrl-->>eracontrol: ack

eracontrol-->>eraproxy: EraAppControl
deactivate eracontrol
deactivate eraproxy
note over eraproxy: UWP Proxy App Setup<br>CoreApplication.Run(FrameworkViewSource)<br>FrameworkViewSource.CreateView()<br>FrameworkView.Initialize(CoreApplicationView)<br>FrameworkView.Run()
eraproxy-->>eraproxy: CoreApplicationView.Activate()
activate eraproxy

note over xamss: Startup
xamss->>comsrvhost: Create Process
activate comsrvhost
comsrvhost->>eracontrol: IXboxSRAManager.Attach(IGameOsManager)
activate eracontrol
eracontrol->>eracontrol2: Create thread
activate eracontrol2
eracontrol-->>comsrvhost: ISystemOsManager
deactivate comsrvhost
deactivate eracontrol
eracontrol2->>comsrvhost: SetTimeZone()<br>(IGameOsManager)
activate comsrvhost
comsrvhost-->>eracontrol2: ack 
deactivate comsrvhost
eracontrol2->>comsrvhost: SetupAndLaunchGame()<br>(IGameOsManager)
activate comsrvhost
note over comsrvhost: Sets up Game<br>(mount XVDs, loads registry, etc)
comsrvhost->>game: Create Process<br>(IActivatableApplication)
comsrvhost-->>eracontrol2: ack
deactivate comsrvhost
note over eracontrol2: Wait for EraAppControl.Activate()<br>to provide IActivatedEventArgs

eraproxy->>eracontrol: Activate(EntryPoint, IActivatedEventArgs)<br>(EraAppControl)
activate eracontrol
eracontrol--xeracontrol2: IActivatedEventArgs
eracontrol2->>comsrvhost: CompleteLaunchAndActivate(LaunchActivatedEventArgs)<br>(IGameOsManager)
activate comsrvhost
comsrvhost->>game: Activate(IActivatedEventArgs)<br>(IActivatableApplication)
activate game
game-->>comsrvhost: ack
deactivate game
comsrvhost-->>eracontrol2: ack
deactivate comsrvhost
eracontrol2--xeracontrol: Event
eracontrol-->>eraproxy: ack
deactivate eracontrol
deactivate eraproxy

activate game
note over game: Game begins

note over eracontrol2: Monitor Proxy App, Game OS VM

deactivate game
deactivate eracontrol2
```

## ERA Proxy UWP App (eraproxyapp.exe, SystemOS)

The proxy app serves as an abstraction that allows SystemOS to launch games via normal UWP application interfaces with no awareness that it is backed by GameOS.  It's responsibility is managing UWP lifecycle events (activate, suspend, resume, user change, window visibility change, window active change) dictated by SystemOS and proxying them to GameOS via the ERA Control Service.

When the operationg system launches this process, it is given a single argument, `-ServerName:XXXXXX`.  The value here corresponds with a UWP identifier, such as `Vermintide2.App.AppX{...}.mca`.  This value is one of many used when calling ERA Control Service to launch the ERA VM.

Upon startup, the program will:

1. Invoke ERA Control Services `EraAppControl.StartEraVm()` method to kick off the ERA VM launch process
2. UWP app lifecycle kicks off via a call to [`CoreApplication.Run()`](https://learn.microsoft.com/en-us/uwp/api/windows.applicationmodel.core.coreapplication.run?view=winrt-26100) which will invoke app initialization via calls to [`FrameworkViewSource.CreateView()`](https://learn.microsoft.com/en-us/uwp/api/windows.ui.xaml.frameworkviewsource.createview?view=winrt-26100) and [`FrameworkView.Initialize()`](https://learn.microsoft.com/en-us/uwp/api/windows.ui.xaml.frameworkview.initialize?view=winrt-26100)
3. App initialization begins
    * Activate lifecycle event hook is installed via [`CoreApplicationView.Activated()`](https://learn.microsoft.com/en-us/uwp/api/windows.applicationmodel.core.coreapplicationview?view=winrt-26100)
    * Resume lifecycle event hook is installed via [`ICoreApplication::add_Resuming()`](https://learn.microsoft.com/en-us/previous-versions/hh438375(v=vs.85))
    * Suspend lifecycle event hook is installed via [`ICoreApplication::add_Suspending()`](https://learn.microsoft.com/en-us/previous-versions/hh438376(v=vs.85))
    * User change event hook is installed via `CoreApplicationContext.OnCurrentUserChange()`
    * Window visibility change event hook is installed
    * Window active change event hook is installed
    * `IEraAppControlEvents` COM object is shared with ERA Control Service via `EraAppControl.SetIEraAppControlEvents()`

Event hooks:

* When an activate UWP lifecycle event is received, invokes `EraAppControl.Activate(entryPoint, IActivatedEventArgs)` where `entryPoint` corresponds with the `appxmanifest.xml` `<Application EntryPoint="XXX">` field, eg `Vermintide2.App`.
* When a resume UWP lifecycle event is received, invokes `EraAppControl.Resume()`.
* When a suspend UWP lifecycle event is received, invokes `EraAppControl.Suspend()`.
* When a user change event is received, invokes `EraAppControl.UpdateUser(UserId, unkUserData)`
* When a window activation event is received, invokes `EraAppControl.WindowActivated(unk0, unk1)`
* When a window visibility event is received, invokes `EraAppControl.VisibilityChanged(unk0)`

### Hosted COM interfaces

* `IEraAppControlEvents`
    * REFIID `F1C233E8-8825-4ADF-B9DA-79708EC2652A`
    * Instance sent to `EraAppControl`, which can use it to communicate back with the proxy
    * Contains Keyboard/Mouse related methods


## ERA Control Service (eracontrol.exe, SystemOS)

The ERA Control Service is a Service (`IEraControlStatic`) responsible for handling the ERA VM lifecycle within SystemOS, handling commands from the ERA Proxy UWP App and communicating directly with GameOS via ComSrvHost. System panics will occur when detaching a debugger from this executable, or when attempting to stop the service.

The ERA Proxy UWP App invokes the `IEraControlStatic.StartEraVm()` method to kick off the Game OS launch and receive an instance of `IEraAppControl`.  Subsequent calls from the ERA Proxy UWP App utilizes the `IEraAppControl` COM object to manage the Game OS VM as well as the game itself.  Additionally, `IEraControlStatic` is called by other system components to do things like enable hardware mice and constrain or kill the VM.


### `IEraControlStatic` COM interface

This is the static service COM object, used to launch and manage Game OS VMs.

* CLSID `D9845246-4E76-4C99-A679-BBDA152C319D`
* REFIID `7F09F76D-B94E-4AA8-BD33-46261EF01261`
* Notable methods:
    * `StartEraVm()`
    * `Attach()`

#### `StartEraVm()` method

This method is responsible for kicking off the Game OS VM and for returning an instance of `IEraAppControl` which can be used by the ERA Proxy UWP App to manage the VM and its game.  Interestingly, while this method takes in quite a bit of information it sends very little of it to HostOS via XVmCtrl, indicating that HostOS is not involved in validating many of the parameters used to create a Game OS VM.

This method will:

1. Handle existing Game OS VMs (eg quick resume, kill)
1. Calls `AppPackageMountManager` to retrieve the temp XVD name for the package (eg `temp01`)
1. Retrieve compatibility flags
1. Calls XvmCtrl (`\\.\XVmCtrl`) to launch the Game OS VM via device code `0x150100`
1. For non-normal launch types (quick resume?):
    * Calls XvmCtrl (`\\.\XVmCtrl`) to retrieve currently loaded content ids via device code `0x150264`
    * Calls `IContentPackageManagerService.RemovePackageFromMonitorList()` or `IAppLicenseManager.RemoveLicensesForInstalledPackages()` to stop listening to package/license changes
    * Calls XvmCtrl (`\\.\XVmCtrl`) via device code `0x150268`
    * Calls XvmCtrl (`\\.\XVmCtrl`) to restore the Game OS VM via device code `0x15020C`
1. Creates event listeners to detect if the ERA Proxy UWP App crashes
1. Queries WNF state data to retrieve the logged in user data via code `0x19890C35A3BCE075`
1. Creates an instance of `EraAppControl`
1. Publishes WNF state data via code `0x19890C35A3BD5875`

Information passed to this method:

* `Locale` (eg `en-US`)
* `Timezone` (eg `Mountain Standard Time`)
* `CountryCode` (eg `US`)
* `GeoId` (eg `244`)
* `GameTitleId` (eg `0x3C108361`)
* `ServiceConfigId` (eg `c05f0100-eac5-49eb-943f-1a0e3c108361`)
* `XboxLiveInfo` (TODO)
* `applicationUserModelId` (eg `(Vermintide2_syvdkwgxvaj72!Vermintide2.App`)
* `serverName` (eg `Vermintide2.App.AppX{...}.mca`)
* `packageFamilyName` (eg `Vermintide2_syvdkwgxvaj72`)
* `packageFullName` (eg `Vermintide2_1.0.0.386_x64__syvdkwgxvaj72`)
* `VmXcrdFileNameWithoutExtension` (eg `era`)
* `environment` (TODO)
* `partitionId` (eg `1` for `[XUC:]`)
* `mode` (TODO)
* `eraProxyAppExe_processId`
* `gpuPolicy` (eg `VARIABLE`)
* `titleMemoryPolicy` (eg `FIXED`)
* `TitleId` (eg `0x3C108361`)
* `titleScratchPath` (TODO)
* `isFissionApp` (Xbox backwards compatibility engine)
* `maxTitleMemory` (eg `0x1C00`)
* `unk58`
* `unk68` (something related to memory size being enabled)
* `flags` (Xbox Series X console, AnisoBoost, AutoHdr)
* `unk70`
* `vSyncMode`
* `launchType` (normal, quick resume)


### `IXboxSRAManager` COM interface

This is a static COM object (`IEraPsmControlEventsStatic`) that is used by ComSrvHost in Game OS to communicate with System OS.

* CLSID `CAC3C1BC-F8C9-4947-9EA5-7F811ADCBD19`
* REFIID `7473D680-1F9E-4CE4-9355-8F8B61199B5D`
* Notable methods:
    * `Attach()`

#### `Attach()` method

This method is called by ComSrvHost in Game OS when the VM is up and ready to launch a game.  It is responsible for swapping COM objects that will be used to communicate between System OS and Game OS during the lifecycle of the Game and VM.  Game OS provides the `IGameOsManager` object for SystemOS to communicate with, and SystemOS provides `ISystemOsManager` for GameOS to communicate with.

Once objects have been swapped, a background thread will call `IGameOsManager.SetTimeZone()` and more importantly `IGameOsManager.SetupAndLaunchGame()`.  The latter which will create the Game process within Game OS, but in an inactive state.  It will then wait on `IEraAppControl.Activate()` to be called, which will supply a `IActivatedEventsArgs` instance.  It then clones & modifies the `IActivatedEventsArgs` arguments before passing it to GameOS via `IGameOsManager.CompleteLaunchAndActivate()` which will invoke the `Activate()` method on the Game processes `IActivatableApplication`.  At this point the Game should be launched and running, so the background thread shifts to monitoring the various components and tearing down the VM (and publishing crash dumps) when appropriate.


### `IEraAppControl` COM interface

This COM object represents a Game OS instance, allowing for the ERA Proxy UWP App to interface with a Game within a running Game OS.

* REFIID `D6A35B74-7FE3-479F-9C11-A7DD1176630A`
* Notable methods:
    * `Activate()`
    * `Resume()`
    * `Suspend()`
    * `SetIEraAppControlEvents()`

#### `Activate()` method

This method is invoked by the ERA Proxy UWP App when it has reached the [activated](https://learn.microsoft.com/en-us/windows/uwp/launch-resume/app-lifecycle) state of its lifecycle.  This method will wait until `IXboxSRAManager.Attach()` is called by Game OS ComSrvHost before performing any work, ensuring that the Game OS is ready and a Game process has been created.  It will then provide its `IActivatedEventArgs` to the `IEraAppControl` background thread, which will then use it to invoke `IGameOsManager.CompleteLaunchAndActivate()`.  Once that has completed successfully, this method will return.


### `ISystemOSManager` COM interface

This is the interface that is swapped with Game OS and allows for Game OS to perform actions within System OS.  When paired with its Game OS counterpart `IGameOSManager` a bi-directional communication bridge is established between System OS and Game OS.

* REFIID `83C3BCAB-48C1-4B9E-B313-A1C7182EBABF`
* AKA `IEraPsmControlEvents`
* Notable methods:
    * `GameProcessLaunchedCallback()`


## Xbox VM Control (xvmctrl.sys, SystemOS)

This is a System OS kernel driver that is used to control/query the Game OS VM.

Notable commands:

* `LAUNCH_ERA_VM` (0x150100)
* `TERMINATE_ERA_VM` (0x150104)
* `RESTORE_ERA_VM` (0x15020C)
* `QUERY_TITLE_VM_INFO` (0x150114)
* `WAIT_VM_TERMINATE` (0x150118)
* `GET_VM_TERMINATION_INFO` (0x150170)
* `TITLE_SUSPEND_AND_RESUME` (0x150110)
* `DOES_TITLE_CONTENT_ID_HAVE_QUICKSTATE` (0x150254)
* `CONSTRAIN_VM` (0x15010C)

### `LAUNCH_ERA_VM` command

This command is used to start the Game OS VM.  It takes a dynamically sized request payload that contains the following information:

* `flags`
* `titleId` (eg 0x3C108361)
* `bootXvdPath` (eg `[XVE:]\[XUC:]\7C7EB620-5F1A-4DFF-8375-1446377CB1E8`)
* `altBootXvdPath` (eg `[XUC:]\era.xvd`)
* `packageFullName` (eg `Vermintide2_1.0.0.386_x64__syvdkwgxvaj72`)
* `applicationUserModelId` (eg `(Vermintide2_syvdkwgxvaj72!Vermintide2.App`)
* `vmShutDownEvent`
* `maxTitleMemoryInMegabytes`
* `unk52`
* `tempXcdSlotNumber` (eg `1` for `temp01`)
* `xboxLiveTitleContentGuid` (eg `{7C7EB620-5F1A-4DFF-8375-1446377CB1E8}`)
    * Maps to XVD `VDUID` & `UDUID`
* `xboxLiveTitleBuildGuid` (eg `{4789dd49-9bb6-490a-94ce-21c2dd556c24}`)
    * Maps to XVD `PDUID`
* `xcdPartitionId` (eg `1` for `[XUC:]`)
* `compatMode`
* `unk88`
* `unk90`
* `compatibilitySettings`
* `activationSequenceNumber`
* `unka4`

Interestingly, none of these fields are validated/verified before the Game OS VM starts up.  As long as at least one valid XVD path is given in `bootXvdPath` or `altBootXvdPath`, the Game OS VM will start up and invoke the `IXboxSRAManager.Attach()` method.  However, some of these fields are persisted within HostOS and eventually vended via the `QUERY_TITLE_VM_INFO` command.

### `QUERY_TITLE_VM_INFO` command

This command is used by Game OS and System OS to query information about the currently running Game OS VM.  Its payload is 0x214 bytes long and contains the following information:

* `unk0` (1 when VM is loaded, 0 otherwise)
* `titleInstanceId` (unique [auto-incrementing] id for the Game OS VM instance)
* `unk8` (1 when VM is loaded, 0 otherwise)
* `packageFullName` (eg `Vermintide2_1.0.0.386_x64__syvdkwgxvaj72`)
* `applicationUserModelId` (eg `(Vermintide2_syvdkwgxvaj72!Vermintide2.App`)
* `unk60`
* `unk160`


## ComSrvHost (comsrvhost.exe, GameOS)

ComSrvHost is launched by `xamss.exe` in Game OS after startup.  It is responsible for reaching out to `IXboxSRAManager` in System OS to exchange COM objects used to communicate between the two, as well as launching , monitoring and managing the Game process.  It is the Game OS counterpart to ERA Control Service.

On startup, it will call `IXboxSRAManager.Attach()` and provide System OS a `IGameOSManager` while receiving back a `ISystemOSManager`.  The `IGameOSManager` has many methods for managing the game, but the important ones are 1) `SetupAndLaunchGame()` which is responsible for setting up and launching the Game process, and 2) `CompleteLaunchAndActivate` which is responsible for invoking `Activate()` on the Game processes `IActivatableApplication`.


### `IGameOSManager` COM interface

This is the interface that is swapped with System OS and allows for System OS to perform actions within Game OS.  When paired with its System OS counterpart `ISystemOSManager` a bi-directional communication bridge is established between System OS and Game OS.

* CLSID `9F91A319-2D53-4154-823C-994FFEEFFBC5`
* REFIID `0A82F5CE-E84A-40E0-8635-52C6F99938EA`
* AKA `IEraPsmService`
* Notable methods:
    * `SetupAndLaunchGame()`
    * `CompleteLaunchAndActivate()`
    * `FastRestart()`

#### `SetupAndLaunchGame()` method

This method is responsible for preparing Game OS for the game launch, as well as launching the game in an inactive state. Steps performed by this method:

* Set the `Software\CurrentTitle\ApplicationUserModelId` registry key
* Set the Users Locale
* Set the Users Geographic Identifier
* Set the Users Timezone
* Calls `\\.\xvmmcli` with code 0x150044 to delete the `\\Global??\\G:` symbolic link
* Builds the XVD path using the partition id and XVD path and mounts via `XCrdMount()`
    * Mounts with READONLY flag if the XVD has encryption or data integrity enabled
* Creates a symbolic link `G:` which points to the mounted XVD path
* Attempts to mount `[XTE:]\tempXX` and create symbolic link `T:`, if the XVD cannot mount (does not exist, etc) it will create the temp XVD
    * Temp XVD will be created with flags `EncryptionEnabled | TitleSpecific` and `XvdContentType.SCRATCH`
* Loads registry hive file `G:\appdata.bin` into `\REGISTRY\MACHINE\XBOX`
* Makes a call to the `epmapper` RPC endpoint
* Finds and launches the game process
    * Queries the `Windows.Foundation.ExtensionCatalog` to find the application based on the package name
    * Compares `IExeServerActivatableClassRegistration` to find the one that matches the given server name
    * Creates a `IActivatableApplication` that represents the game process

NOTE: This method performs additional actions when run on a non-retail Xbox, such as launching Pixie and mounting the D drive.

#### `CompleteLaunchAndActivate()` method

This method is responsible for invoking the `Activate()` method on the Game processes `IActivatableApplication` interface, fully launching the Game running within Game OS.


## Additional notes

### Concurrent instances

Prior to Xbox Series, only one Game OS instance could exist at a time.  With the introducing of [quick resume](https://support.xbox.com/en-US/help/games-apps/game-setup-and-play/get-back-to-your-game-instantly-with-quick-resume) in Series X, up to three Game OS instances can exist, with only one in a running state at once (with others in suspended state).  The lifecycle of these is handled via the suspend/restore methods.


