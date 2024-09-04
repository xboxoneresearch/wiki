# XvioReadRingBuffer function
Reads data from a ring buffer into a buffer

## Syntax
```cpp title='C++'
NTSTATUS XvioReadRingBuffer(
    PXVIO_RING_BUFFER RingBuffer,
    void* Buffer,
    size_t* BytesRead
);
```

## Parameters
`PXVIO_RING_BUFFER`  
Pointer to a ring buffer context. Can be retrieved with *[XvioGetRingBufferContext](./xvio-get-ring-buffer-context.md)* or *[XvioGetRingBufferContextSafe](./xvio-get-ring-buffer-context-safe.md).*

`void* Buffer`  
Pointer to a buffer containing the data to be written.

`size_t* BytesRead`  
Pointer to the amount of bytes to read. Also acts as the output for the amount of bytes read.

## Return value
Either returns `0x213`, `0x214`, or a standard **NTSTATUS**. I believe that `0x213` means there's still more data and that `0x214` means the end of the ring buffer was reached during a read. That being said, I'm not 100% certain on this information.