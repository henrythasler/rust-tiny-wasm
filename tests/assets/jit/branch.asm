
./tests/assets/jit/branch.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000050 simple_if
0000000000000050 l     F .text	0000000000000050 simple_if_return
00000000000000a0 l     F .text	0000000000000050 simple_if_else
00000000000000f0 l     F .text	0000000000000088 nested_if
0000000000000178 l     F .text	0000000000000070 nested_else
00000000000001e8 l     F .text	0000000000000060 simple_if_add1
0000000000000248 l     F .text	0000000000000078 nested_else_add1


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e80340f9 090080d2 1f0109eb e8a79f1a  ..@.............
 0020 a8000034 e8ff9fd2 e8ffbff2 e8ffdff2  ...4............
 0030 e8fffff2 280080d2 e00308aa e1031faa  ....(...........
 0040 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0050 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0060 e80340f9 090080d2 1f0109eb e8a79f1a  ..@.............
 0070 c8000034 e8ff9fd2 e8ffbff2 e8ffdff2  ...4............
 0080 e8fffff2 02000014 280080d2 e00308aa  ........(.......
 0090 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 00a0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00b0 e80340f9 090080d2 1f0109eb e8a79f1a  ..@.............
 00c0 c8000034 e8ff9fd2 e8ffbff2 e8ffdff2  ...4............
 00d0 e8fffff2 02000014 280080d2 e00308aa  ........(.......
 00e0 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 00f0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0100 e80340f9 090080d2 1f0109eb e8a79f1a  ..@.............
 0110 68020034 e80340f9 c9fe9fd2 e9ffbff2  h..4..@.........
 0120 e9ffdff2 e9fffff2 1f0109eb e8a79f1a  ................
 0130 c8000034 88f39fd2 e8ffbff2 e8ffdff2  ...4............
 0140 e8fffff2 05000014 c8fe9fd2 e8ffbff2  ................
 0150 e8ffdff2 e8fffff2 02000014 280080d2  ............(...
 0160 01000014 e00308aa e1031faa ff430091  .............C..
 0170 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0180 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 0190 1f0109eb e8a79f1a c8000034 e8ff9fd2  ...........4....
 01a0 e8ffbff2 e8ffdff2 e8fffff2 09000014  ................
 01b0 e80340f9 490180d2 1f0109eb e8a79f1a  ..@.I...........
 01c0 68000034 480180d2 02000014 880c80d2  h..4H...........
 01d0 01000014 e00308aa e1031faa ff430091  .............C..
 01e0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 01f0 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 0200 1f0109eb e8a79f1a c8000034 e8ff9fd2  ...........4....
 0210 e8ffbff2 e8ffdff2 e8fffff2 02000014  ................
 0220 280080d2 290080d2 0801098b 01000014  (...)...........
 0230 e00308aa e1031faa ff430091 fd7bc1a8  .........C...{..
 0240 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0250 ff4300d1 e00300f9 e80340f9 090080d2  .C........@.....
 0260 1f0109eb e8a79f1a c8000034 e8ff9fd2  ...........4....
 0270 e8ffbff2 e8ffdff2 e8fffff2 09000014  ................
 0280 e80340f9 490180d2 1f0109eb e8a79f1a  ..@.I...........
 0290 68000034 480180d2 02000014 880c80d2  h..4H...........
 02a0 290080d2 0801098b 01000014 e00308aa  )...............
 02b0 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.

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
  20:	340000a8 	cbz	w8, 34 <simple_if+0x34>
  24:	d29fffe8 	mov	x8, #0xffff                	// #65535
  28:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  2c:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  30:	f2ffffe8 	movk	x8, #0xffff, lsl #48
  34:	d2800028 	mov	x8, #0x1                   	// #1
  38:	aa0803e0 	mov	x0, x8
  3c:	aa1f03e1 	mov	x1, xzr
  40:	910043ff 	add	sp, sp, #0x10
  44:	a8c17bfd 	ldp	x29, x30, [sp], #16
  48:	d65f03c0 	ret
  4c:	d503201f 	nop

0000000000000050 <simple_if_return>:
  50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  54:	910003fd 	mov	x29, sp
  58:	d10043ff 	sub	sp, sp, #0x10
  5c:	f90003e0 	str	x0, [sp]
  60:	f94003e8 	ldr	x8, [sp]
  64:	d2800009 	mov	x9, #0x0                   	// #0
  68:	eb09011f 	cmp	x8, x9
  6c:	1a9fa7e8 	cset	w8, lt  // lt = tstop
  70:	340000c8 	cbz	w8, 88 <simple_if_return+0x38>
  74:	d29fffe8 	mov	x8, #0xffff                	// #65535
  78:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  7c:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  80:	f2ffffe8 	movk	x8, #0xffff, lsl #48
  84:	14000002 	b	8c <simple_if_return+0x3c>
  88:	d2800028 	mov	x8, #0x1                   	// #1
  8c:	aa0803e0 	mov	x0, x8
  90:	aa1f03e1 	mov	x1, xzr
  94:	910043ff 	add	sp, sp, #0x10
  98:	a8c17bfd 	ldp	x29, x30, [sp], #16
  9c:	d65f03c0 	ret

00000000000000a0 <simple_if_else>:
  a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  a4:	910003fd 	mov	x29, sp
  a8:	d10043ff 	sub	sp, sp, #0x10
  ac:	f90003e0 	str	x0, [sp]
  b0:	f94003e8 	ldr	x8, [sp]
  b4:	d2800009 	mov	x9, #0x0                   	// #0
  b8:	eb09011f 	cmp	x8, x9
  bc:	1a9fa7e8 	cset	w8, lt  // lt = tstop
  c0:	340000c8 	cbz	w8, d8 <simple_if_else+0x38>
  c4:	d29fffe8 	mov	x8, #0xffff                	// #65535
  c8:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  cc:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  d0:	f2ffffe8 	movk	x8, #0xffff, lsl #48
  d4:	14000002 	b	dc <simple_if_else+0x3c>
  d8:	d2800028 	mov	x8, #0x1                   	// #1
  dc:	aa0803e0 	mov	x0, x8
  e0:	aa1f03e1 	mov	x1, xzr
  e4:	910043ff 	add	sp, sp, #0x10
  e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  ec:	d65f03c0 	ret

00000000000000f0 <nested_if>:
  f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  f4:	910003fd 	mov	x29, sp
  f8:	d10043ff 	sub	sp, sp, #0x10
  fc:	f90003e0 	str	x0, [sp]
 100:	f94003e8 	ldr	x8, [sp]
 104:	d2800009 	mov	x9, #0x0                   	// #0
 108:	eb09011f 	cmp	x8, x9
 10c:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 110:	34000268 	cbz	w8, 15c <nested_if+0x6c>
 114:	f94003e8 	ldr	x8, [sp]
 118:	d29ffec9 	mov	x9, #0xfff6                	// #65526
 11c:	f2bfffe9 	movk	x9, #0xffff, lsl #16
 120:	f2dfffe9 	movk	x9, #0xffff, lsl #32
 124:	f2ffffe9 	movk	x9, #0xffff, lsl #48
 128:	eb09011f 	cmp	x8, x9
 12c:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 130:	340000c8 	cbz	w8, 148 <nested_if+0x58>
 134:	d29ff388 	mov	x8, #0xff9c                	// #65436
 138:	f2bfffe8 	movk	x8, #0xffff, lsl #16
 13c:	f2dfffe8 	movk	x8, #0xffff, lsl #32
 140:	f2ffffe8 	movk	x8, #0xffff, lsl #48
 144:	14000005 	b	158 <nested_if+0x68>
 148:	d29ffec8 	mov	x8, #0xfff6                	// #65526
 14c:	f2bfffe8 	movk	x8, #0xffff, lsl #16
 150:	f2dfffe8 	movk	x8, #0xffff, lsl #32
 154:	f2ffffe8 	movk	x8, #0xffff, lsl #48
 158:	14000002 	b	160 <nested_if+0x70>
 15c:	d2800028 	mov	x8, #0x1                   	// #1
 160:	14000001 	b	164 <nested_if+0x74>
 164:	aa0803e0 	mov	x0, x8
 168:	aa1f03e1 	mov	x1, xzr
 16c:	910043ff 	add	sp, sp, #0x10
 170:	a8c17bfd 	ldp	x29, x30, [sp], #16
 174:	d65f03c0 	ret

0000000000000178 <nested_else>:
 178:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 17c:	910003fd 	mov	x29, sp
 180:	d10043ff 	sub	sp, sp, #0x10
 184:	f90003e0 	str	x0, [sp]
 188:	f94003e8 	ldr	x8, [sp]
 18c:	d2800009 	mov	x9, #0x0                   	// #0
 190:	eb09011f 	cmp	x8, x9
 194:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 198:	340000c8 	cbz	w8, 1b0 <nested_else+0x38>
 19c:	d29fffe8 	mov	x8, #0xffff                	// #65535
 1a0:	f2bfffe8 	movk	x8, #0xffff, lsl #16
 1a4:	f2dfffe8 	movk	x8, #0xffff, lsl #32
 1a8:	f2ffffe8 	movk	x8, #0xffff, lsl #48
 1ac:	14000009 	b	1d0 <nested_else+0x58>
 1b0:	f94003e8 	ldr	x8, [sp]
 1b4:	d2800149 	mov	x9, #0xa                   	// #10
 1b8:	eb09011f 	cmp	x8, x9
 1bc:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 1c0:	34000068 	cbz	w8, 1cc <nested_else+0x54>
 1c4:	d2800148 	mov	x8, #0xa                   	// #10
 1c8:	14000002 	b	1d0 <nested_else+0x58>
 1cc:	d2800c88 	mov	x8, #0x64                  	// #100
 1d0:	14000001 	b	1d4 <nested_else+0x5c>
 1d4:	aa0803e0 	mov	x0, x8
 1d8:	aa1f03e1 	mov	x1, xzr
 1dc:	910043ff 	add	sp, sp, #0x10
 1e0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1e4:	d65f03c0 	ret

00000000000001e8 <simple_if_add1>:
 1e8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1ec:	910003fd 	mov	x29, sp
 1f0:	d10043ff 	sub	sp, sp, #0x10
 1f4:	f90003e0 	str	x0, [sp]
 1f8:	f94003e8 	ldr	x8, [sp]
 1fc:	d2800009 	mov	x9, #0x0                   	// #0
 200:	eb09011f 	cmp	x8, x9
 204:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 208:	340000c8 	cbz	w8, 220 <simple_if_add1+0x38>
 20c:	d29fffe8 	mov	x8, #0xffff                	// #65535
 210:	f2bfffe8 	movk	x8, #0xffff, lsl #16
 214:	f2dfffe8 	movk	x8, #0xffff, lsl #32
 218:	f2ffffe8 	movk	x8, #0xffff, lsl #48
 21c:	14000002 	b	224 <simple_if_add1+0x3c>
 220:	d2800028 	mov	x8, #0x1                   	// #1
 224:	d2800029 	mov	x9, #0x1                   	// #1
 228:	8b090108 	add	x8, x8, x9
 22c:	14000001 	b	230 <simple_if_add1+0x48>
 230:	aa0803e0 	mov	x0, x8
 234:	aa1f03e1 	mov	x1, xzr
 238:	910043ff 	add	sp, sp, #0x10
 23c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 240:	d65f03c0 	ret
 244:	d503201f 	nop

0000000000000248 <nested_else_add1>:
 248:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 24c:	910003fd 	mov	x29, sp
 250:	d10043ff 	sub	sp, sp, #0x10
 254:	f90003e0 	str	x0, [sp]
 258:	f94003e8 	ldr	x8, [sp]
 25c:	d2800009 	mov	x9, #0x0                   	// #0
 260:	eb09011f 	cmp	x8, x9
 264:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 268:	340000c8 	cbz	w8, 280 <nested_else_add1+0x38>
 26c:	d29fffe8 	mov	x8, #0xffff                	// #65535
 270:	f2bfffe8 	movk	x8, #0xffff, lsl #16
 274:	f2dfffe8 	movk	x8, #0xffff, lsl #32
 278:	f2ffffe8 	movk	x8, #0xffff, lsl #48
 27c:	14000009 	b	2a0 <nested_else_add1+0x58>
 280:	f94003e8 	ldr	x8, [sp]
 284:	d2800149 	mov	x9, #0xa                   	// #10
 288:	eb09011f 	cmp	x8, x9
 28c:	1a9fa7e8 	cset	w8, lt  // lt = tstop
 290:	34000068 	cbz	w8, 29c <nested_else_add1+0x54>
 294:	d2800148 	mov	x8, #0xa                   	// #10
 298:	14000002 	b	2a0 <nested_else_add1+0x58>
 29c:	d2800c88 	mov	x8, #0x64                  	// #100
 2a0:	d2800029 	mov	x9, #0x1                   	// #1
 2a4:	8b090108 	add	x8, x8, x9
 2a8:	14000001 	b	2ac <nested_else_add1+0x64>
 2ac:	aa0803e0 	mov	x0, x8
 2b0:	aa1f03e1 	mov	x1, xzr
 2b4:	910043ff 	add	sp, sp, #0x10
 2b8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 2bc:	d65f03c0 	ret
