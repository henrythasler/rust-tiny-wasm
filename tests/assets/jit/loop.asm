
./tests/assets/jit/loop.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000050 loop_n
0000000000000050 l     F .text	0000000000000068 loop_nm


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0010 ff0700b9 e80740b9 29008052 0801090b  ......@.)..R....
 0020 e80700b9 e80740b9 e90340b9 1f01096b  ......@...@....k
 0030 e8a79f1a 08ffff35 e80740b9 e003082a  .......5..@....*
 0040 e1031f2a ff430091 fd7bc1a8 c0035fd6  ...*.C...{...._.
 0050 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0060 e10700b9 ff0b00b9 e80b40b9 29008052  ..........@.)..R
 0070 0801090b e80b00b9 e80340b9 29008052  ..........@.)..R
 0080 0801090b e80300b9 e80340b9 e90740b9  ..........@...@.
 0090 1f01096b e8a79f1a 88feff35 e80b40b9  ...k.......5..@.
 00a0 e003082a e1031f2a ff430091 fd7bc1a8  ...*...*.C...{..
 00b0 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <loop_n>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	b90003e0 	str	w0, [sp]
  10:	b90007ff 	str	wzr, [sp, #4]
  14:	b94007e8 	ldr	w8, [sp, #4]
  18:	52800029 	mov	w9, #0x1                   	// #1
  1c:	0b090108 	add	w8, w8, w9
  20:	b90007e8 	str	w8, [sp, #4]
  24:	b94007e8 	ldr	w8, [sp, #4]
  28:	b94003e9 	ldr	w9, [sp]
  2c:	6b09011f 	cmp	w8, w9
  30:	1a9fa7e8 	cset	w8, lt  // lt = tstop
  34:	35ffff08 	cbnz	w8, 14 <loop_n+0x14>
  38:	b94007e8 	ldr	w8, [sp, #4]
  3c:	2a0803e0 	mov	w0, w8
  40:	2a1f03e1 	mov	w1, wzr
  44:	910043ff 	add	sp, sp, #0x10
  48:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4c:	d65f03c0 	ret

0000000000000050 <loop_nm>:
  50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  54:	910003fd 	mov	x29, sp
  58:	d10043ff 	sub	sp, sp, #0x10
  5c:	b90003e0 	str	w0, [sp]
  60:	b90007e1 	str	w1, [sp, #4]
  64:	b9000bff 	str	wzr, [sp, #8]
  68:	b9400be8 	ldr	w8, [sp, #8]
  6c:	52800029 	mov	w9, #0x1                   	// #1
  70:	0b090108 	add	w8, w8, w9
  74:	b9000be8 	str	w8, [sp, #8]
  78:	b94003e8 	ldr	w8, [sp]
  7c:	52800029 	mov	w9, #0x1                   	// #1
  80:	0b090108 	add	w8, w8, w9
  84:	b90003e8 	str	w8, [sp]
  88:	b94003e8 	ldr	w8, [sp]
  8c:	b94007e9 	ldr	w9, [sp, #4]
  90:	6b09011f 	cmp	w8, w9
  94:	1a9fa7e8 	cset	w8, lt  // lt = tstop
  98:	35fffe88 	cbnz	w8, 68 <loop_nm+0x18>
  9c:	b9400be8 	ldr	w8, [sp, #8]
  a0:	2a0803e0 	mov	w0, w8
  a4:	2a1f03e1 	mov	w1, wzr
  a8:	910043ff 	add	sp, sp, #0x10
  ac:	a8c17bfd 	ldp	x29, x30, [sp], #16
  b0:	d65f03c0 	ret
  b4:	d503201f 	nop
