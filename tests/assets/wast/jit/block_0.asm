
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
00000000000001f0 l     F .text	0000000000000030 as-compare-right
0000000000000220 l     F .text	0000000000000030 as-br_if-value
0000000000000250 l     F .text	0000000000000030 as-br_if-value-cond
0000000000000280 l     F .text	0000000000000038 nested-br-value
00000000000002b8 l     F .text	0000000000000040 nested-br_if-value


Contents of section .text:
 0000 fd7bbfa9 fd030091 08008052 29008052  .{.........R)..R
 0010 69000035 0801c05a 0811c05a e0031faa  i..5...Z...Z....
 0020 e1031faa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 0030 fd7bbfa9 fd030091 080080d2 29008052  .{..........)..R
 0040 69000035 0801c0da 0811c0da e0031faa  i..5............
 0050 e1031faa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 0060 fd7bbfa9 fd030091 28008052 29008052  .{......(..R)..R
 0070 69000035 0801c05a 0811c05a e003082a  i..5...Z...Z...*
 0080 e1031f2a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 0090 fd7bbfa9 fd030091 480080d2 29008052  .{......H...)..R
 00a0 69000035 0801c0da 0811c0da e00308aa  i..5............
 00b0 e1031faa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 00c0 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 00d0 e80340b9 68000035 48008052 02000014  ..@.h..5H..R....
 00e0 69008052 e003092a e1031f2a ff430091  i..R...*...*.C..
 00f0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0100 ff4300d1 e00300b9 48018052 e90340b9  .C......H..R..@.
 0110 69000035 68018052 01000014 e003082a  i..5h..R.......*
 0120 e1031f2a ff430091 fd7bc1a8 c0035fd6  ...*.C...{...._.
 0130 fd7bbfa9 fd030091 28008052 29008052  .{......(..R)..R
 0140 69000035 49018052 0801090b e003082a  i..5I..R.......*
 0150 e1031f2a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 0160 fd7bbfa9 fd030091 48018052 29008052  .{......H..R)..R
 0170 2a008052 4a000035 0801094b e003082a  *..RJ..5...K...*
 0180 e1031f2a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 0190 fd7bbfa9 fd030091 08008052 29008052  .{.........R)..R
 01a0 69000035 1f010071 e8179f1a e003082a  i..5...q.......*
 01b0 e1031f2a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 01c0 fd7bbfa9 fd030091 28008052 29008052  .{......(..R)..R
 01d0 89000035 49018052 1f01096b e8879f1a  ...5I..R...k....
 01e0 e003082a e1031f2a fd7bc1a8 c0035fd6  ...*...*.{...._.
 01f0 fd7bbfa9 fd030091 48018052 29008052  .{......H..R)..R
 0200 2a008052 6a000035 1f01096b e8879f1a  *..Rj..5...k....
 0210 e003082a e1031f2a fd7bc1a8 c0035fd6  ...*...*.{...._.
 0220 fd7bbfa9 fd030091 08018052 04000014  .{.........R....
 0230 29008052 49000035 e8008052 e003082a  )..RI..5...R...*
 0240 e1031f2a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 0250 fd7bbfa9 fd030091 c8008052 29018052  .{.........R)..R
 0260 03000014 49000035 e8008052 e003082a  ....I..5...R...*
 0270 e1031f2a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 0280 fd7bbfa9 fd030091 28008052 49008052  .{......(..RI..R
 0290 89008052 09018052 03000014 01000014  ...R...R........
 02a0 09028052 0801090b e003082a e1031f2a  ...R.......*...*
 02b0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 02c0 28008052 49008052 89008052 09018052  (..RI..R...R...R
 02d0 05000014 2a008052 4a000035 09048052  ....*..RJ..5...R
 02e0 09028052 0801090b e003082a e1031f2a  ...R.......*...*
 02f0 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <type-i32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	52800008 	mov	w8, #0x0                   	// #0
   c:	52800029 	mov	w9, #0x1                   	// #1
  10:	35000069 	cbnz	w9, 1c <type-i32+0x1c>
  14:	5ac00108 	rbit	w8, w8
  18:	5ac01108 	clz	w8, w8
  1c:	aa1f03e0 	mov	x0, xzr
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
  4c:	aa1f03e0 	mov	x0, xzr
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
  7c:	2a0803e0 	mov	w0, w8
  80:	2a1f03e1 	mov	w1, wzr
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
  ac:	aa0803e0 	mov	x0, x8
  b0:	aa1f03e1 	mov	x1, xzr
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
  e0:	52800069 	mov	w9, #0x3                   	// #3
  e4:	2a0903e0 	mov	w0, w9
  e8:	2a1f03e1 	mov	w1, wzr
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
 11c:	2a0803e0 	mov	w0, w8
 120:	2a1f03e1 	mov	w1, wzr
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
 14c:	2a0803e0 	mov	w0, w8
 150:	2a1f03e1 	mov	w1, wzr
 154:	a8c17bfd 	ldp	x29, x30, [sp], #16
 158:	d65f03c0 	ret
 15c:	d503201f 	nop

0000000000000160 <as-binary-right>:
 160:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 164:	910003fd 	mov	x29, sp
 168:	52800148 	mov	w8, #0xa                   	// #10
 16c:	52800029 	mov	w9, #0x1                   	// #1
 170:	5280002a 	mov	w10, #0x1                   	// #1
 174:	3500004a 	cbnz	w10, 17c <as-binary-right+0x1c>
 178:	4b090108 	sub	w8, w8, w9
 17c:	2a0803e0 	mov	w0, w8
 180:	2a1f03e1 	mov	w1, wzr
 184:	a8c17bfd 	ldp	x29, x30, [sp], #16
 188:	d65f03c0 	ret
 18c:	d503201f 	nop

0000000000000190 <as-test-operand>:
 190:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 194:	910003fd 	mov	x29, sp
 198:	52800008 	mov	w8, #0x0                   	// #0
 19c:	52800029 	mov	w9, #0x1                   	// #1
 1a0:	35000069 	cbnz	w9, 1ac <as-test-operand+0x1c>
 1a4:	7100011f 	cmp	w8, #0x0
 1a8:	1a9f17e8 	cset	w8, eq	// eq = none
 1ac:	2a0803e0 	mov	w0, w8
 1b0:	2a1f03e1 	mov	w1, wzr
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
 1e0:	2a0803e0 	mov	w0, w8
 1e4:	2a1f03e1 	mov	w1, wzr
 1e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1ec:	d65f03c0 	ret

00000000000001f0 <as-compare-right>:
 1f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1f4:	910003fd 	mov	x29, sp
 1f8:	52800148 	mov	w8, #0xa                   	// #10
 1fc:	52800029 	mov	w9, #0x1                   	// #1
 200:	5280002a 	mov	w10, #0x1                   	// #1
 204:	3500006a 	cbnz	w10, 210 <as-compare-right+0x20>
 208:	6b09011f 	cmp	w8, w9
 20c:	1a9f87e8 	cset	w8, ls	// ls = plast
 210:	2a0803e0 	mov	w0, w8
 214:	2a1f03e1 	mov	w1, wzr
 218:	a8c17bfd 	ldp	x29, x30, [sp], #16
 21c:	d65f03c0 	ret

0000000000000220 <as-br_if-value>:
 220:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 224:	910003fd 	mov	x29, sp
 228:	52800108 	mov	w8, #0x8                   	// #8
 22c:	14000004 	b	23c <as-br_if-value+0x1c>
 230:	52800029 	mov	w9, #0x1                   	// #1
 234:	35000049 	cbnz	w9, 23c <as-br_if-value+0x1c>
 238:	528000e8 	mov	w8, #0x7                   	// #7
 23c:	2a0803e0 	mov	w0, w8
 240:	2a1f03e1 	mov	w1, wzr
 244:	a8c17bfd 	ldp	x29, x30, [sp], #16
 248:	d65f03c0 	ret
 24c:	d503201f 	nop

0000000000000250 <as-br_if-value-cond>:
 250:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 254:	910003fd 	mov	x29, sp
 258:	528000c8 	mov	w8, #0x6                   	// #6
 25c:	52800129 	mov	w9, #0x9                   	// #9
 260:	14000003 	b	26c <as-br_if-value-cond+0x1c>
 264:	35000049 	cbnz	w9, 26c <as-br_if-value-cond+0x1c>
 268:	528000e8 	mov	w8, #0x7                   	// #7
 26c:	2a0803e0 	mov	w0, w8
 270:	2a1f03e1 	mov	w1, wzr
 274:	a8c17bfd 	ldp	x29, x30, [sp], #16
 278:	d65f03c0 	ret
 27c:	d503201f 	nop

0000000000000280 <nested-br-value>:
 280:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 284:	910003fd 	mov	x29, sp
 288:	52800028 	mov	w8, #0x1                   	// #1
 28c:	52800049 	mov	w9, #0x2                   	// #2
 290:	52800089 	mov	w9, #0x4                   	// #4
 294:	52800109 	mov	w9, #0x8                   	// #8
 298:	14000003 	b	2a4 <nested-br-value+0x24>
 29c:	14000001 	b	2a0 <nested-br-value+0x20>
 2a0:	52800209 	mov	w9, #0x10                  	// #16
 2a4:	0b090108 	add	w8, w8, w9
 2a8:	2a0803e0 	mov	w0, w8
 2ac:	2a1f03e1 	mov	w1, wzr
 2b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 2b4:	d65f03c0 	ret

00000000000002b8 <nested-br_if-value>:
 2b8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 2bc:	910003fd 	mov	x29, sp
 2c0:	52800028 	mov	w8, #0x1                   	// #1
 2c4:	52800049 	mov	w9, #0x2                   	// #2
 2c8:	52800089 	mov	w9, #0x4                   	// #4
 2cc:	52800109 	mov	w9, #0x8                   	// #8
 2d0:	14000005 	b	2e4 <nested-br_if-value+0x2c>
 2d4:	5280002a 	mov	w10, #0x1                   	// #1
 2d8:	3500004a 	cbnz	w10, 2e0 <nested-br_if-value+0x28>
 2dc:	52800409 	mov	w9, #0x20                  	// #32
 2e0:	52800209 	mov	w9, #0x10                  	// #16
 2e4:	0b090108 	add	w8, w8, w9
 2e8:	2a0803e0 	mov	w0, w8
 2ec:	2a1f03e1 	mov	w1, wzr
 2f0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 2f4:	d65f03c0 	ret
