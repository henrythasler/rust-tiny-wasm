
tests/assets/jit/arithmetics.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 trap_handler
0000000000000068 l     F .text	0000000000000038 add
00000000000000a0 l     F .text	0000000000000038 add64
00000000000000d8 l     F .text	0000000000000038 sub
0000000000000110 l     F .text	0000000000000038 sub64
0000000000000148 l     F .text	0000000000000038 mul
0000000000000180 l     F .text	0000000000000038 mul64
00000000000001b8 l     F .text	0000000000000030 square
00000000000001e8 l     F .text	0000000000000030 square64


Contents of section .text:
 0000 010080d2 17000014 210080d2 15000014  ........!.......
 0010 410080d2 13000014 610080d2 11000014  A.......a.......
 0020 810080d2 0f000014 a10080d2 0d000014  ................
 0030 c10080d2 0b000014 e10080d2 09000014  ................
 0040 010180d2 07000014 210180d2 05000014  ........!.......
 0050 410180d2 03000014 610180d2 01000014  A.......a.......
 0060 200080d2 c0035fd6 fd7bbfa9 fd030091   ....._..{......
 0070 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 0080 e90740b9 0801090b 00008052 e103082a  ..@........R...*
 0090 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 00a0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00b0 e10700f9 e80340f9 e90740f9 0801098b  ......@...@.....
 00c0 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 00d0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00e0 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 00f0 e90740b9 0801094b 00008052 e103082a  ..@....K...R...*
 0100 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0110 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0120 e10700f9 e80340f9 e90740f9 080109cb  ......@...@.....
 0130 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0140 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0150 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 0160 e90740b9 087d091b 00008052 e103082a  ..@..}.....R...*
 0170 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0180 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0190 e10700f9 e80340f9 e90740f9 087d099b  ......@...@..}..
 01a0 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 01b0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 01c0 ff4300d1 e00300b9 e80340b9 e90340b9  .C........@...@.
 01d0 087d091b 00008052 e103082a ff430091  .}.....R...*.C..
 01e0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 01f0 ff4300d1 e00300f9 e80340f9 e90340f9  .C........@...@.
 0200 087d099b 000080d2 e10308aa ff430091  .}...........C..
 0210 fd7bc1a8 c0035fd6                    .{...._.        

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

0000000000000068 <add>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10043ff 	sub	sp, sp, #0x10
  74:	b90003e0 	str	w0, [sp]
  78:	b90007e1 	str	w1, [sp, #4]
  7c:	b94003e8 	ldr	w8, [sp]
  80:	b94007e9 	ldr	w9, [sp, #4]
  84:	0b090108 	add	w8, w8, w9
  88:	52800000 	mov	w0, #0x0                   	// #0
  8c:	2a0803e1 	mov	w1, w8
  90:	910043ff 	add	sp, sp, #0x10
  94:	a8c17bfd 	ldp	x29, x30, [sp], #16
  98:	d65f03c0 	ret
  9c:	d503201f 	nop

00000000000000a0 <add64>:
  a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  a4:	910003fd 	mov	x29, sp
  a8:	d10043ff 	sub	sp, sp, #0x10
  ac:	f90003e0 	str	x0, [sp]
  b0:	f90007e1 	str	x1, [sp, #8]
  b4:	f94003e8 	ldr	x8, [sp]
  b8:	f94007e9 	ldr	x9, [sp, #8]
  bc:	8b090108 	add	x8, x8, x9
  c0:	d2800000 	mov	x0, #0x0                   	// #0
  c4:	aa0803e1 	mov	x1, x8
  c8:	910043ff 	add	sp, sp, #0x10
  cc:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d0:	d65f03c0 	ret
  d4:	d503201f 	nop

00000000000000d8 <sub>:
  d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  dc:	910003fd 	mov	x29, sp
  e0:	d10043ff 	sub	sp, sp, #0x10
  e4:	b90003e0 	str	w0, [sp]
  e8:	b90007e1 	str	w1, [sp, #4]
  ec:	b94003e8 	ldr	w8, [sp]
  f0:	b94007e9 	ldr	w9, [sp, #4]
  f4:	4b090108 	sub	w8, w8, w9
  f8:	52800000 	mov	w0, #0x0                   	// #0
  fc:	2a0803e1 	mov	w1, w8
 100:	910043ff 	add	sp, sp, #0x10
 104:	a8c17bfd 	ldp	x29, x30, [sp], #16
 108:	d65f03c0 	ret
 10c:	d503201f 	nop

0000000000000110 <sub64>:
 110:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 114:	910003fd 	mov	x29, sp
 118:	d10043ff 	sub	sp, sp, #0x10
 11c:	f90003e0 	str	x0, [sp]
 120:	f90007e1 	str	x1, [sp, #8]
 124:	f94003e8 	ldr	x8, [sp]
 128:	f94007e9 	ldr	x9, [sp, #8]
 12c:	cb090108 	sub	x8, x8, x9
 130:	d2800000 	mov	x0, #0x0                   	// #0
 134:	aa0803e1 	mov	x1, x8
 138:	910043ff 	add	sp, sp, #0x10
 13c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 140:	d65f03c0 	ret
 144:	d503201f 	nop

0000000000000148 <mul>:
 148:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 14c:	910003fd 	mov	x29, sp
 150:	d10043ff 	sub	sp, sp, #0x10
 154:	b90003e0 	str	w0, [sp]
 158:	b90007e1 	str	w1, [sp, #4]
 15c:	b94003e8 	ldr	w8, [sp]
 160:	b94007e9 	ldr	w9, [sp, #4]
 164:	1b097d08 	mul	w8, w8, w9
 168:	52800000 	mov	w0, #0x0                   	// #0
 16c:	2a0803e1 	mov	w1, w8
 170:	910043ff 	add	sp, sp, #0x10
 174:	a8c17bfd 	ldp	x29, x30, [sp], #16
 178:	d65f03c0 	ret
 17c:	d503201f 	nop

0000000000000180 <mul64>:
 180:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 184:	910003fd 	mov	x29, sp
 188:	d10043ff 	sub	sp, sp, #0x10
 18c:	f90003e0 	str	x0, [sp]
 190:	f90007e1 	str	x1, [sp, #8]
 194:	f94003e8 	ldr	x8, [sp]
 198:	f94007e9 	ldr	x9, [sp, #8]
 19c:	9b097d08 	mul	x8, x8, x9
 1a0:	d2800000 	mov	x0, #0x0                   	// #0
 1a4:	aa0803e1 	mov	x1, x8
 1a8:	910043ff 	add	sp, sp, #0x10
 1ac:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1b0:	d65f03c0 	ret
 1b4:	d503201f 	nop

00000000000001b8 <square>:
 1b8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1bc:	910003fd 	mov	x29, sp
 1c0:	d10043ff 	sub	sp, sp, #0x10
 1c4:	b90003e0 	str	w0, [sp]
 1c8:	b94003e8 	ldr	w8, [sp]
 1cc:	b94003e9 	ldr	w9, [sp]
 1d0:	1b097d08 	mul	w8, w8, w9
 1d4:	52800000 	mov	w0, #0x0                   	// #0
 1d8:	2a0803e1 	mov	w1, w8
 1dc:	910043ff 	add	sp, sp, #0x10
 1e0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1e4:	d65f03c0 	ret

00000000000001e8 <square64>:
 1e8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1ec:	910003fd 	mov	x29, sp
 1f0:	d10043ff 	sub	sp, sp, #0x10
 1f4:	f90003e0 	str	x0, [sp]
 1f8:	f94003e8 	ldr	x8, [sp]
 1fc:	f94003e9 	ldr	x9, [sp]
 200:	9b097d08 	mul	x8, x8, x9
 204:	d2800000 	mov	x0, #0x0                   	// #0
 208:	aa0803e1 	mov	x1, x8
 20c:	910043ff 	add	sp, sp, #0x10
 210:	a8c17bfd 	ldp	x29, x30, [sp], #16
 214:	d65f03c0 	ret
