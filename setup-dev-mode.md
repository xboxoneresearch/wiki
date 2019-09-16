<!-- TITLE: Setup Dev Mode -->
<!-- SUBTITLE: A quick summary of Setup Dev Mode -->

# Setup dev mode
## Prerequisites

  - [App Developer Account](https://developer.microsoft.com/en-us/store/register)
  - [Dev Mode Activation App](https://www.microsoft.com/en-gb/p/dev-mode-activation/9vwgnh0vbn60)
  - [Visual Studio 2019](https://visualstudio.microsoft.com/vs/)
  - Windows 10 (Preferred)
  - PuTTy

## Activation

Before you get started you will need to convert your console into
Developer Mode. Microsoft have an existing page that will show you how
to get started:
<https://docs.microsoft.com/en-us/windows/uwp/xbox-apps/devkit-activation>

It may be worth navigating through their documentation and getting a
grasp on the basis of the environment:
<https://docs.microsoft.com/en-us/windows/uwp/xbox-apps/>

## Visual Studio Setup

In order for you to build Win32 applications and libraries you will need
to install certain libraries available through the Visual Studio
Installer:

|                                   |
| --------------------------------- |
| <https://i.imgur.com/ASeeUAo.png> |

## Using SSH

After your console is activated you will be able to connect over via
PuTTy (or another SSH client of your choice).

  - Enter the console IP address and Connect
  - Use the following to login:
      - Username: DevToolsUser
      - Password is the pin that is displayed on the "Show Visual Studio
        Pin" in Dev Home.
  - Success\!

This will not give you the sufficient priviliges. Fortunately, there is
a way\!

### Requirements

  - USB Drive
  - [superfun](https://gbatemp.net/threads/new-dev-mode-privilege-escalation-exploit-published.540656/)

Make sure that the USB is formatted as NTFS before extracting the
superfun contents to the root of it. Once done, you may plug the USB
into your Xbox One console.

### Xbox One

  - Using PuTTy (or your SSH client of choice) connect to the console
    unless you're already connected
  - Navigate to your USB
      ```
			cd E:\\
			```
  - Execute superfun.exe
  - Voila\!
  - An elevated telnet session has been created.

### Desktop

  - Open Command Prompt as Administrator
  - Enable telnet client by running:
      ```
      DISM /online /enable-feature /featurename:TelnetClient
      ```
  - Connect to the console:
      ```
      telnet <xboxoneip/hostname> 23
      ```
  - You should now be connected\!
  - Navigate to your USB drive
  - Run the following:
      ```
      net1.exe user <username> <password>
      ```

      ```
      net1.exe accounts /MaxPWAge:unlimited
      ```

      ```
      net1.exe localgroup administrators <username> /add
      ```

Now you can reconnect to the console via SSH or SMB using your new user.

## Accessing Console File System

Open up the File Explorer on your Windows machine and enter the
following into your path bar:

`\\<Xbox One IP/Hostname>`

It will prompt you for login details. We can use the Xbox Device Portal
for this:

  - Open up your web browser and enter:
    `https://<xboxoneip/hostname>:11443`
  - Go to File explorer
  - On the right hand side; you will see "Browse"
  - Select it and use the login details provided