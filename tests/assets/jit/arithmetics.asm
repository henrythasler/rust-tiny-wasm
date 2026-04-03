
./tests/assets/jit/arithmetics.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 add
0000000000000028 l     F .text	0000000000000028 sub
0000000000000050 l     F .text	0000000000000028 mul
0000000000000078 l     F .text	0000000000000028 square


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0010 e10700b9 e0031faa e1031faa ff430091  .............C..
 0020 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0030 ff4300d1 e00300b9 e10700b9 e0031faa  .C..............
 0040 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0050 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0060 e10700b9 e0031faa e1031faa ff430091  .............C..
 0070 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0080 ff4300d1 e00300b9 e0031faa e1031faa  .C..............
 0090 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <add>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	b90003e0 	str	w0, [sp]
  10:	b90007e1 	str	w1, [sp, #4]
  14:	aa1f03e0 	mov	x0, xzr
  18:	aa1f03e1 	mov	x1, xzr
  1c:	910043ff 	add	sp, sp, #0x10
  20:	a8c17bfd 	ldp	x29, x30, [sp], #16
  24:	d65f03c0 	ret

0000000000000028 <sub>:
  28:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  2c:	910003fd 	mov	x29, sp
  30:	d10043ff 	sub	sp, sp, #0x10
  34:	b90003e0 	str	w0, [sp]
  38:	b90007e1 	str	w1, [sp, #4]
  3c:	aa1f03e0 	mov	x0, xzr
  40:	aa1f03e1 	mov	x1, xzr
  44:	910043ff 	add	sp, sp, #0x10
  48:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4c:	d65f03c0 	ret

0000000000000050 <mul>:
  50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  54:	910003fd 	mov	x29, sp
  58:	d10043ff 	sub	sp, sp, #0x10
  5c:	b90003e0 	str	w0, [sp]
  60:	b90007e1 	str	w1, [sp, #4]
  64:	aa1f03e0 	mov	x0, xzr
  68:	aa1f03e1 	mov	x1, xzr
  6c:	910043ff 	add	sp, sp, #0x10
  70:	a8c17bfd 	ldp	x29, x30, [sp], #16
  74:	d65f03c0 	ret

0000000000000078 <square>:
  78:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  7c:	910003fd 	mov	x29, sp
  80:	d10043ff 	sub	sp, sp, #0x10
  84:	b90003e0 	str	w0, [sp]
  88:	aa1f03e0 	mov	x0, xzr
  8c:	aa1f03e1 	mov	x1, xzr
  90:	910043ff 	add	sp, sp, #0x10
  94:	a8c17bfd 	ldp	x29, x30, [sp], #16
  98:	d65f03c0 	ret
  9c:	d503201f 	nop
