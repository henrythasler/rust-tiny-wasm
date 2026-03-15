
./tests/assets/jit/constants.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000018 get_42
0000000000000018 l     F .text	0000000000000020 get_minus_1
0000000000000038 l     F .text	0000000000000028 get_large_num
0000000000000060 l     F .text	0000000000000020 get_i64_min


Contents of section .text:
 0000 fd7bbfa9 fd030091 48058052 e003082a  .{......H..R...*
 0010 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0020 e8ff9f52 e8ffbf72 e003082a fd7bc1a8  ...R...r...*.{..
 0030 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0040 887997d2 4815b2f2 08cfcaf2 8846e2f2  .y..H........F..
 0050 e00308aa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 0060 fd7bbfa9 fd030091 080080d2 0800f0f2  .{..............
 0070 e00308aa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..

Disassembly of section .text:

0000000000000000 <get_42>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	52800548 	mov	w8, #0x2a                  	// #42
   c:	2a0803e0 	mov	w0, w8
  10:	a8c17bfd 	ldp	x29, x30, [sp], #16
  14:	d65f03c0 	ret

0000000000000018 <get_minus_1>:
  18:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  1c:	910003fd 	mov	x29, sp
  20:	529fffe8 	mov	w8, #0xffff                	// #65535
  24:	72bfffe8 	movk	w8, #0xffff, lsl #16
  28:	2a0803e0 	mov	w0, w8
  2c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  30:	d65f03c0 	ret
  34:	d503201f 	nop

0000000000000038 <get_large_num>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d2977988 	mov	x8, #0xbbcc                	// #48076
  44:	f2b21548 	movk	x8, #0x90aa, lsl #16
  48:	f2cacf08 	movk	x8, #0x5678, lsl #32
  4c:	f2e24688 	movk	x8, #0x1234, lsl #48
  50:	aa0803e0 	mov	x0, x8
  54:	a8c17bfd 	ldp	x29, x30, [sp], #16
  58:	d65f03c0 	ret
  5c:	d503201f 	nop

0000000000000060 <get_i64_min>:
  60:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  64:	910003fd 	mov	x29, sp
  68:	d2800008 	mov	x8, #0x0                   	// #0
  6c:	f2f00008 	movk	x8, #0x8000, lsl #48
  70:	aa0803e0 	mov	x0, x8
  74:	a8c17bfd 	ldp	x29, x30, [sp], #16
  78:	d65f03c0 	ret
  7c:	d503201f 	nop
