# XvioCleanup function
Cleans up and frees an XVIO Context ID. Also destroys the allocated ring buffer, if one has been allocated.

## Syntax
```cpp title='C++'
NTSTATUS XvioCleanup(
    uint32_t XvioContextId
);
```

## Parameters
`uint32_t XvioContextId`  
The ID of the context to be cleaned up, same as the one created with *XvioInitialize.*

## Return value
Returns a generic **NTSTATUS** value.
