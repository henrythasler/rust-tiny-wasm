
tests/assets/jit/block_end.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000048 $func0


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 28008052 68000034 48058052 05000014  (..Rh..4H..R....
 0020 410180d2 200080d2 04000014 a8d59b52  A... ..........R
 0030 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0040 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <$func0>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	52800028 	mov	w8, #0x1                   	// #1
  14:	34000068 	cbz	w8, 20 <$func0+0x20>
  18:	52800548 	mov	w8, #0x2a                  	// #42
  1c:	14000005 	b	30 <$func0+0x30>
  20:	d2800141 	mov	x1, #0xa                   	// #10
  24:	d2800020 	mov	x0, #0x1                   	// #1
  28:	14000004 	b	38 <$func0+0x38>
  2c:	529bd5a8 	mov	w8, #0xdead                	// #57005
  30:	d2800000 	mov	x0, #0x0                   	// #0
  34:	aa0803e1 	mov	x1, x8
  38:	910043ff 	add	sp, sp, #0x10
  3c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  40:	d65f03c0 	ret
  44:	d503201f 	nop
