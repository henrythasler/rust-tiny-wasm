
tests/assets/jit/globals.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000030 get_int32


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 081840f9 080140b9 000080d2 e10308aa  ..@...@.........
 0020 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <get_int32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	f9401808 	ldr	x8, [x0, #48]
  14:	b9400108 	ldr	w8, [x8]
  18:	d2800000 	mov	x0, #0x0                   	// #0
  1c:	aa0803e1 	mov	x1, x8
  20:	910043ff 	add	sp, sp, #0x10
  24:	a8c17bfd 	ldp	x29, x30, [sp], #16
  28:	d65f03c0 	ret
  2c:	d503201f 	nop
