
tests/assets/jit/memory_extended.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000038 p32
0000000000000038 l     F .text	0000000000000038 mem_bytes
0000000000000070 l     F .text	00000000000000a0 test_i32
0000000000000110 l     F .text	0000000000000028 memtest


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e10b00b9 e80b40b9 c9c89012 e9c6b372  ......@........r
 0020 0801094a 000080d2 e10308aa ff430091  ...J.........C..
 0030 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0040 ff4300d1 e00300f9 081c40f9 09008052  .C........@....R
 0050 2900a072 087d091b 000080d2 e10308aa  )..r.}..........
 0060 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0070 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 0080 ff0b00b9 ff0f00b9 ff1300b9 ff1700b9  ................
 0090 eaffff97 800300b5 e803012a e00340f9  ...........*..@.
 00a0 89008052 0801094b e80f00b9 e80b40b9  ...R...K......@.
 00b0 e91340b9 0a1840f9 4a1100d1 1f010aeb  ..@...@.J.......
 00c0 89000054 410080d2 200080d2 0e000014  ...TA... .......
 00d0 0a1440f9 496928b8 e80b40b9 89008052  ..@.Ii(...@....R
 00e0 0801090b e80b00b9 e90f40b9 1f01096b  ..........@....k
 00f0 e8a79f1a c8fdff35 e80b40b9 000080d2  .......5..@.....
 0100 e10308aa ff830091 fd7bc1a8 c0035fd6  .........{...._.
 0110 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0120 08008052 000080d2 e10308aa ff430091  ...R.........C..
 0130 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <p32>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	b9000be1 	str	w1, [sp, #8]
  14:	b9400be8 	ldr	w8, [sp, #8]
  18:	1290c8c9 	mov	w9, #0xffff79b9            	// #-34375
  1c:	72b3c6e9 	movk	w9, #0x9e37, lsl #16
  20:	4a090108 	eor	w8, w8, w9
  24:	d2800000 	mov	x0, #0x0                   	// #0
  28:	aa0803e1 	mov	x1, x8
  2c:	910043ff 	add	sp, sp, #0x10
  30:	a8c17bfd 	ldp	x29, x30, [sp], #16
  34:	d65f03c0 	ret

0000000000000038 <mem_bytes>:
  38:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  3c:	910003fd 	mov	x29, sp
  40:	d10043ff 	sub	sp, sp, #0x10
  44:	f90003e0 	str	x0, [sp]
  48:	f9401c08 	ldr	x8, [x0, #56]
  4c:	52800009 	mov	w9, #0x0                   	// #0
  50:	72a00029 	movk	w9, #0x1, lsl #16
  54:	1b097d08 	mul	w8, w8, w9
  58:	d2800000 	mov	x0, #0x0                   	// #0
  5c:	aa0803e1 	mov	x1, x8
  60:	910043ff 	add	sp, sp, #0x10
  64:	a8c17bfd 	ldp	x29, x30, [sp], #16
  68:	d65f03c0 	ret
  6c:	d503201f 	nop

0000000000000070 <test_i32>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	d10083ff 	sub	sp, sp, #0x20
  7c:	f90003e0 	str	x0, [sp]
  80:	b9000bff 	str	wzr, [sp, #8]
  84:	b9000fff 	str	wzr, [sp, #12]
  88:	b90013ff 	str	wzr, [sp, #16]
  8c:	b90017ff 	str	wzr, [sp, #20]
  90:	97ffffea 	bl	38 <mem_bytes>
  94:	b5000380 	cbnz	x0, 104 <test_i32+0x94>
  98:	2a0103e8 	mov	w8, w1
  9c:	f94003e0 	ldr	x0, [sp]
  a0:	52800089 	mov	w9, #0x4                   	// #4
  a4:	4b090108 	sub	w8, w8, w9
  a8:	b9000fe8 	str	w8, [sp, #12]
  ac:	b9400be8 	ldr	w8, [sp, #8]
  b0:	b94013e9 	ldr	w9, [sp, #16]
  b4:	f940180a 	ldr	x10, [x0, #48]
  b8:	d100114a 	sub	x10, x10, #0x4
  bc:	eb0a011f 	cmp	x8, x10
  c0:	54000089 	b.ls	d0 <test_i32+0x60>  // b.plast
  c4:	d2800041 	mov	x1, #0x2                   	// #2
  c8:	d2800020 	mov	x0, #0x1                   	// #1
  cc:	1400000e 	b	104 <test_i32+0x94>
  d0:	f940140a 	ldr	x10, [x0, #40]
  d4:	b8286949 	str	w9, [x10, x8]
  d8:	b9400be8 	ldr	w8, [sp, #8]
  dc:	52800089 	mov	w9, #0x4                   	// #4
  e0:	0b090108 	add	w8, w8, w9
  e4:	b9000be8 	str	w8, [sp, #8]
  e8:	b9400fe9 	ldr	w9, [sp, #12]
  ec:	6b09011f 	cmp	w8, w9
  f0:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  f4:	35fffdc8 	cbnz	w8, ac <test_i32+0x3c>
  f8:	b9400be8 	ldr	w8, [sp, #8]
  fc:	d2800000 	mov	x0, #0x0                   	// #0
 100:	aa0803e1 	mov	x1, x8
 104:	910083ff 	add	sp, sp, #0x20
 108:	a8c17bfd 	ldp	x29, x30, [sp], #16
 10c:	d65f03c0 	ret

0000000000000110 <memtest>:
 110:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 114:	910003fd 	mov	x29, sp
 118:	d10043ff 	sub	sp, sp, #0x10
 11c:	f90003e0 	str	x0, [sp]
 120:	52800008 	mov	w8, #0x0                   	// #0
 124:	d2800000 	mov	x0, #0x0                   	// #0
 128:	aa0803e1 	mov	x1, x8
 12c:	910043ff 	add	sp, sp, #0x10
 130:	a8c17bfd 	ldp	x29, x30, [sp], #16
 134:	d65f03c0 	ret
