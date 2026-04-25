
./tests/assets/jit/block.o:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000 l     F .text	0000000000000020 simple
0000000000000020 l     F .text	0000000000000028 simple-br-i32
0000000000000048 l     F .text	0000000000000028 simple-return
0000000000000070 l     F .text	0000000000000038 simple-br_if
00000000000000a8 l     F .text	0000000000000040 parameter-br_if
00000000000000e8 l     F .text	0000000000000040 parameter-nested-return
0000000000000128 l     F .text	0000000000000050 nested-br_if


Contents of section .text:
 0000 fd7bbfa9 fd030091 e8078052 e0031faa  .{.........R....
 0010 e1031faa fd7bc1a8 c0035fd6 1f2003d5  .....{...._.. ..
 0020 fd7bbfa9 fd030091 48058052 02000014  .{......H..R....
 0030 68018052 e003082a e1031f2a fd7bc1a8  h..R...*...*.{..
 0040 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 0050 48058052 02000014 68018052 e003082a  H..R....h..R...*
 0060 e1031f2a fd7bc1a8 c0035fd6 1f2003d5  ...*.{...._.. ..
 0070 fd7bbfa9 fd030091 08048052 09008052  .{.........R...R
 0080 a9000035 48058052 29008052 49000035  ...5H..R)..RI..5
 0090 68018052 e003082a e1031f2a fd7bc1a8  h..R...*...*.{..
 00a0 c0035fd6 1f2003d5 fd7bbfa9 fd030091  .._.. ...{......
 00b0 ff4300d1 e00300b9 48058052 e90340b9  .C......H..R..@.
 00c0 a9000035 68008012 49008012 2a008012  ...5h...I...*...
 00d0 0b008012 e003082a e1031f2a ff430091  .......*...*.C..
 00e0 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 00f0 ff4300d1 e00300b9 08058052 e90340b9  .C.........R..@.
 0100 69000035 68008012 03000014 49008052  i..5h.......I..R
 0110 0801090b e003082a e1031f2a ff430091  .......*...*.C..
 0120 fd7bc1a8 c0035fd6 fd7bbfa9 fd030091  .{...._..{......
 0130 08048052 09008052 a9000035 48058052  ...R...R...5H..R
 0140 29008052 29010035 68018052 48018052  )..R)..5h..RH..R
 0150 09008052 a9000035 88028052 29008052  ...R...5...R)..R
 0160 49000035 c8038052 e003082a e1031f2a  I..5...R...*...*
 0170 fd7bc1a8 c0035fd6                    .{...._.        

Disassembly of section .text:

0000000000000000 <simple>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	528007e8 	mov	w8, #0x3f                  	// #63
   c:	aa1f03e0 	mov	x0, xzr
  10:	aa1f03e1 	mov	x1, xzr
  14:	a8c17bfd 	ldp	x29, x30, [sp], #16
  18:	d65f03c0 	ret
  1c:	d503201f 	nop

0000000000000020 <simple-br-i32>:
  20:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  24:	910003fd 	mov	x29, sp
  28:	52800548 	mov	w8, #0x2a                  	// #42
  2c:	14000002 	b	34 <simple-br-i32+0x14>
  30:	52800168 	mov	w8, #0xb                   	// #11
  34:	2a0803e0 	mov	w0, w8
  38:	2a1f03e1 	mov	w1, wzr
  3c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  40:	d65f03c0 	ret
  44:	d503201f 	nop

0000000000000048 <simple-return>:
  48:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  4c:	910003fd 	mov	x29, sp
  50:	52800548 	mov	w8, #0x2a                  	// #42
  54:	14000002 	b	5c <simple-return+0x14>
  58:	52800168 	mov	w8, #0xb                   	// #11
  5c:	2a0803e0 	mov	w0, w8
  60:	2a1f03e1 	mov	w1, wzr
  64:	a8c17bfd 	ldp	x29, x30, [sp], #16
  68:	d65f03c0 	ret
  6c:	d503201f 	nop

0000000000000070 <simple-br_if>:
  70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  74:	910003fd 	mov	x29, sp
  78:	52800408 	mov	w8, #0x20                  	// #32
  7c:	52800009 	mov	w9, #0x0                   	// #0
  80:	350000a9 	cbnz	w9, 94 <simple-br_if+0x24>
  84:	52800548 	mov	w8, #0x2a                  	// #42
  88:	52800029 	mov	w9, #0x1                   	// #1
  8c:	35000049 	cbnz	w9, 94 <simple-br_if+0x24>
  90:	52800168 	mov	w8, #0xb                   	// #11
  94:	2a0803e0 	mov	w0, w8
  98:	2a1f03e1 	mov	w1, wzr
  9c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  a0:	d65f03c0 	ret
  a4:	d503201f 	nop

00000000000000a8 <parameter-br_if>:
  a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ac:	910003fd 	mov	x29, sp
  b0:	d10043ff 	sub	sp, sp, #0x10
  b4:	b90003e0 	str	w0, [sp]
  b8:	52800548 	mov	w8, #0x2a                  	// #42
  bc:	b94003e9 	ldr	w9, [sp]
  c0:	350000a9 	cbnz	w9, d4 <parameter-br_if+0x2c>
  c4:	12800068 	mov	w8, #0xfffffffc            	// #-4
  c8:	12800049 	mov	w9, #0xfffffffd            	// #-3
  cc:	1280002a 	mov	w10, #0xfffffffe            	// #-2
  d0:	1280000b 	mov	w11, #0xffffffff            	// #-1
  d4:	2a0803e0 	mov	w0, w8
  d8:	2a1f03e1 	mov	w1, wzr
  dc:	910043ff 	add	sp, sp, #0x10
  e0:	a8c17bfd 	ldp	x29, x30, [sp], #16
  e4:	d65f03c0 	ret

00000000000000e8 <parameter-nested-return>:
  e8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  ec:	910003fd 	mov	x29, sp
  f0:	d10043ff 	sub	sp, sp, #0x10
  f4:	b90003e0 	str	w0, [sp]
  f8:	52800508 	mov	w8, #0x28                  	// #40
  fc:	b94003e9 	ldr	w9, [sp]
 100:	35000069 	cbnz	w9, 10c <parameter-nested-return+0x24>
 104:	12800068 	mov	w8, #0xfffffffc            	// #-4
 108:	14000003 	b	114 <parameter-nested-return+0x2c>
 10c:	52800049 	mov	w9, #0x2                   	// #2
 110:	0b090108 	add	w8, w8, w9
 114:	2a0803e0 	mov	w0, w8
 118:	2a1f03e1 	mov	w1, wzr
 11c:	910043ff 	add	sp, sp, #0x10
 120:	a8c17bfd 	ldp	x29, x30, [sp], #16
 124:	d65f03c0 	ret

0000000000000128 <nested-br_if>:
 128:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 12c:	910003fd 	mov	x29, sp
 130:	52800408 	mov	w8, #0x20                  	// #32
 134:	52800009 	mov	w9, #0x0                   	// #0
 138:	350000a9 	cbnz	w9, 14c <nested-br_if+0x24>
 13c:	52800548 	mov	w8, #0x2a                  	// #42
 140:	52800029 	mov	w9, #0x1                   	// #1
 144:	35000129 	cbnz	w9, 168 <nested-br_if+0x40>
 148:	52800168 	mov	w8, #0xb                   	// #11
 14c:	52800148 	mov	w8, #0xa                   	// #10
 150:	52800009 	mov	w9, #0x0                   	// #0
 154:	350000a9 	cbnz	w9, 168 <nested-br_if+0x40>
 158:	52800288 	mov	w8, #0x14                  	// #20
 15c:	52800029 	mov	w9, #0x1                   	// #1
 160:	35000049 	cbnz	w9, 168 <nested-br_if+0x40>
 164:	528003c8 	mov	w8, #0x1e                  	// #30
 168:	2a0803e0 	mov	w0, w8
 16c:	2a1f03e1 	mov	w1, wzr
 170:	a8c17bfd 	ldp	x29, x30, [sp], #16
 174:	d65f03c0 	ret
