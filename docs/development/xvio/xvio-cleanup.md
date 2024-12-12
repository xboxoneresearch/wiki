# XvioCleanup function
Cleans up and frees an XVIO Service ID. Also destroys the allocated ring buffer, if one has been allocated.

## Syntax
```cpp title='C++'
NTSTATUS XvioCleanup(
    uint32_t XvioServiceId
);
```

## Parameters
`uint32_t XvioServiceId`  
The ID of the service to be cleaned up, same as the one created with *XvioInitialize.*

## Return value
Returns a generic **NTSTATUS** value.
