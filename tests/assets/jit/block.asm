
tests/assets/jit/block.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000068 trap_handler
0000000000000068 l     F .text	0000000000000020 simple
0000000000000088 l     F .text	0000000000000028 simple-br-i32
00000000000000b0 l     F .text	0000000000000028 simple-return
00000000000000d8 l     F .text	0000000000000038 simple-br_if
0000000000000110 l     F .text	0000000000000040 parameter-br_if
0000000000000150 l     F .text	0000000000000040 parameter-nested-return
0000000000000190 l     F .text	0000000000000050 nested-br_if
00000000000001e0 l     F .text	0000000000000050 loop_return


Contents of section .text:
 0000 010080d2 17000014 210080d2 15000014  ........!.......
 0010 410080d2 13000014 610080d2 11000014  A.......a.......
 0020 810080d2 0f000014 a10080d2 0d000014  ................
 0030 c10080d2 0b000014 e10080d2 09000014  ................
 0040 010180d2 07000014 210180d2 05000014  ........!.......
 0050 410180d2 03000014 610180d2 01000014  A.......a.......
 0060 200080d2 c0035fd6 fd7bbfa9 fd030091   ....._..{......
 0070 e8078052 000080d2 e1031faa fd7bc1a8  ...R.........{..
 0080 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0090 48058052 02000014 68018052 00008052  H..R....h..R...R
 00a0 e103082a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 00b0 fd7bbfa9 fd030091 48058052 02000014  .{......H..R....
 00c0 68018052 00008052 e103082a fd7bc1a8  h..R...R...*.{..
 00d0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00e0 08048052 09008052 a9000035 48058052  ...R...R...5H..R
 00f0 29008052 49000035 68018052 00008052  )..RI..5h..R...R
 0100 e103082a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 0110 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0120 48058052 e90340b9 a9000035 68008012  H..R..@....5h...
 0130 49008012 2a008012 0b008012 00008052  I...*..........R
 0140 e103082a ff430091 fd7bc1a8 c0035fd6  ...*.C...{...._.
 0150 fd7bbfa9 fd030091 ff4300d1 e00300b9  .{.......C......
 0160 08058052 e90340b9 69000035 68008012  ...R..@.i..5h...
 0170 03000014 49008052 0801090b 00008052  ....I..R.......R
 0180 e103082a ff430091 fd7bc1a8 c0035fd6  ...*.C...{...._.
 0190 fd7bbfa9 fd030091 08048052 09008052  .{.........R...R
 01a0 a9000035 48058052 29008052 29010035  ...5H..R)..R)..5
 01b0 68018052 48018052 09008052 a9000035  h..RH..R...R...5
 01c0 88028052 29008052 49000035 c8038052  ...R)..RI..5...R
 01d0 00008052 e103082a fd7bc1a8 c0035fd6  ...R...*.{...._.
 01e0 fd7bbfa9 fd030091 ff4300d1 ff0300b9  .{.......C......
 01f0 e80340b9 49008052 0801090b e80300b9  ..@.I..R........
 0200 05000014 49018052 1f01096b e8a79f1a  ....I..R...k....
 0210 08ffff35 e80340b9 00008052 e103082a  ...5..@....R...*
 0220 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..

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

0000000000000068 <simple>:
  68:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  6c:	910003fd 	mov	x29, sp
  70:	528007e8 	mov	w8, #0x3f                  	// #63
  74:	d2800000 	mov	x0, #0x0                   	// #0
  78:	aa1f03e1 	mov	x1, xzr
  7c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  80:	d65f03c0 	ret
  84:	d503201f 	nop

0000000000000088 <simple-br-i32>:
  88:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  8c:	910003fd 	mov	x29, sp
  90:	52800548 	mov	w8, #0x2a                  	// #42
  94:	14000002 	b	9c <simple-br-i32+0x14>
  98:	52800168 	mov	w8, #0xb                   	// #11
  9c:	52800000 	mov	w0, #0x0                   	// #0
  a0:	2a0803e1 	mov	w1, w8
  a4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a8:	d65f03c0 	ret
  ac:	d503201f 	nop

00000000000000b0 <simple-return>:
  b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  b4:	910003fd 	mov	x29, sp
  b8:	52800548 	mov	w8, #0x2a                  	// #42
  bc:	14000002 	b	c4 <simple-return+0x14>
  c0:	52800168 	mov	w8, #0xb                   	// #11
  c4:	52800000 	mov	w0, #0x0                   	// #0
  c8:	2a0803e1 	mov	w1, w8
  cc:	a8c17bfd 	ldp	x29, x30, [sp], #16
  d0:	d65f03c0 	ret
  d4:	d503201f 	nop

00000000000000d8 <simple-br_if>:
  d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  dc:	910003fd 	mov	x29, sp
  e0:	52800408 	mov	w8, #0x20                  	// #32
  e4:	52800009 	mov	w9, #0x0                   	// #0
  e8:	350000a9 	cbnz	w9, fc <simple-br_if+0x24>
  ec:	52800548 	mov	w8, #0x2a                  	// #42
  f0:	52800029 	mov	w9, #0x1                   	// #1
  f4:	35000049 	cbnz	w9, fc <simple-br_if+0x24>
  f8:	52800168 	mov	w8, #0xb                   	// #11
  fc:	52800000 	mov	w0, #0x0                   	// #0
 100:	2a0803e1 	mov	w1, w8
 104:	a8c17bfd 	ldp	x29, x30, [sp], #16
 108:	d65f03c0 	ret
 10c:	d503201f 	nop

0000000000000110 <parameter-br_if>:
 110:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 114:	910003fd 	mov	x29, sp
 118:	d10043ff 	sub	sp, sp, #0x10
 11c:	b90003e0 	str	w0, [sp]
 120:	52800548 	mov	w8, #0x2a                  	// #42
 124:	b94003e9 	ldr	w9, [sp]
 128:	350000a9 	cbnz	w9, 13c <parameter-br_if+0x2c>
 12c:	12800068 	mov	w8, #0xfffffffc            	// #-4
 130:	12800049 	mov	w9, #0xfffffffd            	// #-3
 134:	1280002a 	mov	w10, #0xfffffffe            	// #-2
 138:	1280000b 	mov	w11, #0xffffffff            	// #-1
 13c:	52800000 	mov	w0, #0x0                   	// #0
 140:	2a0803e1 	mov	w1, w8
 144:	910043ff 	add	sp, sp, #0x10
 148:	a8c17bfd 	ldp	x29, x30, [sp], #16
 14c:	d65f03c0 	ret

0000000000000150 <parameter-nested-return>:
 150:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 154:	910003fd 	mov	x29, sp
 158:	d10043ff 	sub	sp, sp, #0x10
 15c:	b90003e0 	str	w0, [sp]
 160:	52800508 	mov	w8, #0x28                  	// #40
 164:	b94003e9 	ldr	w9, [sp]
 168:	35000069 	cbnz	w9, 174 <parameter-nested-return+0x24>
 16c:	12800068 	mov	w8, #0xfffffffc            	// #-4
 170:	14000003 	b	17c <parameter-nested-return+0x2c>
 174:	52800049 	mov	w9, #0x2                   	// #2
 178:	0b090108 	add	w8, w8, w9
 17c:	52800000 	mov	w0, #0x0                   	// #0
 180:	2a0803e1 	mov	w1, w8
 184:	910043ff 	add	sp, sp, #0x10
 188:	a8c17bfd 	ldp	x29, x30, [sp], #16
 18c:	d65f03c0 	ret

0000000000000190 <nested-br_if>:
 190:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 194:	910003fd 	mov	x29, sp
 198:	52800408 	mov	w8, #0x20                  	// #32
 19c:	52800009 	mov	w9, #0x0                   	// #0
 1a0:	350000a9 	cbnz	w9, 1b4 <nested-br_if+0x24>
 1a4:	52800548 	mov	w8, #0x2a                  	// #42
 1a8:	52800029 	mov	w9, #0x1                   	// #1
 1ac:	35000129 	cbnz	w9, 1d0 <nested-br_if+0x40>
 1b0:	52800168 	mov	w8, #0xb                   	// #11
 1b4:	52800148 	mov	w8, #0xa                   	// #10
 1b8:	52800009 	mov	w9, #0x0                   	// #0
 1bc:	350000a9 	cbnz	w9, 1d0 <nested-br_if+0x40>
 1c0:	52800288 	mov	w8, #0x14                  	// #20
 1c4:	52800029 	mov	w9, #0x1                   	// #1
 1c8:	35000049 	cbnz	w9, 1d0 <nested-br_if+0x40>
 1cc:	528003c8 	mov	w8, #0x1e                  	// #30
 1d0:	52800000 	mov	w0, #0x0                   	// #0
 1d4:	2a0803e1 	mov	w1, w8
 1d8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1dc:	d65f03c0 	ret

00000000000001e0 <loop_return>:
 1e0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1e4:	910003fd 	mov	x29, sp
 1e8:	d10043ff 	sub	sp, sp, #0x10
 1ec:	b90003ff 	str	wzr, [sp]
 1f0:	b94003e8 	ldr	w8, [sp]
 1f4:	52800049 	mov	w9, #0x2                   	// #2
 1f8:	0b090108 	add	w8, w8, w9
 1fc:	b90003e8 	str	w8, [sp]
 200:	14000005 	b	214 <loop_return+0x34>
 204:	52800149 	mov	w9, #0xa                   	// #10
 208:	6b09011f 	cmp	w8, w9
 20c:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 210:	35ffff08 	cbnz	w8, 1f0 <loop_return+0x10>
 214:	b94003e8 	ldr	w8, [sp]
 218:	52800000 	mov	w0, #0x0                   	// #0
 21c:	2a0803e1 	mov	w1, w8
 220:	910043ff 	add	sp, sp, #0x10
 224:	a8c17bfd 	ldp	x29, x30, [sp], #16
 228:	d65f03c0 	ret
 22c:	d503201f 	nop
