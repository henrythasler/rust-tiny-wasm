
tests/assets/jit/division.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 div_s32
0000000000000068 l     F .text	0000000000000048 div_u32
00000000000000b0 l     F .text	0000000000000068 div_s64
0000000000000118 l     F .text	0000000000000048 div_u64
0000000000000160 l     F .text	0000000000000058 div_by_zero


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0010 e10700b9 e80340b9 e90740b9 89000035  ......@...@....5
 0020 010180d2 200080d2 0c000014 3f050031  .... .......?..1
 0030 e1000054 0a00b052 1f010a6b 81000054  ...T...R...k...T
 0040 e10080d2 200080d2 04000014 080dc91a  .... ...........
 0050 00008052 e103082a ff430091 fd7bc1a8  ...R...*.C...{..
 0060 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0070 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 0080 e90740b9 89000035 010180d2 200080d2  ..@....5.... ...
 0090 04000014 0809c91a 00008052 e103082a  ...........R...*
 00a0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 00b0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00c0 e10700f9 e80340f9 e90740f9 890000b5  ......@...@.....
 00d0 010180d2 200080d2 0c000014 3f0500b1  .... .......?...
 00e0 e1000054 0a00f0d2 1f010aeb 81000054  ...T...........T
 00f0 e10080d2 200080d2 04000014 080dc99a  .... ...........
 0100 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0110 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0120 ff4300d1 e00300f9 e10700f9 e80340f9  .C............@.
 0130 e90740f9 890000b5 010180d2 200080d2  ..@......... ...
 0140 04000014 0809c99a 000080d2 e10308aa  ................
 0150 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0160 fd7bbfa9 fd030091 28008052 09008052  .{......(..R...R
 0170 89000035 010180d2 200080d2 0c000014  ...5.... .......
 0180 3f050031 e1000054 0a00b052 1f010a6b  ?..1...T...R...k
 0190 81000054 e10080d2 200080d2 04000014  ...T.... .......
 01a0 080dc91a 000080d2 e1031faa fd7bc1a8  .............{..
 01b0 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <div_s32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	b90003e0 	str	w0, [sp]
  10:	b90007e1 	str	w1, [sp, #4]
  14:	b94003e8 	ldr	w8, [sp]
  18:	b94007e9 	ldr	w9, [sp, #4]
  1c:	35000089 	cbnz	w9, 2c <div_s32+0x2c>
  20:	d2800101 	mov	x1, #0x8                   	// #8
  24:	d2800020 	mov	x0, #0x1                   	// #1
  28:	1400000c 	b	58 <div_s32+0x58>
  2c:	3100053f 	cmn	w9, #0x1
  30:	540000e1 	b.ne	4c <div_s32+0x4c>  // b.any
  34:	52b0000a 	mov	w10, #0x80000000            	// #-2147483648
  38:	6b0a011f 	cmp	w8, w10
  3c:	54000081 	b.ne	4c <div_s32+0x4c>  // b.any
  40:	d28000e1 	mov	x1, #0x7                   	// #7
  44:	d2800020 	mov	x0, #0x1                   	// #1
  48:	14000004 	b	58 <div_s32+0x58>
  4c:	1ac90d08 	sdiv	w8, w8, w9
  50:	52800000 	mov	w0, #0x0                   	// #0
  54:	2a0803e1 	mov	w1, w8
  58:	910043ff 	add	sp, sp, #0x10
  5c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  60:	d65f03c0 	ret
  64:	d503201f 	nop

0000000000000068 <div_u32>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10043ff 	sub	sp, sp, #0x10
  74:	b90003e0 	str	w0, [sp]
  78:	b90007e1 	str	w1, [sp, #4]
  7c:	b94003e8 	ldr	w8, [sp]
  80:	b94007e9 	ldr	w9, [sp, #4]
  84:	35000089 	cbnz	w9, 94 <div_u32+0x2c>
  88:	d2800101 	mov	x1, #0x8                   	// #8
  8c:	d2800020 	mov	x0, #0x1                   	// #1
  90:	14000004 	b	a0 <div_u32+0x38>
  94:	1ac90908 	udiv	w8, w8, w9
  98:	52800000 	mov	w0, #0x0                   	// #0
  9c:	2a0803e1 	mov	w1, w8
  a0:	910043ff 	add	sp, sp, #0x10
  a4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a8:	d65f03c0 	ret
  ac:	d503201f 	nop

00000000000000b0 <div_s64>:
  b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  b4:	910003fd 	mov	x29, sp
  b8:	d10043ff 	sub	sp, sp, #0x10
  bc:	f90003e0 	str	x0, [sp]
  c0:	f90007e1 	str	x1, [sp, #8]
  c4:	f94003e8 	ldr	x8, [sp]
  c8:	f94007e9 	ldr	x9, [sp, #8]
  cc:	b5000089 	cbnz	x9, dc <div_s64+0x2c>
  d0:	d2800101 	mov	x1, #0x8                   	// #8
  d4:	d2800020 	mov	x0, #0x1                   	// #1
  d8:	1400000c 	b	108 <div_s64+0x58>
  dc:	b100053f 	cmn	x9, #0x1
  e0:	540000e1 	b.ne	fc <div_s64+0x4c>  // b.any
  e4:	d2f0000a 	mov	x10, #0x8000000000000000    	// #-9223372036854775808
  e8:	eb0a011f 	cmp	x8, x10
  ec:	54000081 	b.ne	fc <div_s64+0x4c>  // b.any
  f0:	d28000e1 	mov	x1, #0x7                   	// #7
  f4:	d2800020 	mov	x0, #0x1                   	// #1
  f8:	14000004 	b	108 <div_s64+0x58>
  fc:	9ac90d08 	sdiv	x8, x8, x9
 100:	d2800000 	mov	x0, #0x0                   	// #0
 104:	aa0803e1 	mov	x1, x8
 108:	910043ff 	add	sp, sp, #0x10
 10c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 110:	d65f03c0 	ret
 114:	d503201f 	nop

0000000000000118 <div_u64>:
 118:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 11c:	910003fd 	mov	x29, sp
 120:	d10043ff 	sub	sp, sp, #0x10
 124:	f90003e0 	str	x0, [sp]
 128:	f90007e1 	str	x1, [sp, #8]
 12c:	f94003e8 	ldr	x8, [sp]
 130:	f94007e9 	ldr	x9, [sp, #8]
 134:	b5000089 	cbnz	x9, 144 <div_u64+0x2c>
 138:	d2800101 	mov	x1, #0x8                   	// #8
 13c:	d2800020 	mov	x0, #0x1                   	// #1
 140:	14000004 	b	150 <div_u64+0x38>
 144:	9ac90908 	udiv	x8, x8, x9
 148:	d2800000 	mov	x0, #0x0                   	// #0
 14c:	aa0803e1 	mov	x1, x8
 150:	910043ff 	add	sp, sp, #0x10
 154:	a8c17bfd 	ldp	x29, x30, [sp], #16
 158:	d65f03c0 	ret
 15c:	d503201f 	nop

0000000000000160 <div_by_zero>:
 160:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 164:	910003fd 	mov	x29, sp
 168:	52800028 	mov	w8, #0x1                   	// #1
 16c:	52800009 	mov	w9, #0x0                   	// #0
 170:	35000089 	cbnz	w9, 180 <div_by_zero+0x20>
 174:	d2800101 	mov	x1, #0x8                   	// #8
 178:	d2800020 	mov	x0, #0x1                   	// #1
 17c:	1400000c 	b	1ac <div_by_zero+0x4c>
 180:	3100053f 	cmn	w9, #0x1
 184:	540000e1 	b.ne	1a0 <div_by_zero+0x40>  // b.any
 188:	52b0000a 	mov	w10, #0x80000000            	// #-2147483648
 18c:	6b0a011f 	cmp	w8, w10
 190:	54000081 	b.ne	1a0 <div_by_zero+0x40>  // b.any
 194:	d28000e1 	mov	x1, #0x7                   	// #7
 198:	d2800020 	mov	x0, #0x1                   	// #1
 19c:	14000004 	b	1ac <div_by_zero+0x4c>
 1a0:	1ac90d08 	sdiv	w8, w8, w9
 1a4:	d2800000 	mov	x0, #0x0                   	// #0
 1a8:	aa1f03e1 	mov	x1, xzr
 1ac:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1b0:	d65f03c0 	ret
 1b4:	d503201f 	nop
