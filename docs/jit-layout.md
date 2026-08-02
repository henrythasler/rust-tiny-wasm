# Developer Documentation

## Header Layout

| Offset | Size | Type   | Name         | Description |
|----------|------|--------|--------------|-------------|
| 0x00 | n*8 | (u32, u32) | func_table | tuple of (offset, type_index) for each function |

## Runtime Context

The Runtime Context is a struct that provides pointers and other dynamic runtime information to the jit code.

