<!-- TITLE: Xbox WinRT -->
<!-- SUBTITLE: Small lookover of the WinRT on Xbox -->

# Xbox One Windows Runtime
An overview and guide to the WinRT used on the Xbox One and how to use these in your 
universal windows applications.

The Windows Runtime is an API based on COM that allows interfacing from multiple programming languages and can be instanced from
other services that register class objects. These are usually stored in the '.winmd' format that defines the information for each object
within. The Xbox One makes great use of both WinRT and COM but it primarily uses the WinRT
for the inbox applications (e.g. Dashboard) while store apps are not able to use them officially.

# Using the Xbox Windows Runtime
We can utilise the runtime for the Xbox One by directly referencing the Windows.Xbox.winmd that is located on the system boot drive 
(C:\Windows\System32\WinMetadata) in our Windows Runtime Library (C++). This will allow you to wrap around functionality natively and expose
it to your application if it is written in another language such as C#. 

You can also extract more explicit information for manual use in a command line project with the utilities in the Windows SDK.

## Extracting header and idl files
1. Open the Developer Command Prompt and navigate to the dumped directory of the consoles "C:\Windows\System32\WinMetadata" location.
2. Run: winmidl /nologo /outdir:"[Full path to extraction folder]" [Full path to target file].winmd
3. Run: midlrt "[Path of extracted IDL file]" /metadata_dir "[Path to Xbox WinMetadata folder]"
4. Done!

Once they are extracted, you could then include the generated files but the preferred approach is to redefine the interfaces in your project
and do manual activation - you can see this done in XboxUnattend.

# Resources
https://docs.microsoft.com/en-us/uwp/winrt-cref/winmd-files
https://docs.microsoft.com/en-us/cpp/cppcx/wrl/use-winmdidl-and-midlrt-to-create-h-files-from-windows-metadata?view=vs-2019
