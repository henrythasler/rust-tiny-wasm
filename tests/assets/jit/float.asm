
tests/assets/jit/float.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 get_pi_f32
0000000000000028 l     F .text	0000000000000030 get_e_f64
0000000000000058 l     F .text	0000000000000040 echo_f32
0000000000000098 l     F .text	0000000000000040 echo_f64
00000000000000d8 l     F .text	0000000000000038 add_f32
0000000000000110 l     F .text	0000000000000038 add_f64
0000000000000148 l     F .text	0000000000000038 sub_f32
0000000000000180 l     F .text	0000000000000038 sub_f64
00000000000001b8 l     F .text	0000000000000038 mul_f32
00000000000001f0 l     F .text	0000000000000038 mul_f64
0000000000000228 l     F .text	0000000000000038 div_f32
0000000000000260 l     F .text	0000000000000038 div_f64


Contents of section .text:
 0000 fd7bbfa9 fd030091 68fb8152 2809a872  .{......h..R(..r
 0010 0001271e 000080d2 0100261e fd7bc1a8  ..'.......&..{..
 0020 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0030 28ed8ad2 8862b1f2 48e1d7f2 a800e8f2  (....b..H.......
 0040 0001679e 000080d2 0100669e fd7bc1a8  ..g.......f..{..
 0050 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0060 ff8300d1 e00300bd ff0700b9 ff0700f9  ................
 0070 ff1300b9 e00340bd e00700bd 08008052  ......@........R
 0080 e81300b9 000080d2 0100261e ff830091  ..........&.....
 0090 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00a0 ff8300d1 e00300fd ff0b00b9 ff0b00f9  ................
 00b0 ff1b00b9 e00340fd e00b00fd 08008052  ......@........R
 00c0 e81b00b9 000080d2 0100669e ff830091  ..........f.....
 00d0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00e0 ff4300d1 e00300bd e10700bd e00340bd  .C............@.
 00f0 e10740bd 0028211e 000080d2 0100261e  ..@..(!.......&.
 0100 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0110 fd7bbfa9 fd030091 ff4300d1 e00300fd  .{.......C......
 0120 e10700fd e00340fd e10740fd 0028611e  ......@...@..(a.
 0130 000080d2 0100669e ff430091 fd7bc1a8  ......f..C...{..
 0140 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0150 ff4300d1 e00300bd e10700bd e00340bd  .C............@.
 0160 e10740bd 0038211e 000080d2 0100261e  ..@..8!.......&.
 0170 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0180 fd7bbfa9 fd030091 ff4300d1 e00300fd  .{.......C......
 0190 e10700fd e00340fd e10740fd 0038611e  ......@...@..8a.
 01a0 000080d2 0100669e ff430091 fd7bc1a8  ......f..C...{..
 01b0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 01c0 ff4300d1 e00300bd e10700bd e00340bd  .C............@.
 01d0 e10740bd 0008211e 000080d2 0100261e  ..@...!.......&.
 01e0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 01f0 fd7bbfa9 fd030091 ff4300d1 e00300fd  .{.......C......
 0200 e10700fd e00340fd e10740fd 0008611e  ......@...@...a.
 0210 000080d2 0100669e ff430091 fd7bc1a8  ......f..C...{..
 0220 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0230 ff4300d1 e00300bd e10700bd e00340bd  .C............@.
 0240 e10740bd 0018211e 000080d2 0100261e  ..@...!.......&.
 0250 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0260 fd7bbfa9 fd030091 ff4300d1 e00300fd  .{.......C......
 0270 e10700fd e00340fd e10740fd 0018611e  ......@...@...a.
 0280 000080d2 0100669e ff430091 fd7bc1a8  ......f..C...{..
 0290 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <get_pi_f32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	5281fb68 	mov	w8, #0xfdb                 	// #4059
   c:	72a80928 	movk	w8, #0x4049, lsl #16
  10:	1e270100 	fmov	s0, w8
  14:	d2800000 	mov	x0, #0x0                   	// #0
  18:	1e260001 	fmov	w1, s0
  1c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  20:	d65f03c0 	ret
  24:	d503201f 	nop

0000000000000028 <get_e_f64>:
  28:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  2c:	910003fd 	mov	x29, sp
  30:	d28aed28 	mov	x8, #0x5769                	// #22377
  34:	f2b16288 	movk	x8, #0x8b14, lsl #16
  38:	f2d7e148 	movk	x8, #0xbf0a, lsl #32
  3c:	f2e800a8 	movk	x8, #0x4005, lsl #48
  40:	9e670100 	fmov	d0, x8
  44:	d2800000 	mov	x0, #0x0                   	// #0
  48:	9e660001 	fmov	x1, d0
  4c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  50:	d65f03c0 	ret
  54:	d503201f 	nop

0000000000000058 <echo_f32>:
  58:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  5c:	910003fd 	mov	x29, sp
  60:	d10083ff 	sub	sp, sp, #0x20
  64:	bd0003e0 	str	s0, [sp]
  68:	b90007ff 	str	wzr, [sp, #4]
  6c:	f90007ff 	str	xzr, [sp, #8]
  70:	b90013ff 	str	wzr, [sp, #16]
  74:	bd4003e0 	ldr	s0, [sp]
  78:	bd0007e0 	str	s0, [sp, #4]
  7c:	52800008 	mov	w8, #0x0                   	// #0
  80:	b90013e8 	str	w8, [sp, #16]
  84:	d2800000 	mov	x0, #0x0                   	// #0
  88:	1e260001 	fmov	w1, s0
  8c:	910083ff 	add	sp, sp, #0x20
  90:	a8c17bfd 	ldp	x29, x30, [sp], #16
  94:	d65f03c0 	ret

0000000000000098 <echo_f64>:
  98:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  9c:	910003fd 	mov	x29, sp
  a0:	d10083ff 	sub	sp, sp, #0x20
  a4:	fd0003e0 	str	d0, [sp]
  a8:	b9000bff 	str	wzr, [sp, #8]
  ac:	f9000bff 	str	xzr, [sp, #16]
  b0:	b9001bff 	str	wzr, [sp, #24]
  b4:	fd4003e0 	ldr	d0, [sp]
  b8:	fd000be0 	str	d0, [sp, #16]
  bc:	52800008 	mov	w8, #0x0                   	// #0
  c0:	b9001be8 	str	w8, [sp, #24]
  c4:	d2800000 	mov	x0, #0x0                   	// #0
  c8:	9e660001 	fmov	x1, d0
  cc:	910083ff 	add	sp, sp, #0x20
  d0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d4:	d65f03c0 	ret

00000000000000d8 <add_f32>:
  d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  dc:	910003fd 	mov	x29, sp
  e0:	d10043ff 	sub	sp, sp, #0x10
  e4:	bd0003e0 	str	s0, [sp]
  e8:	bd0007e1 	str	s1, [sp, #4]
  ec:	bd4003e0 	ldr	s0, [sp]
  f0:	bd4007e1 	ldr	s1, [sp, #4]
  f4:	1e212800 	fadd	s0, s0, s1
  f8:	d2800000 	mov	x0, #0x0                   	// #0
  fc:	1e260001 	fmov	w1, s0
 100:	910043ff 	add	sp, sp, #0x10
 104:	a8c17bfd 	ldp	x29, x30, [sp], #16
 108:	d65f03c0 	ret
 10c:	d503201f 	nop

0000000000000110 <add_f64>:
 110:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 114:	910003fd 	mov	x29, sp
 118:	d10043ff 	sub	sp, sp, #0x10
 11c:	fd0003e0 	str	d0, [sp]
 120:	fd0007e1 	str	d1, [sp, #8]
 124:	fd4003e0 	ldr	d0, [sp]
 128:	fd4007e1 	ldr	d1, [sp, #8]
 12c:	1e612800 	fadd	d0, d0, d1
 130:	d2800000 	mov	x0, #0x0                   	// #0
 134:	9e660001 	fmov	x1, d0
 138:	910043ff 	add	sp, sp, #0x10
 13c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 140:	d65f03c0 	ret
 144:	d503201f 	nop

0000000000000148 <sub_f32>:
 148:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 14c:	910003fd 	mov	x29, sp
 150:	d10043ff 	sub	sp, sp, #0x10
 154:	bd0003e0 	str	s0, [sp]
 158:	bd0007e1 	str	s1, [sp, #4]
 15c:	bd4003e0 	ldr	s0, [sp]
 160:	bd4007e1 	ldr	s1, [sp, #4]
 164:	1e213800 	fsub	s0, s0, s1
 168:	d2800000 	mov	x0, #0x0                   	// #0
 16c:	1e260001 	fmov	w1, s0
 170:	910043ff 	add	sp, sp, #0x10
 174:	a8c17bfd 	ldp	x29, x30, [sp], #16
 178:	d65f03c0 	ret
 17c:	d503201f 	nop

0000000000000180 <sub_f64>:
 180:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 184:	910003fd 	mov	x29, sp
 188:	d10043ff 	sub	sp, sp, #0x10
 18c:	fd0003e0 	str	d0, [sp]
 190:	fd0007e1 	str	d1, [sp, #8]
 194:	fd4003e0 	ldr	d0, [sp]
 198:	fd4007e1 	ldr	d1, [sp, #8]
 19c:	1e613800 	fsub	d0, d0, d1
 1a0:	d2800000 	mov	x0, #0x0                   	// #0
 1a4:	9e660001 	fmov	x1, d0
 1a8:	910043ff 	add	sp, sp, #0x10
 1ac:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1b0:	d65f03c0 	ret
 1b4:	d503201f 	nop

00000000000001b8 <mul_f32>:
 1b8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1bc:	910003fd 	mov	x29, sp
 1c0:	d10043ff 	sub	sp, sp, #0x10
 1c4:	bd0003e0 	str	s0, [sp]
 1c8:	bd0007e1 	str	s1, [sp, #4]
 1cc:	bd4003e0 	ldr	s0, [sp]
 1d0:	bd4007e1 	ldr	s1, [sp, #4]
 1d4:	1e210800 	fmul	s0, s0, s1
 1d8:	d2800000 	mov	x0, #0x0                   	// #0
 1dc:	1e260001 	fmov	w1, s0
 1e0:	910043ff 	add	sp, sp, #0x10
 1e4:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1e8:	d65f03c0 	ret
 1ec:	d503201f 	nop

00000000000001f0 <mul_f64>:
 1f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1f4:	910003fd 	mov	x29, sp
 1f8:	d10043ff 	sub	sp, sp, #0x10
 1fc:	fd0003e0 	str	d0, [sp]
 200:	fd0007e1 	str	d1, [sp, #8]
 204:	fd4003e0 	ldr	d0, [sp]
 208:	fd4007e1 	ldr	d1, [sp, #8]
 20c:	1e610800 	fmul	d0, d0, d1
 210:	d2800000 	mov	x0, #0x0                   	// #0
 214:	9e660001 	fmov	x1, d0
 218:	910043ff 	add	sp, sp, #0x10
 21c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 220:	d65f03c0 	ret
 224:	d503201f 	nop

0000000000000228 <div_f32>:
 228:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 22c:	910003fd 	mov	x29, sp
 230:	d10043ff 	sub	sp, sp, #0x10
 234:	bd0003e0 	str	s0, [sp]
 238:	bd0007e1 	str	s1, [sp, #4]
 23c:	bd4003e0 	ldr	s0, [sp]
 240:	bd4007e1 	ldr	s1, [sp, #4]
 244:	1e211800 	fdiv	s0, s0, s1
 248:	d2800000 	mov	x0, #0x0                   	// #0
 24c:	1e260001 	fmov	w1, s0
 250:	910043ff 	add	sp, sp, #0x10
 254:	a8c17bfd 	ldp	x29, x30, [sp], #16
 258:	d65f03c0 	ret
 25c:	d503201f 	nop

0000000000000260 <div_f64>:
 260:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 264:	910003fd 	mov	x29, sp
 268:	d10043ff 	sub	sp, sp, #0x10
 26c:	fd0003e0 	str	d0, [sp]
 270:	fd0007e1 	str	d1, [sp, #8]
 274:	fd4003e0 	ldr	d0, [sp]
 278:	fd4007e1 	ldr	d1, [sp, #8]
 27c:	1e611800 	fdiv	d0, d0, d1
 280:	d2800000 	mov	x0, #0x0                   	// #0
 284:	9e660001 	fmov	x1, d0
 288:	910043ff 	add	sp, sp, #0x10
 28c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 290:	d65f03c0 	ret
 294:	d503201f 	nop
