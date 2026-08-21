
tests/assets/jit/call.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 basic
0000000000000038 l     F .text	0000000000000028 one
0000000000000060 l     F .text	0000000000000038 back
0000000000000098 l     F .text	0000000000000050 four
00000000000000e8 l     F .text	0000000000000030 $func4
0000000000000118 l     F .text	0000000000000030 call_trap
0000000000000148 l     F .text	0000000000000038 $func6
0000000000000180 l     F .text	0000000000000058 plus_one
00000000000001d8 l     F .text	0000000000000040 square_f32
0000000000000218 l     F .text	0000000000000038 $func9


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e00340f9 09000094 800000b5 e80301aa  ..@.............
 0020 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0030 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0040 ff4300d1 e00300f9 280080d2 000080d2  .C......(.......
 0050 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0060 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0070 e00340f9 f1ffff97 800000b5 e80301aa  ..@.............
 0080 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0090 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00a0 ff4300d1 e00300f9 680080d2 e00340f9  .C......h.....@.
 00b0 ff4300d1 e80300f9 e0ffff97 e80340f9  .C............@.
 00c0 ff430091 a00000b5 e90301aa 0801098b  .C..............
 00d0 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 00e0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00f0 ff4300d1 e00300f9 410180d2 200080d2  .C......A... ...
 0100 03000014 000080d2 e1031faa ff430091  .............C..
 0110 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0120 ff4300d1 e00300f9 e00340f9 efffff97  .C........@.....
 0130 600000b5 000080d2 e1031faa ff430091  `............C..
 0140 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0150 ff4300d1 e00300f9 e10b00b9 e20f00b9  .C..............
 0160 e80b40b9 e90f40b9 0801090b 000080d2  ..@...@.........
 0170 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0180 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0190 e10b00b9 e20f00b9 e80b40b9 e90f40b9  ..........@...@.
 01a0 e203092a e103082a e00340f9 e7ffff97  ...*...*..@.....
 01b0 c00000b5 e803012a 29008052 0801090b  .......*)..R....
 01c0 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 01d0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 01e0 ff4300d1 e00300f9 e00b00bd e80b40bd  .C............@.
 01f0 0041201e e00340f9 08000094 800000b5  .A ...@.........
 0200 2800271e 000080d2 0101261e ff430091  (.'.......&..C..
 0210 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0220 ff4300d1 e00300f9 e00b00bd e80b40bd  .C............@.
 0230 e90b40bd 0809291e 000080d2 0101261e  ..@...).......&.
 0240 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <basic>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	f94003e0 	ldr	x0, [sp]
  14:	94000009 	bl	38 <one>
  18:	b5000080 	cbnz	x0, 28 <basic+0x28>
  1c:	aa0103e8 	mov	x8, x1
  20:	d2800000 	mov	x0, #0x0                   	// #0
  24:	aa0803e1 	mov	x1, x8
  28:	910043ff 	add	sp, sp, #0x10
  2c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  30:	d65f03c0 	ret
  34:	d503201f 	nop

0000000000000038 <one>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10043ff 	sub	sp, sp, #0x10
  44:	f90003e0 	str	x0, [sp]
  48:	d2800028 	mov	x8, #0x1                   	// #1
  4c:	d2800000 	mov	x0, #0x0                   	// #0
  50:	aa0803e1 	mov	x1, x8
  54:	910043ff 	add	sp, sp, #0x10
  58:	a8c17bfd 	ldp	x29, x30, [sp], #16
  5c:	d65f03c0 	ret

0000000000000060 <back>:
  60:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  64:	910003fd 	mov	x29, sp
  68:	d10043ff 	sub	sp, sp, #0x10
  6c:	f90003e0 	str	x0, [sp]
  70:	f94003e0 	ldr	x0, [sp]
  74:	97fffff1 	bl	38 <one>
  78:	b5000080 	cbnz	x0, 88 <back+0x28>
  7c:	aa0103e8 	mov	x8, x1
  80:	d2800000 	mov	x0, #0x0                   	// #0
  84:	aa0803e1 	mov	x1, x8
  88:	910043ff 	add	sp, sp, #0x10
  8c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  90:	d65f03c0 	ret
  94:	d503201f 	nop

0000000000000098 <four>:
  98:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  9c:	910003fd 	mov	x29, sp
  a0:	d10043ff 	sub	sp, sp, #0x10
  a4:	f90003e0 	str	x0, [sp]
  a8:	d2800068 	mov	x8, #0x3                   	// #3
  ac:	f94003e0 	ldr	x0, [sp]
  b0:	d10043ff 	sub	sp, sp, #0x10
  b4:	f90003e8 	str	x8, [sp]
  b8:	97ffffe0 	bl	38 <one>
  bc:	f94003e8 	ldr	x8, [sp]
  c0:	910043ff 	add	sp, sp, #0x10
  c4:	b50000a0 	cbnz	x0, d8 <four+0x40>
  c8:	aa0103e9 	mov	x9, x1
  cc:	8b090108 	add	x8, x8, x9
  d0:	d2800000 	mov	x0, #0x0                   	// #0
  d4:	aa0803e1 	mov	x1, x8
  d8:	910043ff 	add	sp, sp, #0x10
  dc:	a8c17bfd 	ldp	x29, x30, [sp], #16
  e0:	d65f03c0 	ret
  e4:	d503201f 	nop

00000000000000e8 <$func4>:
  e8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ec:	910003fd 	mov	x29, sp
  f0:	d10043ff 	sub	sp, sp, #0x10
  f4:	f90003e0 	str	x0, [sp]
  f8:	d2800141 	mov	x1, #0xa                   	// #10
  fc:	d2800020 	mov	x0, #0x1                   	// #1
 100:	14000003 	b	10c <$func4+0x24>
 104:	d2800000 	mov	x0, #0x0                   	// #0
 108:	aa1f03e1 	mov	x1, xzr
 10c:	910043ff 	add	sp, sp, #0x10
 110:	a8c17bfd 	ldp	x29, x30, [sp], #16
 114:	d65f03c0 	ret

0000000000000118 <call_trap>:
 118:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 11c:	910003fd 	mov	x29, sp
 120:	d10043ff 	sub	sp, sp, #0x10
 124:	f90003e0 	str	x0, [sp]
 128:	f94003e0 	ldr	x0, [sp]
 12c:	97ffffef 	bl	e8 <$func4>
 130:	b5000060 	cbnz	x0, 13c <call_trap+0x24>
 134:	d2800000 	mov	x0, #0x0                   	// #0
 138:	aa1f03e1 	mov	x1, xzr
 13c:	910043ff 	add	sp, sp, #0x10
 140:	a8c17bfd 	ldp	x29, x30, [sp], #16
 144:	d65f03c0 	ret

0000000000000148 <$func6>:
 148:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 14c:	910003fd 	mov	x29, sp
 150:	d10043ff 	sub	sp, sp, #0x10
 154:	f90003e0 	str	x0, [sp]
 158:	b9000be1 	str	w1, [sp, #8]
 15c:	b9000fe2 	str	w2, [sp, #12]
 160:	b9400be8 	ldr	w8, [sp, #8]
 164:	b9400fe9 	ldr	w9, [sp, #12]
 168:	0b090108 	add	w8, w8, w9
 16c:	d2800000 	mov	x0, #0x0                   	// #0
 170:	aa0803e1 	mov	x1, x8
 174:	910043ff 	add	sp, sp, #0x10
 178:	a8c17bfd 	ldp	x29, x30, [sp], #16
 17c:	d65f03c0 	ret

0000000000000180 <plus_one>:
 180:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 184:	910003fd 	mov	x29, sp
 188:	d10043ff 	sub	sp, sp, #0x10
 18c:	f90003e0 	str	x0, [sp]
 190:	b9000be1 	str	w1, [sp, #8]
 194:	b9000fe2 	str	w2, [sp, #12]
 198:	b9400be8 	ldr	w8, [sp, #8]
 19c:	b9400fe9 	ldr	w9, [sp, #12]
 1a0:	2a0903e2 	mov	w2, w9
 1a4:	2a0803e1 	mov	w1, w8
 1a8:	f94003e0 	ldr	x0, [sp]
 1ac:	97ffffe7 	bl	148 <$func6>
 1b0:	b50000c0 	cbnz	x0, 1c8 <plus_one+0x48>
 1b4:	2a0103e8 	mov	w8, w1
 1b8:	52800029 	mov	w9, #0x1                   	// #1
 1bc:	0b090108 	add	w8, w8, w9
 1c0:	d2800000 	mov	x0, #0x0                   	// #0
 1c4:	aa0803e1 	mov	x1, x8
 1c8:	910043ff 	add	sp, sp, #0x10
 1cc:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1d0:	d65f03c0 	ret
 1d4:	d503201f 	nop

00000000000001d8 <square_f32>:
 1d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1dc:	910003fd 	mov	x29, sp
 1e0:	d10043ff 	sub	sp, sp, #0x10
 1e4:	f90003e0 	str	x0, [sp]
 1e8:	bd000be0 	str	s0, [sp, #8]
 1ec:	bd400be8 	ldr	s8, [sp, #8]
 1f0:	1e204100 	fmov	s0, s8
 1f4:	f94003e0 	ldr	x0, [sp]
 1f8:	94000008 	bl	218 <$func9>
 1fc:	b5000080 	cbnz	x0, 20c <square_f32+0x34>
 200:	1e270028 	fmov	s8, w1
 204:	d2800000 	mov	x0, #0x0                   	// #0
 208:	1e260101 	fmov	w1, s8
 20c:	910043ff 	add	sp, sp, #0x10
 210:	a8c17bfd 	ldp	x29, x30, [sp], #16
 214:	d65f03c0 	ret

0000000000000218 <$func9>:
 218:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 21c:	910003fd 	mov	x29, sp
 220:	d10043ff 	sub	sp, sp, #0x10
 224:	f90003e0 	str	x0, [sp]
 228:	bd000be0 	str	s0, [sp, #8]
 22c:	bd400be8 	ldr	s8, [sp, #8]
 230:	bd400be9 	ldr	s9, [sp, #8]
 234:	1e290908 	fmul	s8, s8, s9
 238:	d2800000 	mov	x0, #0x0                   	// #0
 23c:	1e260101 	fmov	w1, s8
 240:	910043ff 	add	sp, sp, #0x10
 244:	a8c17bfd 	ldp	x29, x30, [sp], #16
 248:	d65f03c0 	ret
 24c:	d503201f 	nop
