# Firewall

Xbox makes use of the *advanced firewall* feature in Windows, utilizing *WFP (Windows Filtering platform*).

Initially it looked like modifying the [registry](./registry.md#firewall) would be the way to go..

Turns out that for opening an incoming port you rather want to:

- Disable the firewall profiles (domain, public, private)
- Create a new WFP rule

Code how to accomplish that can be found in [Solstice](https://github.com/exploits-forsale/solstice/blob/4158384c998f6d13a98e5025c5feb055cf37263e/crates/solstice_daemon/src/main.rs#L70-L80)

See also: [WFP - Microsoft docs](https://learn.microsoft.com/en-us/windows/win32/fwp/using-windows-filtering-platform)