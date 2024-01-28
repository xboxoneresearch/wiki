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

Not known yet
