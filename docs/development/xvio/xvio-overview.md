# Overview of XVIO
The *XVIO driver* (`xvio.sys`) facilitates all communication between the virtualized partitions. It's APIs share some similarity with the [Hyper-V Inter-Partition Communication](https://github.com/MicrosoftDocs/Virtualization-Documentation/blob/main/tlfs/Hypervisor%20Top%20Level%20Functional%20Specification%20v6.0b.pdf){:target='blank'} APIs. If you're interested in more details, this document should still apply to XVIO, atleast some-what.

Whilst each partition has it's own version of `xvio.sys`, the differences appear to be minor, as each driver is simply being built using different preprocessor definitions to target different partitions.  

## Service identifiers  
The service identifier is an ID that is unique to an instance of XVIO that is initialized using *[XvioInitialize](./xvio-initialize.md).* In total there are 32 unique identifiers available to a partition. This number is finite as all the services are stored within an array in `xvio.sys`'s data section, where services are allocated to drivers where needed.  

You may find it helpful to think of a service ID as a driver ID. This is because when communicating between partitions, it is the service ID that specifies what driver (on the remote partition) to communicate with. For example, `xvmm.sys` *- the virtual machine manager on HostOS -* uses the service identifier `0xf`. Thus, to communicate with this driver, `xvmctrl.sys` *- the virtual machine control driver on SystemOS -* uses that same ID to send requests to the VM manager. Furthermore, for the sake of continuity, it is common for drivers with similar functionality to use the same service ID on different partitions, despite it not being strictly necessary from a functional stand-point. With this in mind, we can be certain that all drivers related to virtual machine management and control allocate the service ID `0xf` on their respective operating systems.

## Partition identifiers
A lot of the XVIO functions take a partition ID as an argument, allowing for IO with a specified partition. An enumeration outlining these IDs can be found below:  
```cpp
enum PARTITION_ID {
    Any      = 0,
    HostOS   = 1,
    SystemOS = 2,
    GameOS   = 3
};
```

## Very, very important disclaimer
This research is not complete! There's plenty more functions within the XVIO drivers that I simply haven't gotten around to analysing or documenting. For reference, there's around 67 exported functions (excluding DllInitialize and DllUnload) within `xviosra.sys`.  
Oh and also, a lot of information may be missing or some information may seem abstract as we currently cannot know how the hypervisor is actually handling XVIO-related hypercalls. That being said I aim to add a bunch more info on how HostOS is handling things at a lower level! :)