
./tests/assets/jit/constants.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000020 get_42
0000000000000020 l     F .text	0000000000000020 get_minus_1
0000000000000040 l     F .text	0000000000000028 get_large_num
0000000000000068 l     F .text	0000000000000020 get_i64_min


Contents of section .text:
 0000 fd7bbfa9 fd030091 48058052 e003082a  .{......H..R...*
 0010 e1031f2a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 0020 fd7bbfa9 fd030091 e8ff9f52 e8ffbf72  .{.........R...r
 0030 e003082a e1031f2a fd7bc1a8 c0035fd6  ...*...*.{...._.
 0040 fd7bbfa9 fd030091 887997d2 4815b2f2  .{.......y..H...
 0050 08cfcaf2 8846e2f2 e00308aa e1031faa  .....F..........
 0060 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0070 080080d2 0800f0f2 e00308aa e1031faa  ................
 0080 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <get_42>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	52800548 	mov	w8, #0x2a                  	// #42
   c:	2a0803e0 	mov	w0, w8
  10:	2a1f03e1 	mov	w1, wzr
  14:	a8c17bfd 	ldp	x29, x30, [sp], #16
  18:	d65f03c0 	ret
  1c:	d503201f 	nop

0000000000000020 <get_minus_1>:
  20:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  24:	910003fd 	mov	x29, sp
  28:	529fffe8 	mov	w8, #0xffff                	// #65535
  2c:	72bfffe8 	movk	w8, #0xffff, lsl #16
  30:	2a0803e0 	mov	w0, w8
  34:	2a1f03e1 	mov	w1, wzr
  38:	a8c17bfd 	ldp	x29, x30, [sp], #16
  3c:	d65f03c0 	ret

0000000000000040 <get_large_num>:
  40:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  44:	910003fd 	mov	x29, sp
  48:	d2977988 	mov	x8, #0xbbcc                	// #48076
  4c:	f2b21548 	movk	x8, #0x90aa, lsl #16
  50:	f2cacf08 	movk	x8, #0x5678, lsl #32
  54:	f2e24688 	movk	x8, #0x1234, lsl #48
  58:	aa0803e0 	mov	x0, x8
  5c:	aa1f03e1 	mov	x1, xzr
  60:	a8c17bfd 	ldp	x29, x30, [sp], #16
  64:	d65f03c0 	ret

0000000000000068 <get_i64_min>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d2800008 	mov	x8, #0x0                   	// #0
  74:	f2f00008 	movk	x8, #0x8000, lsl #48
  78:	aa0803e0 	mov	x0, x8
  7c:	aa1f03e1 	mov	x1, xzr
  80:	a8c17bfd 	ldp	x29, x30, [sp], #16
  84:	d65f03c0 	ret
