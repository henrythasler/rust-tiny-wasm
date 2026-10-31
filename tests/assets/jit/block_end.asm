
tests/assets/jit/block_end.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000040 $func0


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 28008052 68000034 48058052 04000014  (..Rh..4H..R....
 0020 410180d2 200080d2 03000014 000080d2  A... ...........
 0030 e10308aa ff430091 fd7bc1a8 c0035fd6  .....C...{...._.

Disassembly of section .text:

0000000000000000 <$func0>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	52800028 	mov	w8, #0x1                   	// #1
  14:	34000068 	cbz	w8, 20 <$func0+0x20>
  18:	52800548 	mov	w8, #0x2a                  	// #42
  1c:	14000004 	b	2c <$func0+0x2c>
  20:	d2800141 	mov	x1, #0xa                   	// #10
  24:	d2800020 	mov	x0, #0x1                   	// #1
  28:	14000003 	b	34 <$func0+0x34>
  2c:	d2800000 	mov	x0, #0x0                   	// #0
  30:	aa0803e1 	mov	x1, x8
  34:	910043ff 	add	sp, sp, #0x10
  38:	a8c17bfd 	ldp	x29, x30, [sp], #16
  3c:	d65f03c0 	ret
