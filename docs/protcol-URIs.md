# Protocol URIs (deep links)
Protocol URI are used to provide a means for apps to start other apps. An example of protocol URIs being used can be found in the url (`ms-windows-store://`) used to activate the store on the page for a certain app. Protocol URIs are also know as deep links or launch URIs. Info on how to implement them into your uwp app can be found [here](https://docs.microsoft.com/en-us/windows/uwp/launch-resume/handle-uri-activation).

## System apps:
The following list shows a complete list of deep links as of `10.0.19041.6630 (xb_flt_2103vb.210210-0000)` there may be a small number missing.
These were dumped by pulling all of the appx manifests accessible to a custom admin account in dev mode and then parsing all of them to get the protocol URIs.

| Package Family Name                  | URI                                                            |
| ------------------------------------ | -------------------------------------------------------------- |
| Xbox.Guide                           | [guide://](guide://)                                           |
| Microsoft.XboxEvents                 | [xbox-events://](xbox-events://)                               |
| Xbox.Dashboard                       | [xbox-gamehub://](xbox-gamehub://)                             |
| Microsoft.MicrosoftEdge              | [http://](http://)                                             |
| Xbox.Dashboard                       | [achievements://](achievements://)                             |
| Xbox.Dashboard                       | [ms-xbox-achievements://](ms-xbox-achievements://)             |
| Microsoft.Xbox.Settings              | [kinecttuner://](kinecttuner://)                               |
| Xbox.Dashboard                       | [ms-xbox-gamedvr2://](ms-xbox-gamedvr2://)                     |
| Microsoft.MicrosoftEdge              | [https://](https://)                                           |
| Microsoft.Xbox.LiveTV                | [ms-xbl-162615ad://](ms-xbl-162615ad://)                       |
| Microsoft.MicrosoftEdge              | [ms-xbl-3d8b930f://](ms-xbl-3d8b930f://)                       |
| XdashLauncher                        | [ms-xdash://](ms-xdash://)                                     |
| Xbox.Dashboard                       | [social://](social://)                                         |
| Microsoft.WindowsStore               | [zune://](zune://)                                             |
| Xbox.SingleUserProxy                 | [xsingleuserproxy://](xsingleuserproxy://)                     |
| Xbox.Dashboard                       | [gamedvr2://](gamedvr2://)                                     |
| Microsoft.MicrosoftEdge              | [read://](read://)                                             |
| Microsoft.XboxDevices                | [xboxaccessories://](xboxaccessories://)                       |
| XdashLauncher                        | [ms-subscription://](ms-subscription://)                       |
| Xbox.NetworkTroubleshooter           | [networktroubleshooter://](networktroubleshooter://)           |
| Microsoft.Xbox.Settings              | [ms-settings://](ms-settings://)                               |
| Microsoft.Xbox.DevHome               | [ms-xbl-1c835833://](ms-xbl-1c835833://)                       |
| Microsoft.XboxCare                   | [ms-oobe://](ms-oobe://)                                       |
| Xbox.SignIn                          | [signin://](signin://)                                         |
| Microsoft.StorePurchaseApp           | [ms-xbet-survey://](ms-xbet-survey://)                         |
| Microsoft.CloudExperienceHost        | [ms-device-enrollment://](ms-device-enrollment://)             |
| Microsoft.WindowsStore               | [ms-windows-store2://](ms-windows-store2://)                   |
| Xbox.BroadcastSetup                  | [xpositioningtcui://](xpositioningtcui://)                     |
| Xbox.StorageManagement               | [storagemanagement://](storagemanagement://)                   |
| Microsoft.Microsoft.Xbox.AdsLauncher | [ms-ad-hwa://](ms-ad-hwa://)                                   |
| Xbox.Dashboard                       | [ms-xbox-dashboard://](ms-xbox-dashboard://)                   |
| Microsoft.MicrosoftEdge              | [microsoft-edge-holographic://](microsoft-edge-holographic://) |
| Microsoft.XboxDevices                | [ms-xbl-2d34608b://](ms-xbl-2d34608b://)                       |
| Microsoft.Xbox.Settings              | [ms-xbl-6d83c5c3://](ms-xbl-6d83c5c3://)                       |
| Xbox.Dashboard                       | [ms-xbl-achievements://](ms-xbl-achievements://)               |
| Xbox.EditorialHost                   | [editorialhost://](editorialhost://)                           |
| Microsoft.XboxCare                   | [xhelp://](xhelp://)                                           |
| Microsoft.Xbox.Settings              | [settings://](settings://)                                     |
| Microsoft.MicrosoftEdge              | [microsoft-edge://](microsoft-edge://)                         |
| Xbox.Dashboard                       | [ms-xbl-gamedvr2://](ms-xbl-gamedvr2://)                       |
| Microsoft.Xbox.LiveTV                | [ms-xbox-livetv://](ms-xbox-livetv://)                         |
| Microsoft.WindowsStore               | [xboxmusic://](xboxmusic://)                                   |
| Xbox.Dashboard                       | [screenshots://](screenshots://)                               |
| Microsoft.QuickBuy                   | [ms-xbox-quickbuy://](ms-xbox-quickbuy://)                     |
| Xbox.VideoPlayer                     | [xpreviewkiosk://](xpreviewkiosk://)                           |
| Xbox.Dashboard                       | [xbox-club://](xbox-club://)                                   |
| Microsoft.NTSCaptivePortal           | [ntscaptiveportal://](ntscaptiveportal://)                     |
| XdashLauncher                        | [ms-survey://](ms-survey://)                                   |
| Microsoft.Xbox.TvSettings            | [ms-xbox-tvsettings://](ms-xbox-tvsettings://)                 |
| Xbox.HDRGameCalibration              | [hdrgamecalibration://](hdrgamecalibration://)                 |
| Xbox.Dashboard                       | [gameclips://](gameclips://)                                   |
| Xbox.IdleScreen                      | [idlescreen://](idlescreen://)                                 |
| Microsoft.CloudExperienceHost        | [ms-cxh://](ms-cxh://)                                         |
| Xbox.Dashboard                       | [ms-xbl-281d1c2f://](ms-xbl-281d1c2f://)                       |
| Xbox.TrialOverlay                    | [trialoverlay://](trialoverlay://)                             |
| Xbox.SU                              | [systemupdatenew://](systemupdatenew://)                       |
| Microsoft.Xbox.OOBE                  | [oobe://](oobe://)                                             |
| Xbox.VideoPlayer                     | [xpreview://](xpreview://)                                     |
| Microsoft.XboxCare                   | [ms-xcare://](ms-xcare://)                                     |
| Microsoft.WindowsStore               | [microsoftmusic://](microsoftmusic://)                         |
| Microsoft.WindowsStore               | [ms-windows-store://](ms-windows-store://)                     |
| Xbox.Dashboard                       | [library://](library://)                                       |
| Microsoft.storify                    | [ms-windows-store://](ms-windows-store://)                     |
| Microsoft.WindowsStore               | [microsoftvideo://](microsoftvideo://)                         |
| XdashLauncher                        | [ms-content-picker://](ms-content-picker://)                   |


