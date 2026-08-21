
tests/assets/wast/jit/division_0.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 div_s
0000000000000068 l     F .text	0000000000000048 div_u


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 0020 89000035 010180d2 200080d2 0c000014  ...5.... .......
 0030 3f050031 e1000054 0a00b052 1f010a6b  ?..1...T...R...k
 0040 81000054 e10080d2 200080d2 04000014  ...T.... .......
 0050 080dc91a 000080d2 e10308aa ff430091  .............C..
 0060 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0070 ff4300d1 e00300f9 e10b00b9 e20f00b9  .C..............
 0080 e80b40b9 e90f40b9 89000035 010180d2  ..@...@....5....
 0090 200080d2 04000014 0809c91a 000080d2   ...............
 00a0 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.

Disassembly of section .text:

0000000000000000 <div_s>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9000fe2 	str	w2, [sp, #12]
  18:	b9400be8 	ldr	w8, [sp, #8]
  1c:	b9400fe9 	ldr	w9, [sp, #12]
  20:	35000089 	cbnz	w9, 30 <div_s+0x30>
  24:	d2800101 	mov	x1, #0x8                   	// #8
  28:	d2800020 	mov	x0, #0x1                   	// #1
  2c:	1400000c 	b	5c <div_s+0x5c>
  30:	3100053f 	cmn	w9, #0x1
  34:	540000e1 	b.ne	50 <div_s+0x50>  // b.any
  38:	52b0000a 	mov	w10, #0x80000000            	// #-2147483648
  3c:	6b0a011f 	cmp	w8, w10
  40:	54000081 	b.ne	50 <div_s+0x50>  // b.any
  44:	d28000e1 	mov	x1, #0x7                   	// #7
  48:	d2800020 	mov	x0, #0x1                   	// #1
  4c:	14000004 	b	5c <div_s+0x5c>
  50:	1ac90d08 	sdiv	w8, w8, w9
  54:	d2800000 	mov	x0, #0x0                   	// #0
  58:	aa0803e1 	mov	x1, x8
  5c:	910043ff 	add	sp, sp, #0x10
  60:	a8c17bfd 	ldp	x29, x30, [sp], #16
  64:	d65f03c0 	ret

0000000000000068 <div_u>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10043ff 	sub	sp, sp, #0x10
  74:	f90003e0 	str	x0, [sp]
  78:	b9000be1 	str	w1, [sp, #8]
  7c:	b9000fe2 	str	w2, [sp, #12]
  80:	b9400be8 	ldr	w8, [sp, #8]
  84:	b9400fe9 	ldr	w9, [sp, #12]
  88:	35000089 	cbnz	w9, 98 <div_u+0x30>
  8c:	d2800101 	mov	x1, #0x8                   	// #8
  90:	d2800020 	mov	x0, #0x1                   	// #1
  94:	14000004 	b	a4 <div_u+0x3c>
  98:	1ac90908 	udiv	w8, w8, w9
  9c:	d2800000 	mov	x0, #0x0                   	// #0
  a0:	aa0803e1 	mov	x1, x8
  a4:	910043ff 	add	sp, sp, #0x10
  a8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  ac:	d65f03c0 	ret
