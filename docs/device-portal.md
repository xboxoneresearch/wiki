# Device Portal
The Xbox one has a Device that enables developers to install apps and recieve other data

## Managing the Device Portal
### Stoping the Device Portal
`sc stop webmanagement`
### Starting the Device Portal
`sc start webmanagement`
### Starting the Device Portal in debug mode
`WebManagement.exe -debug -HttpPort 11443 -TraceLevel 5`
### Getting the additional arguments from the Device Portal
`WebManagement.exe /?`
## API
### EXT
* [/ext/app/deployinfo](dev-portal-api/ext/app-deployinfo.md)
* [/ext/app/sshpins](dev-portal-api/ext/app-sshpins.md)
* [/ext/fiddler](dev-portal-api/ext/fiddler.md)
* [/ext/httpmonitor/sessions](dev-portal-api/ext/httpMonitor-sessions.md)
* [/ext/networkcredentials](dev-portal-api/ext/networkcredentials.md)
* [/ext/remoteinput](dev-portal-api/ext/remoteinput.md)
* [/ext/remoteinput/controllers](dev-portal-api/ext/remoteinput-controllers.md)
* [/ext/screenshot](dev-portal-api/ext/screenshot.md)
* [/ext/settings](dev-portal-api/ext/settings.md)
* [/ext/smb/developerfolder](dev-portal-api/ext/smb-developerfolder.md)
* [/ext/user](dev-portal-api/ext/user.md)
* [/ext/xbox/info](dev-portal-api/ext/xbox-info.md)
* [/ext/xboxlive/sandbox](dev-portal-api/ext/xboxlive-sandbox.md)
### API
* [/api/app/packagemanager/package](dev-portal-api/api/app-packagemanager-package.md)
* [/api/app/packagemanager/register](dev-portal-api/api/app-packagemanager-register.md)
* [/api/app/packagemanager/upload](dev-portal-api/api/app-packagemanager-upload.md)
* [/api/appx/packagemanager/package](dev-portal-api/api/appx-packagemanager-package.md)