
tests/assets/jit/block.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000028 simple
0000000000000028 l     F .text	0000000000000030 simple-br-i32
0000000000000058 l     F .text	0000000000000030 simple-return
0000000000000088 l     F .text	0000000000000040 simple-br_if
00000000000000c8 l     F .text	0000000000000048 parameter-br_if
0000000000000110 l     F .text	0000000000000048 parameter-nested-return
0000000000000158 l     F .text	0000000000000060 nested-br_if
00000000000001b8 l     F .text	0000000000000050 loop_return
0000000000000208 l     F .text	0000000000000040 truncate_stack


Contents of section .text:
 0000 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0010 e8078052 000080d2 e1031faa ff430091  ...R.........C..
 0020 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0030 ff4300d1 e00300f9 48058052 02000014  .C......H..R....
 0040 68018052 000080d2 e10308aa ff430091  h..R.........C..
 0050 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0060 ff4300d1 e00300f9 48058052 02000014  .C......H..R....
 0070 68018052 000080d2 e10308aa ff430091  h..R.........C..
 0080 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0090 ff4300d1 e00300f9 08048052 09008052  .C.........R...R
 00a0 a9000035 48058052 29008052 49000035  ...5H..R)..RI..5
 00b0 68018052 000080d2 e10308aa ff430091  h..R.........C..
 00c0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00d0 ff4300d1 e00300f9 e10b00b9 48058052  .C..........H..R
 00e0 e90b40b9 a9000035 68008012 49008012  ..@....5h...I...
 00f0 2a008012 0b008012 000080d2 e10308aa  *...............
 0100 ff430091 fd7bc1a8 c0035fd6 1f2003d5  .C...{...._.. ..
 0110 fd7bbfa9 fd030091 ff4300d1 e00300f9  .{.......C......
 0120 e10b00b9 08058052 e90b40b9 69000035  .......R..@.i..5
 0130 68008012 03000014 49008052 0801090b  h.......I..R....
 0140 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0150 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0160 ff4300d1 e00300f9 08048052 09008052  .C.........R...R
 0170 a9000035 48058052 29008052 29010035  ...5H..R)..R)..5
 0180 68018052 48018052 09008052 a9000035  h..RH..R...R...5
 0190 88028052 29008052 49000035 c8038052  ...R)..RI..5...R
 01a0 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 01b0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 01c0 ff4300d1 e00300f9 ff0b00b9 e80b40b9  .C............@.
 01d0 49008052 0801090b e80b00b9 05000014  I..R............
 01e0 49018052 1f01096b e8a79f1a 08ffff35  I..R...k.......5
 01f0 e80b40b9 000080d2 e10308aa ff430091  ..@..........C..
 0200 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0210 ff4300d1 e00300f9 28008052 49008052  .C......(..RI..R
 0220 89000035 69008052 02000014 e803092a  ...5i..R.......*
 0230 000080d2 e10308aa ff430091 fd7bc1a8  .........C...{..
 0240 c0035fd6 1f2003d5                    .._.. ..        

Disassembly of section .text:

0000000000000000 <simple>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	d10043ff 	sub	sp, sp, #0x10
   c:	f90003e0 	str	x0, [sp]
  10:	528007e8 	mov	w8, #0x3f                  	// #63
  14:	d2800000 	mov	x0, #0x0                   	// #0
  18:	aa1f03e1 	mov	x1, xzr
  1c:	910043ff 	add	sp, sp, #0x10
  20:	a8c17bfd 	ldp	x29, x30, [sp], #16
  24:	d65f03c0 	ret

0000000000000028 <simple-br-i32>:
  28:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  2c:	910003fd 	mov	x29, sp
  30:	d10043ff 	sub	sp, sp, #0x10
  34:	f90003e0 	str	x0, [sp]
  38:	52800548 	mov	w8, #0x2a                  	// #42
  3c:	14000002 	b	44 <simple-br-i32+0x1c>
  40:	52800168 	mov	w8, #0xb                   	// #11
  44:	d2800000 	mov	x0, #0x0                   	// #0
  48:	aa0803e1 	mov	x1, x8
  4c:	910043ff 	add	sp, sp, #0x10
  50:	a8c17bfd 	ldp	x29, x30, [sp], #16
  54:	d65f03c0 	ret

0000000000000058 <simple-return>:
  58:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  5c:	910003fd 	mov	x29, sp
  60:	d10043ff 	sub	sp, sp, #0x10
  64:	f90003e0 	str	x0, [sp]
  68:	52800548 	mov	w8, #0x2a                  	// #42
  6c:	14000002 	b	74 <simple-return+0x1c>
  70:	52800168 	mov	w8, #0xb                   	// #11
  74:	d2800000 	mov	x0, #0x0                   	// #0
  78:	aa0803e1 	mov	x1, x8
  7c:	910043ff 	add	sp, sp, #0x10
  80:	a8c17bfd 	ldp	x29, x30, [sp], #16
  84:	d65f03c0 	ret

0000000000000088 <simple-br_if>:
  88:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  8c:	910003fd 	mov	x29, sp
  90:	d10043ff 	sub	sp, sp, #0x10
  94:	f90003e0 	str	x0, [sp]
  98:	52800408 	mov	w8, #0x20                  	// #32
  9c:	52800009 	mov	w9, #0x0                   	// #0
  a0:	350000a9 	cbnz	w9, b4 <simple-br_if+0x2c>
  a4:	52800548 	mov	w8, #0x2a                  	// #42
  a8:	52800029 	mov	w9, #0x1                   	// #1
  ac:	35000049 	cbnz	w9, b4 <simple-br_if+0x2c>
  b0:	52800168 	mov	w8, #0xb                   	// #11
  b4:	d2800000 	mov	x0, #0x0                   	// #0
  b8:	aa0803e1 	mov	x1, x8
  bc:	910043ff 	add	sp, sp, #0x10
  c0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  c4:	d65f03c0 	ret

00000000000000c8 <parameter-br_if>:
  c8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  cc:	910003fd 	mov	x29, sp
  d0:	d10043ff 	sub	sp, sp, #0x10
  d4:	f90003e0 	str	x0, [sp]
  d8:	b9000be1 	str	w1, [sp, #8]
  dc:	52800548 	mov	w8, #0x2a                  	// #42
  e0:	b9400be9 	ldr	w9, [sp, #8]
  e4:	350000a9 	cbnz	w9, f8 <parameter-br_if+0x30>
  e8:	12800068 	mov	w8, #0xfffffffc            	// #-4
  ec:	12800049 	mov	w9, #0xfffffffd            	// #-3
  f0:	1280002a 	mov	w10, #0xfffffffe            	// #-2
  f4:	1280000b 	mov	w11, #0xffffffff            	// #-1
  f8:	d2800000 	mov	x0, #0x0                   	// #0
  fc:	aa0803e1 	mov	x1, x8
 100:	910043ff 	add	sp, sp, #0x10
 104:	a8c17bfd 	ldp	x29, x30, [sp], #16
 108:	d65f03c0 	ret
 10c:	d503201f 	nop

0000000000000110 <parameter-nested-return>:
 110:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 114:	910003fd 	mov	x29, sp
 118:	d10043ff 	sub	sp, sp, #0x10
 11c:	f90003e0 	str	x0, [sp]
 120:	b9000be1 	str	w1, [sp, #8]
 124:	52800508 	mov	w8, #0x28                  	// #40
 128:	b9400be9 	ldr	w9, [sp, #8]
 12c:	35000069 	cbnz	w9, 138 <parameter-nested-return+0x28>
 130:	12800068 	mov	w8, #0xfffffffc            	// #-4
 134:	14000003 	b	140 <parameter-nested-return+0x30>
 138:	52800049 	mov	w9, #0x2                   	// #2
 13c:	0b090108 	add	w8, w8, w9
 140:	d2800000 	mov	x0, #0x0                   	// #0
 144:	aa0803e1 	mov	x1, x8
 148:	910043ff 	add	sp, sp, #0x10
 14c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 150:	d65f03c0 	ret
 154:	d503201f 	nop

0000000000000158 <nested-br_if>:
 158:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 15c:	910003fd 	mov	x29, sp
 160:	d10043ff 	sub	sp, sp, #0x10
 164:	f90003e0 	str	x0, [sp]
 168:	52800408 	mov	w8, #0x20                  	// #32
 16c:	52800009 	mov	w9, #0x0                   	// #0
 170:	350000a9 	cbnz	w9, 184 <nested-br_if+0x2c>
 174:	52800548 	mov	w8, #0x2a                  	// #42
 178:	52800029 	mov	w9, #0x1                   	// #1
 17c:	35000129 	cbnz	w9, 1a0 <nested-br_if+0x48>
 180:	52800168 	mov	w8, #0xb                   	// #11
 184:	52800148 	mov	w8, #0xa                   	// #10
 188:	52800009 	mov	w9, #0x0                   	// #0
 18c:	350000a9 	cbnz	w9, 1a0 <nested-br_if+0x48>
 190:	52800288 	mov	w8, #0x14                  	// #20
 194:	52800029 	mov	w9, #0x1                   	// #1
 198:	35000049 	cbnz	w9, 1a0 <nested-br_if+0x48>
 19c:	528003c8 	mov	w8, #0x1e                  	// #30
 1a0:	d2800000 	mov	x0, #0x0                   	// #0
 1a4:	aa0803e1 	mov	x1, x8
 1a8:	910043ff 	add	sp, sp, #0x10
 1ac:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1b0:	d65f03c0 	ret
 1b4:	d503201f 	nop

00000000000001b8 <loop_return>:
 1b8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1bc:	910003fd 	mov	x29, sp
 1c0:	d10043ff 	sub	sp, sp, #0x10
 1c4:	f90003e0 	str	x0, [sp]
 1c8:	b9000bff 	str	wzr, [sp, #8]
 1cc:	b9400be8 	ldr	w8, [sp, #8]
 1d0:	52800049 	mov	w9, #0x2                   	// #2
 1d4:	0b090108 	add	w8, w8, w9
 1d8:	b9000be8 	str	w8, [sp, #8]
 1dc:	14000005 	b	1f0 <loop_return+0x38>
 1e0:	52800149 	mov	w9, #0xa                   	// #10
 1e4:	6b09011f 	cmp	w8, w9
 1e8:	1a9fa7e8 	cset	w8, lt	// lt = tstop
 1ec:	35ffff08 	cbnz	w8, 1cc <loop_return+0x14>
 1f0:	b9400be8 	ldr	w8, [sp, #8]
 1f4:	d2800000 	mov	x0, #0x0                   	// #0
 1f8:	aa0803e1 	mov	x1, x8
 1fc:	910043ff 	add	sp, sp, #0x10
 200:	a8c17bfd 	ldp	x29, x30, [sp], #16
 204:	d65f03c0 	ret

0000000000000208 <truncate_stack>:
 208:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 20c:	910003fd 	mov	x29, sp
 210:	d10043ff 	sub	sp, sp, #0x10
 214:	f90003e0 	str	x0, [sp]
 218:	52800028 	mov	w8, #0x1                   	// #1
 21c:	52800049 	mov	w9, #0x2                   	// #2
 220:	35000089 	cbnz	w9, 230 <truncate_stack+0x28>
 224:	52800069 	mov	w9, #0x3                   	// #3
 228:	14000002 	b	230 <truncate_stack+0x28>
 22c:	2a0903e8 	mov	w8, w9
 230:	d2800000 	mov	x0, #0x0                   	// #0
 234:	aa0803e1 	mov	x1, x8
 238:	910043ff 	add	sp, sp, #0x10
 23c:	a8c17bfd 	ldp	x29, x30, [sp], #16
 240:	d65f03c0 	ret
 244:	d503201f 	nop
