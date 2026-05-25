
tests/assets/jit/parameters.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 trap_handler
0000000000000068 l     F .text	0000000000000030 get_first_i32
0000000000000098 l     F .text	0000000000000030 get_third_i32
00000000000000c8 l     F .text	0000000000000030 get_second_i64
00000000000000f8 l     F .text	0000000000000038 get_fourth_i64


Contents of section .text:
 0000 010080d2 17000014 210080d2 15000014  ........!.......
 0010 410080d2 13000014 610080d2 11000014  A.......a.......
 0020 810080d2 0f000014 a10080d2 0d000014  ................
 0030 c10080d2 0b000014 e10080d2 09000014  ................
 0040 010180d2 07000014 210180d2 05000014  ........!.......
 0050 410180d2 03000014 610180d2 01000014  A.......a.......
 0060 200080d2 c0035fd6 fd7bbfa9 fd030091   ....._..{......
 0070 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 0080 00008052 e103082a ff430091 fd7bc1a8  ...R...*.C...{..
 0090 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00a0 ff4300d1 e00300b9 e10700b9 e20b00b9  .C..............
 00b0 e80b40b9 00008052 e103082a ff430091  ..@....R...*.C..
 00c0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00d0 ff4300d1 e00300f9 e10700f9 e80740f9  .C............@.
 00e0 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 00f0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0100 ff8300d1 e00300f9 e10700f9 e20b00f9  ................
 0110 e30f00f9 e80f40f9 000080d2 e10308aa  ......@.........
 0120 ff830091 fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..

Disassembly of section .text:

0000000000000000 <trap_handler>:
   0:	d2800001 	mov	x1, #0x0                   	// #0
   4:	14000017 	b	60 <trap_handler+0x60>
   8:	d2800021 	mov	x1, #0x1                   	// #1
   c:	14000015 	b	60 <trap_handler+0x60>
  10:	d2800041 	mov	x1, #0x2                   	// #2
  14:	14000013 	b	60 <trap_handler+0x60>
  18:	d2800061 	mov	x1, #0x3                   	// #3
  1c:	14000011 	b	60 <trap_handler+0x60>
  20:	d2800081 	mov	x1, #0x4                   	// #4
  24:	1400000f 	b	60 <trap_handler+0x60>
  28:	d28000a1 	mov	x1, #0x5                   	// #5
  2c:	1400000d 	b	60 <trap_handler+0x60>
  30:	d28000c1 	mov	x1, #0x6                   	// #6
  34:	1400000b 	b	60 <trap_handler+0x60>
  38:	d28000e1 	mov	x1, #0x7                   	// #7
  3c:	14000009 	b	60 <trap_handler+0x60>
  40:	d2800101 	mov	x1, #0x8                   	// #8
  44:	14000007 	b	60 <trap_handler+0x60>
  48:	d2800121 	mov	x1, #0x9                   	// #9
  4c:	14000005 	b	60 <trap_handler+0x60>
  50:	d2800141 	mov	x1, #0xa                   	// #10
  54:	14000003 	b	60 <trap_handler+0x60>
  58:	d2800161 	mov	x1, #0xb                   	// #11
  5c:	14000001 	b	60 <trap_handler+0x60>
  60:	d2800020 	mov	x0, #0x1                   	// #1
  64:	d65f03c0 	ret

0000000000000068 <get_first_i32>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10043ff 	sub	sp, sp, #0x10
  74:	b90003e0 	str	w0, [sp]
  78:	b90007e1 	str	w1, [sp, #4]
  7c:	b94003e8 	ldr	w8, [sp]
  80:	52800000 	mov	w0, #0x0                   	// #0
  84:	2a0803e1 	mov	w1, w8
  88:	910043ff 	add	sp, sp, #0x10
  8c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  90:	d65f03c0 	ret
  94:	d503201f 	nop

0000000000000098 <get_third_i32>:
  98:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  9c:	910003fd 	mov	x29, sp
  a0:	d10043ff 	sub	sp, sp, #0x10
  a4:	b90003e0 	str	w0, [sp]
  a8:	b90007e1 	str	w1, [sp, #4]
  ac:	b9000be2 	str	w2, [sp, #8]
  b0:	b9400be8 	ldr	w8, [sp, #8]
  b4:	52800000 	mov	w0, #0x0                   	// #0
  b8:	2a0803e1 	mov	w1, w8
  bc:	910043ff 	add	sp, sp, #0x10
  c0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  c4:	d65f03c0 	ret

00000000000000c8 <get_second_i64>:
  c8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  cc:	910003fd 	mov	x29, sp
  d0:	d10043ff 	sub	sp, sp, #0x10
  d4:	f90003e0 	str	x0, [sp]
  d8:	f90007e1 	str	x1, [sp, #8]
  dc:	f94007e8 	ldr	x8, [sp, #8]
  e0:	d2800000 	mov	x0, #0x0                   	// #0
  e4:	aa0803e1 	mov	x1, x8
  e8:	910043ff 	add	sp, sp, #0x10
  ec:	a8c17bfd 	ldp	x29, x30, [sp], #16
  f0:	d65f03c0 	ret
  f4:	d503201f 	nop

00000000000000f8 <get_fourth_i64>:
  f8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  fc:	910003fd 	mov	x29, sp
 100:	d10083ff 	sub	sp, sp, #0x20
 104:	f90003e0 	str	x0, [sp]
 108:	f90007e1 	str	x1, [sp, #8]
 10c:	f9000be2 	str	x2, [sp, #16]
 110:	f9000fe3 	str	x3, [sp, #24]
 114:	f9400fe8 	ldr	x8, [sp, #24]
 118:	d2800000 	mov	x0, #0x0                   	// #0
 11c:	aa0803e1 	mov	x1, x8
 120:	910083ff 	add	sp, sp, #0x20
 124:	a8c17bfd 	ldp	x29, x30, [sp], #16
 128:	d65f03c0 	ret
 12c:	d503201f 	nop
