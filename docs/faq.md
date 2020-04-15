# FAQ #

## How to contribute to the Wiki? ##
Contact an admin on the Discord server and explain your motivation and expertise to get authorized with your github account or simply send pull requests to https://github.com/XboxOneResearch/wiki

## What's different between Dev Mode and Retail? ##
The bootslot is determined based on whether or not your console was started in Developer Mode or Retail which will set the target the bootslot for booting up. Initially there was two slots known as  Bootslot "A" and "B" - with recent updates it appears that a third slot has been added known as Bootslot "C" , which purpose is actually unknown. Dev Mode is mostly seperated from Retail mode. The windows registry is built up dynamically for each mode, SystemOS partition (system.xvd) is mounted ReadOnly and settings is seperated into settings.xvd and settings-devkit.xvd. It is important to note that developer mode and retail share very little to none in regards to its operating system files. It is configured at the lowest level which determines what your console can and cannot do.

## OS sandboxes ##
As the console is built with security in mind, the OS layers are seperated in sandboxes.
The system used is known as ''Hydra'' and is supposed to be based on HyperV - with 80% of code written specifically for the use on the Xbox One gaming console.
The base operating system is HostOS, which runs drivers to interact with the hardware and communicate with other OS layers to exchange data / commands. SystemOS or ExclusiveOS/EraOS are preparing data to render and interact with the user.

## Is there telemetry being sent? ##
YES! Basically every single thing is logged and transmitted to telemetry servers. In Dev Mode it appears to be possible to deactivate those services manually, 
The telemetry data that they send in developer mode will be more intense than retail, due to the nature of capturing as much data in regards to the tool usage. However, being in a preview program will also increase the data being sent.

## When can I mod games? ##
Not a target of this project! While this is not in our own priorities, this is will be subject to a future console exploit.

## How does the guest virtual machines communicate with the Host? ##
Named pipes / special kernel broker drivers are used to push data between the OS layers. ...
The Xbox One is known to currently use a driver common on all OS VMs known as "XVIO" which appear to use shared memory ring buffers to communicate between the host and guest virtual machines.

## Can we draw standard Win32 UI? ##
The possibility of "escaping" the UWP sandbox thats originally targeted at homebrew developers is tempting and of course delivers a bigger potential for developers to port applications more easily. However, as the rendering is done in a non-Win32-conform way, it is also a challenge to achieve displaying such Win32 GUI application. See [XboxUI](../xbox-ui) for further info. 
The current Shell UI that is used on the console disables the standard features we see on desktop-based Windows applications, with the Window Chrome that contains the title, minimize, maximize and close buttons.

## Where and how do we get the keys? ##
Getting the keys to the kingdom is a topic that requires much more information and skills. The Xbox One uses the AMD Platform Security Processor (aka PSP), which appears to be designed specifically for Xbox based security and other features, which initialises the boot chain and stores the key(s) in the fuses. However, it also appears that there might be certain content keys stored in the System Kernel Memory and also Host Kernel Memory but this is hard to determine without comprehensive tools.
Keys are are stored in '"keyslots" and are loaded depending on the bootslot / bootmode - this means booting to developer mode just loads the developer keyslot - retails keys wont be loaded and are not accessible for decryption.

There are at least two keyslots as far as we know.
- Retail (Green)
- Development (Red)

Different keys are used for the following purposes:
- Bootloader encryption
- Operating system container encryption (ODK / Offline distribution keys)
- Games / apps (CIK / Content integrity keys)

## Certificates ##
There are at least two major certificates utilized for generic usage: Console certificate and Boot capability certificate. Of course they are signed with an RSA key and therefore cannot be modified. For further info see [Certificates](../certificates).

## Reset Glitch hack? ##
A power glitch hack that made hacking the Xbox 360 feasible for the public was an unforseen technique that led to breaking the secure boot chain of trust [Info](https://recon.cx/2015/slides/recon2015-13-colin-o-flynn-Glitching-and-Side-Channel-Analysis-for-All.pdf) You could say that the designers of the console, that appeared in the end of 2005, were not aware of this possibility. Obviously technique and mitigations evolved since that time, so it is a lot harder to pull off such an attack on the modern Xbox One console. It is expected to have a lot of mitigations implemented (for example: timing checks, excessive data validity checks etc.) 

## There was an Edge exploit - Why did nothing come out of it? ##
Edge, while being a privileged UWP process, still runs in the usual UWP sandbox. Additionally, it is only allowed to communicate with the internet or local network if a valid Xbox Live connection is detected. This means that the operated console has to be running the latest mandatory Systemupdate - exploitation cannot happen offline / undetected.
