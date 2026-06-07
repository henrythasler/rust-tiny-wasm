
tests/assets/jit/float.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 get_pi_f32
0000000000000028 l     F .text	0000000000000030 get_e_f64


Contents of section .text:
 0000 fd7bbfa9 fd030091 68fb8152 2809a872  .{......h..R(..r
 0010 0001271e 000080d2 0100261e fd7bc1a8  ..'.......&..{..
 0020 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0030 28ed8ad2 8862b1f2 48e1d7f2 a800e8f2  (....b..H.......
 0040 0001679e 000080d2 0100669e fd7bc1a8  ..g.......f..{..
 0050 c0035fd6 1f2003d5                    .._.. ..        

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
