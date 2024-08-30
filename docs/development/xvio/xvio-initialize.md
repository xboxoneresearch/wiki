# XvioInitialize function
Initializes an XVIO Context with the requested ID.

## Syntax
```cpp title='C++'
NTSTATUS XvioInitialize(
    uint64_t XvioContextId,
    uint64_t TargetPartition,
    uint64_t Unk1,
    uint64_t Unk2,
    void (*ReceiveMessageCallback)(
        uint64_t XvioContextId,
        uint64_t RemotePartition,
        uint16_t MessageCode,
        uint32_t DataSize,
        void*    Data
    ),
    void* Callback2
)
```

## Parameters
`UINT32 XvioContextId`  
The unique Context ID for the XVIO instances, acting as a unique identifier for the driver or a link to a remote driver. Do note that only one Context IDs are **unique** meaning two drivers (in the same partition) cannot allocate the same Context ID. It is also worth mentioning that the amount of available XVIO Contexts in a partition is **finite**, totalling **32** IDs.

`UINT64 TargetPartition`  
The target partition (*see [Partition IDs](#)*) - *can be **0**, permitting communication with all remote partitions.*

`UINT64 Unk1`  
Currently unknown ¯\\\_(ツ)_/¯  

`UINT64 Unk2`  
Appears to be a shared structure of some description?

`PVOID ReceiveMessageCallback`  
Pointer to a callback function which is called when a message is received from a *remote* partition. Practically the same function prototype as [XvioPostMessage](#).

`PVOID Callback2`  
Similar to `ReceiveMessageCallback` but doesn't seem to be specific to messages.

## Return value
Returns your standard **NTSTATUS** with some extra XVIO statuses added on top (will document these soon)

## Important notes
When called, *XvioInitialize* checks if the *XvioContextId* has already been initialized. In **most** cases, all context ID's are typically already in use within a partition, meaning a developer would likely have to hijack an XVIO context.  
*Research into this is planned but is* **currently** *impossible, as fully hijacking XVIO contexts would likely require kernel function hooks for callback functions (in all applicable partitions)*