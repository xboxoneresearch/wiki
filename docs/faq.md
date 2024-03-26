# FAQ #

## How to contribute to the Wiki? ##
Simply send pull requests to https://github.com/XboxOneResearch/wiki

## What's different between Dev Mode and Retail? ##
The bootslot is determined based on whether or not your console was started in Developer Mode or Retail which will set the target the bootslot for booting up. In practice there are two slots known as  Bootslot "A" and "B" - with a third slot, Bootslot "C" , being reserved for use on internal devkits and their potentially unique update process. Dev Mode is mostly seperated from Retail mode. The windows registry is built up dynamically into memory for each mode, SystemOS partition (system.xvd) is mounted ReadOnly from the flash and settings is seperated into settings.xvd and settings-devkit.xvd. It is important to note that developer mode and retail share very little to none in regards to its user or configurable files. It is configured at the lowest level by the hypervisor which determines what your console can and cannot do.

## OS sandboxes ##
As the console is built with security in mind, the OS layers are seperated in sandboxes.
The system used is known as ''Hydra'' and is supposed to be based on HyperV - with 80% of code written specifically for the use on the Xbox One gaming console.
The base operating system is HostOS, which runs drivers to interact with the hardware and communicate with other OS layers to exchange data / commands. SystemOS or TitleOS/GameOS are preparing data to render and interact with the user.

## I heard the console has three (or more) operating systems ##
Correct. As briefly mentioned above, the Xbox One/Series platform makes use of multiple virtual machines and a Hyper-V fork. HostOS, the smallest of the operating systems, with around a 90MB footprint, runs the Xbox Virtual Machines and interfaces directly with the hardware and hypervisor. Next is SystemOS, which runs all applications, such as the dashboard and guide, but also UWP games like Minecraft through expanded resources. In the case of XDK/GameCore games, HostOS starts the ERA VM and SystemOS starts several proxy related programs to handle passing controller inputs and video/audio. For XDK games, the legacy TitleOS is then booted on the ERA VM, while GC games use GameOS. (Once called GameCoreOS) It should be noted that all Xbox operating systems outside of SysteemOS make use of the LNM Kernel fork. 

## Is there telemetry being sent? ##
YES! Basically every single thing is logged and transmitted to telemetry servers. In Dev Mode it appears to be possible to deactivate those services manually, 
The telemetry data that they send in developer mode will be more intense than retail, due to the nature of capturing as much data in regards to the tool usage. However, being in a preview program will also increase the data being sent. The following script can be employed with an Administrator account in DevMode to disable and delete the telemetry services: https://github.com/xboxoneresearch/XboxDevModeBatchScripts/blob/main/removetelemetry.bat 

## When can I mod games? ##
Not a target of this project! While this is not in our own priorities, this is will be subject to a future console exploit.

## How does the guest virtual machines communicate with the Host? ##
Named pipes / special kernel broker drivers are used to push data between the OS layers. ...
The Xbox One is known to currently use a driver common on all OS VMs known as "XVIO" which appear to use shared memory ring buffers to communicate between the host and guest virtual machines.

## Can we draw standard Win32 UI? ##
The possibility of "escaping" the UWP sandbox thats originally targeted at homebrew developers is tempting and of course delivers a bigger potential for developers to port applications more easily. However, as the rendering is done in a non-Win32-conform way, it is also a challenge to achieve displaying such Win32 GUI application. See [XboxUI](operating-system/xbox-ui.md) for further info. 
Traditional Win32 rendering is very unlikely to be possible on SystemOS. Like Windows IoT, the System VM makes use of the win32kmin.sys windowing driver rather than the full win32k.sys or win32kfull.sys employed by Client and Desktop, which doesn't support rendering more than one window at a time. Microsoft has tricks to supplement this (which can be seen in cases of the guide and dash being open, etc), however they are not known at this time. 

## Where and how do we get the keys? ##
Getting the keys to the kingdom is a topic that requires much more information and skills. The Xbox One uses the AMD Platform Security Processor (aka PSP), which appears to be designed specifically for Xbox based security and other features, which initialises the boot chain and stores the key(s) in the fuses. However, it also appears that there might be certain content keys stored in the System Kernel Memory and also Host Kernel Memory but this is hard to determine without comprehensive tools.
Keys are are stored in '"keyslots" and are loaded depending on the bootslot / bootmode - this means booting to developer mode just loads the developer keyslot - retails keys wont be loaded and are not accessible for decryption.

There are at least two keyslots as far as we know.
- Retail (Green)
- Development (Red)
Note: There are currently two sets of Red keys, one of which is no longer used. The result of this split was likely a number of sensitive leaks over the years. 

Different keys are used for the following purposes:
- Bootloader encryption
- Operating system container encryption (ODK / Offline distribution keys)
- Games / apps (CIK / Content integrity keys)

## Certificates ##
There are at least two major certificates utilized for generic usage: Console certificate and Boot capability certificate. Of course they are signed with an RSA key and therefore cannot be modified. For further info see [Certificates](security/certificates.md).

## Reset Glitch hack? ##
A power glitch hack that made hacking the Xbox 360 feasible for the public was an unforseen technique that led to breaking the secure boot chain of trust [Info](https://recon.cx/2015/slides/recon2015-13-colin-o-flynn-Glitching-and-Side-Channel-Analysis-for-All.pdf) You could say that the designers of the console, that appeared in the end of 2005, were not aware of this possibility. Obviously technique and mitigations evolved since that time, so it is a lot harder to pull off such an attack on the modern Xbox One console. It is expected to have a lot of mitigations implemented (for example: timing checks, excessive data validity checks etc.) 

## There was an Edge exploit - Why did nothing come out of it? ##
Edge, while being a privileged UWP process, still runs in the usual UWP sandbox. Additionally, it is only allowed to communicate with the internet or local network if a valid Xbox Live connection is detected. This means that the operated console has to be running the latest mandatory Systemupdate - exploitation cannot happen offline / undetected.


## Why is my console's power LED flashing after I did XYZ or nothing at all? ##
This indicates that your SystemOS has bugchecked, and HostOS is in the process of making an encrypted crash dump before rebooting the VM. If you don't want to wait for the process to complete, unplugging and replugging your console to interrupt the process will not harm it.