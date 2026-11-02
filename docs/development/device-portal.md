# Device Portal
The Xbox Device Portal is a web management server based on [Windows Device Portal](https://learn.microsoft.com/en-us/windows/advanced-settings/device-portal), allowing developers to deploy apps, debug, configure settings, and monitor system performance.

## Managing the Device Portal

### Stopping the Device Portal
`sc stop webmanagement`

### Starting the Device Portal
`sc start webmanagement`

### Starting the Device Portal in debug mode
`WebManagement.exe -debug -HttpPort 11443 -TraceLevel 5`

You will need to connect over HTTP rather than HTTPS on port 11443.

### Getting additional arguments from the Device Portal
`WebManagement.exe /?`

## Usage
* [Setting up device portal](dev-portal-api/set-up-device-portal.md)
* [Device portal pages](dev-portal-api/device-portal-pages.md)

## Table of contents

### Core Device Portal APIs (`/api`)

#### App Management
* [/api/app/packagemanager/certificate](dev-portal-api/api/app-packagemanager-certificate.md)
* [/api/app/packagemanager/contentgroups](dev-portal-api/api/app-packagemanager-contentgroups.md)
* [/api/app/packagemanager/networkapp](dev-portal-api/api/app-packagemanager-networkapp.md)
* [/api/app/packagemanager/package](dev-portal-api/api/app-packagemanager-package.md)
* [/api/app/packagemanager/packages](dev-portal-api/api/app-packagemanager-packages.md)
* [/api/app/packagemanager/pullinstall](dev-portal-api/api/app-packagemanager-pullinstall.md)
* [/api/app/packagemanager/register](dev-portal-api/api/app-packagemanager-register.md)
* [/api/app/packagemanager/state](dev-portal-api/api/app-packagemanager-state.md)
* [/api/app/packagemanager/upload](dev-portal-api/api/app-packagemanager-upload.md)
* [/api/appx/packagemanager/contentgroups](dev-portal-api/api/appx-packagemanager-contentgroups.md)
* [/api/appx/packagemanager/networkapp](dev-portal-api/api/appx-packagemanager-networkapp.md)
* [/api/appx/packagemanager/package](dev-portal-api/api/appx-packagemanager-package.md)
* [/api/appx/packagemanager/packages](dev-portal-api/api/appx-packagemanager-packages.md)
* [/api/appx/packagemanager/state](dev-portal-api/api/appx-packagemanager-state.md)

#### Authentication & Pairing
* [/api/authorize/pair](dev-portal-api/api/authorize-pair.md)
* [/api/authorize/setSslState](dev-portal-api/api/authorize-setSslState.md)
* [/api/authorize/startpair](dev-portal-api/api/authorize-startpair.md)

#### Crash Dumps
* [/api/debug/dump/kernel/bugcheck](dev-portal-api/api/debug-dump-kernel-bugcheck.md)
* [/api/debug/dump/kernel/crashcontrol](dev-portal-api/api/debug-dump-kernel-crashcontrol.md)
* [/api/debug/dump/kernel/dump](dev-portal-api/api/debug-dump-kernel-dump.md)
* [/api/debug/dump/kernel/dumplist](dev-portal-api/api/debug-dump-kernel-dumplist.md)
* [/api/debug/dump/livekernel](dev-portal-api/api/debug-dump-livekernel.md)
* [/api/debug/dump/usermode/crashcontrol](dev-portal-api/api/debug-dump-usermode-crashcontrol.md)
* [/api/debug/dump/usermode/crashdump](dev-portal-api/api/debug-dump-usermode-crashdump.md)
* [/api/debug/dump/usermode/dumps](dev-portal-api/api/debug-dump-usermode-dumps.md)
* [/api/debug/dump/usermode/live](dev-portal-api/api/debug-dump-usermode-live.md)

#### Performance & Tracing
* [/api/etw/providers](dev-portal-api/api/etw-providers.md)
* [/api/etw/session/realtime](dev-portal-api/api/etw-session-realtime.md)
* [/api/resourcemanager/processes](dev-portal-api/api/resourcemanager-processes.md)
* [/api/resourcemanager/systemperf](dev-portal-api/api/resourcemanager-systemperf.md)
* [/api/wpr/customtrace](dev-portal-api/api/wpr-customtrace.md)
* [/api/wpr/status](dev-portal-api/api/wpr-status.md)
* [/api/wpr/trace](dev-portal-api/api/wpr-trace.md)
* [/api/wpr/tracefile](dev-portal-api/api/wpr-tracefile.md)
* [/api/wpr/tracefiles](dev-portal-api/api/wpr-tracefiles.md)

#### File System
* [/api/filesystem/apps/file](dev-portal-api/api/filesystem-apps-file.md)
* [/api/filesystem/apps/files](dev-portal-api/api/filesystem-apps-files.md)
* [/api/filesystem/apps/folder](dev-portal-api/api/filesystem-apps-folder.md)
* [/api/filesystem/apps/knownfolders](dev-portal-api/api/filesystem-apps-knownfolders.md)
* [/api/filesystem/apps/rename](dev-portal-api/api/filesystem-apps-rename.md)

#### Networking & Wi-Fi
* [/api/networking/ipconfig](dev-portal-api/api/networking-ipconfig.md)
* [/api/networking/ipV4config](dev-portal-api/api/networking-ipv4config.md)
* [/api/wifi/interfaces](dev-portal-api/api/wifi-interfaces.md)
* [/api/wifi/network](dev-portal-api/api/wifi-network.md)
* [/api/wifi/networks](dev-portal-api/api/wifi-networks.md)
* [/api/wifi/profile](dev-portal-api/api/wifi-profile.md)

#### Power
* [/api/control/restart](dev-portal-api/api/control-restart.md)
* [/api/control/shutdown](dev-portal-api/api/control-shutdown.md)
* [/api/power/state](dev-portal-api/api/power-state.md)

#### Registry
* [/api/registryeditor/rootkeys](dev-portal-api/api/registryeditor-rootkeys.md)
* [/api/registryeditor/subkeys](dev-portal-api/api/registryeditor-subkeys.md)
* [/api/registryeditor/values](dev-portal-api/api/registryeditor-values.md)

#### System Information
* [/api/devicemanager/devices](dev-portal-api/api/devicemanager-devices.md)
* [/api/os/devicefamily](dev-portal-api/api/os-devicefamily.md)
* [/api/os/info](dev-portal-api/api/os-info.md)
* [/api/os/machinename](dev-portal-api/api/os-machinename.md)
* [/api/users/activeuser](dev-portal-api/api/users-activeuser.md)

#### Processes & Tasks
* [/api/taskmanager/app](dev-portal-api/api/taskmanager-app.md)
* [/api/taskmanager/app/state](dev-portal-api/api/taskmanager-app-state.md)
* [/api/taskmanager/process](dev-portal-api/api/taskmanager-process.md)

#### Windows Error Reporting
* [/api/wer/reports](dev-portal-api/api/wer-reports.md)
* [/api/wer/reports/file](dev-portal-api/api/wer-reports-file.md)
* [/api/wer/reports/files](dev-portal-api/api/wer-reports-files.md)

### Xbox Extension APIs (`/ext`)

#### ERA App Management
* [/ext/app/deployinfo](dev-portal-api/ext/app-deployinfo.md)
* [/ext/app/move](dev-portal-api/ext/app-move.md)
* [/ext/app/packagemanager/era/available](dev-portal-api/ext/app-packagemanager-era-available.md)
* [/ext/app/packagemanager/era/check](dev-portal-api/ext/app-packagemanager-era-check.md)
* [/ext/app/packagemanager/era/register](dev-portal-api/ext/app-packagemanager-era-register.md)
* [/ext/app/packagemanager/era/registernetwork](dev-portal-api/ext/app-packagemanager-era-registernetwork.md)
* [/ext/app/packagemanager/era/streaming](dev-portal-api/ext/app-packagemanager-era-streaming.md)
* [/ext/app/packagemanager/era/upload](dev-portal-api/ext/app-packagemanager-era-upload.md)
* [/ext/app/packagemanager/package](dev-portal-api/ext/app-packagemanager-package.md)
* [/ext/app/runningtitle](dev-portal-api/ext/app-runningtitle.md)
* [/ext/app/sshpins](dev-portal-api/ext/app-sshpins.md)
* [/ext/app/unregistered](dev-portal-api/ext/app-unregistered.md)

#### Remote Control & Diagnostics
* [/ext/fiddler](dev-portal-api/ext/fiddler.md)
* [/ext/frontpanel](dev-portal-api/ext/frontpanel.md)
* [/ext/httpmonitor/sessions](dev-portal-api/ext/httpMonitor-sessions.md)
* [/ext/remoteinput](dev-portal-api/ext/remoteinput.md)
* [/ext/remoteinput/controllers](dev-portal-api/ext/remoteinput-controllers.md)
* [/ext/screenshot](dev-portal-api/ext/screenshot.md)

#### Console Settings & Storage
* [/ext/devices/usbdevices](dev-portal-api/ext/devices-usbdevices.md)
* [/ext/networkcredentials](dev-portal-api/ext/networkcredentials.md)
* [/ext/settings](dev-portal-api/ext/settings.md)
* [/ext/settings/export](dev-portal-api/ext/settings-export.md)
* [/ext/settings/import](dev-portal-api/ext/settings-import.md)
* [/ext/smb/developerfolder](dev-portal-api/ext/smb-developerfolder.md)
* [/ext/status](dev-portal-api/ext/status.md)

#### OS Updates
* [/ext/update/check](dev-portal-api/ext/update-check.md)
* [/ext/update/remote](dev-portal-api/ext/update-remote.md)

#### Unattended Setup
* [/ext/unattendedsetup/apply](dev-portal-api/ext/unattendedsetup-apply.md)
* [/ext/unattendedsetup/configure](dev-portal-api/ext/unattendedsetup-configure.md)
* [/ext/unattendedsetup/default](dev-portal-api/ext/unattendedsetup-default.md)
* [/ext/unattendedsetup/logging](dev-portal-api/ext/unattendedsetup-logging.md)
* [/ext/unattendedsetup/quickaction](dev-portal-api/ext/unattendedsetup-quickaction.md)
* [/ext/unattendedsetup/remote](dev-portal-api/ext/unattendedsetup-remote.md)
* [/ext/unattendedsetup/test](dev-portal-api/ext/unattendedsetup-test.md)

#### Xbox Live & Accounts
* [/ext/gameeventdata](dev-portal-api/ext/gameeventdata.md)
* [/ext/user](dev-portal-api/ext/user.md)
* [/ext/xblgamesave](dev-portal-api/ext/xblgamesave.md)
* [/ext/xbox/info](dev-portal-api/ext/xbox-info.md)
* [/ext/xboxlive/sandbox](dev-portal-api/ext/xboxlive-sandbox.md)

### Core Management APIs (`/core`)
* [/core/tools](dev-portal-api/core/tools.md)
* [/core/uniqueId](dev-portal-api/core/uniqueid.md)
* [/core/workspaces](dev-portal-api/core/workspaces.md)
