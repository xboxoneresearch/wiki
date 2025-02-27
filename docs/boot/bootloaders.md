<!-- TITLE: Bootloaders -->
<!-- SUBTITLE: A quick summary of Bootloaders -->

# Bootloaders
Bootloaders used on Xbox One.

## Bootchain overview

This is a broad overview of the secure-bootchain of Xbox One PHAT/S/X.

The Xbox Series-family might differ slightly from this, as they use a different primary bootmedium (SSD instead of eMMC Flash).

```mermaid
sequenceDiagram
  autonumber

  box Southbridge
    participant smc as SMC
  end

  box APU (ARM)
    participant sp as Security Processor<br>SP
    participant scp as Streaming Crypto Processor<br>SCP
  end

  box APU (x86)
    participant cpu as CPU<br>x64
  end

  box Hydra
    participant hv as Hypervisor
    participant hostos as HostOS
    participant systemos as SystemOS
    participant titleos as TitleOS
  end

note over smc: 0SMCBL (ROM)
note over smc: 1SMCBL<br>(Flash: 1smcbl_*.bin)
note over smc: 2SMCBL<br>SMCFW<br>(Flash: smcfw.bin)

smc->>sp: Powerup SP
smc->smc: SMC mainloop

note over sp: 0SP (ROM)

critical boot.bin
    note over sp: 1SP (Flash)
    note over sp: 2SP (Flash)
    sp->>cpu: Decrypt / Load 2BL
    note over cpu: 2BL
    cpu->>scp: Decrypt / Load SCP FW
    note over cpu: Host VBI
    cpu->>scp: Decrypt / Upload keytable
    cpu->>hv: Load hvax64
    cpu->>hostos: Load Host VBI
end

note over cpu: Host XVD (Flash)
cpu->>hostos: Load host.xvd

opt Recovery mode
    hostos->>hostos: Show Recovery Menu
end

critical system.xvd
    note over hostos: System VBI (HDD)
    hostos->>systemos: Load System VBI
    note over hostos: System XVD (HDD)
    hostos->>systemos: Load system.xvd
end
note over systemos: Start Game
systemos->>hostos: Request VM Start

critical Game XVC
    note over hostos: ERA / GameCore VBI<br>(HDD)
    hostos->>titleos: Load Host VBI
    note over hostos: ERA / GameCore XVD<br>(HDD)
    hostos->>titleos: Load host.xvd
end
```

## SPBL

Primary bootloader that is used for initialising the Security Processor,
decrypting the future stages, verifying the console certificates, fuses
and more. This sequence is split into 3 boot stages.

  - 0SP : Stored in SP ROM (factory)
  - 1SP : Patched into boot.bin
  - 2SP : Patched into boot.bin

## SMC

  - 0SMCBL: Stored in SB ROM (factory)
  - 1SMCBL: In Flash, named `1smcbl_{a,b}.bin`
  - 2SMCBL / SMCFW: In Flash, named `smcfw.bin`

## 2BL

Started after the SP has completed its boot. Proceeds to intialise the
rest of the console and then begins booting into the Host VBI.

## SCP
(S)treaming (C)rypto (P)rocessor - internal crypto engine on the APU die.
Data blob that is uploaded to the SCP, for initialization?!
Initialization phase: Unknown, somewhere in between 2BL and VBI.

## VBI

Final boot stage which initialises the critical components of the
operating system, and essentially acts as a bootstrap.
