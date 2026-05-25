
tests/assets/jit/loop.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 trap_handler
0000000000000068 l     F .text	0000000000000050 loop_n
00000000000000b8 l     F .text	0000000000000050 loop_n_tee
0000000000000108 l     F .text	0000000000000068 loop_nm


Contents of section .text:
 0000 010080d2 17000014 210080d2 15000014  ........!.......
 0010 410080d2 13000014 610080d2 11000014  A.......a.......
 0020 810080d2 0f000014 a10080d2 0d000014  ................
 0030 c10080d2 0b000014 e10080d2 09000014  ................
 0040 010180d2 07000014 210180d2 05000014  ........!.......
 0050 410180d2 03000014 610180d2 01000014  A.......a.......
 0060 200080d2 c0035fd6 fd7bbfa9 fd030091   ....._..{......
 0070 ff4300d1 e00300b9 ff0700b9 e80740b9  .C............@.
 0080 29008052 0801090b e80700b9 e80740b9  )..R..........@.
 0090 e90340b9 1f01096b e8a79f1a 08ffff35  ..@....k.......5
 00a0 e80740b9 00008052 e103082a ff430091  ..@....R...*.C..
 00b0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00c0 ff4300d1 e00300b9 ff0700b9 e80740b9  .C............@.
 00d0 29008052 0801090b e80700b9 e90340b9  )..R..........@.
 00e0 1f01096b e8a79f1a 28ffff35 e80740b9  ...k....(..5..@.
 00f0 00008052 e103082a ff430091 fd7bc1a8  ...R...*.C...{..
 0100 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0110 ff4300d1 e00300b9 e10700b9 ff0b00b9  .C..............
 0120 e80b40b9 29008052 0801090b e80b00b9  ..@.)..R........
 0130 e80340b9 29008052 0801090b e80300b9  ..@.)..R........
 0140 e80340b9 e90740b9 1f01096b e8a79f1a  ..@...@....k....
 0150 88feff35 e80b40b9 00008052 e103082a  ...5..@....R...*
 0160 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

Disassembly of section .text:

0000000000000000 <trap_handler>:
   0:	d2800001 	mov	x1, #0x0                   	// #0
   4:	14000017 	b	60 <trap_handler+0x60>
   8:	d2800021 	mov	x1, #0x1                   	// #1
   c:	14000015 	b	60 <trap_handler+0x60>
  10:	d2800041 	mov	x1, #0x2                   	// #2
  14:	14000013 	b	60 <trap_handler+0x60>
  18:	d2800061 	mov	x1, #0x3                   	// #3
  1c:	14000011 	b	60 <trap_handler+0x60>
  20:	d2800081 	mov	x1, #0x4                   	// #4
  24:	1400000f 	b	60 <trap_handler+0x60>
  28:	d28000a1 	mov	x1, #0x5                   	// #5
  2c:	1400000d 	b	60 <trap_handler+0x60>
  30:	d28000c1 	mov	x1, #0x6                   	// #6
  34:	1400000b 	b	60 <trap_handler+0x60>
  38:	d28000e1 	mov	x1, #0x7                   	// #7
  3c:	14000009 	b	60 <trap_handler+0x60>
  40:	d2800101 	mov	x1, #0x8                   	// #8
  44:	14000007 	b	60 <trap_handler+0x60>
  48:	d2800121 	mov	x1, #0x9                   	// #9
  4c:	14000005 	b	60 <trap_handler+0x60>
  50:	d2800141 	mov	x1, #0xa                   	// #10
  54:	14000003 	b	60 <trap_handler+0x60>
  58:	d2800161 	mov	x1, #0xb                   	// #11
  5c:	14000001 	b	60 <trap_handler+0x60>
  60:	d2800020 	mov	x0, #0x1                   	// #1
  64:	d65f03c0 	ret

0000000000000068 <loop_n>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	d10043ff 	sub	sp, sp, #0x10
  74:	b90003e0 	str	w0, [sp]
  78:	b90007ff 	str	wzr, [sp, #4]
  7c:	b94007e8 	ldr	w8, [sp, #4]
  80:	52800029 	mov	w9, #0x1                   	// #1
  84:	0b090108 	add	w8, w8, w9
  88:	b90007e8 	str	w8, [sp, #4]
  8c:	b94007e8 	ldr	w8, [sp, #4]
  90:	b94003e9 	ldr	w9, [sp]
  94:	6b09011f 	cmp	w8, w9
  98:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  9c:	35ffff08 	cbnz	w8, 7c <loop_n+0x14>
  a0:	b94007e8 	ldr	w8, [sp, #4]
  a4:	52800000 	mov	w0, #0x0                   	// #0
  a8:	2a0803e1 	mov	w1, w8
  ac:	910043ff 	add	sp, sp, #0x10
  b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  b4:	d65f03c0 	ret

00000000000000b8 <loop_n_tee>:
  b8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  bc:	910003fd 	mov	x29, sp
  c0:	d10043ff 	sub	sp, sp, #0x10
  c4:	b90003e0 	str	w0, [sp]
  c8:	b90007ff 	str	wzr, [sp, #4]
  cc:	b94007e8 	ldr	w8, [sp, #4]
  d0:	52800029 	mov	w9, #0x1                   	// #1
  d4:	0b090108 	add	w8, w8, w9
  d8:	b90007e8 	str	w8, [sp, #4]
  dc:	b94003e9 	ldr	w9, [sp]
  e0:	6b09011f 	cmp	w8, w9
  e4:	1a9fa7e8 	cset	w8, lt	// lt = tstop
  e8:	35ffff28 	cbnz	w8, cc <loop_n_tee+0x14>
  ec:	b94007e8 	ldr	w8, [sp, #4]
  f0:	52800000 	mov	w0, #0x0                   	// #0
  f4:	2a0803e1 	mov	w1, w8
  f8:	910043ff 	add	sp, sp, #0x10
  fc:	a8c17bfd 	ldp	x29, x30, [sp], #16
 100:	d65f03c0 	ret
 104:	d503201f 	nop

0000000000000108 <loop_nm>:
 108:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 10c:	910003fd 	mov	x29, sp
 110:	d10043ff 	sub	sp, sp, #0x10
 114:	b90003e0 	str	w0, [sp]
 118:	b90007e1 	str	w1, [sp, #4]
 11c:	b9000bff 	str	wzr, [sp, #8]
 120:	b9400be8 	ldr	w8, [sp, #8]
 124:	52800029 	mov	w9, #0x1                   	// #1
 128:	0b090108 	add	w8, w8, w9
 12c:	b9000be8 	str	w8, [sp, #8]
 130:	b94003e8 	ldr	w8, [sp]
 134:	52800029 	mov	w9, #0x1                   	// #1
 138:	0b090108 	add	w8, w8, w9
 13c:	b90003e8 	str	w8, [sp]
 140:	b94003e8 	ldr	w8, [sp]
 144:	b94007e9 	ldr	w9, [sp, #4]
 148:	6b09011f 	cmp	w8, w9
 14c:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 150:	35fffe88 	cbnz	w8, 120 <loop_nm+0x18>
 154:	b9400be8 	ldr	w8, [sp, #8]
 158:	52800000 	mov	w0, #0x0                   	// #0
 15c:	2a0803e1 	mov	w1, w8
 160:	910043ff 	add	sp, sp, #0x10
 164:	a8c17bfd 	ldp	x29, x30, [sp], #16
 168:	d65f03c0 	ret
 16c:	d503201f 	nop
