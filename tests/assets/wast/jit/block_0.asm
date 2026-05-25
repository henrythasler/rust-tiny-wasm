
tests/assets/wast/jit/block_0.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 trap_handler
0000000000000068 l     F .text	0000000000000030 type-i32
0000000000000098 l     F .text	0000000000000030 type-i64
00000000000000c8 l     F .text	0000000000000030 type-i32-value
00000000000000f8 l     F .text	0000000000000030 type-i64-value
0000000000000128 l     F .text	0000000000000038 as-block-first
0000000000000160 l     F .text	0000000000000038 as-block-first-value
0000000000000198 l     F .text	0000000000000030 as-binary-left
00000000000001c8 l     F .text	0000000000000030 as-binary-right
00000000000001f8 l     F .text	0000000000000030 as-test-operand
0000000000000228 l     F .text	0000000000000030 as-compare-left
0000000000000258 l     F .text	0000000000000038 as-compare-right
0000000000000290 l     F .text	0000000000000030 as-br_if-value
00000000000002c0 l     F .text	0000000000000030 as-br_if-value-cond
00000000000002f0 l     F .text	0000000000000038 nested-br-value
0000000000000328 l     F .text	0000000000000040 nested-br_if-value


Contents of section .text:
 0000 010080d2 17000014 210080d2 15000014  ........!.......
 0010 410080d2 13000014 610080d2 11000014  A.......a.......
 0020 810080d2 0f000014 a10080d2 0d000014  ................
 0030 c10080d2 0b000014 e10080d2 09000014  ................
 0040 010180d2 07000014 210180d2 05000014  ........!.......
 0050 410180d2 03000014 610180d2 01000014  A.......a.......
 0060 200080d2 c0035fd6 fd7bbfa9 fd030091   ....._..{......
 0070 08008052 29008052 69000035 0801c05a  ...R)..Ri..5...Z
 0080 0811c05a 000080d2 e1031faa fd7bc1a8  ...Z.........{..
 0090 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00a0 080080d2 29008052 69000035 0801c0da  ....)..Ri..5....
 00b0 0811c0da 000080d2 e1031faa fd7bc1a8  .............{..
 00c0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00d0 28008052 29008052 69000035 0801c05a  (..R)..Ri..5...Z
 00e0 0811c05a 00008052 e103082a fd7bc1a8  ...Z...R...*.{..
 00f0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0100 480080d2 29008052 69000035 0801c0da  H...)..Ri..5....
 0110 0811c0da 000080d2 e10308aa fd7bc1a8  .............{..
 0120 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0130 ff4300d1 e00300b9 e80340b9 68000035  .C........@.h..5
 0140 48008052 02000014 68008052 00008052  H..R....h..R...R
 0150 e103082a ff430091 fd7bc1a8 c0035fd6  ...*.C...{...._.
 0160 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0170 48018052 e90340b9 69000035 68018052  H..R..@.i..5h..R
 0180 01000014 00008052 e103082a ff430091  .......R...*.C..
 0190 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 01a0 28008052 29008052 69000035 49018052  (..R)..Ri..5I..R
 01b0 0801090b 00008052 e103082a fd7bc1a8  .......R...*.{..
 01c0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 01d0 48018052 29008052 2a008052 6a000035  H..R)..R*..Rj..5
 01e0 0801094b e903082a 00008052 e103092a  ...K...*...R...*
 01f0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0200 08008052 29008052 69000035 1f010071  ...R)..Ri..5...q
 0210 e8179f1a 00008052 e103082a fd7bc1a8  .......R...*.{..
 0220 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0230 28008052 29008052 89000035 49018052  (..R)..R...5I..R
 0240 1f01096b e8879f1a 00008052 e103082a  ...k.......R...*
 0250 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0260 48018052 29008052 2a008052 8a000035  H..R)..R*..R...5
 0270 1f01096b e8879f1a e903082a 00008052  ...k.......*...R
 0280 e103092a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 0290 fd7bbfa9 fd030091 08018052 04000014  .{.........R....
 02a0 29008052 49000035 e8008052 00008052  )..RI..5...R...R
 02b0 e103082a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 02c0 fd7bbfa9 fd030091 c8008052 29018052  .{.........R)..R
 02d0 04000014 69000035 e8008052 e903082a  ....i..5...R...*
 02e0 00008052 e103092a fd7bc1a8 c0035fd6  ...R...*.{...._.
 02f0 fd7bbfa9 fd030091 28008052 49008052  .{......(..RI..R
 0300 89008052 09018052 03000014 01000014  ...R...R........
 0310 09028052 0801090b 00008052 e103082a  ...R.......R...*
 0320 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0330 28008052 49008052 89008052 09018052  (..RI..R...R...R
 0340 05000014 2a008052 4a000035 09048052  ....*..RJ..5...R
 0350 09028052 0801090b 00008052 e103082a  ...R.......R...*
 0360 fd7bc1a8 c0035fd6                    .{...._.        

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

0000000000000068 <type-i32>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	52800008 	mov	w8, #0x0                   	// #0
  74:	52800029 	mov	w9, #0x1                   	// #1
  78:	35000069 	cbnz	w9, 84 <type-i32+0x1c>
  7c:	5ac00108 	rbit	w8, w8
  80:	5ac01108 	clz	w8, w8
  84:	d2800000 	mov	x0, #0x0                   	// #0
  88:	aa1f03e1 	mov	x1, xzr
  8c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  90:	d65f03c0 	ret
  94:	d503201f 	nop

0000000000000098 <type-i64>:
  98:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  9c:	910003fd 	mov	x29, sp
  a0:	d2800008 	mov	x8, #0x0                   	// #0
  a4:	52800029 	mov	w9, #0x1                   	// #1
  a8:	35000069 	cbnz	w9, b4 <type-i64+0x1c>
  ac:	dac00108 	rbit	x8, x8
  b0:	dac01108 	clz	x8, x8
  b4:	d2800000 	mov	x0, #0x0                   	// #0
  b8:	aa1f03e1 	mov	x1, xzr
  bc:	a8c17bfd 	ldp	x29, x30, [sp], #16
  c0:	d65f03c0 	ret
  c4:	d503201f 	nop

00000000000000c8 <type-i32-value>:
  c8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  cc:	910003fd 	mov	x29, sp
  d0:	52800028 	mov	w8, #0x1                   	// #1
  d4:	52800029 	mov	w9, #0x1                   	// #1
  d8:	35000069 	cbnz	w9, e4 <type-i32-value+0x1c>
  dc:	5ac00108 	rbit	w8, w8
  e0:	5ac01108 	clz	w8, w8
  e4:	52800000 	mov	w0, #0x0                   	// #0
  e8:	2a0803e1 	mov	w1, w8
  ec:	a8c17bfd 	ldp	x29, x30, [sp], #16
  f0:	d65f03c0 	ret
  f4:	d503201f 	nop

00000000000000f8 <type-i64-value>:
  f8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  fc:	910003fd 	mov	x29, sp
 100:	d2800048 	mov	x8, #0x2                   	// #2
 104:	52800029 	mov	w9, #0x1                   	// #1
 108:	35000069 	cbnz	w9, 114 <type-i64-value+0x1c>
 10c:	dac00108 	rbit	x8, x8
 110:	dac01108 	clz	x8, x8
 114:	d2800000 	mov	x0, #0x0                   	// #0
 118:	aa0803e1 	mov	x1, x8
 11c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 120:	d65f03c0 	ret
 124:	d503201f 	nop

0000000000000128 <as-block-first>:
 128:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 12c:	910003fd 	mov	x29, sp
 130:	d10043ff 	sub	sp, sp, #0x10
 134:	b90003e0 	str	w0, [sp]
 138:	b94003e8 	ldr	w8, [sp]
 13c:	35000068 	cbnz	w8, 148 <as-block-first+0x20>
 140:	52800048 	mov	w8, #0x2                   	// #2
 144:	14000002 	b	14c <as-block-first+0x24>
 148:	52800068 	mov	w8, #0x3                   	// #3
 14c:	52800000 	mov	w0, #0x0                   	// #0
 150:	2a0803e1 	mov	w1, w8
 154:	910043ff 	add	sp, sp, #0x10
 158:	a8c17bfd 	ldp	x29, x30, [sp], #16
 15c:	d65f03c0 	ret

0000000000000160 <as-block-first-value>:
 160:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 164:	910003fd 	mov	x29, sp
 168:	d10043ff 	sub	sp, sp, #0x10
 16c:	b90003e0 	str	w0, [sp]
 170:	52800148 	mov	w8, #0xa                   	// #10
 174:	b94003e9 	ldr	w9, [sp]
 178:	35000069 	cbnz	w9, 184 <as-block-first-value+0x24>
 17c:	52800168 	mov	w8, #0xb                   	// #11
 180:	14000001 	b	184 <as-block-first-value+0x24>
 184:	52800000 	mov	w0, #0x0                   	// #0
 188:	2a0803e1 	mov	w1, w8
 18c:	910043ff 	add	sp, sp, #0x10
 190:	a8c17bfd 	ldp	x29, x30, [sp], #16
 194:	d65f03c0 	ret

0000000000000198 <as-binary-left>:
 198:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 19c:	910003fd 	mov	x29, sp
 1a0:	52800028 	mov	w8, #0x1                   	// #1
 1a4:	52800029 	mov	w9, #0x1                   	// #1
 1a8:	35000069 	cbnz	w9, 1b4 <as-binary-left+0x1c>
 1ac:	52800149 	mov	w9, #0xa                   	// #10
 1b0:	0b090108 	add	w8, w8, w9
 1b4:	52800000 	mov	w0, #0x0                   	// #0
 1b8:	2a0803e1 	mov	w1, w8
 1bc:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1c0:	d65f03c0 	ret
 1c4:	d503201f 	nop

00000000000001c8 <as-binary-right>:
 1c8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1cc:	910003fd 	mov	x29, sp
 1d0:	52800148 	mov	w8, #0xa                   	// #10
 1d4:	52800029 	mov	w9, #0x1                   	// #1
 1d8:	5280002a 	mov	w10, #0x1                   	// #1
 1dc:	3500006a 	cbnz	w10, 1e8 <as-binary-right+0x20>
 1e0:	4b090108 	sub	w8, w8, w9
 1e4:	2a0803e9 	mov	w9, w8
 1e8:	52800000 	mov	w0, #0x0                   	// #0
 1ec:	2a0903e1 	mov	w1, w9
 1f0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1f4:	d65f03c0 	ret

00000000000001f8 <as-test-operand>:
 1f8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1fc:	910003fd 	mov	x29, sp
 200:	52800008 	mov	w8, #0x0                   	// #0
 204:	52800029 	mov	w9, #0x1                   	// #1
 208:	35000069 	cbnz	w9, 214 <as-test-operand+0x1c>
 20c:	7100011f 	cmp	w8, #0x0
 210:	1a9f17e8 	cset	w8, eq	// eq = none
 214:	52800000 	mov	w0, #0x0                   	// #0
 218:	2a0803e1 	mov	w1, w8
 21c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 220:	d65f03c0 	ret
 224:	d503201f 	nop

0000000000000228 <as-compare-left>:
 228:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 22c:	910003fd 	mov	x29, sp
 230:	52800028 	mov	w8, #0x1                   	// #1
 234:	52800029 	mov	w9, #0x1                   	// #1
 238:	35000089 	cbnz	w9, 248 <as-compare-left+0x20>
 23c:	52800149 	mov	w9, #0xa                   	// #10
 240:	6b09011f 	cmp	w8, w9
 244:	1a9f87e8 	cset	w8, ls	// ls = plast
 248:	52800000 	mov	w0, #0x0                   	// #0
 24c:	2a0803e1 	mov	w1, w8
 250:	a8c17bfd 	ldp	x29, x30, [sp], #16
 254:	d65f03c0 	ret

0000000000000258 <as-compare-right>:
 258:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 25c:	910003fd 	mov	x29, sp
 260:	52800148 	mov	w8, #0xa                   	// #10
 264:	52800029 	mov	w9, #0x1                   	// #1
 268:	5280002a 	mov	w10, #0x1                   	// #1
 26c:	3500008a 	cbnz	w10, 27c <as-compare-right+0x24>
 270:	6b09011f 	cmp	w8, w9
 274:	1a9f87e8 	cset	w8, ls	// ls = plast
 278:	2a0803e9 	mov	w9, w8
 27c:	52800000 	mov	w0, #0x0                   	// #0
 280:	2a0903e1 	mov	w1, w9
 284:	a8c17bfd 	ldp	x29, x30, [sp], #16
 288:	d65f03c0 	ret
 28c:	d503201f 	nop

0000000000000290 <as-br_if-value>:
 290:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 294:	910003fd 	mov	x29, sp
 298:	52800108 	mov	w8, #0x8                   	// #8
 29c:	14000004 	b	2ac <as-br_if-value+0x1c>
 2a0:	52800029 	mov	w9, #0x1                   	// #1
 2a4:	35000049 	cbnz	w9, 2ac <as-br_if-value+0x1c>
 2a8:	528000e8 	mov	w8, #0x7                   	// #7
 2ac:	52800000 	mov	w0, #0x0                   	// #0
 2b0:	2a0803e1 	mov	w1, w8
 2b4:	a8c17bfd 	ldp	x29, x30, [sp], #16
 2b8:	d65f03c0 	ret
 2bc:	d503201f 	nop

00000000000002c0 <as-br_if-value-cond>:
 2c0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 2c4:	910003fd 	mov	x29, sp
 2c8:	528000c8 	mov	w8, #0x6                   	// #6
 2cc:	52800129 	mov	w9, #0x9                   	// #9
 2d0:	14000004 	b	2e0 <as-br_if-value-cond+0x20>
 2d4:	35000069 	cbnz	w9, 2e0 <as-br_if-value-cond+0x20>
 2d8:	528000e8 	mov	w8, #0x7                   	// #7
 2dc:	2a0803e9 	mov	w9, w8
 2e0:	52800000 	mov	w0, #0x0                   	// #0
 2e4:	2a0903e1 	mov	w1, w9
 2e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 2ec:	d65f03c0 	ret

00000000000002f0 <nested-br-value>:
 2f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 2f4:	910003fd 	mov	x29, sp
 2f8:	52800028 	mov	w8, #0x1                   	// #1
 2fc:	52800049 	mov	w9, #0x2                   	// #2
 300:	52800089 	mov	w9, #0x4                   	// #4
 304:	52800109 	mov	w9, #0x8                   	// #8
 308:	14000003 	b	314 <nested-br-value+0x24>
 30c:	14000001 	b	310 <nested-br-value+0x20>
 310:	52800209 	mov	w9, #0x10                  	// #16
 314:	0b090108 	add	w8, w8, w9
 318:	52800000 	mov	w0, #0x0                   	// #0
 31c:	2a0803e1 	mov	w1, w8
 320:	a8c17bfd 	ldp	x29, x30, [sp], #16
 324:	d65f03c0 	ret

0000000000000328 <nested-br_if-value>:
 328:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 32c:	910003fd 	mov	x29, sp
 330:	52800028 	mov	w8, #0x1                   	// #1
 334:	52800049 	mov	w9, #0x2                   	// #2
 338:	52800089 	mov	w9, #0x4                   	// #4
 33c:	52800109 	mov	w9, #0x8                   	// #8
 340:	14000005 	b	354 <nested-br_if-value+0x2c>
 344:	5280002a 	mov	w10, #0x1                   	// #1
 348:	3500004a 	cbnz	w10, 350 <nested-br_if-value+0x28>
 34c:	52800409 	mov	w9, #0x20                  	// #32
 350:	52800209 	mov	w9, #0x10                  	// #16
 354:	0b090108 	add	w8, w8, w9
 358:	52800000 	mov	w0, #0x0                   	// #0
 35c:	2a0803e1 	mov	w1, w8
 360:	a8c17bfd 	ldp	x29, x30, [sp], #16
 364:	d65f03c0 	ret
