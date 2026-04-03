
./tests/assets/jit/locals.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000030 store_i64
0000000000000030 l     F .text	0000000000000030 store_i64_const
0000000000000060 l     F .text	0000000000000080 many_locals


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff8300d1 e00300f9  .{..............
 0010 ff0b00b9 ff0b00f9 ff1b00b9 e0031faa  ................
 0020 e1031faa ff830091 fd7bc1a8 c0035fd6  .........{...._.
 0030 fd7bbfa9 fd030091 ff8300d1 ff0300b9  .{..............
 0040 ff0700f9 ff1300b9 e0031faa e1031faa  ................
 0050 ff830091 fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 0060 fd7bbfa9 fd030091 ffc301d1 e00300b9  .{..............
 0070 ff0700b9 ff0b00b9 ff0f00b9 ff1300b9  ................
 0080 ff1700b9 ff1b00b9 ff1f00b9 ff2300b9  .............#..
 0090 ff2700b9 ff2b00b9 ff2f00b9 ff3300b9  .'...+.../...3..
 00a0 ff1f00f9 ff2300f9 ff2700f9 ff5300b9  .....#...'...S..
 00b0 ff5700b9 ff5b00b9 ff5f00b9 ff6300b9  .W...[..._...c..
 00c0 ff6700b9 ff6b00b9 e0031faa e1031faa  .g...k..........
 00d0 ffc30191 fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..

Disassembly of section .text:

0000000000000000 <store_i64>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10083ff 	sub	sp, sp, #0x20
   c:	f90003e0 	str	x0, [sp]
  10:	b9000bff 	str	wzr, [sp, #8]
  14:	f9000bff 	str	xzr, [sp, #16]
  18:	b9001bff 	str	wzr, [sp, #24]
  1c:	aa1f03e0 	mov	x0, xzr
  20:	aa1f03e1 	mov	x1, xzr
  24:	910083ff 	add	sp, sp, #0x20
  28:	a8c17bfd 	ldp	x29, x30, [sp], #16
  2c:	d65f03c0 	ret

0000000000000030 <store_i64_const>:
  30:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  34:	910003fd 	mov	x29, sp
  38:	d10083ff 	sub	sp, sp, #0x20
  3c:	b90003ff 	str	wzr, [sp]
  40:	f90007ff 	str	xzr, [sp, #8]
  44:	b90013ff 	str	wzr, [sp, #16]
  48:	aa1f03e0 	mov	x0, xzr
  4c:	aa1f03e1 	mov	x1, xzr
  50:	910083ff 	add	sp, sp, #0x20
  54:	a8c17bfd 	ldp	x29, x30, [sp], #16
  58:	d65f03c0 	ret
  5c:	d503201f 	nop

0000000000000060 <many_locals>:
  60:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  64:	910003fd 	mov	x29, sp
  68:	d101c3ff 	sub	sp, sp, #0x70
  6c:	b90003e0 	str	w0, [sp]
  70:	b90007ff 	str	wzr, [sp, #4]
  74:	b9000bff 	str	wzr, [sp, #8]
  78:	b9000fff 	str	wzr, [sp, #12]
  7c:	b90013ff 	str	wzr, [sp, #16]
  80:	b90017ff 	str	wzr, [sp, #20]
  84:	b9001bff 	str	wzr, [sp, #24]
  88:	b9001fff 	str	wzr, [sp, #28]
  8c:	b90023ff 	str	wzr, [sp, #32]
  90:	b90027ff 	str	wzr, [sp, #36]
  94:	b9002bff 	str	wzr, [sp, #40]
  98:	b9002fff 	str	wzr, [sp, #44]
  9c:	b90033ff 	str	wzr, [sp, #48]
  a0:	f9001fff 	str	xzr, [sp, #56]
  a4:	f90023ff 	str	xzr, [sp, #64]
  a8:	f90027ff 	str	xzr, [sp, #72]
  ac:	b90053ff 	str	wzr, [sp, #80]
  b0:	b90057ff 	str	wzr, [sp, #84]
  b4:	b9005bff 	str	wzr, [sp, #88]
  b8:	b9005fff 	str	wzr, [sp, #92]
  bc:	b90063ff 	str	wzr, [sp, #96]
  c0:	b90067ff 	str	wzr, [sp, #100]
  c4:	b9006bff 	str	wzr, [sp, #104]
  c8:	aa1f03e0 	mov	x0, xzr
  cc:	aa1f03e1 	mov	x1, xzr
  d0:	9101c3ff 	add	sp, sp, #0x70
  d4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d8:	d65f03c0 	ret
  dc:	d503201f 	nop
