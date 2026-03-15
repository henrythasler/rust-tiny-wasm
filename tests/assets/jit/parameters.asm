
./tests/assets/jit/parameters.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000018 get_const_i32
0000000000000018 l     F .text	0000000000000020 get_const_i64


Contents of section .text:
 0000 fd7bbfa9 fd030091 48058052 e003082a  .{......H..R...*
 0010 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0020 088a80d2 683faef2 e823c0f2 e00308aa  ....h?...#......
 0030 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <get_const_i32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	52800548 	mov	w8, #0x2a                  	// #42
   c:	2a0803e0 	mov	w0, w8
  10:	a8c17bfd 	ldp	x29, x30, [sp], #16
  14:	d65f03c0 	ret

0000000000000018 <get_const_i64>:
  18:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  1c:	910003fd 	mov	x29, sp
  20:	d2808a08 	mov	x8, #0x450                 	// #1104
  24:	f2ae3f68 	movk	x8, #0x71fb, lsl #16
  28:	f2c023e8 	movk	x8, #0x11f, lsl #32
  2c:	aa0803e0 	mov	x0, x8
  30:	a8c17bfd 	ldp	x29, x30, [sp], #16
  34:	d65f03c0 	ret
