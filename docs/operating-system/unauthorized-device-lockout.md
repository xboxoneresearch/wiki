# Unauthorized Xbox Device Lockout & Enforcement

**PRELIMINARY RESEARCH**
## `hklm\osdata\software\microsoft\durango\Enforcement`
Early research suggests that the lockout of unauthorized Xbox devices is controlled by the above reg key.
On a Retail Series X console, the value is set to "UnauthorizedDeviceFlag : 1" in the PublicInsider10 (Skip Ahead) ring. In theory, deleting the key would disable the lockout system, however this has yet to be tested.

### Notes
* The [LiveSettings](https://settings-win.data.microsoft.com/settings/v3.0/xbox/XboxOneShellFeatures) flighting system provisions the key, it is believed to be based on the value: `AccessoryEnforcement
A91B1992-AE37-4936-A220-5384CC830F88`