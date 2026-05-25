
tests/assets/wast/jit/arithmetic_0.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 trap_handler
0000000000000068 l     F .text	0000000000000038 add
00000000000000a0 l     F .text	0000000000000038 sub
00000000000000d8 l     F .text	0000000000000038 mul


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
 00a0 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 00b0 e10700b9 e80340b9 e90740b9 0801094b  ......@...@....K
 00c0 00008052 e103082a ff430091 fd7bc1a8  ...R...*.C...{..
 00d0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00e0 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 00f0 e90740b9 087d091b 00008052 e103082a  ..@..}.....R...*
 0100 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

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

00000000000000a0 <sub>:
  a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  a4:	910003fd 	mov	x29, sp
  a8:	d10043ff 	sub	sp, sp, #0x10
  ac:	b90003e0 	str	w0, [sp]
  b0:	b90007e1 	str	w1, [sp, #4]
  b4:	b94003e8 	ldr	w8, [sp]
  b8:	b94007e9 	ldr	w9, [sp, #4]
  bc:	4b090108 	sub	w8, w8, w9
  c0:	52800000 	mov	w0, #0x0                   	// #0
  c4:	2a0803e1 	mov	w1, w8
  c8:	910043ff 	add	sp, sp, #0x10
  cc:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d0:	d65f03c0 	ret
  d4:	d503201f 	nop

00000000000000d8 <mul>:
  d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  dc:	910003fd 	mov	x29, sp
  e0:	d10043ff 	sub	sp, sp, #0x10
  e4:	b90003e0 	str	w0, [sp]
  e8:	b90007e1 	str	w1, [sp, #4]
  ec:	b94003e8 	ldr	w8, [sp]
  f0:	b94007e9 	ldr	w9, [sp, #4]
  f4:	1b097d08 	mul	w8, w8, w9
  f8:	52800000 	mov	w0, #0x0                   	// #0
  fc:	2a0803e1 	mov	w1, w8
 100:	910043ff 	add	sp, sp, #0x10
 104:	a8c17bfd 	ldp	x29, x30, [sp], #16
 108:	d65f03c0 	ret
 10c:	d503201f 	nop
