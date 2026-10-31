
tests/assets/jit/unreachable.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000030 binop_after_unreachable
0000000000000030 l     F .text	0000000000000030 block_result_unreachable
0000000000000060 l     F .text	0000000000000030 dead_operands_after_br
0000000000000090 l     F .text	0000000000000030 dead_nested_block
00000000000000c0 l     F .text	0000000000000030 dead_if_else
00000000000000f0 l     F .text	0000000000000038 float_block
0000000000000128 l     F .text	0000000000000048 float_unreachable_tail
0000000000000170 l     F .text	0000000000000030 return_then_dead


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 410180d2 200080d2 03000014 000080d2  A... ...........
 0020 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0030 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0040 410180d2 200080d2 03000014 000080d2  A... ...........
 0050 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0060 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0070 e8008052 01000014 000080d2 e10308aa  ...R............
 0080 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0090 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00a0 68008052 01000014 000080d2 e10308aa  h..R............
 00b0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 00c0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00d0 e10b00b9 a8008052 01000014 000080d2  .......R........
 00e0 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 00f0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0100 08008052 08f8a772 0801271e 01000014  ...R...r..'.....
 0110 000080d2 0101261e ff430091 fd7bc1a8  ......&..C...{..
 0120 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0130 ff4300d1 e00300f9 e10b00b9 e80b40b9  .C............@.
 0140 88000034 410180d2 200080d2 06000014  ...4A... .......
 0150 08008052 0804a872 0801271e 000080d2  ...R...r..'.....
 0160 0101261e ff430091 fd7bc1a8 c0035fd6  ..&..C...{...._.
 0170 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0180 48058052 01000014 000080d2 e10308aa  H..R............
 0190 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <binop_after_unreachable>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	d2800141 	mov	x1, #0xa                   	// #10
  14:	d2800020 	mov	x0, #0x1                   	// #1
  18:	14000003 	b	24 <binop_after_unreachable+0x24>
  1c:	d2800000 	mov	x0, #0x0                   	// #0
  20:	aa0803e1 	mov	x1, x8
  24:	910043ff 	add	sp, sp, #0x10
  28:	a8c17bfd 	ldp	x29, x30, [sp], #16
  2c:	d65f03c0 	ret

0000000000000030 <block_result_unreachable>:
  30:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  34:	910003fd 	mov	x29, sp
  38:	d10043ff 	sub	sp, sp, #0x10
  3c:	f90003e0 	str	x0, [sp]
  40:	d2800141 	mov	x1, #0xa                   	// #10
  44:	d2800020 	mov	x0, #0x1                   	// #1
  48:	14000003 	b	54 <block_result_unreachable+0x24>
  4c:	d2800000 	mov	x0, #0x0                   	// #0
  50:	aa0803e1 	mov	x1, x8
  54:	910043ff 	add	sp, sp, #0x10
  58:	a8c17bfd 	ldp	x29, x30, [sp], #16
  5c:	d65f03c0 	ret

0000000000000060 <dead_operands_after_br>:
  60:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  64:	910003fd 	mov	x29, sp
  68:	d10043ff 	sub	sp, sp, #0x10
  6c:	f90003e0 	str	x0, [sp]
  70:	528000e8 	mov	w8, #0x7                   	// #7
  74:	14000001 	b	78 <dead_operands_after_br+0x18>
  78:	d2800000 	mov	x0, #0x0                   	// #0
  7c:	aa0803e1 	mov	x1, x8
  80:	910043ff 	add	sp, sp, #0x10
  84:	a8c17bfd 	ldp	x29, x30, [sp], #16
  88:	d65f03c0 	ret
  8c:	d503201f 	nop

0000000000000090 <dead_nested_block>:
  90:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  94:	910003fd 	mov	x29, sp
  98:	d10043ff 	sub	sp, sp, #0x10
  9c:	f90003e0 	str	x0, [sp]
  a0:	52800068 	mov	w8, #0x3                   	// #3
  a4:	14000001 	b	a8 <dead_nested_block+0x18>
  a8:	d2800000 	mov	x0, #0x0                   	// #0
  ac:	aa0803e1 	mov	x1, x8
  b0:	910043ff 	add	sp, sp, #0x10
  b4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  b8:	d65f03c0 	ret
  bc:	d503201f 	nop

00000000000000c0 <dead_if_else>:
  c0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  c4:	910003fd 	mov	x29, sp
  c8:	d10043ff 	sub	sp, sp, #0x10
  cc:	f90003e0 	str	x0, [sp]
  d0:	b9000be1 	str	w1, [sp, #8]
  d4:	528000a8 	mov	w8, #0x5                   	// #5
  d8:	14000001 	b	dc <dead_if_else+0x1c>
  dc:	d2800000 	mov	x0, #0x0                   	// #0
  e0:	aa0803e1 	mov	x1, x8
  e4:	910043ff 	add	sp, sp, #0x10
  e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  ec:	d65f03c0 	ret

00000000000000f0 <float_block>:
  f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  f4:	910003fd 	mov	x29, sp
  f8:	d10043ff 	sub	sp, sp, #0x10
  fc:	f90003e0 	str	x0, [sp]
 100:	52800008 	mov	w8, #0x0                   	// #0
 104:	72a7f808 	movk	w8, #0x3fc0, lsl #16
 108:	1e270108 	fmov	s8, w8
 10c:	14000001 	b	110 <float_block+0x20>
 110:	d2800000 	mov	x0, #0x0                   	// #0
 114:	1e260101 	fmov	w1, s8
 118:	910043ff 	add	sp, sp, #0x10
 11c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 120:	d65f03c0 	ret
 124:	d503201f 	nop

0000000000000128 <float_unreachable_tail>:
 128:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 12c:	910003fd 	mov	x29, sp
 130:	d10043ff 	sub	sp, sp, #0x10
 134:	f90003e0 	str	x0, [sp]
 138:	b9000be1 	str	w1, [sp, #8]
 13c:	b9400be8 	ldr	w8, [sp, #8]
 140:	34000088 	cbz	w8, 150 <float_unreachable_tail+0x28>
 144:	d2800141 	mov	x1, #0xa                   	// #10
 148:	d2800020 	mov	x0, #0x1                   	// #1
 14c:	14000006 	b	164 <float_unreachable_tail+0x3c>
 150:	52800008 	mov	w8, #0x0                   	// #0
 154:	72a80408 	movk	w8, #0x4020, lsl #16
 158:	1e270108 	fmov	s8, w8
 15c:	d2800000 	mov	x0, #0x0                   	// #0
 160:	1e260101 	fmov	w1, s8
 164:	910043ff 	add	sp, sp, #0x10
 168:	a8c17bfd 	ldp	x29, x30, [sp], #16
 16c:	d65f03c0 	ret

0000000000000170 <return_then_dead>:
 170:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 174:	910003fd 	mov	x29, sp
 178:	d10043ff 	sub	sp, sp, #0x10
 17c:	f90003e0 	str	x0, [sp]
 180:	52800548 	mov	w8, #0x2a                  	// #42
 184:	14000001 	b	188 <return_then_dead+0x18>
 188:	d2800000 	mov	x0, #0x0                   	// #0
 18c:	aa0803e1 	mov	x1, x8
 190:	910043ff 	add	sp, sp, #0x10
 194:	a8c17bfd 	ldp	x29, x30, [sp], #16
 198:	d65f03c0 	ret
 19c:	d503201f 	nop
