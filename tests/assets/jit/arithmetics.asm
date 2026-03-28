
./tests/assets/jit/arithmetics.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 add
0000000000000038 l     F .text	0000000000000030 sub
0000000000000068 l     F .text	0000000000000030 mul
0000000000000098 l     F .text	0000000000000028 $func3


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0010 e10700b9 e80340b9 e90740b9 0801090b  ......@...@.....
 0020 e003082a e1031f2a ff430091 fd7bc1a8  ...*...*.C...{..
 0030 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0040 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 0050 e003082a e1031f2a ff430091 fd7bc1a8  ...*...*.C...{..
 0060 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0070 ff4300d1 e00300b9 e10700b9 e80340b9  .C............@.
 0080 e003082a e1031f2a ff430091 fd7bc1a8  ...*...*.C...{..
 0090 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00a0 ff4300d1 e00300b9 e80340b9 e003082a  .C........@....*
 00b0 e1031f2a ff430091 fd7bc1a8 c0035fd6  ...*.C...{...._.

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
  50:	2a0803e0 	mov	w0, w8
  54:	2a1f03e1 	mov	w1, wzr
  58:	910043ff 	add	sp, sp, #0x10
  5c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  60:	d65f03c0 	ret
  64:	d503201f 	nop

0000000000000068 <mul>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10043ff 	sub	sp, sp, #0x10
  74:	b90003e0 	str	w0, [sp]
  78:	b90007e1 	str	w1, [sp, #4]
  7c:	b94003e8 	ldr	w8, [sp]
  80:	2a0803e0 	mov	w0, w8
  84:	2a1f03e1 	mov	w1, wzr
  88:	910043ff 	add	sp, sp, #0x10
  8c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  90:	d65f03c0 	ret
  94:	d503201f 	nop

0000000000000098 <$func3>:
  98:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  9c:	910003fd 	mov	x29, sp
  a0:	d10043ff 	sub	sp, sp, #0x10
  a4:	b90003e0 	str	w0, [sp]
  a8:	b94003e8 	ldr	w8, [sp]
  ac:	2a0803e0 	mov	w0, w8
  b0:	2a1f03e1 	mov	w1, wzr
  b4:	910043ff 	add	sp, sp, #0x10
  b8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  bc:	d65f03c0 	ret
