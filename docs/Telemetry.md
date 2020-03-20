# Telemetry
Just like on regular Windows 10, the Xbox One collects telemetry data too.

Most telemetry is collected when you activate "Extended usage data", for example when subscribed to the **Insider program**.

## Deactive telemetry in Dev Mode
The following commands should disable most telemetry service. Unfortunately it needs to be executed on every bootup.
```
sc stop xbblackbox
sc stop etwuploaderservice
sc stop xbdiagservice
sc stop diagtrack
```