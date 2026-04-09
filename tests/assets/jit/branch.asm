
./tests/assets/jit/branch.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000050 simple_if
0000000000000050 l     F .text	0000000000000028 nested_if
0000000000000078 l     F .text	0000000000000028 nested_else
00000000000000a0 l     F .text	0000000000000028 simple_if_add1
00000000000000c8 l     F .text	0000000000000028 nested_else_add1


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e80340f9 090080d2 1f0109eb e8079f1a  ..@.............
 0020 c8000034 e8ff9fd2 e8ffbff2 e8ffdff2  ...4............
 0030 e8fffff2 02000014 280080d2 e00308aa  ........(.......
 0040 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0050 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0060 e80340f9 e00308aa e1031faa ff430091  ..@..........C..
 0070 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0080 ff4300d1 e00300f9 e80340f9 e00308aa  .C........@.....
 0090 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 00a0 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 00b0 e80340f9 e00308aa e1031faa ff430091  ..@..........C..
 00c0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00d0 ff4300d1 e00300f9 e80340f9 e00308aa  .C........@.....
 00e0 e1031faa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.

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
  20:	340000c8 	cbz	w8, 38 <simple_if+0x38>
  24:	d29fffe8 	mov	x8, #0xffff                	// #65535
  28:	f2bfffe8 	movk	x8, #0xffff, lsl #16
  2c:	f2dfffe8 	movk	x8, #0xffff, lsl #32
  30:	f2ffffe8 	movk	x8, #0xffff, lsl #48
  34:	14000002 	b	3c <simple_if+0x3c>
  38:	d2800028 	mov	x8, #0x1                   	// #1
  3c:	aa0803e0 	mov	x0, x8
  40:	aa1f03e1 	mov	x1, xzr
  44:	910043ff 	add	sp, sp, #0x10
  48:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4c:	d65f03c0 	ret

0000000000000050 <nested_if>:
  50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  54:	910003fd 	mov	x29, sp
  58:	d10043ff 	sub	sp, sp, #0x10
  5c:	f90003e0 	str	x0, [sp]
  60:	f94003e8 	ldr	x8, [sp]
  64:	aa0803e0 	mov	x0, x8
  68:	aa1f03e1 	mov	x1, xzr
  6c:	910043ff 	add	sp, sp, #0x10
  70:	a8c17bfd 	ldp	x29, x30, [sp], #16
  74:	d65f03c0 	ret

0000000000000078 <nested_else>:
  78:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  7c:	910003fd 	mov	x29, sp
  80:	d10043ff 	sub	sp, sp, #0x10
  84:	f90003e0 	str	x0, [sp]
  88:	f94003e8 	ldr	x8, [sp]
  8c:	aa0803e0 	mov	x0, x8
  90:	aa1f03e1 	mov	x1, xzr
  94:	910043ff 	add	sp, sp, #0x10
  98:	a8c17bfd 	ldp	x29, x30, [sp], #16
  9c:	d65f03c0 	ret

00000000000000a0 <simple_if_add1>:
  a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  a4:	910003fd 	mov	x29, sp
  a8:	d10043ff 	sub	sp, sp, #0x10
  ac:	f90003e0 	str	x0, [sp]
  b0:	f94003e8 	ldr	x8, [sp]
  b4:	aa0803e0 	mov	x0, x8
  b8:	aa1f03e1 	mov	x1, xzr
  bc:	910043ff 	add	sp, sp, #0x10
  c0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  c4:	d65f03c0 	ret

00000000000000c8 <nested_else_add1>:
  c8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  cc:	910003fd 	mov	x29, sp
  d0:	d10043ff 	sub	sp, sp, #0x10
  d4:	f90003e0 	str	x0, [sp]
  d8:	f94003e8 	ldr	x8, [sp]
  dc:	aa0803e0 	mov	x0, x8
  e0:	aa1f03e1 	mov	x1, xzr
  e4:	910043ff 	add	sp, sp, #0x10
  e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
  ec:	d65f03c0 	ret
