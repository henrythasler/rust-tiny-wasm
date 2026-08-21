# Developer Documentation

## JIT Layout

- Function machinecode is compiled back-to-back in the order defined in the code section.
- Size of each function is padded to 8 bytes using `nop` instructions.

## Runtime Context

The Runtime Context is a struct that provides pointers and other dynamic runtime information to the jit code.

