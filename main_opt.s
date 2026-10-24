	.arch armv8.2-a+dotprod+crc+crypto+fp16+rcpc
	.file	"main.cpp"
	.text
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.align	2
	.p2align 5,,15
	.global	_Z18compute_heavy_taskRKSt6vectorIfSaIfEES3_RS1_m
	.type	_Z18compute_heavy_taskRKSt6vectorIfSaIfEES3_RS1_m, %function
_Z18compute_heavy_taskRKSt6vectorIfSaIfEES3_RS1_m:
.LFB2723:
	.cfi_startproc
	cbz	x3, .L1
	sub	x6, x3, #1
	ldr	x4, [x1]
	ldr	x5, [x0]
	ldr	x1, [x2]
	cmp	x6, 1
	bls	.L12
	add	x2, x4, 4
	add	x0, x5, 4
	sub	x2, x1, x2
	sub	x0, x1, x0
	cmp	x2, 8
	ccmp	x0, 8, 0, hi
	bls	.L12
	cmp	x6, 2
	beq	.L13
	lsr	x2, x3, 2
	mov	x0, 0
	fmov	v31.4s, 1.5e+0
	lsl	x2, x2, 4
	.p2align 5,,15
.L5:
	ldr	q30, [x5, x0]
	ldr	q29, [x4, x0]
	mov	v28.16b, v31.16b
	fmla	v28.4s, v30.4s, v29.4s
	str	q28, [x1, x0]
	add	x0, x0, 16
	cmp	x0, x2
	bne	.L5
	tst	x3, 3
	beq	.L1
	and	x6, x3, 3
	and	x0, x3, -4
	sub	x2, x6, #1
	cmp	x2, 1
	bls	.L7
.L4:
	lsl	x2, x0, 2
	fmov	v25.2s, 1.5e+0
	ldr	d27, [x5, x2]
	ldr	d26, [x4, x2]
	fmla	v25.2s, v27.2s, v26.2s
	str	d25, [x1, x2]
	tbz	x6, 0, .L1
	and	x6, x6, -2
	add	x0, x0, x6
.L7:
	lsl	x2, x0, 2
	fmov	s22, 1.5e+0
	add	x0, x0, 1
	ldr	s1, [x4, x2]
	ldr	s0, [x5, x2]
	fmadd	s0, s1, s0, s22
	str	s0, [x1, x2]
	cmp	x3, x0
	bhi	.L26
.L1:
	ret
	.p2align 2,,3
.L26:
	add	x2, x2, 4
	ldr	s24, [x5, x2]
	ldr	s23, [x4, x2]
	fmadd	s23, s24, s23, s22
	str	s23, [x1, x2]
	ret
	.p2align 2,,3
.L12:
	mov	x0, 0
	fmov	s21, 1.5e+0
	.p2align 5,,15
.L9:
	ldr	s20, [x5, x0, lsl 2]
	ldr	s19, [x4, x0, lsl 2]
	fmadd	s19, s20, s19, s21
	str	s19, [x1, x0, lsl 2]
	add	x0, x0, 1
	cmp	x3, x0
	bne	.L9
	ret
.L13:
	mov	x0, 0
	mov	x6, 3
	b	.L4
	.cfi_endproc
.LFE2723:
	.size	_Z18compute_heavy_taskRKSt6vectorIfSaIfEES3_RS1_m, .-_Z18compute_heavy_taskRKSt6vectorIfSaIfEES3_RS1_m
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Starting computation..."
	.align	3
.LC1:
	.string	"Time: "
	.align	3
.LC2:
	.string	" s\n"
	.align	3
.LC3:
	.string	"Control sum: "
	.align	3
.LC4:
	.string	"\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 5,,15
	.global	main
	.type	main, %function
main:
.LFB2724:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2724
	stp	x29, x30, [sp, -144]!
	.cfi_def_cfa_offset 144
	.cfi_offset 29, -144
	.cfi_offset 30, -136
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -128
	.cfi_offset 20, -120
	mov	x19, 2048
	movk	x19, 0x2faf, lsl 16
	mov	x0, x19
	stp	x21, x22, [sp, 32]
	str	d15, [sp, 48]
	.cfi_offset 21, -112
	.cfi_offset 22, -104
	.cfi_offset 79, -96
.LEHB0:
	bl	_Znwm
