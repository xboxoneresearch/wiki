<!-- TITLE: Console Revisions -->
<!-- SUBTITLE: A quick summary of Console Revisions -->

# Console revisions
## Revisions

| Revision        | Enum | Information            |
| --------------- | ---- | ---------------------- |
| DURANGO         | 0x10 | First retail revision. |
| SILVERTON ZORRO | 0x20 | Xbox One (PHAT)        |
| SILVERTON MANDA | 0x21 | Xbox One (PHAT)        |
| CARMEL BASE     | 0x30 | Xbox One (PHAT)        |
| CARMEL 4K       | 0x31 | TBD                    |
| EDMONTON        | 0x40 | Xbox One S             |
| KEYSTONE        | 0x48 | TBD                    |
| SCORPIO         | 0x50 | Xbox One X             |
| CHUCKWALLA      | 0x58 | Xbox One X DevKit      |
| LOCKHART        | 0x60 | Xbox Series S          |
| ANACONDA        | 0x64 | Xbox Series X          |
| DANTE           | 0x68 | Xbox Series X DevKit   |
| EDINBURGH       | 0x70 | TBD                    |

## Reading revision via software

C code
```
#define CPUID_HW_REV 0x4000000D

int regs[4];
__cpuid(regs, CPUID_HW_REV);
int consoleRevId = regs[2] & 0xFFFF;

printf("Console Revision: 0x%04X\n", consoleRevId);
```

## Physical identification

Right now we can only be sure about motherboard revision mapping.
Mapping to actual console revisions is a very welcome contribution!

### XBOX ONE (PHAT)

| Soldermask part num | Motherboard Revision                  | SOC Type          | SB Type           |
| ------------------- | ------------------------------------- | ----------------- | --------          |
| X877750-003         | Greybull, Retail (Fab M)              | Kryptos / Panther | Kraken / Orion    |
| X902472-006         | Carmel, Retail (Fab F)                | Kryptos / Panther | Kraken / Orion    |
| X887997-001         | Silverton, Retail (Fab M)             | Kryptos / Panther | Kraken / Orion    |
| X887998-001         | Silverton, Retail (Fab M)             | Kryptos / Panther | Kraken / Orion    |

### XBOX ONE S

| Soldermask part num | Motherboard Revision                  | SOC Type          | SB Type           |
| ------------------- | ------------------------------------- | ----------------- | --------          |
| M1087066-001        | Kief, Retail (Fab A)                  | ?                 | ?                 |
| X947889-001         | Kingston, Retail (Fab G)              | Arlene            | Kraken / Orion    |

### XBOX ONE X

| Soldermask part num | Motherboard Revision                  | SOC Type          | SB Type           |
| ------------------- | ------------------------------------- | ----------------- | --------          |
| M1037358-002        | Cactus, Retail (Fab G)                | Anubis            | Kraken / Orion    |

### XBOX SERIES S

| Soldermask part num | Motherboard Revision                  | SOC Type          | SB Type           |
| ------------------- | ------------------------------------- | ----------------- | --------          |
| M1111890-001        | Stockton (Fab B)                      | Sparkman          | Santo             |

### XBOX SERIES X

Xbox Series has 2 PCBs. One for SOC and another for SB circuitry.

Southbridge PCB

| Soldermask part num | Motherboard Revision                  | SB Type           |
| ------------------- | ------------------------------------- | --------          |
| M1127054-001        | SB PCB: Toledo, Debug (Fab E)         | Santo             |
| M1126891-002        | SB PCB: Toledo, Retail (Fab E)        | Santo             |
| M1128162-002        | SB PCB: Toledo, Retail, No RF (Fab E) | Santo             |

SOC PCB

| Soldermask part num | Motherboard Revision                   | SOC Type          |
| ------------------- | -------------------------------------- | ----------------- |
| M1090324-006        | SOC PCB: Toledo, Debug (Fab E)         | Arden             |
| M1125041-002        | SOC PCB: Toledo, Debug (Fab E)         | Arden             |
| M1128163-001        | SOC PCB: Toledo, Retail (Fab E)        | Arden             |
| M1128164-001        | SOC PCB: Toledo, Retail, No RF (Fab E) | Arden             |
