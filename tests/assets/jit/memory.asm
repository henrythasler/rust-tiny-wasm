
tests/assets/jit/memory.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000058 load_i32


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e80b40b9 091440f9 291100d1  ......@...@.)...
 0020 1f0109eb 83000054 410080d2 200080d2  .......TA... ...
 0030 06000014 091040f9 2901088b 080140b9  ......@.).....@.
 0040 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0050 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <load_i32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9400be8 	ldr	w8, [sp, #8]
  18:	f9401409 	ldr	x9, [x0, #40]
  1c:	d1001129 	sub	x9, x9, #0x4
  20:	eb09011f 	cmp	x8, x9
  24:	54000083 	b.cc	34 <load_i32+0x34>  // b.lo, b.ul, b.last
  28:	d2800041 	mov	x1, #0x2                   	// #2
  2c:	d2800020 	mov	x0, #0x1                   	// #1
  30:	14000006 	b	48 <load_i32+0x48>
  34:	f9401009 	ldr	x9, [x0, #32]
  38:	8b080129 	add	x9, x9, x8
  3c:	b9400108 	ldr	w8, [x8]
  40:	d2800000 	mov	x0, #0x0                   	// #0
  44:	aa0803e1 	mov	x1, x8
  48:	910043ff 	add	sp, sp, #0x10
  4c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  50:	d65f03c0 	ret
  54:	d503201f 	nop
