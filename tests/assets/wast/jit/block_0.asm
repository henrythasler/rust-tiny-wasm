
tests/assets/wast/jit/block_0.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000030 type-i32
0000000000000030 l     F .text	0000000000000030 type-i64
0000000000000060 l     F .text	0000000000000030 type-i32-value
0000000000000090 l     F .text	0000000000000030 type-i64-value
00000000000000c0 l     F .text	0000000000000038 as-block-first
00000000000000f8 l     F .text	0000000000000038 as-block-first-value
0000000000000130 l     F .text	0000000000000030 as-binary-left
0000000000000160 l     F .text	0000000000000030 as-binary-right
0000000000000190 l     F .text	0000000000000030 as-test-operand
00000000000001c0 l     F .text	0000000000000030 as-compare-left
00000000000001f0 l     F .text	0000000000000038 as-compare-right
0000000000000228 l     F .text	0000000000000030 as-br_if-value
0000000000000258 l     F .text	0000000000000030 as-br_if-value-cond
0000000000000288 l     F .text	0000000000000038 nested-br-value
00000000000002c0 l     F .text	0000000000000040 nested-br_if-value


Contents of section .text:
 0000 fd7bbfa9 fd030091 08008052 29008052  .{.........R)..R
 0010 69000035 0801c05a 0811c05a 000080d2  i..5...Z...Z....
 0020 e1031faa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 0030 fd7bbfa9 fd030091 080080d2 29008052  .{..........)..R
 0040 69000035 0801c0da 0811c0da 000080d2  i..5............
 0050 e1031faa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 0060 fd7bbfa9 fd030091 28008052 29008052  .{......(..R)..R
 0070 69000035 0801c05a 0811c05a 00008052  i..5...Z...Z...R
 0080 e103082a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 0090 fd7bbfa9 fd030091 480080d2 29008052  .{......H...)..R
 00a0 69000035 0801c0da 0811c0da 000080d2  i..5............
 00b0 e10308aa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 00c0 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 00d0 e80340b9 68000035 48008052 02000014  ..@.h..5H..R....
 00e0 68008052 00008052 e103082a ff430091  h..R...R...*.C..
 00f0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0100 ff4300d1 e00300b9 48018052 e90340b9  .C......H..R..@.
 0110 69000035 68018052 01000014 00008052  i..5h..R.......R
 0120 e103082a ff430091 fd7bc1a8 c0035fd6  ...*.C...{...._.
 0130 fd7bbfa9 fd030091 28008052 29008052  .{......(..R)..R
 0140 69000035 49018052 0801090b 00008052  i..5I..R.......R
 0150 e103082a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 0160 fd7bbfa9 fd030091 48018052 29008052  .{......H..R)..R
 0170 2a008052 6a000035 0801094b e903082a  *..Rj..5...K...*
 0180 00008052 e103092a fd7bc1a8 c0035fd6  ...R...*.{...._.
 0190 fd7bbfa9 fd030091 08008052 29008052  .{.........R)..R
 01a0 69000035 1f010071 e8179f1a 00008052  i..5...q.......R
 01b0 e103082a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 01c0 fd7bbfa9 fd030091 28008052 29008052  .{......(..R)..R
 01d0 89000035 49018052 1f01096b e8879f1a  ...5I..R...k....
 01e0 00008052 e103082a fd7bc1a8 c0035fd6  ...R...*.{...._.
 01f0 fd7bbfa9 fd030091 48018052 29008052  .{......H..R)..R
 0200 2a008052 8a000035 1f01096b e8879f1a  *..R...5...k....
 0210 e903082a 00008052 e103092a fd7bc1a8  ...*...R...*.{..
 0220 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0230 08018052 04000014 29008052 49000035  ...R....)..RI..5
 0240 e8008052 00008052 e103082a fd7bc1a8  ...R...R...*.{..
 0250 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0260 c8008052 29018052 04000014 69000035  ...R)..R....i..5
 0270 e8008052 e903082a 00008052 e103092a  ...R...*...R...*
 0280 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0290 28008052 49008052 89008052 09018052  (..RI..R...R...R
 02a0 03000014 01000014 09028052 0801090b  ...........R....
 02b0 00008052 e103082a fd7bc1a8 c0035fd6  ...R...*.{...._.
 02c0 fd7bbfa9 fd030091 28008052 49008052  .{......(..RI..R
 02d0 89008052 09018052 05000014 2a008052  ...R...R....*..R
 02e0 4a000035 09048052 09028052 0801090b  J..5...R...R....
 02f0 00008052 e103082a fd7bc1a8 c0035fd6  ...R...*.{...._.

Disassembly of section .text:

0000000000000000 <type-i32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	52800008 	mov	w8, #0x0                   	// #0
   c:	52800029 	mov	w9, #0x1                   	// #1
  10:	35000069 	cbnz	w9, 1c <type-i32+0x1c>
  14:	5ac00108 	rbit	w8, w8
  18:	5ac01108 	clz	w8, w8
  1c:	d2800000 	mov	x0, #0x0                   	// #0
  20:	aa1f03e1 	mov	x1, xzr
  24:	a8c17bfd 	ldp	x29, x30, [sp], #16
  28:	d65f03c0 	ret
  2c:	d503201f 	nop

0000000000000030 <type-i64>:
  30:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  34:	910003fd 	mov	x29, sp
  38:	d2800008 	mov	x8, #0x0                   	// #0
  3c:	52800029 	mov	w9, #0x1                   	// #1
  40:	35000069 	cbnz	w9, 4c <type-i64+0x1c>
  44:	dac00108 	rbit	x8, x8
  48:	dac01108 	clz	x8, x8
  4c:	d2800000 	mov	x0, #0x0                   	// #0
  50:	aa1f03e1 	mov	x1, xzr
  54:	a8c17bfd 	ldp	x29, x30, [sp], #16
  58:	d65f03c0 	ret
  5c:	d503201f 	nop

0000000000000060 <type-i32-value>:
  60:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  64:	910003fd 	mov	x29, sp
  68:	52800028 	mov	w8, #0x1                   	// #1
  6c:	52800029 	mov	w9, #0x1                   	// #1
  70:	35000069 	cbnz	w9, 7c <type-i32-value+0x1c>
  74:	5ac00108 	rbit	w8, w8
  78:	5ac01108 	clz	w8, w8
  7c:	52800000 	mov	w0, #0x0                   	// #0
  80:	2a0803e1 	mov	w1, w8
  84:	a8c17bfd 	ldp	x29, x30, [sp], #16
  88:	d65f03c0 	ret
  8c:	d503201f 	nop

0000000000000090 <type-i64-value>:
  90:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  94:	910003fd 	mov	x29, sp
  98:	d2800048 	mov	x8, #0x2                   	// #2
  9c:	52800029 	mov	w9, #0x1                   	// #1
  a0:	35000069 	cbnz	w9, ac <type-i64-value+0x1c>
  a4:	dac00108 	rbit	x8, x8
  a8:	dac01108 	clz	x8, x8
  ac:	d2800000 	mov	x0, #0x0                   	// #0
  b0:	aa0803e1 	mov	x1, x8
  b4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  b8:	d65f03c0 	ret
  bc:	d503201f 	nop

00000000000000c0 <as-block-first>:
  c0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  c4:	910003fd 	mov	x29, sp
  c8:	d10043ff 	sub	sp, sp, #0x10
  cc:	b90003e0 	str	w0, [sp]
  d0:	b94003e8 	ldr	w8, [sp]
  d4:	35000068 	cbnz	w8, e0 <as-block-first+0x20>
  d8:	52800048 	mov	w8, #0x2                   	// #2
  dc:	14000002 	b	e4 <as-block-first+0x24>
  e0:	52800068 	mov	w8, #0x3                   	// #3
  e4:	52800000 	mov	w0, #0x0                   	// #0
  e8:	2a0803e1 	mov	w1, w8
  ec:	910043ff 	add	sp, sp, #0x10
  f0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  f4:	d65f03c0 	ret

00000000000000f8 <as-block-first-value>:
  f8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  fc:	910003fd 	mov	x29, sp
 100:	d10043ff 	sub	sp, sp, #0x10
 104:	b90003e0 	str	w0, [sp]
 108:	52800148 	mov	w8, #0xa                   	// #10
 10c:	b94003e9 	ldr	w9, [sp]
 110:	35000069 	cbnz	w9, 11c <as-block-first-value+0x24>
 114:	52800168 	mov	w8, #0xb                   	// #11
 118:	14000001 	b	11c <as-block-first-value+0x24>
 11c:	52800000 	mov	w0, #0x0                   	// #0
 120:	2a0803e1 	mov	w1, w8
 124:	910043ff 	add	sp, sp, #0x10
 128:	a8c17bfd 	ldp	x29, x30, [sp], #16
 12c:	d65f03c0 	ret

0000000000000130 <as-binary-left>:
 130:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 134:	910003fd 	mov	x29, sp
 138:	52800028 	mov	w8, #0x1                   	// #1
 13c:	52800029 	mov	w9, #0x1                   	// #1
 140:	35000069 	cbnz	w9, 14c <as-binary-left+0x1c>
 144:	52800149 	mov	w9, #0xa                   	// #10
 148:	0b090108 	add	w8, w8, w9
 14c:	52800000 	mov	w0, #0x0                   	// #0
 150:	2a0803e1 	mov	w1, w8
 154:	a8c17bfd 	ldp	x29, x30, [sp], #16
 158:	d65f03c0 	ret
 15c:	d503201f 	nop

0000000000000160 <as-binary-right>:
 160:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 164:	910003fd 	mov	x29, sp
 168:	52800148 	mov	w8, #0xa                   	// #10
 16c:	52800029 	mov	w9, #0x1                   	// #1
 170:	5280002a 	mov	w10, #0x1                   	// #1
 174:	3500006a 	cbnz	w10, 180 <as-binary-right+0x20>
 178:	4b090108 	sub	w8, w8, w9
 17c:	2a0803e9 	mov	w9, w8
 180:	52800000 	mov	w0, #0x0                   	// #0
 184:	2a0903e1 	mov	w1, w9
 188:	a8c17bfd 	ldp	x29, x30, [sp], #16
 18c:	d65f03c0 	ret

0000000000000190 <as-test-operand>:
 190:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 194:	910003fd 	mov	x29, sp
 198:	52800008 	mov	w8, #0x0                   	// #0
 19c:	52800029 	mov	w9, #0x1                   	// #1
 1a0:	35000069 	cbnz	w9, 1ac <as-test-operand+0x1c>
 1a4:	7100011f 	cmp	w8, #0x0
 1a8:	1a9f17e8 	cset	w8, eq	// eq = none
 1ac:	52800000 	mov	w0, #0x0                   	// #0
 1b0:	2a0803e1 	mov	w1, w8
 1b4:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1b8:	d65f03c0 	ret
 1bc:	d503201f 	nop

00000000000001c0 <as-compare-left>:
 1c0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1c4:	910003fd 	mov	x29, sp
 1c8:	52800028 	mov	w8, #0x1                   	// #1
 1cc:	52800029 	mov	w9, #0x1                   	// #1
 1d0:	35000089 	cbnz	w9, 1e0 <as-compare-left+0x20>
 1d4:	52800149 	mov	w9, #0xa                   	// #10
 1d8:	6b09011f 	cmp	w8, w9
 1dc:	1a9f87e8 	cset	w8, ls	// ls = plast
 1e0:	52800000 	mov	w0, #0x0                   	// #0
 1e4:	2a0803e1 	mov	w1, w8
 1e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1ec:	d65f03c0 	ret

00000000000001f0 <as-compare-right>:
 1f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1f4:	910003fd 	mov	x29, sp
 1f8:	52800148 	mov	w8, #0xa                   	// #10
 1fc:	52800029 	mov	w9, #0x1                   	// #1
 200:	5280002a 	mov	w10, #0x1                   	// #1
 204:	3500008a 	cbnz	w10, 214 <as-compare-right+0x24>
 208:	6b09011f 	cmp	w8, w9
 20c:	1a9f87e8 	cset	w8, ls	// ls = plast
 210:	2a0803e9 	mov	w9, w8
 214:	52800000 	mov	w0, #0x0                   	// #0
 218:	2a0903e1 	mov	w1, w9
 21c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 220:	d65f03c0 	ret
 224:	d503201f 	nop

0000000000000228 <as-br_if-value>:
 228:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 22c:	910003fd 	mov	x29, sp
 230:	52800108 	mov	w8, #0x8                   	// #8
 234:	14000004 	b	244 <as-br_if-value+0x1c>
 238:	52800029 	mov	w9, #0x1                   	// #1
 23c:	35000049 	cbnz	w9, 244 <as-br_if-value+0x1c>
 240:	528000e8 	mov	w8, #0x7                   	// #7
 244:	52800000 	mov	w0, #0x0                   	// #0
 248:	2a0803e1 	mov	w1, w8
 24c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 250:	d65f03c0 	ret
 254:	d503201f 	nop

0000000000000258 <as-br_if-value-cond>:
 258:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 25c:	910003fd 	mov	x29, sp
 260:	528000c8 	mov	w8, #0x6                   	// #6
 264:	52800129 	mov	w9, #0x9                   	// #9
 268:	14000004 	b	278 <as-br_if-value-cond+0x20>
 26c:	35000069 	cbnz	w9, 278 <as-br_if-value-cond+0x20>
 270:	528000e8 	mov	w8, #0x7                   	// #7
 274:	2a0803e9 	mov	w9, w8
 278:	52800000 	mov	w0, #0x0                   	// #0
 27c:	2a0903e1 	mov	w1, w9
 280:	a8c17bfd 	ldp	x29, x30, [sp], #16
 284:	d65f03c0 	ret

0000000000000288 <nested-br-value>:
 288:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 28c:	910003fd 	mov	x29, sp
 290:	52800028 	mov	w8, #0x1                   	// #1
 294:	52800049 	mov	w9, #0x2                   	// #2
 298:	52800089 	mov	w9, #0x4                   	// #4
 29c:	52800109 	mov	w9, #0x8                   	// #8
 2a0:	14000003 	b	2ac <nested-br-value+0x24>
 2a4:	14000001 	b	2a8 <nested-br-value+0x20>
 2a8:	52800209 	mov	w9, #0x10                  	// #16
 2ac:	0b090108 	add	w8, w8, w9
 2b0:	52800000 	mov	w0, #0x0                   	// #0
 2b4:	2a0803e1 	mov	w1, w8
 2b8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 2bc:	d65f03c0 	ret

00000000000002c0 <nested-br_if-value>:
 2c0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 2c4:	910003fd 	mov	x29, sp
 2c8:	52800028 	mov	w8, #0x1                   	// #1
 2cc:	52800049 	mov	w9, #0x2                   	// #2
 2d0:	52800089 	mov	w9, #0x4                   	// #4
 2d4:	52800109 	mov	w9, #0x8                   	// #8
 2d8:	14000005 	b	2ec <nested-br_if-value+0x2c>
 2dc:	5280002a 	mov	w10, #0x1                   	// #1
 2e0:	3500004a 	cbnz	w10, 2e8 <nested-br_if-value+0x28>
 2e4:	52800409 	mov	w9, #0x20                  	// #32
 2e8:	52800209 	mov	w9, #0x10                  	// #16
 2ec:	0b090108 	add	w8, w8, w9
 2f0:	52800000 	mov	w0, #0x0                   	// #0
 2f4:	2a0803e1 	mov	w1, w8
 2f8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 2fc:	d65f03c0 	ret
