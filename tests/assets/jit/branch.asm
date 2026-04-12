
./tests/assets/jit/branch.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000040 simple_if
0000000000000040 l     F .text	0000000000000048 simple_if_return
0000000000000088 l     F .text	0000000000000048 simple_if_else
00000000000000d0 l     F .text	0000000000000068 nested_if
0000000000000138 l     F .text	0000000000000068 nested_else
00000000000001a0 l     F .text	0000000000000050 simple_if_add1
00000000000001f0 l     F .text	0000000000000070 nested_else_add1


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e80340f9 090080d2 1f0109eb e8a79f1a  ..@.............
 0020 48000034 08008092 280080d2 e00308aa  H..4....(.......
 0030 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0040 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0050 e80340f9 090080d2 1f0109eb e8a79f1a  ..@.............
 0060 68000034 08008092 02000014 280080d2  h..4........(...
 0070 e00308aa e1031faa ff430091 fd7bc1a8  .........C...{..
 0080 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0090 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 00a0 1f0109eb e8a79f1a 68000034 08008092  ........h..4....
 00b0 02000014 280080d2 e00308aa e1031faa  ....(...........
 00c0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 00d0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00e0 e80340f9 090080d2 1f0109eb e8a79f1a  ..@.............
 00f0 48010034 e80340f9 29018092 1f0109eb  H..4..@.).......
 0100 e8a79f1a 68000034 680c8092 02000014  ....h..4h.......
 0110 28018092 02000014 280080d2 01000014  (.......(.......
 0120 e00308aa e1031faa ff430091 fd7bc1a8  .........C...{..
 0130 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0140 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 0150 1f0109eb e8a79f1a 68000034 08008092  ........h..4....
 0160 09000014 e80340f9 490180d2 1f0109eb  ......@.I.......
 0170 e8a79f1a 68000034 480180d2 02000014  ....h..4H.......
 0180 880c80d2 01000014 e00308aa e1031faa  ................
 0190 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 01a0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 01b0 e80340f9 090080d2 1f0109eb e8a79f1a  ..@.............
 01c0 68000034 08008092 02000014 280080d2  h..4........(...
 01d0 290080d2 0801098b 01000014 e00308aa  )...............
 01e0 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 01f0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0200 e80340f9 090080d2 1f0109eb e8a79f1a  ..@.............
 0210 68000034 08008092 09000014 e80340f9  h..4..........@.
 0220 490180d2 1f0109eb e8a79f1a 68000034  I...........h..4
 0230 480180d2 02000014 880c80d2 290080d2  H...........)...
 0240 0801098b 01000014 e00308aa e1031faa  ................
 0250 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <simple_if>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	f94003e8 	ldr	x8, [sp]
  14:	d2800009 	mov	x9, #0x0                   	// #0
  18:	eb09011f 	cmp	x8, x9
  1c:	1a9fa7e8 	cset	w8, lt  // lt = tstop
  20:	34000048 	cbz	w8, 28 <simple_if+0x28>
  24:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  28:	d2800028 	mov	x8, #0x1                   	// #1
  2c:	aa0803e0 	mov	x0, x8
  30:	aa1f03e1 	mov	x1, xzr
  34:	910043ff 	add	sp, sp, #0x10
  38:	a8c17bfd 	ldp	x29, x30, [sp], #16
  3c:	d65f03c0 	ret

0000000000000040 <simple_if_return>:
  40:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  44:	910003fd 	mov	x29, sp
  48:	d10043ff 	sub	sp, sp, #0x10
  4c:	f90003e0 	str	x0, [sp]
  50:	f94003e8 	ldr	x8, [sp]
  54:	d2800009 	mov	x9, #0x0                   	// #0
  58:	eb09011f 	cmp	x8, x9
  5c:	1a9fa7e8 	cset	w8, lt  // lt = tstop
  60:	34000068 	cbz	w8, 6c <simple_if_return+0x2c>
  64:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  68:	14000002 	b	70 <simple_if_return+0x30>
  6c:	d2800028 	mov	x8, #0x1                   	// #1
  70:	aa0803e0 	mov	x0, x8
  74:	aa1f03e1 	mov	x1, xzr
  78:	910043ff 	add	sp, sp, #0x10
  7c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  80:	d65f03c0 	ret
  84:	d503201f 	nop

0000000000000088 <simple_if_else>:
  88:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  8c:	910003fd 	mov	x29, sp
  90:	d10043ff 	sub	sp, sp, #0x10
  94:	f90003e0 	str	x0, [sp]
  98:	f94003e8 	ldr	x8, [sp]
  9c:	d2800009 	mov	x9, #0x0                   	// #0
  a0:	eb09011f 	cmp	x8, x9
  a4:	1a9fa7e8 	cset	w8, lt  // lt = tstop
  a8:	34000068 	cbz	w8, b4 <simple_if_else+0x2c>
  ac:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  b0:	14000002 	b	b8 <simple_if_else+0x30>
  b4:	d2800028 	mov	x8, #0x1                   	// #1
  b8:	aa0803e0 	mov	x0, x8
  bc:	aa1f03e1 	mov	x1, xzr
  c0:	910043ff 	add	sp, sp, #0x10
  c4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  c8:	d65f03c0 	ret
  cc:	d503201f 	nop

00000000000000d0 <nested_if>:
  d0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  d4:	910003fd 	mov	x29, sp
  d8:	d10043ff 	sub	sp, sp, #0x10
  dc:	f90003e0 	str	x0, [sp]
  e0:	f94003e8 	ldr	x8, [sp]
  e4:	d2800009 	mov	x9, #0x0                   	// #0
  e8:	eb09011f 	cmp	x8, x9
  ec:	1a9fa7e8 	cset	w8, lt  // lt = tstop
  f0:	34000148 	cbz	w8, 118 <nested_if+0x48>
  f4:	f94003e8 	ldr	x8, [sp]
  f8:	92800129 	mov	x9, #0xfffffffffffffff6    	// #-10
  fc:	eb09011f 	cmp	x8, x9
 100:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 104:	34000068 	cbz	w8, 110 <nested_if+0x40>
 108:	92800c68 	mov	x8, #0xffffffffffffff9c    	// #-100
 10c:	14000002 	b	114 <nested_if+0x44>
 110:	92800128 	mov	x8, #0xfffffffffffffff6    	// #-10
 114:	14000002 	b	11c <nested_if+0x4c>
 118:	d2800028 	mov	x8, #0x1                   	// #1
 11c:	14000001 	b	120 <nested_if+0x50>
 120:	aa0803e0 	mov	x0, x8
 124:	aa1f03e1 	mov	x1, xzr
 128:	910043ff 	add	sp, sp, #0x10
 12c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 130:	d65f03c0 	ret
 134:	d503201f 	nop

0000000000000138 <nested_else>:
 138:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 13c:	910003fd 	mov	x29, sp
 140:	d10043ff 	sub	sp, sp, #0x10
 144:	f90003e0 	str	x0, [sp]
 148:	f94003e8 	ldr	x8, [sp]
 14c:	d2800009 	mov	x9, #0x0                   	// #0
 150:	eb09011f 	cmp	x8, x9
 154:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 158:	34000068 	cbz	w8, 164 <nested_else+0x2c>
 15c:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
 160:	14000009 	b	184 <nested_else+0x4c>
 164:	f94003e8 	ldr	x8, [sp]
 168:	d2800149 	mov	x9, #0xa                   	// #10
 16c:	eb09011f 	cmp	x8, x9
 170:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 174:	34000068 	cbz	w8, 180 <nested_else+0x48>
 178:	d2800148 	mov	x8, #0xa                   	// #10
 17c:	14000002 	b	184 <nested_else+0x4c>
 180:	d2800c88 	mov	x8, #0x64                  	// #100
 184:	14000001 	b	188 <nested_else+0x50>
 188:	aa0803e0 	mov	x0, x8
 18c:	aa1f03e1 	mov	x1, xzr
 190:	910043ff 	add	sp, sp, #0x10
 194:	a8c17bfd 	ldp	x29, x30, [sp], #16
 198:	d65f03c0 	ret
 19c:	d503201f 	nop

00000000000001a0 <simple_if_add1>:
 1a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1a4:	910003fd 	mov	x29, sp
 1a8:	d10043ff 	sub	sp, sp, #0x10
 1ac:	f90003e0 	str	x0, [sp]
 1b0:	f94003e8 	ldr	x8, [sp]
 1b4:	d2800009 	mov	x9, #0x0                   	// #0
 1b8:	eb09011f 	cmp	x8, x9
 1bc:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 1c0:	34000068 	cbz	w8, 1cc <simple_if_add1+0x2c>
 1c4:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
 1c8:	14000002 	b	1d0 <simple_if_add1+0x30>
 1cc:	d2800028 	mov	x8, #0x1                   	// #1
 1d0:	d2800029 	mov	x9, #0x1                   	// #1
 1d4:	8b090108 	add	x8, x8, x9
 1d8:	14000001 	b	1dc <simple_if_add1+0x3c>
 1dc:	aa0803e0 	mov	x0, x8
 1e0:	aa1f03e1 	mov	x1, xzr
 1e4:	910043ff 	add	sp, sp, #0x10
 1e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1ec:	d65f03c0 	ret

00000000000001f0 <nested_else_add1>:
 1f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1f4:	910003fd 	mov	x29, sp
 1f8:	d10043ff 	sub	sp, sp, #0x10
 1fc:	f90003e0 	str	x0, [sp]
 200:	f94003e8 	ldr	x8, [sp]
 204:	d2800009 	mov	x9, #0x0                   	// #0
 208:	eb09011f 	cmp	x8, x9
 20c:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 210:	34000068 	cbz	w8, 21c <nested_else_add1+0x2c>
 214:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
 218:	14000009 	b	23c <nested_else_add1+0x4c>
 21c:	f94003e8 	ldr	x8, [sp]
 220:	d2800149 	mov	x9, #0xa                   	// #10
 224:	eb09011f 	cmp	x8, x9
 228:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 22c:	34000068 	cbz	w8, 238 <nested_else_add1+0x48>
 230:	d2800148 	mov	x8, #0xa                   	// #10
 234:	14000002 	b	23c <nested_else_add1+0x4c>
 238:	d2800c88 	mov	x8, #0x64                  	// #100
 23c:	d2800029 	mov	x9, #0x1                   	// #1
 240:	8b090108 	add	x8, x8, x9
 244:	14000001 	b	248 <nested_else_add1+0x58>
 248:	aa0803e0 	mov	x0, x8
 24c:	aa1f03e1 	mov	x1, xzr
 250:	910043ff 	add	sp, sp, #0x10
 254:	a8c17bfd 	ldp	x29, x30, [sp], #16
 258:	d65f03c0 	ret
 25c:	d503201f 	nop
