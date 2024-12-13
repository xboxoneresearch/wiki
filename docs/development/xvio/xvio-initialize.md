# XvioInitialize function
Initializes an XVIO Service with the requested ID.

## Syntax
```cpp title='C++'
NTSTATUS XvioInitialize(
    uint32_t XvioServiceId,
    uint64_t TargetPartition,
    uint64_t Unk1,
    uint64_t Unk2,
    void (*ReceiveMessageCallback)(
        uint64_t XvioServiceId,
        uint64_t RemotePartition,
        uint16_t MessageCode,
        uint32_t DataSize,
        void*    Data
    ),
    void* Callback2
);
```

## Parameters
`uint32_t XvioServiceId`  
The unique Service ID for the XVIO instances, acting as a unique identifier for the driver or a link to a remote driver. Do note that only one Service IDs are **unique** meaning two drivers (in the same partition) cannot allocate the same Service ID. It is also worth mentioning that the amount of available XVIO Services in a partition is **finite**, totalling **32** IDs. *For more detail, see [service identifiers](./xvio-overview.md/#service-identifiers).*

`uint64_t TargetPartition`  
The target partition (*see [Partition IDs](./xvio-overview.md/#partition-identifiers)*) - *can be **0**, permitting communication with all remote partitions.*

`uint64_t Unk1`  
Currently unknown ¯\\\_(ツ)_/¯  

`uint64_t Unk2`  
Appears to be a shared structure of some description?

`void* ReceiveMessageCallback`  
Pointer to a callback function which is called when a message is received from a *remote* partition. Practically the same function prototype as [XvioPostMessage](./xvio-post-message.md).

`void* Callback2`  
Similar to `ReceiveMessageCallback` but doesn't seem to be specific to messages. It's possible that this is meant to be a callback to an error handler function, but I have yet to confirm this.

## Return value
Returns your standard **NTSTATUS** with some extra XVIO statuses added on top (will document these soon)

## Important notes
When called, *XvioInitialize* checks if the *XvioServiceId* has already been initialized. In **most** cases, all service ID's are typically already in use within a partition, meaning a developer would likely have to hijack an XVIO service.  
*Research into this is planned but is* **currently** *impossible, as fully hijacking XVIO services would likely require kernel function hooks for callback functions (in all applicable partitions)*