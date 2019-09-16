<!-- TITLE: Console Revisions -->
<!-- SUBTITLE: A quick summary of Console Revisions -->

# Console revisions
## Revisions

| Revision        | Enum | Information            |
| --------------- | ---- | ---------------------- |
| DURANGO         | 0x10 | First retail revision. |
| SILVERTON ZORRO | 0x20 | TBD                    |
| SILVERTON MANDA | 0x21 | TBD                    |
| CARMEL BASE     | 0x30 | TBD                    |
| CARMEL 4K       | 0x31 | TBD                    |
| EDMONTON        | 0x40 | TBD                    |
| SCORPIO         | 0x50 | TBD                    |

## Reading revision via software

C code
```
#define CPUID_HW_REV 0x4000000D

#define HW_REV_DURANGO         0x10
#define HW_REV_SILVERTON_ZORRO 0x20
#define HW_REV_SILVERTON_MANDA 0x21
#define HW_REV_CARMEL_BASE     0x30
#define HW_REV_CARMEL_4K       0x31
#define HW_REV_EDMONTON        0x40
#define HW_REV_SCORPIO         0x50

int regs[4];
__cpuid(regs, CPUID_HW_REV);
int consoleRevId = regs[2] & 0xFFFF;

char *consoleRev = (char *)calloc(1, 0x100);

switch (consoleRevId)
{
case HW_REV_DURANGO:
   consoleRev = "Durango";
   break;
case HW_REV_SILVERTON_ZORRO:
   consoleRev = "Silverton Zorro";
   break;
case HW_REV_SILVERTON_MANDA:
   consoleRev = "Silverton Manda";
   break;
case HW_REV_CARMEL_BASE:
   consoleRev = "Carmel Base";
   break;
case HW_REV_CARMEL_4K:
   consoleRev = "Carmel 4K";
   break;
case HW_REV_EDMONTON:
   consoleRev = "Edmonton";
   break;
case HW_REV_SCORPIO:
   consoleRev = "Scorpio";
   break;
default:
   consoleRev = "Unknown";
}
printf("Console Revision: %s (0x%04X)\n", consoleRev, consoleRevId);
```

## Physical identification

Not known yet