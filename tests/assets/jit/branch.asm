
./tests/assets/jit/branch.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000040 simple_if
0000000000000040 l     F .text	0000000000000028 nested_if
0000000000000068 l     F .text	0000000000000028 nested_else
0000000000000090 l     F .text	0000000000000028 simple_if_add1
00000000000000b8 l     F .text	0000000000000028 nested_else_add1


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e80340f9 090080d2 1f0109eb e8079f1a  ..@.............
 0020 08000034 e80340f9 e00308aa e1031faa  ...4..@.........
 0030 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0040 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0050 e80340f9 e00308aa e1031faa ff430091  ..@..........C..
 0060 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0070 ff4300d1 e00300f9 e80340f9 e00308aa  .C........@.....
 0080 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0090 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00a0 e80340f9 e00308aa e1031faa ff430091  ..@..........C..
 00b0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00c0 ff4300d1 e00300f9 e80340f9 e00308aa  .C........@.....
 00d0 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.

Disassembly of section .text:

0000000000000000 <simple_if>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	f94003e8 	ldr	x8, [sp]
  14:	d2800009 	mov	x9, #0x0                   	// #0
  18:	eb09011f 	cmp	x8, x9
  1c:	1a9f07e8 	cset	w8, ne	// ne = any
  20:	34000008 	cbz	w8, 20 <simple_if+0x20>
  24:	f94003e8 	ldr	x8, [sp]
  28:	aa0803e0 	mov	x0, x8
  2c:	aa1f03e1 	mov	x1, xzr
  30:	910043ff 	add	sp, sp, #0x10
  34:	a8c17bfd 	ldp	x29, x30, [sp], #16
  38:	d65f03c0 	ret
  3c:	d503201f 	nop

0000000000000040 <nested_if>:
  40:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  44:	910003fd 	mov	x29, sp
  48:	d10043ff 	sub	sp, sp, #0x10
  4c:	f90003e0 	str	x0, [sp]
  50:	f94003e8 	ldr	x8, [sp]
  54:	aa0803e0 	mov	x0, x8
  58:	aa1f03e1 	mov	x1, xzr
  5c:	910043ff 	add	sp, sp, #0x10
  60:	a8c17bfd 	ldp	x29, x30, [sp], #16
  64:	d65f03c0 	ret

0000000000000068 <nested_else>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10043ff 	sub	sp, sp, #0x10
  74:	f90003e0 	str	x0, [sp]
  78:	f94003e8 	ldr	x8, [sp]
  7c:	aa0803e0 	mov	x0, x8
  80:	aa1f03e1 	mov	x1, xzr
  84:	910043ff 	add	sp, sp, #0x10
  88:	a8c17bfd 	ldp	x29, x30, [sp], #16
  8c:	d65f03c0 	ret

0000000000000090 <simple_if_add1>:
  90:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  94:	910003fd 	mov	x29, sp
  98:	d10043ff 	sub	sp, sp, #0x10
  9c:	f90003e0 	str	x0, [sp]
  a0:	f94003e8 	ldr	x8, [sp]
  a4:	aa0803e0 	mov	x0, x8
  a8:	aa1f03e1 	mov	x1, xzr
  ac:	910043ff 	add	sp, sp, #0x10
  b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  b4:	d65f03c0 	ret

00000000000000b8 <nested_else_add1>:
  b8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  bc:	910003fd 	mov	x29, sp
  c0:	d10043ff 	sub	sp, sp, #0x10
  c4:	f90003e0 	str	x0, [sp]
  c8:	f94003e8 	ldr	x8, [sp]
  cc:	aa0803e0 	mov	x0, x8
  d0:	aa1f03e1 	mov	x1, xzr
  d4:	910043ff 	add	sp, sp, #0x10
  d8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  dc:	d65f03c0 	ret