.LEHE0:
	mov	x20, x0
	adrp	x0, .LC5
	mov	x1, x20
	add	x2, x20, x19
	ldr	q31, [x0, #:lo12:.LC5]
	str	x20, [sp, 120]
	str	x2, [sp, 136]
	.p2align 5,,15
.L28:
	str	q31, [x1], 16
	cmp	x1, x2
	bne	.L28
	mov	x0, 2048
	stp	xzr, xzr, [sp, 72]
	movk	x0, 0x2faf, lsl 16
	str	x1, [sp, 128]
.LEHB1:
	bl	_Znwm
.LEHE1:
	mov	x19, x0
	adrp	x0, .LC6
	mov	x2, 2048
	mov	x1, x19
	ldr	q31, [x0, #:lo12:.LC6]
	movk	x2, 0x2faf, lsl 16
	add	x2, x19, x2
	str	x19, [sp, 64]
	str	x2, [sp, 80]
	.p2align 5,,15
.L29:
	str	q31, [x1], 16
	cmp	x2, x1
	bne	.L29
	mov	x0, 2048
	str	x2, [sp, 72]
	movk	x0, 0x2faf, lsl 16
	stp	xzr, xzr, [sp, 104]
.LEHB2:
	bl	_Znwm
.LEHE2:
	mov	x2, 2048
	mov	w1, 0
	movk	x2, 0x2faf, lsl 16
	mov	x21, x0
	add	x22, x0, x2
	str	x0, [sp, 96]
	str	x22, [sp, 112]
	bl	memset
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	adrp	x1, .LC0
	mov	x2, 23
	add	x1, x1, :lo12:.LC0
	str	x22, [sp, 104]
.LEHB3:
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x1, :got:_ZSt4cout;ldr	x1, [x1, :got_lo12:_ZSt4cout]
	ldr	x0, [x1]
	ldr	x0, [x0, -24]
	add	x0, x0, x1
	ldr	x22, [x0, 240]
	cbz	x22, .L44
	ldrb	w0, [x22, 56]
	cbz	w0, .L31
	ldrb	w1, [x22, 67]
.L32:
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	bl	_ZNSo3putEc
	bl	_ZNSo5flushEv
	bl	_ZNSt6chrono3_V212system_clock3nowEv
	mov	x22, x0
	add	x2, sp, 96
	add	x1, sp, 64
	add	x0, sp, 120
	mov	x3, 49664
	movk	x3, 0xbeb, lsl 16
	bl	_Z18compute_heavy_taskRKSt6vectorIfSaIfEES3_RS1_m
	bl	_ZNSt6chrono3_V212system_clock3nowEv
	sub	x1, x0, x22
	mov	x2, 225833675390976
	scvtf	d15, x1
	movk	x2, 0x41cd, lsl 48
	fmov	d31, x2
	adrp	x1, .LC1
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	add	x1, x1, :lo12:.LC1
	fdiv	d15, d15, d31
	mov	x2, 6
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	fmov	d0, d15
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	bl	_ZNSo9_M_insertIdEERSoT_
	adrp	x1, .LC2
	mov	x2, 3
	add	x1, x1, :lo12:.LC2
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	adrp	x1, .LC3
	mov	x2, 13
	add	x1, x1, :lo12:.LC3
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x1, 32768
	movk	x1, 0x17d7, lsl 16
	add	x1, x21, x1
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	ldr	s0, [x1, 1024]
	fcvt	d0, s0
	bl	_ZNSo9_M_insertIdEERSoT_
	adrp	x1, .LC4
	mov	x2, 1
	add	x1, x1, :lo12:.LC4
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x1, 2048
	mov	x0, x21
	movk	x1, 0x2faf, lsl 16
	bl	_ZdlPvm
	mov	x1, 2048
	mov	x0, x19
	movk	x1, 0x2faf, lsl 16
	bl	_ZdlPvm
	mov	x1, 2048
	mov	x0, x20
	movk	x1, 0x2faf, lsl 16
	bl	_ZdlPvm
	ldr	d15, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 144
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 79
	.cfi_def_cfa_offset 0
	ret
.L31:
	.cfi_restore_state
	mov	x0, x22
	bl	_ZNKSt5ctypeIcE13_M_widen_initEv
	ldr	x2, [x22]
	mov	x0, x22
	mov	w1, 10
	ldr	x2, [x2, 48]
	blr	x2
	and	w1, w0, 255
	b	.L32
.L44:
	bl	_ZSt16__throw_bad_castv
.LEHE3:
.L38:
	mov	x22, x0
	mov	x0, x21
	mov	x21, x22
	mov	x1, 2048
	movk	x1, 0x2faf, lsl 16
	bl	_ZdlPvm
.L34:
	mov	x1, 2048
	mov	x0, x19
	movk	x1, 0x2faf, lsl 16
	bl	_ZdlPvm
.L35:
	mov	x1, 2048
	mov	x0, x20
	movk	x1, 0x2faf, lsl 16
	bl	_ZdlPvm
	mov	x0, x21
.LEHB4:
	bl	_Unwind_Resume
.LEHE4:
.L37:
	mov	x21, x0
	b	.L34
.L36:
	mov	x21, x0
	b	.L35
	.cfi_endproc
.LFE2724:
	.section	.gcc_except_table,"a",@progbits
.LLSDA2724:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2724-.LLSDACSB2724
.LLSDACSB2724:
	.uleb128 .LEHB0-.LFB2724
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB2724
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L36-.LFB2724
	.uleb128 0
	.uleb128 .LEHB2-.LFB2724
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L37-.LFB2724
	.uleb128 0
	.uleb128 .LEHB3-.LFB2724
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L38-.LFB2724
	.uleb128 0
	.uleb128 .LEHB4-.LFB2724
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSE2724:
	.section	.text.startup
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align	4
.LC5:
	.word	1066192077
	.word	1066192077
	.word	1066192077
	.word	1066192077
	.align	4
.LC6:
	.word	1074580685
	.word	1074580685
	.word	1074580685
	.word	1074580685
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align	3
	.type	DW.ref.__gxx_personality_v0, %object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.xword	__gxx_personality_v0
	.global	__gxx_personality_v0
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
