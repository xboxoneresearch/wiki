<!-- TITLE: Xbox Ui -->
<!-- SUBTITLE: A quick summary of Xbox Ui -->

# XboxUI
## General

XboxUI is the rendering engine / framework that is used to display
windows in SystemOS. The framework is located in system.xvd =\>
C:\\Windows\\XboxUI.

## Components

![XboxUI Schema](xbox-ui/xboxui_schema.png)

## Win32 process rendering

Generally incompatible due to lack of win32kfull.sys. SystemOS instead uses win32kmin.sys like Windows IoT. Win32kmin lacks windowing support. 