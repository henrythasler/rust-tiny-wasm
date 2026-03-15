
./tests/assets/jit/parameters.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000014 get_const_i32
0000000000000014 l     F .text	000000000000001c get_const_i64


Contents of section .text:
 0000 fd7bbfa9 fd030091 48058052 fd7bc1a8  .{......H..R.{..
 0010 c0035fd6 fd7bbfa9 fd030091 088a80d2  .._..{..........
 0020 683faef2 e823c0f2 fd7bc1a8 c0035fd6  h?...#...{...._.

Disassembly of section .text:

0000000000000000 <get_const_i32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	52800548 	mov	w8, #0x2a                  	// #42
   c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  10:	d65f03c0 	ret

0000000000000014 <get_const_i64>:
  14:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  18:	910003fd 	mov	x29, sp
  1c:	d2808a08 	mov	x8, #0x450                 	// #1104
  20:	f2ae3f68 	movk	x8, #0x71fb, lsl #16
  24:	f2c023e8 	movk	x8, #0x11f, lsl #32
  28:	a8c17bfd 	ldp	x29, x30, [sp], #16
  2c:	d65f03c0 	ret
