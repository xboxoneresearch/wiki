# XvioGetRingBufferContextSafe
Safe version of *[XvioGetRingBufferContext](./xvio-get-ring-buffer-context.md).* Essentially just checks if the XVIO service is initialized and the *ServiceId* parameter matches the ring buffer's service ID.

## Syntax
```cpp title='C++'
PXVIO_RING_BUFFER XvioGetRingBufferContext(
    uint32_t TargetPartition,
    uint32_t ServiceId
);
```

## Parameters
`uint32_t TargetPartition`  
The *[Partition ID](../xvio-overview.md/#partition-identifiers)* of the partition the ring buffer targets.

`uint32_t ServiceId`  
The *[Service ID](../xvio-overview.md/#service-identifiers)* of the XVIO service the ring buffer targets.

## Return value
Returns a pointer to a **XVIO_RING_BUFFER** structure.