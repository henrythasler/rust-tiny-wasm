
tests/assets/jit/branch.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 trap_handler
0000000000000068 l     F .text	0000000000000040 simple_if
00000000000000a8 l     F .text	0000000000000048 simple_if_return
00000000000000f0 l     F .text	0000000000000048 simple_if_else
0000000000000138 l     F .text	0000000000000068 nested_if
00000000000001a0 l     F .text	0000000000000068 nested_else
0000000000000208 l     F .text	0000000000000050 simple_if_add1
0000000000000258 l     F .text	0000000000000070 nested_else_add1


Contents of section .text:
 0000 010080d2 17000014 210080d2 15000014  ........!.......
 0010 410080d2 13000014 610080d2 11000014  A.......a.......
 0020 810080d2 0f000014 a10080d2 0d000014  ................
 0030 c10080d2 0b000014 e10080d2 09000014  ................
 0040 010180d2 07000014 210180d2 05000014  ........!.......
 0050 410180d2 03000014 610180d2 01000014  A.......a.......
 0060 200080d2 c0035fd6 fd7bbfa9 fd030091   ....._..{......
 0070 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 0080 1f0109eb e8a79f1a 48000034 08008092  ........H..4....
 0090 280080d2 000080d2 e10308aa ff430091  (............C..
 00a0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00b0 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 00c0 1f0109eb e8a79f1a 68000034 08008092  ........h..4....
 00d0 02000014 280080d2 000080d2 e10308aa  ....(...........
 00e0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 00f0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0100 e80340f9 090080d2 1f0109eb e8a79f1a  ..@.............
 0110 68000034 08008092 02000014 280080d2  h..4........(...
 0120 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0130 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0140 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 0150 1f0109eb e8a79f1a 48010034 e80340f9  ........H..4..@.
 0160 29018092 1f0109eb e8a79f1a 68000034  )...........h..4
 0170 680c8092 02000014 28018092 02000014  h.......(.......
 0180 280080d2 01000014 000080d2 e10308aa  (...............
 0190 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 01a0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 01b0 e80340f9 090080d2 1f0109eb e8a79f1a  ..@.............
 01c0 68000034 08008092 09000014 e80340f9  h..4..........@.
 01d0 490180d2 1f0109eb e8a79f1a 68000034  I...........h..4
 01e0 480180d2 02000014 880c80d2 01000014  H...............
 01f0 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0200 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0210 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 0220 1f0109eb e8a79f1a 68000034 08008092  ........h..4....
 0230 02000014 280080d2 290080d2 0801098b  ....(...).......
 0240 01000014 000080d2 e10308aa ff430091  .............C..
 0250 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0260 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 0270 1f0109eb e8a79f1a 68000034 08008092  ........h..4....
 0280 09000014 e80340f9 490180d2 1f0109eb  ......@.I.......
 0290 e8a79f1a 68000034 480180d2 02000014  ....h..4H.......
 02a0 880c80d2 290080d2 0801098b 01000014  ....)...........
 02b0 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 02c0 c0035fd6 1f2003d5                    .._.. ..        

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

0000000000000068 <simple_if>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10043ff 	sub	sp, sp, #0x10
  74:	f90003e0 	str	x0, [sp]
  78:	f94003e8 	ldr	x8, [sp]
  7c:	d2800009 	mov	x9, #0x0                   	// #0
  80:	eb09011f 	cmp	x8, x9
  84:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  88:	34000048 	cbz	w8, 90 <simple_if+0x28>
  8c:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  90:	d2800028 	mov	x8, #0x1                   	// #1
  94:	d2800000 	mov	x0, #0x0                   	// #0
  98:	aa0803e1 	mov	x1, x8
  9c:	910043ff 	add	sp, sp, #0x10
  a0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a4:	d65f03c0 	ret

00000000000000a8 <simple_if_return>:
  a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ac:	910003fd 	mov	x29, sp
  b0:	d10043ff 	sub	sp, sp, #0x10
  b4:	f90003e0 	str	x0, [sp]
  b8:	f94003e8 	ldr	x8, [sp]
  bc:	d2800009 	mov	x9, #0x0                   	// #0
  c0:	eb09011f 	cmp	x8, x9
  c4:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  c8:	34000068 	cbz	w8, d4 <simple_if_return+0x2c>
  cc:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  d0:	14000002 	b	d8 <simple_if_return+0x30>
  d4:	d2800028 	mov	x8, #0x1                   	// #1
  d8:	d2800000 	mov	x0, #0x0                   	// #0
  dc:	aa0803e1 	mov	x1, x8
  e0:	910043ff 	add	sp, sp, #0x10
  e4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  e8:	d65f03c0 	ret
  ec:	d503201f 	nop

00000000000000f0 <simple_if_else>:
  f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  f4:	910003fd 	mov	x29, sp
  f8:	d10043ff 	sub	sp, sp, #0x10
  fc:	f90003e0 	str	x0, [sp]
 100:	f94003e8 	ldr	x8, [sp]
 104:	d2800009 	mov	x9, #0x0                   	// #0
 108:	eb09011f 	cmp	x8, x9
 10c:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 110:	34000068 	cbz	w8, 11c <simple_if_else+0x2c>
 114:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
 118:	14000002 	b	120 <simple_if_else+0x30>
 11c:	d2800028 	mov	x8, #0x1                   	// #1
 120:	d2800000 	mov	x0, #0x0                   	// #0
 124:	aa0803e1 	mov	x1, x8
 128:	910043ff 	add	sp, sp, #0x10
 12c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 130:	d65f03c0 	ret
 134:	d503201f 	nop

0000000000000138 <nested_if>:
 138:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 13c:	910003fd 	mov	x29, sp
 140:	d10043ff 	sub	sp, sp, #0x10
 144:	f90003e0 	str	x0, [sp]
 148:	f94003e8 	ldr	x8, [sp]
 14c:	d2800009 	mov	x9, #0x0                   	// #0
 150:	eb09011f 	cmp	x8, x9
 154:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 158:	34000148 	cbz	w8, 180 <nested_if+0x48>
 15c:	f94003e8 	ldr	x8, [sp]
 160:	92800129 	mov	x9, #0xfffffffffffffff6    	// #-10
 164:	eb09011f 	cmp	x8, x9
 168:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 16c:	34000068 	cbz	w8, 178 <nested_if+0x40>
 170:	92800c68 	mov	x8, #0xffffffffffffff9c    	// #-100
 174:	14000002 	b	17c <nested_if+0x44>
 178:	92800128 	mov	x8, #0xfffffffffffffff6    	// #-10
 17c:	14000002 	b	184 <nested_if+0x4c>
 180:	d2800028 	mov	x8, #0x1                   	// #1
 184:	14000001 	b	188 <nested_if+0x50>
 188:	d2800000 	mov	x0, #0x0                   	// #0
 18c:	aa0803e1 	mov	x1, x8
 190:	910043ff 	add	sp, sp, #0x10
 194:	a8c17bfd 	ldp	x29, x30, [sp], #16
 198:	d65f03c0 	ret
 19c:	d503201f 	nop

00000000000001a0 <nested_else>:
 1a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1a4:	910003fd 	mov	x29, sp
 1a8:	d10043ff 	sub	sp, sp, #0x10
 1ac:	f90003e0 	str	x0, [sp]
 1b0:	f94003e8 	ldr	x8, [sp]
 1b4:	d2800009 	mov	x9, #0x0                   	// #0
 1b8:	eb09011f 	cmp	x8, x9
 1bc:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 1c0:	34000068 	cbz	w8, 1cc <nested_else+0x2c>
 1c4:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
 1c8:	14000009 	b	1ec <nested_else+0x4c>
 1cc:	f94003e8 	ldr	x8, [sp]
 1d0:	d2800149 	mov	x9, #0xa                   	// #10
 1d4:	eb09011f 	cmp	x8, x9
 1d8:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 1dc:	34000068 	cbz	w8, 1e8 <nested_else+0x48>
 1e0:	d2800148 	mov	x8, #0xa                   	// #10
 1e4:	14000002 	b	1ec <nested_else+0x4c>
 1e8:	d2800c88 	mov	x8, #0x64                  	// #100
 1ec:	14000001 	b	1f0 <nested_else+0x50>
 1f0:	d2800000 	mov	x0, #0x0                   	// #0
 1f4:	aa0803e1 	mov	x1, x8
 1f8:	910043ff 	add	sp, sp, #0x10
 1fc:	a8c17bfd 	ldp	x29, x30, [sp], #16
 200:	d65f03c0 	ret
 204:	d503201f 	nop

0000000000000208 <simple_if_add1>:
 208:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 20c:	910003fd 	mov	x29, sp
 210:	d10043ff 	sub	sp, sp, #0x10
 214:	f90003e0 	str	x0, [sp]
 218:	f94003e8 	ldr	x8, [sp]
 21c:	d2800009 	mov	x9, #0x0                   	// #0
 220:	eb09011f 	cmp	x8, x9
 224:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 228:	34000068 	cbz	w8, 234 <simple_if_add1+0x2c>
 22c:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
 230:	14000002 	b	238 <simple_if_add1+0x30>
 234:	d2800028 	mov	x8, #0x1                   	// #1
 238:	d2800029 	mov	x9, #0x1                   	// #1
 23c:	8b090108 	add	x8, x8, x9
 240:	14000001 	b	244 <simple_if_add1+0x3c>
 244:	d2800000 	mov	x0, #0x0                   	// #0
 248:	aa0803e1 	mov	x1, x8
 24c:	910043ff 	add	sp, sp, #0x10
 250:	a8c17bfd 	ldp	x29, x30, [sp], #16
 254:	d65f03c0 	ret

0000000000000258 <nested_else_add1>:
 258:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 25c:	910003fd 	mov	x29, sp
 260:	d10043ff 	sub	sp, sp, #0x10
 264:	f90003e0 	str	x0, [sp]
 268:	f94003e8 	ldr	x8, [sp]
 26c:	d2800009 	mov	x9, #0x0                   	// #0
 270:	eb09011f 	cmp	x8, x9
 274:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 278:	34000068 	cbz	w8, 284 <nested_else_add1+0x2c>
 27c:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
 280:	14000009 	b	2a4 <nested_else_add1+0x4c>
 284:	f94003e8 	ldr	x8, [sp]
 288:	d2800149 	mov	x9, #0xa                   	// #10
 28c:	eb09011f 	cmp	x8, x9
 290:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 294:	34000068 	cbz	w8, 2a0 <nested_else_add1+0x48>
 298:	d2800148 	mov	x8, #0xa                   	// #10
 29c:	14000002 	b	2a4 <nested_else_add1+0x4c>
 2a0:	d2800c88 	mov	x8, #0x64                  	// #100
 2a4:	d2800029 	mov	x9, #0x1                   	// #1
 2a8:	8b090108 	add	x8, x8, x9
 2ac:	14000001 	b	2b0 <nested_else_add1+0x58>
 2b0:	d2800000 	mov	x0, #0x0                   	// #0
 2b4:	aa0803e1 	mov	x1, x8
 2b8:	910043ff 	add	sp, sp, #0x10
 2bc:	a8c17bfd 	ldp	x29, x30, [sp], #16
 2c0:	d65f03c0 	ret
 2c4:	d503201f 	nop
