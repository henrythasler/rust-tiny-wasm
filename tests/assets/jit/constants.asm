
./tests/assets/jit/constants.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000018 get_42
0000000000000018 l     F .text	0000000000000018 get_minus_1
0000000000000030 l     F .text	0000000000000018 get_large_num
0000000000000048 l     F .text	0000000000000018 get_i64_min


Contents of section .text:
 0000 fd7bbfa9 fd030091 e0031faa e1031faa  .{..............
 0010 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0020 e0031faa e1031faa fd7bc1a8 c0035fd6  .........{...._.
 0030 fd7bbfa9 fd030091 e0031faa e1031faa  .{..............
 0040 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0050 e0031faa e1031faa fd7bc1a8 c0035fd6  .........{...._.

Disassembly of section .text:

0000000000000000 <get_42>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	aa1f03e0 	mov	x0, xzr
   c:	aa1f03e1 	mov	x1, xzr
  10:	a8c17bfd 	ldp	x29, x30, [sp], #16
  14:	d65f03c0 	ret

0000000000000018 <get_minus_1>:
  18:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  1c:	910003fd 	mov	x29, sp
  20:	aa1f03e0 	mov	x0, xzr
  24:	aa1f03e1 	mov	x1, xzr
  28:	a8c17bfd 	ldp	x29, x30, [sp], #16
  2c:	d65f03c0 	ret

0000000000000030 <get_large_num>:
  30:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  34:	910003fd 	mov	x29, sp
  38:	aa1f03e0 	mov	x0, xzr
  3c:	aa1f03e1 	mov	x1, xzr
  40:	a8c17bfd 	ldp	x29, x30, [sp], #16
  44:	d65f03c0 	ret

0000000000000048 <get_i64_min>:
  48:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  4c:	910003fd 	mov	x29, sp
  50:	aa1f03e0 	mov	x0, xzr
  54:	aa1f03e1 	mov	x1, xzr
  58:	a8c17bfd 	ldp	x29, x30, [sp], #16
  5c:	d65f03c0 	ret
