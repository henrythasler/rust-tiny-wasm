
tests/assets/wast/jit/division_1.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 div_s
0000000000000068 l     F .text	0000000000000048 div_u


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10700f9 e80340f9 e90740f9 890000b5  ......@...@.....
 0020 010180d2 200080d2 0c000014 3f0500b1  .... .......?...
 0030 e1000054 0a00f0d2 1f010aeb 81000054  ...T...........T
 0040 e10080d2 200080d2 04000014 080dc99a  .... ...........
 0050 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0060 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0070 ff4300d1 e00300f9 e10700f9 e80340f9  .C............@.
 0080 e90740f9 890000b5 010180d2 200080d2  ..@......... ...
 0090 04000014 0809c99a 000080d2 e10308aa  ................
 00a0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <div_s>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	f90007e1 	str	x1, [sp, #8]
  14:	f94003e8 	ldr	x8, [sp]
  18:	f94007e9 	ldr	x9, [sp, #8]
  1c:	b5000089 	cbnz	x9, 2c <div_s+0x2c>
  20:	d2800101 	mov	x1, #0x8                   	// #8
  24:	d2800020 	mov	x0, #0x1                   	// #1
  28:	1400000c 	b	58 <div_s+0x58>
  2c:	b100053f 	cmn	x9, #0x1
  30:	540000e1 	b.ne	4c <div_s+0x4c>  // b.any
  34:	d2f0000a 	mov	x10, #0x8000000000000000    	// #-9223372036854775808
  38:	eb0a011f 	cmp	x8, x10
  3c:	54000081 	b.ne	4c <div_s+0x4c>  // b.any
  40:	d28000e1 	mov	x1, #0x7                   	// #7
  44:	d2800020 	mov	x0, #0x1                   	// #1
  48:	14000004 	b	58 <div_s+0x58>
  4c:	9ac90d08 	sdiv	x8, x8, x9
  50:	d2800000 	mov	x0, #0x0                   	// #0
  54:	aa0803e1 	mov	x1, x8
  58:	910043ff 	add	sp, sp, #0x10
  5c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  60:	d65f03c0 	ret
  64:	d503201f 	nop

0000000000000068 <div_u>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10043ff 	sub	sp, sp, #0x10
  74:	f90003e0 	str	x0, [sp]
  78:	f90007e1 	str	x1, [sp, #8]
  7c:	f94003e8 	ldr	x8, [sp]
  80:	f94007e9 	ldr	x9, [sp, #8]
  84:	b5000089 	cbnz	x9, 94 <div_u+0x2c>
  88:	d2800101 	mov	x1, #0x8                   	// #8
  8c:	d2800020 	mov	x0, #0x1                   	// #1
  90:	14000004 	b	a0 <div_u+0x38>
  94:	9ac90908 	udiv	x8, x8, x9
  98:	d2800000 	mov	x0, #0x0                   	// #0
  9c:	aa0803e1 	mov	x1, x8
  a0:	910043ff 	add	sp, sp, #0x10
  a4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a8:	d65f03c0 	ret
  ac:	d503201f 	nop
