# XvioSetFocus function
Used for setting to another partition. Likely used for switching between SystemOS and GameOS.  
It's weird this function is implemented in `xvio.sys` rather than `xvmctrl.sys` as it simply just posts a message to the Xbox VM Manager.

## Syntax
```cpp title='C++'
NTSTATUS XvioSetFocus(
    uint64_t TargetPartition
);
```

## Parameters
`uint64_t TargetPartition`  
The target partition to focus. *See [partition identifiers](./xvio-overview.md/#partition-identifiers) for more info.*

## Return value
Returns a standard **NTSTATUS** value.

## Important notes
**Cannot** be called from GameOS, and will just return **STATUS_ACCESS_DENIED** if this is attempted.