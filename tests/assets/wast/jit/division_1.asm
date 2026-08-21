
tests/assets/wast/jit/division_1.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 div_s
0000000000000068 l     F .text	0000000000000048 div_u


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 0010 e10700f9 e20b00f9 e80740f9 e90b40f9  ..........@...@.
 0020 890000b5 010180d2 200080d2 0c000014  ........ .......
 0030 3f0500b1 e1000054 0a00f0d2 1f010aeb  ?......T........
 0040 81000054 e10080d2 200080d2 04000014  ...T.... .......
 0050 080dc99a 000080d2 e10308aa ff830091  ................
 0060 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0070 ff8300d1 e00300f9 e10700f9 e20b00f9  ................
 0080 e80740f9 e90b40f9 890000b5 010180d2  ..@...@.........
 0090 200080d2 04000014 0809c99a 000080d2   ...............
 00a0 e10308aa ff830091 fd7bc1a8 c0035fd6  .........{...._.

Disassembly of section .text:

0000000000000000 <div_s>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10083ff 	sub	sp, sp, #0x20
   c:	f90003e0 	str	x0, [sp]
  10:	f90007e1 	str	x1, [sp, #8]
  14:	f9000be2 	str	x2, [sp, #16]
  18:	f94007e8 	ldr	x8, [sp, #8]
  1c:	f9400be9 	ldr	x9, [sp, #16]
  20:	b5000089 	cbnz	x9, 30 <div_s+0x30>
  24:	d2800101 	mov	x1, #0x8                   	// #8
  28:	d2800020 	mov	x0, #0x1                   	// #1
  2c:	1400000c 	b	5c <div_s+0x5c>
  30:	b100053f 	cmn	x9, #0x1
  34:	540000e1 	b.ne	50 <div_s+0x50>  // b.any
  38:	d2f0000a 	mov	x10, #0x8000000000000000    	// #-9223372036854775808
  3c:	eb0a011f 	cmp	x8, x10
  40:	54000081 	b.ne	50 <div_s+0x50>  // b.any
  44:	d28000e1 	mov	x1, #0x7                   	// #7
  48:	d2800020 	mov	x0, #0x1                   	// #1
  4c:	14000004 	b	5c <div_s+0x5c>
  50:	9ac90d08 	sdiv	x8, x8, x9
  54:	d2800000 	mov	x0, #0x0                   	// #0
  58:	aa0803e1 	mov	x1, x8
  5c:	910083ff 	add	sp, sp, #0x20
  60:	a8c17bfd 	ldp	x29, x30, [sp], #16
  64:	d65f03c0 	ret

0000000000000068 <div_u>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10083ff 	sub	sp, sp, #0x20
  74:	f90003e0 	str	x0, [sp]
  78:	f90007e1 	str	x1, [sp, #8]
  7c:	f9000be2 	str	x2, [sp, #16]
  80:	f94007e8 	ldr	x8, [sp, #8]
  84:	f9400be9 	ldr	x9, [sp, #16]
  88:	b5000089 	cbnz	x9, 98 <div_u+0x30>
  8c:	d2800101 	mov	x1, #0x8                   	// #8
  90:	d2800020 	mov	x0, #0x1                   	// #1
  94:	14000004 	b	a4 <div_u+0x3c>
  98:	9ac90908 	udiv	x8, x8, x9
  9c:	d2800000 	mov	x0, #0x0                   	// #0
  a0:	aa0803e1 	mov	x1, x8
  a4:	910083ff 	add	sp, sp, #0x20
  a8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  ac:	d65f03c0 	ret
