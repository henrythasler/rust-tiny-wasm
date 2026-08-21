
tests/assets/jit/constants.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 get_42
0000000000000028 l     F .text	0000000000000028 get_minus_1
0000000000000050 l     F .text	0000000000000038 get_large_num
0000000000000088 l     F .text	0000000000000038 get_i64_min


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 48058052 000080d2 e10308aa ff430091  H..R.........C..
 0020 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0030 ff4300d1 e00300f9 08008012 000080d2  .C..............
 0040 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.
 0050 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0060 887997d2 4815b2f2 08cfcaf2 8846e2f2  .y..H........F..
 0070 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0080 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0090 ff4300d1 e00300f9 e8ff9f92 0800a0f2  .C..............
 00a0 0800c0f2 0800f0f2 000080d2 e10308aa  ................
 00b0 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <get_42>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	52800548 	mov	w8, #0x2a                  	// #42
  14:	d2800000 	mov	x0, #0x0                   	// #0
  18:	aa0803e1 	mov	x1, x8
  1c:	910043ff 	add	sp, sp, #0x10
  20:	a8c17bfd 	ldp	x29, x30, [sp], #16
  24:	d65f03c0 	ret

0000000000000028 <get_minus_1>:
  28:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  2c:	910003fd 	mov	x29, sp
  30:	d10043ff 	sub	sp, sp, #0x10
  34:	f90003e0 	str	x0, [sp]
  38:	12800008 	mov	w8, #0xffffffff            	// #-1
  3c:	d2800000 	mov	x0, #0x0                   	// #0
  40:	aa0803e1 	mov	x1, x8
  44:	910043ff 	add	sp, sp, #0x10
  48:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4c:	d65f03c0 	ret

0000000000000050 <get_large_num>:
  50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  54:	910003fd 	mov	x29, sp
  58:	d10043ff 	sub	sp, sp, #0x10
  5c:	f90003e0 	str	x0, [sp]
  60:	d2977988 	mov	x8, #0xbbcc                	// #48076
  64:	f2b21548 	movk	x8, #0x90aa, lsl #16
  68:	f2cacf08 	movk	x8, #0x5678, lsl #32
  6c:	f2e24688 	movk	x8, #0x1234, lsl #48
  70:	d2800000 	mov	x0, #0x0                   	// #0
  74:	aa0803e1 	mov	x1, x8
  78:	910043ff 	add	sp, sp, #0x10
  7c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  80:	d65f03c0 	ret
  84:	d503201f 	nop

0000000000000088 <get_i64_min>:
  88:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  8c:	910003fd 	mov	x29, sp
  90:	d10043ff 	sub	sp, sp, #0x10
  94:	f90003e0 	str	x0, [sp]
  98:	929fffe8 	mov	x8, #0xffffffffffff0000    	// #-65536
  9c:	f2a00008 	movk	x8, #0x0, lsl #16
  a0:	f2c00008 	movk	x8, #0x0, lsl #32
  a4:	f2f00008 	movk	x8, #0x8000, lsl #48
  a8:	d2800000 	mov	x0, #0x0                   	// #0
  ac:	aa0803e1 	mov	x1, x8
  b0:	910043ff 	add	sp, sp, #0x10
  b4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  b8:	d65f03c0 	ret
  bc:	d503201f 	nop
