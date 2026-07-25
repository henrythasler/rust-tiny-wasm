# Developer Documentation

## Header Layout

| Offset | Size | Type   | Name         | Description |
|----------|------|--------|--------------|-------------|
| 0x00 | n*8 | (u32, u32) | func_table | tuple of (offset, type_index) for each function |
