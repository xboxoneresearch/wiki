# XvioPostMessage function
Sends a message (asynchronously) to the target partition. The message is then handled by an *XVIO service* within one of the remote partition's drivers. 

## Syntax
```cpp title='C++'
NTSTATUS XvioPostMessage(
    uint32_t TargetServiceId,
    uint64_t TargetPartition,
    uint64_t MessageCode,
    uint16_t DataSize,
    void* Data
);
```

## Parameters
`uint32_t TargetServiceId`  
The service ID of the target XVIO instance *(pretty much the target driver)* on the target partition.

`uint64_t TargetPartition`  
Pretty self-explanatory, the partition the message is targeted to, be it HostOS, SystemOS or GameOS. *See [Partition IDs](./xvio-overview.md#partition-identifiers) for more details.*

`uint64_t MessageCode`  
The code that is being posted, practically designating the action to be performed by the target.

`uint16_t DataSize`  
Specifies the size of the *Data* buffer in bytes, with a maximum of 232 bytes total -- *can be 0.*

`void* Data`  
Pointer to the data to be sent to the target -- *can be NULL.*

## Return value
Returns your standard **NTSTATUS** with some extra XVIO statuses added on top (will document these soon)