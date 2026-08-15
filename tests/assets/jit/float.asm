
tests/assets/jit/float.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000030 get_pi_f32
0000000000000030 l     F .text	0000000000000038 get_e_f64
0000000000000068 l     F .text	0000000000000048 echo_f32
00000000000000b0 l     F .text	0000000000000048 echo_f64
00000000000000f8 l     F .text	0000000000000038 add_f32
0000000000000130 l     F .text	0000000000000038 add_f64
0000000000000168 l     F .text	0000000000000038 sub_f32
00000000000001a0 l     F .text	0000000000000038 sub_f64
00000000000001d8 l     F .text	0000000000000038 mul_f32
0000000000000210 l     F .text	0000000000000038 mul_f64
0000000000000248 l     F .text	0000000000000038 div_f32
0000000000000280 l     F .text	0000000000000038 div_f64


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 68fb8152 2809a872 0801271e 000080d2  h..R(..r..'.....
 0020 0101261e ff430091 fd7bc1a8 c0035fd6  ..&..C...{...._.
 0030 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0040 28ed8ad2 8862b1f2 48e1d7f2 a800e8f2  (....b..H.......
 0050 0801679e 000080d2 0101669e ff430091  ..g.......f..C..
 0060 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0070 ff8300d1 e00300f9 e00b00bd ff0f00b9  ................
 0080 ff0b00f9 ff1b00b9 e80b40bd e80f00bd  ..........@.....
 0090 08008052 e81b00b9 000080d2 0101261e  ...R..........&.
 00a0 ff830091 fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 00b0 fd7bbfa9 fd030091 ffc300d1 e00300f9  .{..............
 00c0 e00700fd ff1300b9 ff0f00f9 ff2300b9  .............#..
 00d0 e80740fd e80f00fd 08008052 e82300b9  ..@........R.#..
 00e0 000080d2 0101669e ffc30091 fd7bc1a8  ......f......{..
 00f0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0100 ff4300d1 e00300f9 e00b00bd e10f00bd  .C..............
 0110 e80b40bd e90f40bd 0829291e 000080d2  ..@...@..)).....
 0120 0101261e ff430091 fd7bc1a8 c0035fd6  ..&..C...{...._.
 0130 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 0140 e00700fd e10b00fd e80740fd e90b40fd  ..........@...@.
 0150 0829691e 000080d2 0101669e ff830091  .)i.......f.....
 0160 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0170 ff4300d1 e00300f9 e00b00bd e10f00bd  .C..............
 0180 e80b40bd e90f40bd 0839291e 000080d2  ..@...@..9).....
 0190 0101261e ff430091 fd7bc1a8 c0035fd6  ..&..C...{...._.
 01a0 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 01b0 e00700fd e10b00fd e80740fd e90b40fd  ..........@...@.
 01c0 0839691e 000080d2 0101669e ff830091  .9i.......f.....
 01d0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 01e0 ff4300d1 e00300f9 e00b00bd e10f00bd  .C..............
 01f0 e80b40bd e90f40bd 0809291e 000080d2  ..@...@...).....
 0200 0101261e ff430091 fd7bc1a8 c0035fd6  ..&..C...{...._.
 0210 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 0220 e00700fd e10b00fd e80740fd e90b40fd  ..........@...@.
 0230 0809691e 000080d2 0101669e ff830091  ..i.......f.....
 0240 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0250 ff4300d1 e00300f9 e00b00bd e10f00bd  .C..............
 0260 e80b40bd e90f40bd 0819291e 000080d2  ..@...@...).....
 0270 0101261e ff430091 fd7bc1a8 c0035fd6  ..&..C...{...._.
 0280 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 0290 e00700fd e10b00fd e80740fd e90b40fd  ..........@...@.
 02a0 0819691e 000080d2 0101669e ff830091  ..i.......f.....
 02b0 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <get_pi_f32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	5281fb68 	mov	w8, #0xfdb                 	// #4059
  14:	72a80928 	movk	w8, #0x4049, lsl #16
  18:	1e270108 	fmov	s8, w8
  1c:	d2800000 	mov	x0, #0x0                   	// #0
  20:	1e260101 	fmov	w1, s8
  24:	910043ff 	add	sp, sp, #0x10
  28:	a8c17bfd 	ldp	x29, x30, [sp], #16
  2c:	d65f03c0 	ret

0000000000000030 <get_e_f64>:
  30:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  34:	910003fd 	mov	x29, sp
  38:	d10043ff 	sub	sp, sp, #0x10
  3c:	f90003e0 	str	x0, [sp]
  40:	d28aed28 	mov	x8, #0x5769                	// #22377
  44:	f2b16288 	movk	x8, #0x8b14, lsl #16
  48:	f2d7e148 	movk	x8, #0xbf0a, lsl #32
  4c:	f2e800a8 	movk	x8, #0x4005, lsl #48
  50:	9e670108 	fmov	d8, x8
  54:	d2800000 	mov	x0, #0x0                   	// #0
  58:	9e660101 	fmov	x1, d8
  5c:	910043ff 	add	sp, sp, #0x10
  60:	a8c17bfd 	ldp	x29, x30, [sp], #16
  64:	d65f03c0 	ret

0000000000000068 <echo_f32>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10083ff 	sub	sp, sp, #0x20
  74:	f90003e0 	str	x0, [sp]
  78:	bd000be0 	str	s0, [sp, #8]
  7c:	b9000fff 	str	wzr, [sp, #12]
  80:	f9000bff 	str	xzr, [sp, #16]
  84:	b9001bff 	str	wzr, [sp, #24]
  88:	bd400be8 	ldr	s8, [sp, #8]
  8c:	bd000fe8 	str	s8, [sp, #12]
  90:	52800008 	mov	w8, #0x0                   	// #0
  94:	b9001be8 	str	w8, [sp, #24]
  98:	d2800000 	mov	x0, #0x0                   	// #0
  9c:	1e260101 	fmov	w1, s8
  a0:	910083ff 	add	sp, sp, #0x20
  a4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a8:	d65f03c0 	ret
  ac:	d503201f 	nop

00000000000000b0 <echo_f64>:
  b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  b4:	910003fd 	mov	x29, sp
  b8:	d100c3ff 	sub	sp, sp, #0x30
  bc:	f90003e0 	str	x0, [sp]
  c0:	fd0007e0 	str	d0, [sp, #8]
  c4:	b90013ff 	str	wzr, [sp, #16]
  c8:	f9000fff 	str	xzr, [sp, #24]
  cc:	b90023ff 	str	wzr, [sp, #32]
  d0:	fd4007e8 	ldr	d8, [sp, #8]
  d4:	fd000fe8 	str	d8, [sp, #24]
  d8:	52800008 	mov	w8, #0x0                   	// #0
  dc:	b90023e8 	str	w8, [sp, #32]
  e0:	d2800000 	mov	x0, #0x0                   	// #0
  e4:	9e660101 	fmov	x1, d8
  e8:	9100c3ff 	add	sp, sp, #0x30
  ec:	a8c17bfd 	ldp	x29, x30, [sp], #16
  f0:	d65f03c0 	ret
  f4:	d503201f 	nop

00000000000000f8 <add_f32>:
  f8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  fc:	910003fd 	mov	x29, sp
 100:	d10043ff 	sub	sp, sp, #0x10
 104:	f90003e0 	str	x0, [sp]
 108:	bd000be0 	str	s0, [sp, #8]
 10c:	bd000fe1 	str	s1, [sp, #12]
 110:	bd400be8 	ldr	s8, [sp, #8]
 114:	bd400fe9 	ldr	s9, [sp, #12]
 118:	1e292908 	fadd	s8, s8, s9
 11c:	d2800000 	mov	x0, #0x0                   	// #0
 120:	1e260101 	fmov	w1, s8
 124:	910043ff 	add	sp, sp, #0x10
 128:	a8c17bfd 	ldp	x29, x30, [sp], #16
 12c:	d65f03c0 	ret

0000000000000130 <add_f64>:
 130:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 134:	910003fd 	mov	x29, sp
 138:	d10083ff 	sub	sp, sp, #0x20
 13c:	f90003e0 	str	x0, [sp]
 140:	fd0007e0 	str	d0, [sp, #8]
 144:	fd000be1 	str	d1, [sp, #16]
 148:	fd4007e8 	ldr	d8, [sp, #8]
 14c:	fd400be9 	ldr	d9, [sp, #16]
 150:	1e692908 	fadd	d8, d8, d9
 154:	d2800000 	mov	x0, #0x0                   	// #0
 158:	9e660101 	fmov	x1, d8
 15c:	910083ff 	add	sp, sp, #0x20
 160:	a8c17bfd 	ldp	x29, x30, [sp], #16
 164:	d65f03c0 	ret

0000000000000168 <sub_f32>:
 168:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 16c:	910003fd 	mov	x29, sp
 170:	d10043ff 	sub	sp, sp, #0x10
 174:	f90003e0 	str	x0, [sp]
 178:	bd000be0 	str	s0, [sp, #8]
 17c:	bd000fe1 	str	s1, [sp, #12]
 180:	bd400be8 	ldr	s8, [sp, #8]
 184:	bd400fe9 	ldr	s9, [sp, #12]
 188:	1e293908 	fsub	s8, s8, s9
 18c:	d2800000 	mov	x0, #0x0                   	// #0
 190:	1e260101 	fmov	w1, s8
 194:	910043ff 	add	sp, sp, #0x10
 198:	a8c17bfd 	ldp	x29, x30, [sp], #16
 19c:	d65f03c0 	ret

00000000000001a0 <sub_f64>:
 1a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1a4:	910003fd 	mov	x29, sp
 1a8:	d10083ff 	sub	sp, sp, #0x20
 1ac:	f90003e0 	str	x0, [sp]
 1b0:	fd0007e0 	str	d0, [sp, #8]
 1b4:	fd000be1 	str	d1, [sp, #16]
 1b8:	fd4007e8 	ldr	d8, [sp, #8]
 1bc:	fd400be9 	ldr	d9, [sp, #16]
 1c0:	1e693908 	fsub	d8, d8, d9
 1c4:	d2800000 	mov	x0, #0x0                   	// #0
 1c8:	9e660101 	fmov	x1, d8
 1cc:	910083ff 	add	sp, sp, #0x20
 1d0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1d4:	d65f03c0 	ret

00000000000001d8 <mul_f32>:
 1d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1dc:	910003fd 	mov	x29, sp
 1e0:	d10043ff 	sub	sp, sp, #0x10
 1e4:	f90003e0 	str	x0, [sp]
 1e8:	bd000be0 	str	s0, [sp, #8]
 1ec:	bd000fe1 	str	s1, [sp, #12]
 1f0:	bd400be8 	ldr	s8, [sp, #8]
 1f4:	bd400fe9 	ldr	s9, [sp, #12]
 1f8:	1e290908 	fmul	s8, s8, s9
 1fc:	d2800000 	mov	x0, #0x0                   	// #0
 200:	1e260101 	fmov	w1, s8
 204:	910043ff 	add	sp, sp, #0x10
 208:	a8c17bfd 	ldp	x29, x30, [sp], #16
 20c:	d65f03c0 	ret

0000000000000210 <mul_f64>:
 210:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 214:	910003fd 	mov	x29, sp
 218:	d10083ff 	sub	sp, sp, #0x20
 21c:	f90003e0 	str	x0, [sp]
 220:	fd0007e0 	str	d0, [sp, #8]
 224:	fd000be1 	str	d1, [sp, #16]
 228:	fd4007e8 	ldr	d8, [sp, #8]
 22c:	fd400be9 	ldr	d9, [sp, #16]
 230:	1e690908 	fmul	d8, d8, d9
 234:	d2800000 	mov	x0, #0x0                   	// #0
 238:	9e660101 	fmov	x1, d8
 23c:	910083ff 	add	sp, sp, #0x20
 240:	a8c17bfd 	ldp	x29, x30, [sp], #16
 244:	d65f03c0 	ret

0000000000000248 <div_f32>:
 248:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 24c:	910003fd 	mov	x29, sp
 250:	d10043ff 	sub	sp, sp, #0x10
 254:	f90003e0 	str	x0, [sp]
 258:	bd000be0 	str	s0, [sp, #8]
 25c:	bd000fe1 	str	s1, [sp, #12]
 260:	bd400be8 	ldr	s8, [sp, #8]
 264:	bd400fe9 	ldr	s9, [sp, #12]
 268:	1e291908 	fdiv	s8, s8, s9
 26c:	d2800000 	mov	x0, #0x0                   	// #0
 270:	1e260101 	fmov	w1, s8
 274:	910043ff 	add	sp, sp, #0x10
 278:	a8c17bfd 	ldp	x29, x30, [sp], #16
 27c:	d65f03c0 	ret

0000000000000280 <div_f64>:
 280:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 284:	910003fd 	mov	x29, sp
 288:	d10083ff 	sub	sp, sp, #0x20
 28c:	f90003e0 	str	x0, [sp]
 290:	fd0007e0 	str	d0, [sp, #8]
 294:	fd000be1 	str	d1, [sp, #16]
 298:	fd4007e8 	ldr	d8, [sp, #8]
 29c:	fd400be9 	ldr	d9, [sp, #16]
 2a0:	1e691908 	fdiv	d8, d8, d9
 2a4:	d2800000 	mov	x0, #0x0                   	// #0
 2a8:	9e660101 	fmov	x1, d8
 2ac:	910083ff 	add	sp, sp, #0x20
 2b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 2b4:	d65f03c0 	ret
