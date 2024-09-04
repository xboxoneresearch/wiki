# XvioGetRingBufferContext function
One would assume this function returns a pointer to a ring buffer context but instead, this appears to always return 0? Thus, for getting a ring buffer context, *[XvioGetRingBufferContextSafe](./xvio-get-ring-buffer-context-safe.md)* should be used instead as it actually returns a pointer to the ring buffer context.  
  
*Once I find any uses of XvioGetRingBufferContext in any drivers, I'll do a little research and update this page. But for now, this function shall remain a weird one.*