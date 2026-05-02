
tests/assets/wast/jit/arithmetic_0.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 add
0000000000000038 l     F .text	0000000000000038 sub
0000000000000070 l     F .text	0000000000000038 mul


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0010 e10700b9 e80340b9 e90740b9 0801090b  ......@...@.....
 0020 e003082a e1031f2a ff430091 fd7bc1a8  ...*...*.C...{..
 0030 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0040 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 0050 e90740b9 0801094b e003082a e1031f2a  ..@....K...*...*
 0060 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0070 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0080 e10700b9 e80340b9 e90740b9 087d091b  ......@...@..}..
 0090 e003082a e1031f2a ff430091 fd7bc1a8  ...*...*.C...{..
 00a0 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <add>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	b90003e0 	str	w0, [sp]
  10:	b90007e1 	str	w1, [sp, #4]
  14:	b94003e8 	ldr	w8, [sp]
  18:	b94007e9 	ldr	w9, [sp, #4]
  1c:	0b090108 	add	w8, w8, w9
  20:	2a0803e0 	mov	w0, w8
  24:	2a1f03e1 	mov	w1, wzr
  28:	910043ff 	add	sp, sp, #0x10
  2c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  30:	d65f03c0 	ret
  34:	d503201f 	nop

0000000000000038 <sub>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10043ff 	sub	sp, sp, #0x10
  44:	b90003e0 	str	w0, [sp]
  48:	b90007e1 	str	w1, [sp, #4]
  4c:	b94003e8 	ldr	w8, [sp]
  50:	b94007e9 	ldr	w9, [sp, #4]
  54:	4b090108 	sub	w8, w8, w9
  58:	2a0803e0 	mov	w0, w8
  5c:	2a1f03e1 	mov	w1, wzr
  60:	910043ff 	add	sp, sp, #0x10
  64:	a8c17bfd 	ldp	x29, x30, [sp], #16
  68:	d65f03c0 	ret
  6c:	d503201f 	nop

0000000000000070 <mul>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	d10043ff 	sub	sp, sp, #0x10
  7c:	b90003e0 	str	w0, [sp]
  80:	b90007e1 	str	w1, [sp, #4]
  84:	b94003e8 	ldr	w8, [sp]
  88:	b94007e9 	ldr	w9, [sp, #4]
  8c:	1b097d08 	mul	w8, w8, w9
  90:	2a0803e0 	mov	w0, w8
  94:	2a1f03e1 	mov	w1, wzr
  98:	910043ff 	add	sp, sp, #0x10
  9c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a0:	d65f03c0 	ret
  a4:	d503201f 	nop
