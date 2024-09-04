# XvioGetRingBufferContextSafe
Safe version of *[XvioGetRingBufferContext](./xvio-get-ring-buffer-context.md).* Essentially just checks if the XVIO context is initialized and the *ContextId* parameter matches the ring buffer's context ID.

## Syntax
```cpp title='C++'
PXVIO_RING_BUFFER XvioGetRingBufferContext(
    uint32_t TargetPartition,
    uint32_t ContextId
);
```

## Parameters
`uint32_t TargetPartition`  
The *[Partition ID](../xvio-overview.md/#partition-identifiers)* of the partition the ring buffer targets.

`uint32_t ContextId`  
The *[Context ID](../xvio-overview.md/#context-identifiers)* of the XVIO context the ring buffer targets.

## Return value
Returns a pointer to a **XVIO_RING_BUFFER** structure.