
tests/assets/jit/call.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 basic
0000000000000028 l     F .text	0000000000000020 one
0000000000000048 l     F .text	0000000000000028 back
0000000000000070 l     F .text	0000000000000040 four
00000000000000b0 l     F .text	0000000000000028 $func4
00000000000000d8 l     F .text	0000000000000020 call_trap
00000000000000f8 l     F .text	0000000000000038 $func6
0000000000000130 l     F .text	0000000000000050 plus_one


Contents of section .text:
 0000 fd7bbfa9 fd030091 08000094 800000b5  .{..............
 0010 e80301aa 000080d2 e10308aa fd7bc1a8  .............{..
 0020 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0030 280080d2 000080d2 e10308aa fd7bc1a8  (............{..
 0040 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0050 f6ffff97 800000b5 e80301aa 000080d2  ................
 0060 e10308aa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 0070 fd7bbfa9 fd030091 680080d2 ff4300d1  .{......h....C..
 0080 e80300f9 e9ffff97 e80340f9 ff430091  ..........@..C..
 0090 a00000b5 e90301aa 0801098b 000080d2  ................
 00a0 e10308aa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 00b0 fd7bbfa9 fd030091 410180d2 200080d2  .{......A... ...
 00c0 03000014 000080d2 e1031faa fd7bc1a8  .............{..
 00d0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00e0 f4ffff97 600000b5 000080d2 e1031faa  ....`...........
 00f0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0100 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 0110 e90740b9 0801090b 000080d2 e10308aa  ..@.............
 0120 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0130 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0140 e10700b9 e80340b9 e90740b9 e003092a  ......@...@....*
 0150 e103082a e9ffff97 c00000b5 e803012a  ...*...........*
 0160 29008052 0801090b 000080d2 e10308aa  )..R............
 0170 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <basic>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	94000008 	bl	28 <one>
   c:	b5000080 	cbnz	x0, 1c <basic+0x1c>
  10:	aa0103e8 	mov	x8, x1
  14:	d2800000 	mov	x0, #0x0                   	// #0
  18:	aa0803e1 	mov	x1, x8
  1c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  20:	d65f03c0 	ret
  24:	d503201f 	nop

0000000000000028 <one>:
  28:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  2c:	910003fd 	mov	x29, sp
  30:	d2800028 	mov	x8, #0x1                   	// #1
  34:	d2800000 	mov	x0, #0x0                   	// #0
  38:	aa0803e1 	mov	x1, x8
  3c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  40:	d65f03c0 	ret
  44:	d503201f 	nop

0000000000000048 <back>:
  48:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  4c:	910003fd 	mov	x29, sp
  50:	97fffff6 	bl	28 <one>
  54:	b5000080 	cbnz	x0, 64 <back+0x1c>
  58:	aa0103e8 	mov	x8, x1
  5c:	d2800000 	mov	x0, #0x0                   	// #0
  60:	aa0803e1 	mov	x1, x8
  64:	a8c17bfd 	ldp	x29, x30, [sp], #16
  68:	d65f03c0 	ret
  6c:	d503201f 	nop

0000000000000070 <four>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	d2800068 	mov	x8, #0x3                   	// #3
  7c:	d10043ff 	sub	sp, sp, #0x10
  80:	f90003e8 	str	x8, [sp]
  84:	97ffffe9 	bl	28 <one>
  88:	f94003e8 	ldr	x8, [sp]
  8c:	910043ff 	add	sp, sp, #0x10
  90:	b50000a0 	cbnz	x0, a4 <four+0x34>
  94:	aa0103e9 	mov	x9, x1
  98:	8b090108 	add	x8, x8, x9
  9c:	d2800000 	mov	x0, #0x0                   	// #0
  a0:	aa0803e1 	mov	x1, x8
  a4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a8:	d65f03c0 	ret
  ac:	d503201f 	nop

00000000000000b0 <$func4>:
  b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  b4:	910003fd 	mov	x29, sp
  b8:	d2800141 	mov	x1, #0xa                   	// #10
  bc:	d2800020 	mov	x0, #0x1                   	// #1
  c0:	14000003 	b	cc <$func4+0x1c>
  c4:	d2800000 	mov	x0, #0x0                   	// #0
  c8:	aa1f03e1 	mov	x1, xzr
  cc:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d0:	d65f03c0 	ret
  d4:	d503201f 	nop

00000000000000d8 <call_trap>:
  d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  dc:	910003fd 	mov	x29, sp
  e0:	97fffff4 	bl	b0 <$func4>
  e4:	b5000060 	cbnz	x0, f0 <call_trap+0x18>
  e8:	d2800000 	mov	x0, #0x0                   	// #0
  ec:	aa1f03e1 	mov	x1, xzr
  f0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  f4:	d65f03c0 	ret

00000000000000f8 <$func6>:
  f8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  fc:	910003fd 	mov	x29, sp
 100:	d10043ff 	sub	sp, sp, #0x10
 104:	b90003e0 	str	w0, [sp]
 108:	b90007e1 	str	w1, [sp, #4]
 10c:	b94003e8 	ldr	w8, [sp]
 110:	b94007e9 	ldr	w9, [sp, #4]
 114:	0b090108 	add	w8, w8, w9
 118:	d2800000 	mov	x0, #0x0                   	// #0
 11c:	aa0803e1 	mov	x1, x8
 120:	910043ff 	add	sp, sp, #0x10
 124:	a8c17bfd 	ldp	x29, x30, [sp], #16
 128:	d65f03c0 	ret
 12c:	d503201f 	nop

0000000000000130 <plus_one>:
 130:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 134:	910003fd 	mov	x29, sp
 138:	d10043ff 	sub	sp, sp, #0x10
 13c:	b90003e0 	str	w0, [sp]
 140:	b90007e1 	str	w1, [sp, #4]
 144:	b94003e8 	ldr	w8, [sp]
 148:	b94007e9 	ldr	w9, [sp, #4]
 14c:	2a0903e0 	mov	w0, w9
 150:	2a0803e1 	mov	w1, w8
 154:	97ffffe9 	bl	f8 <$func6>
 158:	b50000c0 	cbnz	x0, 170 <plus_one+0x40>
 15c:	2a0103e8 	mov	w8, w1
 160:	52800029 	mov	w9, #0x1                   	// #1
 164:	0b090108 	add	w8, w8, w9
 168:	d2800000 	mov	x0, #0x0                   	// #0
 16c:	aa0803e1 	mov	x1, x8
 170:	910043ff 	add	sp, sp, #0x10
 174:	a8c17bfd 	ldp	x29, x30, [sp], #16
 178:	d65f03c0 	ret
 17c:	d503201f 	nop
