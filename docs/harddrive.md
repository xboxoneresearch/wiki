# Harddrive

The console comes with an integrated harddrive and also supports external harddrives via USB 3.0.
Using an external harddrive to store apps and games requires the drive to be USB 3.0 and storage to be 128GB or bigger.

Both, either internal or external, drive use [GUID/GPT](https://en.wikipedia.org/wiki/GUID_Partition_Table) partitioning
scheme and [NTFS](https://en.wikipedia.org/wiki/NTFS) as drive format.

An external USB 3.0 drive, after being formatted on the console, is normally non-accessible on a PC due to a non-standard
*Boot Signature* being written to the first sector of the drive. 

## Internal harddrive
The console supports 500GB, 1TB and 2TB harddrives (state: 09/2019).
Internal harddrive uses specific partition GUIDs and partition labels.

## Partitions
1. Temp Content
2. User Content
3. System Support
4. System Update
5. System Update 2

## Partition GUIDs
| Name / Part Label | Guid                                 | Size (bytes) | Size (GB)  |
|-------------------|--------------------------------------|--------------|------------|
| Temp Content      | B3727DA5-A3AC-4B3D-9FD6-2EA54441011B | 44023414784  |        41  |
| User Content      |              *variable*              |   *variable* | *variable* |
| System Support    | C90D7A47-CCB9-4CBA-8C66-0459F6B85724 | 42949672960  |        40  |
| System Update     | 9A056AD7-32ED-4141-AEB1-AFB9BD5565DC | 12884901888  |        12  |
| System Update 2   | 24B2197C-9D01-45F9-A8E1-DBBCFA161EB2 |  7516192768  |         7  |

### User partition GUIDs
| Harddrive size | Guid                                 | Partition size (bytes) | Partition size (GB)  |
|----------------|--------------------------------------|------------------------|----------------------|
| 500 GB         | A2344BDB-D6DE-4766-9EB5-4109A12228E5 |           391915765760 |                 365  |
|   1 TB         | 25E8A1B2-0B2A-4474-93FA-35B847D97EE5 |           838592364544 |                 781  |
|   2 TB         | 5B114955-4A1C-45C4-86DC-D95070008139 |          1784558911488 |                1662  |


## External harddrive
When a USB 3.0 drive is formatted for apps/games usage by the console, it gets rendered unreadable by a PC by writing a
special, non-standard boot signature.

By overwriting the custom xbox signature with the regular, expected bytes makes the drive being recognized and mountable
on a PC.

## Boot signature marker
The boot signature is located in the first sector of the drive at offset: __0x1FE__

| Type          | Boot signature |
|---------------|----------------|
| Regular (MBR) | 55 AA          |
| Xbox One      | 99 CC          |

Note: Even if 55 AA indicates MBR normally, for GPT it is just marking the "Protective MBR", to secure GUID partition against
ovewriting by non-GPT aware applications.