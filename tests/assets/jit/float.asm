
tests/assets/jit/float.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 get_pi_f32
0000000000000028 l     F .text	0000000000000030 get_e_f64
0000000000000058 l     F .text	0000000000000038 add_f32
0000000000000090 l     F .text	0000000000000038 add_f64
00000000000000c8 l     F .text	0000000000000038 sub_f32
0000000000000100 l     F .text	0000000000000038 sub_f64
0000000000000138 l     F .text	0000000000000038 mul_f32
0000000000000170 l     F .text	0000000000000038 mul_f64


Contents of section .text:
 0000 fd7bbfa9 fd030091 68fb8152 2809a872  .{......h..R(..r
 0010 0001271e 000080d2 0100261e fd7bc1a8  ..'.......&..{..
 0020 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0030 28ed8ad2 8862b1f2 48e1d7f2 a800e8f2  (....b..H.......
 0040 0001679e 000080d2 0100669e fd7bc1a8  ..g.......f..{..
 0050 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0060 ff4300d1 e00300bd e10700bd e00340bd  .C............@.
 0070 e10740bd 0028211e 000080d2 0100261e  ..@..(!.......&.
 0080 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0090 fd7bbfa9 fd030091 ff4300d1 e00300fd  .{.......C......
 00a0 e10700fd e00340fd e10740fd 0028611e  ......@...@..(a.
 00b0 000080d2 0100669e ff430091 fd7bc1a8  ......f..C...{..
 00c0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00d0 ff4300d1 e00300bd e10700bd e00340bd  .C............@.
 00e0 e10740bd 0038211e 000080d2 0100261e  ..@..8!.......&.
 00f0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0100 fd7bbfa9 fd030091 ff4300d1 e00300fd  .{.......C......
 0110 e10700fd e00340fd e10740fd 0038611e  ......@...@..8a.
 0120 000080d2 0100669e ff430091 fd7bc1a8  ......f..C...{..
 0130 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0140 ff4300d1 e00300bd e10700bd e00340bd  .C............@.
 0150 e10740bd 0008211e 000080d2 0100261e  ..@...!.......&.
 0160 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0170 fd7bbfa9 fd030091 ff4300d1 e00300fd  .{.......C......
 0180 e10700fd e00340fd e10740fd 0008611e  ......@...@...a.
 0190 000080d2 0100669e ff430091 fd7bc1a8  ......f..C...{..
 01a0 c0035fd6 1f2003d5                    .._.. ..        

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

0000000000000058 <add_f32>:
  58:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  5c:	910003fd 	mov	x29, sp
  60:	d10043ff 	sub	sp, sp, #0x10
  64:	bd0003e0 	str	s0, [sp]
  68:	bd0007e1 	str	s1, [sp, #4]
  6c:	bd4003e0 	ldr	s0, [sp]
  70:	bd4007e1 	ldr	s1, [sp, #4]
  74:	1e212800 	fadd	s0, s0, s1
  78:	d2800000 	mov	x0, #0x0                   	// #0
  7c:	1e260001 	fmov	w1, s0
  80:	910043ff 	add	sp, sp, #0x10
  84:	a8c17bfd 	ldp	x29, x30, [sp], #16
  88:	d65f03c0 	ret
  8c:	d503201f 	nop

0000000000000090 <add_f64>:
  90:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  94:	910003fd 	mov	x29, sp
  98:	d10043ff 	sub	sp, sp, #0x10
  9c:	fd0003e0 	str	d0, [sp]
  a0:	fd0007e1 	str	d1, [sp, #8]
  a4:	fd4003e0 	ldr	d0, [sp]
  a8:	fd4007e1 	ldr	d1, [sp, #8]
  ac:	1e612800 	fadd	d0, d0, d1
  b0:	d2800000 	mov	x0, #0x0                   	// #0
  b4:	9e660001 	fmov	x1, d0
  b8:	910043ff 	add	sp, sp, #0x10
  bc:	a8c17bfd 	ldp	x29, x30, [sp], #16
  c0:	d65f03c0 	ret
  c4:	d503201f 	nop

00000000000000c8 <sub_f32>:
  c8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  cc:	910003fd 	mov	x29, sp
  d0:	d10043ff 	sub	sp, sp, #0x10
  d4:	bd0003e0 	str	s0, [sp]
  d8:	bd0007e1 	str	s1, [sp, #4]
  dc:	bd4003e0 	ldr	s0, [sp]
  e0:	bd4007e1 	ldr	s1, [sp, #4]
  e4:	1e213800 	fsub	s0, s0, s1
  e8:	d2800000 	mov	x0, #0x0                   	// #0
  ec:	1e260001 	fmov	w1, s0
  f0:	910043ff 	add	sp, sp, #0x10
  f4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  f8:	d65f03c0 	ret
  fc:	d503201f 	nop

0000000000000100 <sub_f64>:
 100:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 104:	910003fd 	mov	x29, sp
 108:	d10043ff 	sub	sp, sp, #0x10
 10c:	fd0003e0 	str	d0, [sp]
 110:	fd0007e1 	str	d1, [sp, #8]
 114:	fd4003e0 	ldr	d0, [sp]
 118:	fd4007e1 	ldr	d1, [sp, #8]
 11c:	1e613800 	fsub	d0, d0, d1
 120:	d2800000 	mov	x0, #0x0                   	// #0
 124:	9e660001 	fmov	x1, d0
 128:	910043ff 	add	sp, sp, #0x10
 12c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 130:	d65f03c0 	ret
 134:	d503201f 	nop

0000000000000138 <mul_f32>:
 138:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 13c:	910003fd 	mov	x29, sp
 140:	d10043ff 	sub	sp, sp, #0x10
 144:	bd0003e0 	str	s0, [sp]
 148:	bd0007e1 	str	s1, [sp, #4]
 14c:	bd4003e0 	ldr	s0, [sp]
 150:	bd4007e1 	ldr	s1, [sp, #4]
 154:	1e210800 	fmul	s0, s0, s1
 158:	d2800000 	mov	x0, #0x0                   	// #0
 15c:	1e260001 	fmov	w1, s0
 160:	910043ff 	add	sp, sp, #0x10
 164:	a8c17bfd 	ldp	x29, x30, [sp], #16
 168:	d65f03c0 	ret
 16c:	d503201f 	nop

0000000000000170 <mul_f64>:
 170:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 174:	910003fd 	mov	x29, sp
 178:	d10043ff 	sub	sp, sp, #0x10
 17c:	fd0003e0 	str	d0, [sp]
 180:	fd0007e1 	str	d1, [sp, #8]
 184:	fd4003e0 	ldr	d0, [sp]
 188:	fd4007e1 	ldr	d1, [sp, #8]
 18c:	1e610800 	fmul	d0, d0, d1
 190:	d2800000 	mov	x0, #0x0                   	// #0
 194:	9e660001 	fmov	x1, d0
 198:	910043ff 	add	sp, sp, #0x10
 19c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1a0:	d65f03c0 	ret
 1a4:	d503201f 	nop
