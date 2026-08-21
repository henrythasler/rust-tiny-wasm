
tests/assets/jit/branch.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000048 simple_if
0000000000000048 l     F .text	0000000000000048 simple_if_return
0000000000000090 l     F .text	0000000000000048 simple_if_else
00000000000000d8 l     F .text	0000000000000068 nested_if
0000000000000140 l     F .text	0000000000000068 nested_else
00000000000001a8 l     F .text	0000000000000058 simple_if_add1
0000000000000200 l     F .text	0000000000000070 nested_else_add1


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10700f9 e80740f9 090080d2 1f0109eb  ......@.........
 0020 e8a79f1a 48000034 08008092 280080d2  ....H..4....(...
 0030 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0040 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0050 ff4300d1 e00300f9 e10700f9 e80740f9  .C............@.
 0060 090080d2 1f0109eb e8a79f1a 68000034  ............h..4
 0070 08008092 02000014 280080d2 000080d2  ........(.......
 0080 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0090 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00a0 e10700f9 e80740f9 090080d2 1f0109eb  ......@.........
 00b0 e8a79f1a 68000034 08008092 02000014  ....h..4........
 00c0 280080d2 000080d2 e10308aa ff430091  (............C..
 00d0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00e0 ff4300d1 e00300f9 e10700f9 e80740f9  .C............@.
 00f0 090080d2 1f0109eb e8a79f1a 48010034  ............H..4
 0100 e80740f9 29018092 1f0109eb e8a79f1a  ..@.)...........
 0110 68000034 680c8092 02000014 28018092  h..4h.......(...
 0120 02000014 280080d2 01000014 000080d2  ....(...........
 0130 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0140 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0150 e10700f9 e80740f9 090080d2 1f0109eb  ......@.........
 0160 e8a79f1a 68000034 08008092 09000014  ....h..4........
 0170 e80740f9 490180d2 1f0109eb e8a79f1a  ..@.I...........
 0180 68000034 480180d2 02000014 880c80d2  h..4H...........
 0190 01000014 000080d2 e10308aa ff430091  .............C..
 01a0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 01b0 ff4300d1 e00300f9 e10700f9 e80740f9  .C............@.
 01c0 090080d2 1f0109eb e8a79f1a 68000034  ............h..4
 01d0 08008092 02000014 280080d2 290080d2  ........(...)...
 01e0 0801098b 01000014 000080d2 e10308aa  ................
 01f0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0200 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0210 e10700f9 e80740f9 090080d2 1f0109eb  ......@.........
 0220 e8a79f1a 68000034 08008092 09000014  ....h..4........
 0230 e80740f9 490180d2 1f0109eb e8a79f1a  ..@.I...........
 0240 68000034 480180d2 02000014 880c80d2  h..4H...........
 0250 290080d2 0801098b 01000014 000080d2  )...............
 0260 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.

Disassembly of section .text:

0000000000000000 <simple_if>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	f90007e1 	str	x1, [sp, #8]
  14:	f94007e8 	ldr	x8, [sp, #8]
  18:	d2800009 	mov	x9, #0x0                   	// #0
  1c:	eb09011f 	cmp	x8, x9
  20:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  24:	34000048 	cbz	w8, 2c <simple_if+0x2c>
  28:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  2c:	d2800028 	mov	x8, #0x1                   	// #1
  30:	d2800000 	mov	x0, #0x0                   	// #0
  34:	aa0803e1 	mov	x1, x8
  38:	910043ff 	add	sp, sp, #0x10
  3c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  40:	d65f03c0 	ret
  44:	d503201f 	nop

0000000000000048 <simple_if_return>:
  48:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  4c:	910003fd 	mov	x29, sp
  50:	d10043ff 	sub	sp, sp, #0x10
  54:	f90003e0 	str	x0, [sp]
  58:	f90007e1 	str	x1, [sp, #8]
  5c:	f94007e8 	ldr	x8, [sp, #8]
  60:	d2800009 	mov	x9, #0x0                   	// #0
  64:	eb09011f 	cmp	x8, x9
  68:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  6c:	34000068 	cbz	w8, 78 <simple_if_return+0x30>
  70:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  74:	14000002 	b	7c <simple_if_return+0x34>
  78:	d2800028 	mov	x8, #0x1                   	// #1
  7c:	d2800000 	mov	x0, #0x0                   	// #0
  80:	aa0803e1 	mov	x1, x8
  84:	910043ff 	add	sp, sp, #0x10
  88:	a8c17bfd 	ldp	x29, x30, [sp], #16
  8c:	d65f03c0 	ret

0000000000000090 <simple_if_else>:
  90:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  94:	910003fd 	mov	x29, sp
  98:	d10043ff 	sub	sp, sp, #0x10
  9c:	f90003e0 	str	x0, [sp]
  a0:	f90007e1 	str	x1, [sp, #8]
  a4:	f94007e8 	ldr	x8, [sp, #8]
  a8:	d2800009 	mov	x9, #0x0                   	// #0
  ac:	eb09011f 	cmp	x8, x9
  b0:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  b4:	34000068 	cbz	w8, c0 <simple_if_else+0x30>
  b8:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
  bc:	14000002 	b	c4 <simple_if_else+0x34>
  c0:	d2800028 	mov	x8, #0x1                   	// #1
  c4:	d2800000 	mov	x0, #0x0                   	// #0
  c8:	aa0803e1 	mov	x1, x8
  cc:	910043ff 	add	sp, sp, #0x10
  d0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d4:	d65f03c0 	ret

00000000000000d8 <nested_if>:
  d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  dc:	910003fd 	mov	x29, sp
  e0:	d10043ff 	sub	sp, sp, #0x10
  e4:	f90003e0 	str	x0, [sp]
  e8:	f90007e1 	str	x1, [sp, #8]
  ec:	f94007e8 	ldr	x8, [sp, #8]
  f0:	d2800009 	mov	x9, #0x0                   	// #0
  f4:	eb09011f 	cmp	x8, x9
  f8:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  fc:	34000148 	cbz	w8, 124 <nested_if+0x4c>
 100:	f94007e8 	ldr	x8, [sp, #8]
 104:	92800129 	mov	x9, #0xfffffffffffffff6    	// #-10
 108:	eb09011f 	cmp	x8, x9
 10c:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 110:	34000068 	cbz	w8, 11c <nested_if+0x44>
 114:	92800c68 	mov	x8, #0xffffffffffffff9c    	// #-100
 118:	14000002 	b	120 <nested_if+0x48>
 11c:	92800128 	mov	x8, #0xfffffffffffffff6    	// #-10
 120:	14000002 	b	128 <nested_if+0x50>
 124:	d2800028 	mov	x8, #0x1                   	// #1
 128:	14000001 	b	12c <nested_if+0x54>
 12c:	d2800000 	mov	x0, #0x0                   	// #0
 130:	aa0803e1 	mov	x1, x8
 134:	910043ff 	add	sp, sp, #0x10
 138:	a8c17bfd 	ldp	x29, x30, [sp], #16
 13c:	d65f03c0 	ret

0000000000000140 <nested_else>:
 140:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 144:	910003fd 	mov	x29, sp
 148:	d10043ff 	sub	sp, sp, #0x10
 14c:	f90003e0 	str	x0, [sp]
 150:	f90007e1 	str	x1, [sp, #8]
 154:	f94007e8 	ldr	x8, [sp, #8]
 158:	d2800009 	mov	x9, #0x0                   	// #0
 15c:	eb09011f 	cmp	x8, x9
 160:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 164:	34000068 	cbz	w8, 170 <nested_else+0x30>
 168:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
 16c:	14000009 	b	190 <nested_else+0x50>
 170:	f94007e8 	ldr	x8, [sp, #8]
 174:	d2800149 	mov	x9, #0xa                   	// #10
 178:	eb09011f 	cmp	x8, x9
 17c:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 180:	34000068 	cbz	w8, 18c <nested_else+0x4c>
 184:	d2800148 	mov	x8, #0xa                   	// #10
 188:	14000002 	b	190 <nested_else+0x50>
 18c:	d2800c88 	mov	x8, #0x64                  	// #100
 190:	14000001 	b	194 <nested_else+0x54>
 194:	d2800000 	mov	x0, #0x0                   	// #0
 198:	aa0803e1 	mov	x1, x8
 19c:	910043ff 	add	sp, sp, #0x10
 1a0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1a4:	d65f03c0 	ret

00000000000001a8 <simple_if_add1>:
 1a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1ac:	910003fd 	mov	x29, sp
 1b0:	d10043ff 	sub	sp, sp, #0x10
 1b4:	f90003e0 	str	x0, [sp]
 1b8:	f90007e1 	str	x1, [sp, #8]
 1bc:	f94007e8 	ldr	x8, [sp, #8]
 1c0:	d2800009 	mov	x9, #0x0                   	// #0
 1c4:	eb09011f 	cmp	x8, x9
 1c8:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 1cc:	34000068 	cbz	w8, 1d8 <simple_if_add1+0x30>
 1d0:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
 1d4:	14000002 	b	1dc <simple_if_add1+0x34>
 1d8:	d2800028 	mov	x8, #0x1                   	// #1
 1dc:	d2800029 	mov	x9, #0x1                   	// #1
 1e0:	8b090108 	add	x8, x8, x9
 1e4:	14000001 	b	1e8 <simple_if_add1+0x40>
 1e8:	d2800000 	mov	x0, #0x0                   	// #0
 1ec:	aa0803e1 	mov	x1, x8
 1f0:	910043ff 	add	sp, sp, #0x10
 1f4:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1f8:	d65f03c0 	ret
 1fc:	d503201f 	nop

0000000000000200 <nested_else_add1>:
 200:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 204:	910003fd 	mov	x29, sp
 208:	d10043ff 	sub	sp, sp, #0x10
 20c:	f90003e0 	str	x0, [sp]
 210:	f90007e1 	str	x1, [sp, #8]
 214:	f94007e8 	ldr	x8, [sp, #8]
 218:	d2800009 	mov	x9, #0x0                   	// #0
 21c:	eb09011f 	cmp	x8, x9
 220:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 224:	34000068 	cbz	w8, 230 <nested_else_add1+0x30>
 228:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
 22c:	14000009 	b	250 <nested_else_add1+0x50>
 230:	f94007e8 	ldr	x8, [sp, #8]
 234:	d2800149 	mov	x9, #0xa                   	// #10
 238:	eb09011f 	cmp	x8, x9
 23c:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 240:	34000068 	cbz	w8, 24c <nested_else_add1+0x4c>
 244:	d2800148 	mov	x8, #0xa                   	// #10
 248:	14000002 	b	250 <nested_else_add1+0x50>
 24c:	d2800c88 	mov	x8, #0x64                  	// #100
 250:	d2800029 	mov	x9, #0x1                   	// #1
 254:	8b090108 	add	x8, x8, x9
 258:	14000001 	b	25c <nested_else_add1+0x5c>
 25c:	d2800000 	mov	x0, #0x0                   	// #0
 260:	aa0803e1 	mov	x1, x8
 264:	910043ff 	add	sp, sp, #0x10
 268:	a8c17bfd 	ldp	x29, x30, [sp], #16
 26c:	d65f03c0 	ret
