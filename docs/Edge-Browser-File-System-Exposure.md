#Xbox Edge Browser - File System Exposure

## Metadata
|                             |                                                     |
|-----------------------------|-----------------------------------------------------|
|Release date                 |                                           *unknown* |
|Author                       |                                             TitleOS |
|Classification               |                                         File Access |
|Patched                      |                              unknown (presumed yes) |
|Patch date                   |                                           *unknown* |
|First patched system version |                                           *unknown* |
|Source                       |                  https://titleos.dev/xploring-xbox/ |

## Info
Access local volumes using the Edge browser.

- Edge’s address bar allowed access of local files on the device via the File:\\ protocol.
- This functionality is used for viewing local PDFs, etc but as the Xbox file system isn’t normally accessible, this allowed for the dumping of Xbox binaries.
- Any valid path would trigger a download prompt, copying the file to the user's download folder where it was accessible via the File Browser application.

This has been mitigated by the fact that the File Explorer application was disabled due to ["Limited Usage"](https://twitter.com/xboxinsider/status/1202357755140546560)

## Instructions
 - Enter any valid path into the edge browser url bar and prepend `File:\\`
 
# Credits:
https://titleos.dev/xploring-xbox/
