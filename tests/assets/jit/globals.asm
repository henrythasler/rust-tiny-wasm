
tests/assets/jit/globals.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 get_int32
0000000000000028 l     F .text	0000000000000028 get_int64
0000000000000050 l     F .text	0000000000000030 get_float32
0000000000000080 l     F .text	0000000000000038 get_float64


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 28008012 000080d2 e10308aa ff430091  (............C..
 0020 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0030 ff4300d1 e00300f9 88008092 000080d2  .C..............
 0040 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0050 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0060 68fb8152 2809a872 0801271e 000080d2  h..R(..r..'.....
 0070 0101261e ff430091 fd7bc1a8 c0035fd6  ..&..C...{...._.
 0080 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0090 28ed8ad2 8862b1f2 48e1d7f2 a800e8f2  (....b..H.......
 00a0 0801679e 000080d2 0101669e ff430091  ..g.......f..C..
 00b0 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <get_int32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	12800028 	mov	w8, #0xfffffffe            	// #-2
  14:	d2800000 	mov	x0, #0x0                   	// #0
  18:	aa0803e1 	mov	x1, x8
  1c:	910043ff 	add	sp, sp, #0x10
  20:	a8c17bfd 	ldp	x29, x30, [sp], #16
  24:	d65f03c0 	ret

0000000000000028 <get_int64>:
  28:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  2c:	910003fd 	mov	x29, sp
  30:	d10043ff 	sub	sp, sp, #0x10
  34:	f90003e0 	str	x0, [sp]
  38:	92800088 	mov	x8, #0xfffffffffffffffb    	// #-5
  3c:	d2800000 	mov	x0, #0x0                   	// #0
  40:	aa0803e1 	mov	x1, x8
  44:	910043ff 	add	sp, sp, #0x10
  48:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4c:	d65f03c0 	ret

0000000000000050 <get_float32>:
  50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  54:	910003fd 	mov	x29, sp
  58:	d10043ff 	sub	sp, sp, #0x10
  5c:	f90003e0 	str	x0, [sp]
  60:	5281fb68 	mov	w8, #0xfdb                 	// #4059
  64:	72a80928 	movk	w8, #0x4049, lsl #16
  68:	1e270108 	fmov	s8, w8
  6c:	d2800000 	mov	x0, #0x0                   	// #0
  70:	1e260101 	fmov	w1, s8
  74:	910043ff 	add	sp, sp, #0x10
  78:	a8c17bfd 	ldp	x29, x30, [sp], #16
  7c:	d65f03c0 	ret

0000000000000080 <get_float64>:
  80:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  84:	910003fd 	mov	x29, sp
  88:	d10043ff 	sub	sp, sp, #0x10
  8c:	f90003e0 	str	x0, [sp]
  90:	d28aed28 	mov	x8, #0x5769                	// #22377
  94:	f2b16288 	movk	x8, #0x8b14, lsl #16
  98:	f2d7e148 	movk	x8, #0xbf0a, lsl #32
  9c:	f2e800a8 	movk	x8, #0x4005, lsl #48
  a0:	9e670108 	fmov	d8, x8
  a4:	d2800000 	mov	x0, #0x0                   	// #0
  a8:	9e660101 	fmov	x1, d8
  ac:	910043ff 	add	sp, sp, #0x10
  b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  b4:	d65f03c0 	ret
