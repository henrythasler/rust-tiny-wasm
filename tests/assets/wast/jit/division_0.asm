
tests/assets/wast/jit/division_0.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 div_s
0000000000000068 l     F .text	0000000000000048 div_u


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0010 e10700b9 e80340b9 e90740b9 89000035  ......@...@....5
 0020 010180d2 200080d2 0c000014 3f050031  .... .......?..1
 0030 e1000054 0a00b052 1f010a6b 81000054  ...T...R...k...T
 0040 e10080d2 200080d2 04000014 080dc91a  .... ...........
 0050 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0060 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0070 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 0080 e90740b9 89000035 010180d2 200080d2  ..@....5.... ...
 0090 04000014 0809c91a 000080d2 e10308aa  ................
 00a0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <div_s>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	b90003e0 	str	w0, [sp]
  10:	b90007e1 	str	w1, [sp, #4]
  14:	b94003e8 	ldr	w8, [sp]
  18:	b94007e9 	ldr	w9, [sp, #4]
  1c:	35000089 	cbnz	w9, 2c <div_s+0x2c>
  20:	d2800101 	mov	x1, #0x8                   	// #8
  24:	d2800020 	mov	x0, #0x1                   	// #1
  28:	1400000c 	b	58 <div_s+0x58>
  2c:	3100053f 	cmn	w9, #0x1
  30:	540000e1 	b.ne	4c <div_s+0x4c>  // b.any
  34:	52b0000a 	mov	w10, #0x80000000            	// #-2147483648
  38:	6b0a011f 	cmp	w8, w10
  3c:	54000081 	b.ne	4c <div_s+0x4c>  // b.any
  40:	d28000e1 	mov	x1, #0x7                   	// #7
  44:	d2800020 	mov	x0, #0x1                   	// #1
  48:	14000004 	b	58 <div_s+0x58>
  4c:	1ac90d08 	sdiv	w8, w8, w9
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
  74:	b90003e0 	str	w0, [sp]
  78:	b90007e1 	str	w1, [sp, #4]
  7c:	b94003e8 	ldr	w8, [sp]
  80:	b94007e9 	ldr	w9, [sp, #4]
  84:	35000089 	cbnz	w9, 94 <div_u+0x2c>
  88:	d2800101 	mov	x1, #0x8                   	// #8
  8c:	d2800020 	mov	x0, #0x1                   	// #1
  90:	14000004 	b	a0 <div_u+0x38>
  94:	1ac90908 	udiv	w8, w8, w9
  98:	d2800000 	mov	x0, #0x0                   	// #0
  9c:	aa0803e1 	mov	x1, x8
  a0:	910043ff 	add	sp, sp, #0x10
  a4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a8:	d65f03c0 	ret
  ac:	d503201f 	nop
