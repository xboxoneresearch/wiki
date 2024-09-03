# XvioWriteRingBuffer function
Writes to some data to a ring buffer.

## Syntax
```cpp title='C++'
NTSTATUS XvioWriteRingBuffer(
    PXVIO_RING_BUFFER RingBuffer,
    void* Buffer,
    size_t Length,
    void** Unk1
);
```

## Parameters
`PXVIO_RING_BUFFER RingBuffer`  
Pointer to a ring buffer context. Can be retrieved with *[XvioGetRingBufferContext](./xvio-get-ring-buffer-context.md)* or *[XvioGetRingBufferContextSafe](./xvio-get-ring-buffer-context-safe.md).*

`void* Buffer`  
Pointer to a buffer containing the data to be written.

`size_t Length`  
Amount of bytes to be written from the user-specified buffer into the ring buffer.  

`void** Unk1`  
Unknown :/ 

## Return value
Returns a standard **NTSTATUS** value.