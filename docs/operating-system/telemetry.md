# Telemetry
Just like on regular Windows 10, the Xbox One collects telemetry data too.

Most telemetry is collected when you activate "Extended usage data", for example when subscribed to the **Insider program**.

The source of telemetry data is [Event Tracing](./event-tracing.md)

## Deactive telemetry in Dev Mode
The following commands should disable most telemetry service. Unfortunately it needs to be executed on every bootup.
```
sc stop xbblackbox
sc stop etwuploaderservice
sc stop xbdiagservice
sc stop diagtrack
```

## Telemetry Endpoints
The following urls are known telemetry endpoints, blocking them on a DNS level (Such as with PiHole) is sufficient to prevent *most* telemetry. 
> https://v10.events.data.microsoft.com/OneCollector/1.0/ - running processes, services and imported libraries, device info, UI frame Dumps, Controller Status, WinRT Calls, Telemetry Metric and Health Check, GPU Failures.

> https://v20.events.data.microsoft.com/OneCollector/1.0/ - "TailoredExperiences Feedback"

> https://settings-win.data.microsoft.com/settings/v3.0/xbox/XboxOneTelemetry - https://titleos.dev/manipulating-xbox-live-flighting/

> https://watson.telemetry.microsoft.com/Telemetry.Request - Unknown returns HTTP 408.
