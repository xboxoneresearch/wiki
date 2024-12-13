# XvioCreateRingBuffer function
Creates a ring buffer for passing large amounts of data between partitions. Interestingly, it seems to be used as an auxiliary XvioPostMessage in some cases, though the reason for this is unknown.

## Syntax
```cpp title='C++'
NTSTATUS XvioCreateRingBuffer(
    uint32_t ServiceId,
    uint64_t TargetPartition,
    uint16_t Unk1,
    uint32_t ReceivePageCount,
    uint32_t SendPageCount,
    PXVIO_RING_BUFFER RingBuffer
);
```

## Parameters
`uint32_t ServiceId`  
The *[Service ID](../xvio-overview.md/#service-identifiers)* to communicate to on the remote partition.
  
`uint64_t TargetPartition`  
Target partition for the ring buffer to be shared with. *See [partition identifiers](../xvio-overview.md/#partition-identifiers) for a list of partitions and their corresponding IDs.*  
  
`uint16_t Unk1`  
Not sure what this is, seems important though. Perhaps allocation type?  

`uint32_t ReceivePageCount`  
Amount of pages, used for reading data, to be allocated to the ring buffer.  

`uint32_t SendPageCount`  
Amount of pages, used for writing data, to be allocated to the ring buffer.

`PXVIO_RING_BUFFER RingBuffer`  
Pointer to an **XVIO_RING_BUFFER** structure, used for output.  

## Return value
Returns a generic **NTSTATUS** value.

## Under the microscope
Put simply, XvioCreateRingBuffer allocates a user-specified amount of contiguous physical pages. The guest physical address of these pages are then posted to HostOS, amongst other data, with the message code 0x5 - which I've chosen to name *RingBufferAction* as the same code is used when destroying a ring buffer. The local partition then waits for the Ring Buffer's synchronization event to be signalled (presumably by HostOS) before returning the Ring Buffer Context to the caller.  
  
*Research into how HostOS handles a RingBufferAction is planned, I've just yet to get around to it :)*