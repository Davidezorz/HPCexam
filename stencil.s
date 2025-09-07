	.file	"stencil_template_parallel.c"
	.text
	.p2align 4
	.type	inject_energy._omp_fn.0, @function
inject_energy._omp_fn.0:
.LFB6500:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	omp_get_num_threads@PLT
	movl	%eax, %ebp
	call	omp_get_thread_num@PLT
	movl	%eax, %ecx
	movl	24(%rbx), %eax
	cltd
	idivl	%ebp
	cmpl	%edx, %ecx
	jl	.L2
.L14:
	imull	%eax, %ecx
	addl	%ecx, %edx
	leal	(%rax,%rdx), %ecx
	cmpl	%ecx, %edx
	jge	.L22
	movl	36(%rbx), %r9d
	movl	40(%rbx), %ecx
	vxorps	%xmm3, %xmm3, %xmm3
	movslq	%edx, %rdx
	movl	28(%rbx), %edi
	movq	(%rbx), %r10
	movl	%eax, %eax
	vxorpd	%xmm2, %xmm2, %xmm2
	leal	1(%r9), %r8d
	addq	%rdx, %rax
	movq	16(%rbx), %rsi
	vmovsd	8(%rbx), %xmm0
	vcvtsi2sdq	%rcx, %xmm3, %xmm4
	movl	44(%rbx), %ecx
	movl	32(%rbx), %r11d
	imull	%edi, %r8d
	vcvtsi2sdq	%rcx, %xmm3, %xmm3
	leaq	(%r10,%rdx,8), %rcx
	leaq	(%r10,%rax,8), %r10
	.p2align 4,,10
	.p2align 3
.L12:
	movl	4(%rcx), %ebx
	movl	%edi, %edx
	movl	(%rcx), %eax
	imull	%ebx, %edx
	cmpl	$1, %eax
	leal	(%rax,%rdx), %ebp
	leaq	(%rsi,%rbp,8), %rbp
	vaddsd	0(%rbp), %xmm0, %xmm1
	vmovsd	%xmm1, 0(%rbp)
	leal	-1(%rdi,%rdx), %ebp
	vmovsd	%xmm0, %xmm0, %xmm1
	leaq	(%rsi,%rbp,8), %rbp
	vmovsd	0(%rbp), %xmm5
	je	.L8
	vmulsd	%xmm2, %xmm0, %xmm1
.L8:
	vfmadd132sd	%xmm4, %xmm5, %xmm1
	leaq	(%rsi,%rdx,8), %rdx
	cmpl	%r11d, %eax
	vmovsd	%xmm1, 0(%rbp)
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	(%rdx), %xmm5
	je	.L9
	vmulsd	%xmm2, %xmm0, %xmm1
.L9:
	vfmadd132sd	%xmm4, %xmm5, %xmm1
	cmpl	$1, %ebx
	vmovsd	%xmm1, (%rdx)
	leal	(%rax,%r8), %edx
	vmovsd	%xmm0, %xmm0, %xmm1
	leaq	(%rsi,%rdx,8), %rdx
	vmovsd	(%rdx), %xmm5
	je	.L10
	vmulsd	%xmm2, %xmm0, %xmm1
.L10:
	vfmadd132sd	%xmm3, %xmm5, %xmm1
	leaq	(%rsi,%rax,8), %rax
	cmpl	%r9d, %ebx
	vmovsd	%xmm1, (%rdx)
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	(%rax), %xmm5
	je	.L11
	vmulsd	%xmm2, %xmm0, %xmm1
.L11:
	vfmadd132sd	%xmm3, %xmm5, %xmm1
	addq	$8, %rcx
	cmpq	%rcx, %r10
	vmovsd	%xmm1, (%rax)
	jne	.L12
.L22:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L14
	.cfi_endproc
.LFE6500:
	.size	inject_energy._omp_fn.0, .-inject_energy._omp_fn.0
	.p2align 4
	.type	inject_energy._omp_fn.1, @function
inject_energy._omp_fn.1:
.LFB6501:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	omp_get_num_threads@PLT
	movl	%eax, %ebp
	call	omp_get_thread_num@PLT
	movl	%eax, %ecx
	movl	24(%rbx), %eax
	cltd
	idivl	%ebp
	cmpl	%edx, %ecx
	jl	.L26
.L29:
	imull	%eax, %ecx
	addl	%ecx, %edx
	leal	(%rax,%rdx), %ecx
	cmpl	%ecx, %edx
	jge	.L31
	movslq	%edx, %rdx
	movq	(%rbx), %r8
	movl	%eax, %eax
	movq	16(%rbx), %rdi
	addq	%rdx, %rax
	movl	28(%rbx), %esi
	vmovsd	8(%rbx), %xmm1
	leaq	(%r8,%rdx,8), %rcx
	leaq	(%r8,%rax,8), %rdx
	.p2align 4,,10
	.p2align 3
.L28:
	movl	4(%rcx), %eax
	addq	$8, %rcx
	imull	%esi, %eax
	addl	-8(%rcx), %eax
	cmpq	%rcx, %rdx
	leaq	(%rdi,%rax,8), %rax
	vaddsd	(%rax), %xmm1, %xmm0
	vmovsd	%xmm0, (%rax)
	jne	.L28
.L31:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L29
	.cfi_endproc
.LFE6501:
	.size	inject_energy._omp_fn.1, .-inject_energy._omp_fn.1
	.p2align 4
	.type	update_center._omp_fn.0, @function
update_center._omp_fn.0:
.LFB6502:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$32, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	88(%rdi), %ebx
	cmpl	$2, %ebx
	jbe	.L49
	movq	%rdi, %r12
	call	omp_get_num_threads@PLT
	movl	%eax, %r13d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	leal	-2(%rbx), %eax
	divl	%r13d
	cmpl	%edx, %ecx
	jb	.L35
.L44:
	imull	%eax, %ecx
	addl	%edx, %ecx
	addl	%ecx, %eax
	cmpl	%eax, %ecx
	jnb	.L49
	movl	80(%r12), %r8d
	leal	2(%rcx), %edi
	addl	$2, %eax
	movl	84(%r12), %r10d
	movl	%eax, 8(%rsp)
	movl	%edi, %eax
	vmovsd	.LC1(%rip), %xmm4
	imull	%r8d, %eax
	movl	%edi, 28(%rsp)
	leal	4(%r8), %ebx
	vmovsd	.LC2(%rip), %xmm3
	vmovapd	32(%r12), %ymm2
	vmovapd	(%r12), %ymm1
	leal	1(%r8), %r15d
	movq	72(%r12), %rsi
	movq	64(%r12), %rdx
	leal	8(%r8), %r12d
	leal	-1(%r10,%rax), %r9d
	movl	%eax, %ecx
	negl	%eax
	movl	%eax, 20(%rsp)
	movl	$1, %eax
	subl	%r8d, %ecx
	movl	%eax, %edi
	movl	%r9d, 24(%rsp)
	subl	%r8d, %eax
	addl	$2, %ecx
	subl	%r10d, %edi
	movl	%eax, %r13d
	movl	%edi, 4(%rsp)
	movl	%ebx, %edi
	.p2align 4,,10
	.p2align 3
.L39:
	movl	4(%rsp), %eax
	movl	24(%rsp), %ebx
	cmpl	$13, %r10d
	leal	(%rax,%rbx), %r14d
	jbe	.L51
	leal	(%r8,%rcx), %eax
	movl	%r14d, 12(%rsp)
	movl	$11, %r11d
	movl	%eax, 16(%rsp)
	subl	%r14d, %r11d
	.p2align 4,,10
	.p2align 3
.L42:
	leal	-1(%rax), %ebx
	leal	1(%rax), %r14d
	vmovupd	(%rdx,%r14,8), %ymm0
	movl	%ecx, %r14d
	vaddpd	(%rdx,%rbx,8), %ymm0, %ymm0
	leal	(%r8,%rax), %ebx
	vmovupd	(%rdx,%r14,8), %ymm5
	vaddpd	(%rdx,%rbx,8), %ymm5, %ymm5
	leal	24(%rax), %r9d
	salq	$3, %r9
	leal	(%rdi,%rax), %ebx
	leal	4(%rcx), %r14d
	prefetchw	(%rsi,%r9)
	prefetcht2	(%rdx,%r9)
	movl	%eax, %r9d
	vaddpd	%ymm5, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm0
	vfmadd231pd	(%rdx,%r9,8), %ymm1, %ymm0
	vmovupd	%ymm0, (%rsi,%r9,8)
	vmovupd	(%rdx,%r14,8), %ymm0
	leal	5(%rax), %r14d
	vaddpd	(%rdx,%rbx,8), %ymm0, %ymm0
	leal	3(%rax), %ebx
	vmovupd	(%rdx,%r14,8), %ymm5
	leal	4(%rax), %r9d
	vaddpd	(%rdx,%rbx,8), %ymm5, %ymm5
	leal	8(%rcx), %r14d
	addl	$12, %ecx
	leal	(%r12,%rax), %ebx
	vaddpd	%ymm5, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm0
	vfmadd231pd	(%rdx,%r9,8), %ymm1, %ymm0
	vmovupd	%ymm0, (%rsi,%r9,8)
	vmovupd	(%rdx,%r14,8), %ymm0
	leal	9(%rax), %r14d
	vaddpd	(%rdx,%rbx,8), %ymm0, %ymm0
	leal	7(%rax), %ebx
	vmovupd	(%rdx,%r14,8), %ymm5
	leal	8(%rax), %r9d
	vaddpd	(%rdx,%rbx,8), %ymm5, %ymm5
	movl	%eax, %ebx
	addl	$12, %eax
	vaddpd	%ymm5, %ymm0, %ymm0
	vmulpd	%ymm2, %ymm0, %ymm0
	vfmadd231pd	(%rdx,%r9,8), %ymm1, %ymm0
	vmovupd	%ymm0, (%rsi,%r9,8)
	leal	(%r11,%rax), %r9d
	cmpl	%r10d, %r9d
	jb	.L42
	movl	20(%rsp), %eax
	movl	12(%rsp), %r14d
	leal	12(%rbx,%rax), %eax
.L43:
	cmpl	%r10d, %eax
	movl	24(%rsp), %r11d
	leal	-1(%r14,%rax), %ecx
	jnb	.L41
	.p2align 4,,10
	.p2align 3
.L40:
	movl	%ecx, %eax
	leal	1(%rcx), %r9d
	leal	(%r15,%rax), %ebx
	leal	0(%r13,%rax), %r14d
	cmpl	%r11d, %r9d
	movq	%r9, %rcx
	vmovsd	(%rdx,%r14,8), %xmm0
	vaddsd	(%rdx,%rbx,8), %xmm0, %xmm0
	leal	2(%rax), %ebx
	vmovsd	(%rdx,%rbx,8), %xmm5
	vaddsd	(%rdx,%rax,8), %xmm5, %xmm5
	vaddsd	%xmm5, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vfmadd231sd	(%rdx,%r9,8), %xmm3, %xmm0
	vmovsd	%xmm0, (%rsi,%r9,8)
	jne	.L40
.L41:
	addl	$1, 28(%rsp)
	movl	8(%rsp), %ebx
	movl	28(%rsp), %eax
	addl	%r8d, 24(%rsp)
	subl	%r8d, 20(%rsp)
	movl	16(%rsp), %ecx
	cmpl	%ebx, %eax
	jb	.L39
	vzeroupper
.L49:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L51:
	.cfi_restore_state
	addl	%r8d, %ecx
	movl	$2, %eax
	movl	%ecx, 16(%rsp)
	jmp	.L43
.L35:
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L44
	.cfi_endproc
.LFE6502:
	.size	update_center._omp_fn.0, .-update_center._omp_fn.0
	.p2align 4
	.type	update_NORTH._omp_fn.0, @function
update_NORTH._omp_fn.0:
.LFB6503:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	20(%rdi), %ebx
	leal	1(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L59
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	movl	%ebx, %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L54
.L57:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L59
	movl	16(%rbp), %r8d
	leal	1(%rax), %edi
	movl	24(%rbp), %eax
	movl	$1, %r10d
	movl	%r10d, %r11d
	movq	8(%rbp), %r9
	movq	0(%rbp), %rsi
	imull	%r8d, %eax
	vmovsd	.LC3(%rip), %xmm2
	vmovsd	.LC2(%rip), %xmm1
	subl	%r8d, %r11d
	addl	$1, %r8d
	addl	%eax, %edx
	subl	%eax, %r10d
	.p2align 4,,10
	.p2align 3
.L56:
	movl	%edx, %ebx
	leal	1(%rdx), %ecx
	movq	%rbx, %rax
	leal	2(%rbx), %ebp
	movq	%rcx, %rdx
	addl	%r8d, %eax
	vmovsd	(%rsi,%rbp,8), %xmm0
	vaddsd	(%rsi,%rbx,8), %xmm0, %xmm0
	leal	(%r11,%rbx), %ebx
	movl	%eax, %eax
	vaddsd	(%rsi,%rbx,8), %xmm0, %xmm0
	vaddsd	(%rsi,%rax,8), %xmm0, %xmm0
	leal	(%r10,%rcx), %eax
	cmpl	%edi, %eax
	vmulsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vfmadd231sd	(%rsi,%rcx,8), %xmm1, %xmm0
	vmovsd	%xmm0, (%r9,%rcx,8)
	jb	.L56
.L59:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L54:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L57
	.cfi_endproc
.LFE6503:
	.size	update_NORTH._omp_fn.0, .-update_NORTH._omp_fn.0
	.p2align 4
	.type	update_SOUTH._omp_fn.0, @function
update_SOUTH._omp_fn.0:
.LFB6504:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	20(%rdi), %ebx
	leal	1(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L68
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	movl	%ebx, %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L63
.L66:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L68
	movl	16(%rbp), %r8d
	leal	1(%rax), %edi
	movl	24(%rbp), %eax
	movl	$1, %r10d
	movl	%r10d, %r11d
	movq	8(%rbp), %r9
	movq	0(%rbp), %rsi
	imull	%r8d, %eax
	vmovsd	.LC3(%rip), %xmm2
	vmovsd	.LC2(%rip), %xmm1
	subl	%r8d, %r11d
	addl	$1, %r8d
	addl	%eax, %edx
	subl	%eax, %r10d
	.p2align 4,,10
	.p2align 3
.L65:
	movl	%edx, %ebx
	leal	1(%rdx), %ecx
	movq	%rbx, %rax
	leal	2(%rbx), %ebp
	movq	%rcx, %rdx
	addl	%r8d, %eax
	vmovsd	(%rsi,%rbp,8), %xmm0
	vaddsd	(%rsi,%rbx,8), %xmm0, %xmm0
	leal	(%r11,%rbx), %ebx
	movl	%eax, %eax
	vaddsd	(%rsi,%rbx,8), %xmm0, %xmm0
	vaddsd	(%rsi,%rax,8), %xmm0, %xmm0
	leal	(%r10,%rcx), %eax
	cmpl	%edi, %eax
	vmulsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vfmadd231sd	(%rsi,%rcx,8), %xmm1, %xmm0
	vmovsd	%xmm0, (%r9,%rcx,8)
	jb	.L65
.L68:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L63:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L66
	.cfi_endproc
.LFE6504:
	.size	update_SOUTH._omp_fn.0, .-update_SOUTH._omp_fn.0
	.p2align 4
	.type	update_WEST._omp_fn.0, @function
update_WEST._omp_fn.0:
.LFB6505:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	20(%rdi), %ebx
	cmpl	$2, %ebx
	jbe	.L77
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	leal	-2(%rbx), %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L72
.L75:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L77
	movl	16(%rbp), %r9d
	addl	$2, %edx
	leal	2(%rax), %edi
	movq	8(%rbp), %r10
	movq	0(%rbp), %rcx
	vmovsd	.LC3(%rip), %xmm2
	movl	%r9d, %eax
	movl	%r9d, %r11d
	vmovsd	.LC2(%rip), %xmm1
	imull	%edx, %eax
	addl	24(%rbp), %eax
	sall	$4, %r11d
	movl	%eax, %r8d
	.p2align 4,,10
	.p2align 3
.L74:
	leal	(%rax,%r11), %esi
	leal	-1(%rax), %ebx
	addl	$1, %edx
	salq	$3, %rsi
	vmovsd	(%rcx,%rbx,8), %xmm0
	prefetchw	(%r10,%rsi)
	prefetcht2	(%rcx,%rsi)
	leaq	0(,%r8,8), %rsi
	leal	1(%rax), %r8d
	vaddsd	(%rcx,%r8,8), %xmm0, %xmm0
	movl	%eax, %r8d
	subl	%r9d, %r8d
	cmpl	%edi, %edx
	vaddsd	(%rcx,%r8,8), %xmm0, %xmm0
	leal	(%rax,%r9), %r8d
	vaddsd	(%rcx,%r8,8), %xmm0, %xmm0
	movq	%r8, %rax
	vmulsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vfmadd231sd	(%rcx,%rsi), %xmm1, %xmm0
	vmovsd	%xmm0, (%r10,%rsi)
	jb	.L74
.L77:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L72:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L75
	.cfi_endproc
.LFE6505:
	.size	update_WEST._omp_fn.0, .-update_WEST._omp_fn.0
	.p2align 4
	.type	update_EAST._omp_fn.0, @function
update_EAST._omp_fn.0:
.LFB6506:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	20(%rdi), %ebx
	cmpl	$2, %ebx
	jbe	.L86
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	leal	-2(%rbx), %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L81
.L84:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L86
	movl	16(%rbp), %r9d
	addl	$2, %edx
	leal	2(%rax), %edi
	movq	8(%rbp), %r10
	movq	0(%rbp), %rcx
	vmovsd	.LC3(%rip), %xmm2
	movl	%r9d, %eax
	vmovsd	.LC2(%rip), %xmm1
	leal	0(,%r9,4), %r11d
	imull	%edx, %eax
	addl	24(%rbp), %eax
	movl	%eax, %r8d
	.p2align 4,,10
	.p2align 3
.L83:
	leal	(%rax,%r11), %esi
	leal	-1(%rax), %ebx
	addl	$1, %edx
	salq	$3, %rsi
	vmovsd	(%rcx,%rbx,8), %xmm0
	prefetchw	(%r10,%rsi)
	prefetcht2	(%rcx,%rsi)
	leaq	0(,%r8,8), %rsi
	leal	1(%rax), %r8d
	vaddsd	(%rcx,%r8,8), %xmm0, %xmm0
	movl	%eax, %r8d
	subl	%r9d, %r8d
	cmpl	%edi, %edx
	vaddsd	(%rcx,%r8,8), %xmm0, %xmm0
	leal	(%rax,%r9), %r8d
	vaddsd	(%rcx,%r8,8), %xmm0, %xmm0
	movq	%r8, %rax
	vmulsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vfmadd231sd	(%rcx,%rsi), %xmm1, %xmm0
	vmovsd	%xmm0, (%r10,%rsi)
	jb	.L83
.L86:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L84
	.cfi_endproc
.LFE6506:
	.size	update_EAST._omp_fn.0, .-update_EAST._omp_fn.0
	.p2align 4
	.type	update_NORTH_SOUTH._omp_fn.0, @function
update_NORTH_SOUTH._omp_fn.0:
.LFB6507:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	24(%rdi), %ebx
	cmpl	$1, %ebx
	jbe	.L95
	movq	%rdi, %r12
	call	omp_get_num_threads@PLT
	movl	%eax, %ebp
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	leal	-1(%rbx), %eax
	divl	%ebp
	cmpl	%edx, %ecx
	jb	.L90
.L93:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L95
	addl	$1, %eax
	movl	16(%r12), %ebp
	movl	28(%r12), %r8d
	leal	1(%rdx), %ecx
	movq	8(%r12), %rdi
	movq	(%r12), %rsi
	movl	%eax, 4(%rsp)
	movl	32(%r12), %eax
	leal	(%rbp,%rbp), %r9d
	vmovsd	.LC3(%rip), %xmm4
	imull	%ebp, %r8d
	vmovsd	.LC2(%rip), %xmm2
	imull	%ebp, %eax
	movl	%r8d, %r14d
	addl	%edx, %r8d
	movl	%eax, %r13d
	subl	%ebp, %r14d
	subl	%ebp, %r13d
	leal	(%r14,%r9), %r15d
	leal	0(%r13,%r9), %ebx
	leal	1(%rdx,%rax), %r9d
	movl	%ebx, 8(%rsp)
	movl	20(%r12), %ebx
	movq	%r9, %rdx
	imull	%ebp, %ebx
	movl	%ebx, %r12d
	leal	0(%rbp,%rbx), %ebx
	movl	%ebx, 12(%rsp)
	.p2align 4,,10
	.p2align 3
.L92:
	movl	%r8d, %eax
	leal	(%rcx,%r14), %ebx
	leal	(%rcx,%r15), %r11d
	vmovsd	(%rsi,%rbx,8), %xmm0
	vaddsd	(%rsi,%r11,8), %xmm0, %xmm0
	leal	2(%rax), %r11d
	vmovsd	(%rsi,%r11,8), %xmm1
	vaddsd	(%rsi,%rax,8), %xmm1, %xmm1
	leal	(%rcx,%r13), %r11d
	movl	8(%rsp), %ebx
	leaq	0(,%r9,8), %rax
	leal	-1(%rdx), %r9d
	addl	$1, %edx
	vmovsd	(%rsi,%r9,8), %xmm3
	leal	1(%r8), %r10d
	vaddsd	%xmm1, %xmm0, %xmm0
	leal	(%rcx,%rbx), %r9d
	movq	%r10, %r8
	vmulsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	(%rsi,%r11,8), %xmm0
	vaddsd	(%rsi,%r9,8), %xmm0, %xmm0
	movl	%edx, %r9d
	vaddsd	(%rsi,%r9,8), %xmm3, %xmm3
	vfmadd231sd	(%rsi,%r10,8), %xmm2, %xmm1
	vaddsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vfmadd231sd	(%rsi,%rax), %xmm2, %xmm0
	vmovsd	%xmm1, (%rdi,%r10,8)
	vmovsd	%xmm0, (%rdi,%rax)
	leal	(%rcx,%r12), %eax
	vmovsd	(%rdi,%rax,8), %xmm0
	movl	%ecx, %eax
	vmovsd	%xmm0, (%rdi,%rax,8)
	leal	(%rcx,%rbp), %eax
	vmovsd	(%rdi,%rax,8), %xmm0
	movl	12(%rsp), %eax
	addl	%ecx, %eax
	addl	$1, %ecx
	movl	%eax, %eax
	vmovsd	%xmm0, (%rdi,%rax,8)
	movl	4(%rsp), %eax
	cmpl	%eax, %ecx
	jb	.L92
.L95:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L90:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L93
	.cfi_endproc
.LFE6507:
	.size	update_NORTH_SOUTH._omp_fn.0, .-update_NORTH_SOUTH._omp_fn.0
	.p2align 4
	.type	update_NORTH_SOUTH._omp_fn.1, @function
update_NORTH_SOUTH._omp_fn.1:
.LFB6508:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movl	20(%rdi), %ebx
	cmpl	$1, %ebx
	jbe	.L104
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	leal	-1(%rbx), %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L99
.L102:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L104
	movl	16(%rbp), %edi
	movl	28(%rbp), %ebx
	movl	$1, %r11d
	leal	1(%rax), %esi
	movl	24(%rbp), %r8d
	movq	8(%rbp), %r9
	imull	%edi, %ebx
	movq	0(%rbp), %rcx
	movl	%r11d, %ebp
	leal	1(%rdi), %r12d
	imull	%edi, %r8d
	subl	%edi, %ebp
	vmovsd	.LC3(%rip), %xmm4
	vmovsd	.LC2(%rip), %xmm2
	movl	%ebx, %r10d
	leal	1(%rdx,%rbx), %r13d
	subl	%edi, %r10d
	subl	%r8d, %edi
	leal	(%rdx,%r8), %eax
	subl	%r8d, %r11d
	subl	%r8d, %r10d
	movq	%r13, %rdx
	leal	1(%rdi,%rbx), %ebx
	addl	$1, %r10d
	.p2align 4,,10
	.p2align 3
.L101:
	movl	%eax, %edi
	leal	1(%rax), %r14d
	leal	(%r12,%rdi), %r15d
	leal	0(%rbp,%rdi), %r8d
	movq	%r14, %rax
	vmovsd	(%rcx,%r15,8), %xmm0
	leal	2(%rdi), %r15d
	vaddsd	(%rcx,%r8,8), %xmm0, %xmm0
	movl	%edi, %r8d
	vmovsd	(%rcx,%r15,8), %xmm1
	vaddsd	(%rcx,%r8,8), %xmm1, %xmm1
	leaq	0(,%r13,8), %r8
	leal	-1(%rdx), %r13d
	addl	$1, %edx
	vmovsd	(%rcx,%r13,8), %xmm3
	leal	(%r10,%rdi), %r13d
	addl	%ebx, %edi
	vaddsd	%xmm1, %xmm0, %xmm0
	movl	%edi, %edi
	vmulsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	(%rcx,%r13,8), %xmm0
	movl	%edx, %r13d
	vaddsd	(%rcx,%rdi,8), %xmm0, %xmm0
	vaddsd	(%rcx,%r13,8), %xmm3, %xmm3
	vfmadd231sd	(%rcx,%r14,8), %xmm2, %xmm1
	leal	(%r11,%r14), %edi
	cmpl	%esi, %edi
	vaddsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vfmadd231sd	(%rcx,%r8), %xmm2, %xmm0
	vmovsd	%xmm1, (%r9,%r14,8)
	vmovsd	%xmm0, (%r9,%r8)
	jb	.L101
.L104:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L99:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L102
	.cfi_endproc
.LFE6508:
	.size	update_NORTH_SOUTH._omp_fn.1, .-update_NORTH_SOUTH._omp_fn.1
	.p2align 4
	.type	update_WEST_EAST._omp_fn.0, @function
update_WEST_EAST._omp_fn.0:
.LFB6509:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	28(%rdi), %ebp
	cmpl	$2, %ebp
	jbe	.L117
	movq	%rdi, %rbx
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	leal	-2(%rbp), %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L108
.L115:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L117
	movl	24(%rbx), %edi
	addl	$2, %edx
	addl	$2, %eax
	movl	36(%rbx), %r8d
	movl	44(%rbx), %r13d
	movl	32(%rbx), %r10d
	movl	%eax, 4(%rsp)
	vxorps	%xmm4, %xmm4, %xmm4
	movl	%edi, %r9d
	movl	40(%rbx), %eax
	movl	48(%rbx), %r14d
	imull	%edx, %r9d
	movq	16(%rbx), %rsi
	movq	(%rbx), %r12
	movl	%r13d, 12(%rsp)
	movq	8(%rbx), %rcx
	leal	0(,%rdi,8), %ebx
	vmovsd	.LC3(%rip), %xmm3
	movl	%ebx, 8(%rsp)
	vmovsd	.LC2(%rip), %xmm2
	addl	%r9d, %r8d
	addl	%r9d, %eax
	addl	%r9d, %r10d
	movl	%r8d, %ebx
	movl	%eax, %r11d
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L119:
	testl	%r14d, %r14d
	vxorpd	%xmm1, %xmm1, %xmm1
	jne	.L111
.L120:
	vxorpd	%xmm5, %xmm5, %xmm5
.L113:
	leaq	0(,%rbx,8), %r15
	leal	1(%r8), %ebx
	addl	$1, %edx
	vaddsd	(%rcx,%rbx,8), %xmm1, %xmm1
	movl	%r8d, %ebx
	leaq	0(,%r11,8), %rbp
	subl	%edi, %ebx
	leal	-1(%rax), %r11d
	vmovsd	(%rcx,%rbx,8), %xmm0
	leal	(%r8,%rdi), %ebx
	vaddsd	(%rcx,%r11,8), %xmm5, %xmm5
	movl	%eax, %r11d
	vaddsd	(%rcx,%rbx,8), %xmm0, %xmm0
	subl	%edi, %r11d
	movq	%rbx, %r8
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm1
	vmovsd	(%rcx,%r11,8), %xmm0
	leal	(%rax,%rdi), %r11d
	vaddsd	(%rcx,%r11,8), %xmm0, %xmm0
	vfmadd231sd	(%rcx,%r15), %xmm2, %xmm1
	movq	%r11, %rax
	vaddsd	%xmm5, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vfmadd231sd	(%rcx,%rbp), %xmm2, %xmm0
	vmovsd	%xmm1, (%rsi,%r15)
	movl	4(%rsp), %r15d
	vmovsd	%xmm0, (%rsi,%rbp)
	movl	%r10d, %ebp
	vmovsd	(%rsi,%rbp,8), %xmm0
	movl	%r9d, %ebp
	vmovsd	%xmm0, (%rsi,%rbp,8)
	leal	1(%r9), %ebp
	addl	%edi, %r9d
	vmovsd	(%rsi,%rbp,8), %xmm0
	leal	1(%r10), %ebp
	addl	%edi, %r10d
	cmpl	%r15d, %edx
	vmovsd	%xmm0, (%rsi,%rbp,8)
	jnb	.L117
.L112:
	movl	8(%rsp), %r15d
	movl	12(%rsp), %r13d
	leal	(%rax,%r15), %ebp
	salq	$3, %rbp
	testl	%r13d, %r13d
	prefetchw	(%rsi,%rbp)
	prefetcht2	(%rcx,%rbp)
	leal	-1(%rdx), %ebp
	je	.L119
	movq	56(%r12), %r13
	movl	%ebp, %r15d
	testl	%r14d, %r14d
	vcvttsd2sil	0(%r13,%r15,8), %r15d
	vcvtsi2sdl	%r15d, %xmm4, %xmm1
	je	.L120
.L111:
	movq	48(%r12), %r15
	vcvttsd2sil	(%r15,%rbp,8), %ebp
	vcvtsi2sdl	%ebp, %xmm4, %xmm5
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L117:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L108:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L115
	.cfi_endproc
.LFE6509:
	.size	update_WEST_EAST._omp_fn.0, .-update_WEST_EAST._omp_fn.0
	.p2align 4
	.type	update_WEST_EAST._omp_fn.1, @function
update_WEST_EAST._omp_fn.1:
.LFB6510:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	28(%rdi), %ebx
	cmpl	$2, %ebx
	jbe	.L132
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	leal	-2(%rbx), %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L123
.L130:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L132
	movl	24(%rbp), %edi
	leal	2(%rax), %r8d
	addl	$2, %edx
	movl	32(%rbp), %esi
	movl	%r8d, 12(%rsp)
	movl	44(%rbp), %r15d
	vxorps	%xmm4, %xmm4, %xmm4
	movl	%edi, %eax
	movl	40(%rbp), %r14d
	movq	16(%rbp), %r11
	leal	0(,%rdi,8), %r12d
	imull	%edx, %eax
	movq	8(%rbp), %rcx
	movq	0(%rbp), %r13
	vmovsd	.LC3(%rip), %xmm3
	vmovsd	.LC2(%rip), %xmm2
	addl	%eax, %esi
	addl	36(%rbp), %eax
	movl	%esi, %r10d
	movl	%eax, %r9d
	jmp	.L127
	.p2align 4,,10
	.p2align 3
.L134:
	testl	%r15d, %r15d
	vxorpd	%xmm1, %xmm1, %xmm1
	jne	.L126
.L135:
	vxorpd	%xmm5, %xmm5, %xmm5
.L128:
	leaq	0(,%r10,8), %rbp
	leal	1(%rsi), %r10d
	addl	$1, %edx
	vaddsd	(%rcx,%r10,8), %xmm1, %xmm1
	movl	%esi, %r10d
	leaq	0(,%r9,8), %rbx
	subl	%edi, %r10d
	leal	-1(%rax), %r9d
	vmovsd	(%rcx,%r10,8), %xmm0
	leal	(%rsi,%rdi), %r10d
	vaddsd	(%rcx,%r9,8), %xmm5, %xmm5
	movl	%eax, %r9d
	vaddsd	(%rcx,%r10,8), %xmm0, %xmm0
	subl	%edi, %r9d
	movq	%r10, %rsi
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm1
	vmovsd	(%rcx,%r9,8), %xmm0
	leal	(%rax,%rdi), %r9d
	vaddsd	(%rcx,%r9,8), %xmm0, %xmm0
	vfmadd231sd	(%rcx,%rbp), %xmm2, %xmm1
	movq	%r9, %rax
	vaddsd	%xmm5, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vfmadd231sd	(%rcx,%rbx), %xmm2, %xmm0
	vmovsd	%xmm1, (%r11,%rbp)
	vmovsd	%xmm0, (%r11,%rbx)
	movl	12(%rsp), %ebx
	cmpl	%ebx, %edx
	jnb	.L132
.L127:
	leal	(%rax,%r12), %ebx
	salq	$3, %rbx
	testl	%r14d, %r14d
	prefetchw	(%r11,%rbx)
	prefetcht2	(%rcx,%rbx)
	leal	-1(%rdx), %ebx
	je	.L134
	movq	56(%r13), %r8
	movl	%ebx, %ebp
	testl	%r15d, %r15d
	vcvttsd2sil	(%r8,%rbp,8), %ebp
	vcvtsi2sdl	%ebp, %xmm4, %xmm1
	je	.L135
.L126:
	movq	48(%r13), %rbp
	vcvttsd2sil	0(%rbp,%rbx,8), %ebx
	vcvtsi2sdl	%ebx, %xmm4, %xmm5
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L132:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L123:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L130
	.cfi_endproc
.LFE6510:
	.size	update_WEST_EAST._omp_fn.1, .-update_WEST_EAST._omp_fn.1
	.p2align 4
	.type	update_plane._omp_fn.0, @function
update_plane._omp_fn.0:
.LFB6511:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	24(%rdi), %ebx
	leal	1(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L167
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	movl	%ebx, %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L138
.L143:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	movl	%eax, 8(%rsp)
	jnb	.L167
	leal	1(%rdx), %edi
	addl	$1, %eax
	cmpl	%eax, %edi
	jnb	.L167
	movl	16(%rbp), %ecx
	movq	8(%rbp), %rbx
	movq	0(%rbp), %rax
	movl	20(%rbp), %r12d
	movl	%ecx, %esi
	imull	%edi, %esi
.L141:
	testl	%r12d, %r12d
	leal	1(%rdi), %r15d
	je	.L163
	vmovsd	.LC3(%rip), %xmm2
	vmovsd	.LC2(%rip), %xmm1
	movl	%edi, %r13d
	.p2align 4,,10
	.p2align 3
.L140:
	movl	$1, %r10d
	movl	%esi, %r11d
	leal	2(%rsi), %r9d
	movl	%r12d, %edi
	subl	%ecx, %r10d
	vmovsd	(%rax,%r9,8), %xmm0
	leal	1(%rcx), %ebp
	leal	1(%rsi), %r8d
	vaddsd	(%rax,%r11,8), %xmm0, %xmm0
	leal	(%r10,%rsi), %r11d
	movl	$1, %r14d
	subl	$1, %edi
	vaddsd	(%rax,%r11,8), %xmm0, %xmm0
	leal	(%rcx,%rsi), %edx
	subl	%esi, %r14d
	andl	$3, %edi
	leal	0(%rbp,%rsi), %r11d
	movl	%edx, 4(%rsp)
	movq	%r8, %rdx
	vaddsd	(%rax,%r11,8), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r8,8), %xmm1, %xmm0
	vmovsd	%xmm0, (%rbx,%r8,8)
	leal	(%r14,%r8), %r8d
	cmpl	%r8d, %r12d
	jb	.L164
	testl	%edi, %edi
	je	.L166
	cmpl	$1, %edi
	je	.L158
	cmpl	$2, %edi
	je	.L159
	movl	%edx, %r11d
	leaq	0(,%r9,8), %r8
	leal	3(%rsi), %r9d
	vmovsd	(%rax,%r9,8), %xmm0
	movq	%r11, %rdi
	vaddsd	(%rax,%r11,8), %xmm0, %xmm0
	leal	(%r10,%r11), %r11d
	vaddsd	(%rax,%r11,8), %xmm0, %xmm0
	leal	0(%rbp,%rdi), %r11d
	vaddsd	(%rax,%r11,8), %xmm0, %xmm0
	leal	2(%rsi), %edx
	vmulsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r8), %xmm1, %xmm0
	vmovsd	%xmm0, (%rbx,%r8)
.L159:
	movl	%edx, %r11d
	leal	1(%rdx), %r8d
	leal	2(%r11), %r9d
	movq	%r11, %rdi
	movq	%r8, %rdx
	vmovsd	(%rax,%r9,8), %xmm0
	vaddsd	(%rax,%r11,8), %xmm0, %xmm0
	leal	(%r10,%r11), %r11d
	vaddsd	(%rax,%r11,8), %xmm0, %xmm0
	leal	0(%rbp,%rdi), %r11d
	vaddsd	(%rax,%r11,8), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r8,8), %xmm1, %xmm0
	vmovsd	%xmm0, (%rbx,%r8,8)
.L158:
	movl	%edx, %r11d
	leal	1(%rdx), %r8d
	leal	2(%r11), %r9d
	movq	%r11, %rdi
	movq	%r8, %rdx
	vmovsd	(%rax,%r9,8), %xmm0
	vaddsd	(%rax,%r11,8), %xmm0, %xmm0
	leal	(%r10,%r11), %r11d
	vaddsd	(%rax,%r11,8), %xmm0, %xmm0
	leal	0(%rbp,%rdi), %r11d
	vaddsd	(%rax,%r11,8), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r8,8), %xmm1, %xmm0
	vmovsd	%xmm0, (%rbx,%r8,8)
	leal	(%r14,%r8), %r8d
	cmpl	%r8d, %r12d
	jb	.L164
.L166:
	movl	%ecx, 12(%rsp)
.L142:
	leal	2(%rdx), %ecx
	movl	%edx, %edi
	leal	0(%rbp,%rdx), %esi
	vmovsd	(%rax,%rcx,8), %xmm0
	vaddsd	(%rax,%rdi,8), %xmm0, %xmm0
	leal	(%r10,%rdx), %edi
	vaddsd	(%rax,%rdi,8), %xmm0, %xmm0
	vaddsd	(%rax,%rsi,8), %xmm0, %xmm0
	leal	1(%rdx), %r9d
	movq	%r9, %r8
	vmulsd	%xmm2, %xmm0, %xmm0
	movl	%r8d, %edi
	leal	0(%rbp,%r8), %esi
	vmulsd	%xmm1, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r9,8), %xmm1, %xmm0
	vmovsd	%xmm0, (%rbx,%r9,8)
	leaq	0(,%rcx,8), %r9
	leal	2(%r8), %ecx
	vmovsd	(%rax,%rcx,8), %xmm0
	vaddsd	(%rax,%rdi,8), %xmm0, %xmm0
	leal	(%r10,%r8), %edi
	movq	%rcx, %r11
	vaddsd	(%rax,%rdi,8), %xmm0, %xmm0
	vaddsd	(%rax,%rsi,8), %xmm0, %xmm0
	leal	2(%rdx), %edi
	movq	%rdi, %rsi
	vmulsd	%xmm2, %xmm0, %xmm0
	addl	%ebp, %esi
	movl	%esi, %esi
	vmulsd	%xmm1, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r9), %xmm1, %xmm0
	vmovsd	%xmm0, (%rbx,%r9)
	leaq	0(,%rcx,8), %r9
	leal	2(%rdi), %ecx
	vmovsd	(%rax,%rcx,8), %xmm0
	vaddsd	(%rax,%rdi,8), %xmm0, %xmm0
	leal	(%r10,%rdi), %edi
	vaddsd	(%rax,%rdi,8), %xmm0, %xmm0
	vaddsd	(%rax,%rsi,8), %xmm0, %xmm0
	movl	%r11d, %edi
	movq	%rdi, %rsi
	leal	4(%r8), %ecx
	addl	%ebp, %esi
	vmulsd	%xmm2, %xmm0, %xmm0
	movl	%esi, %esi
	vmulsd	%xmm1, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r9), %xmm1, %xmm0
	vmovsd	%xmm0, (%rbx,%r9)
	vmovsd	(%rax,%rcx,8), %xmm0
	vaddsd	(%rax,%rdi,8), %xmm0, %xmm0
	leal	(%r10,%rdi), %edi
	vaddsd	(%rax,%rdi,8), %xmm0, %xmm0
	vaddsd	(%rax,%rsi,8), %xmm0, %xmm0
	leal	3(%r8), %r9d
	leal	(%r14,%r9), %ecx
	movq	%r9, %rdx
	vmulsd	%xmm2, %xmm0, %xmm0
	cmpl	%ecx, %r12d
	vmulsd	%xmm1, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r9,8), %xmm1, %xmm0
	vmovsd	%xmm0, (%rbx,%r9,8)
	jnb	.L142
	movl	12(%rsp), %ecx
.L164:
	cmpl	%r13d, 8(%rsp)
	movl	4(%rsp), %esi
	je	.L167
	movl	%r15d, %r13d
	addl	$1, %r15d
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L167:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L163:
	.cfi_restore_state
	addl	%ecx, %esi
	cmpl	%edi, 8(%rsp)
	je	.L167
	movl	%r15d, %edi
	jmp	.L141
.L138:
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L143
	.cfi_endproc
.LFE6511:
	.size	update_plane._omp_fn.0, .-update_plane._omp_fn.0
	.p2align 4
	.type	get_total_energy._omp_fn.0, @function
get_total_energy._omp_fn.0:
.LFB6512:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	andq	$-32, %rsp
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	movl	%eax, %esi
	movl	20(%rbx), %eax
	cltd
	idivl	%r12d
	cmpl	%edx, %esi
	jl	.L170
.L182:
	imull	%eax, %esi
	vxorpd	%xmm1, %xmm1, %xmm1
	addl	%edx, %esi
	addl	%esi, %eax
	cmpl	%eax, %esi
	jge	.L171
	movslq	24(%rbx), %r9
	addl	$1, %esi
	movl	16(%rbx), %edx
	movq	%rsp, %r10
	movq	(%rbx), %rdi
	vpxor	%xmm2, %xmm2, %xmm2
	movq	%r9, %rcx
	movl	%edx, %r8d
	movl	%edx, %r11d
	salq	$3, %r9
	imull	%esi, %ecx
	shrl	$2, %r8d
	andl	$-4, %r11d
	salq	$5, %r8
	leal	1(%r11), %r12d
	movslq	%ecx, %rcx
	leaq	(%rdi,%rcx,8), %rcx
	leal	1(%rax), %edi
	.p2align 4,,10
	.p2align 3
.L173:
	testl	%edx, %edx
	vmovdqa	%ymm2, (%r10)
	jle	.L177
	cmpl	$3, %edx
	jle	.L185
	leaq	8(%rcx), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	(%r8,%rax), %r13
	.p2align 4,,10
	.p2align 3
.L175:
	vaddpd	(%rax), %ymm0, %ymm0
	addq	$32, %rax
	cmpq	%r13, %rax
	jne	.L175
	cmpl	%r11d, %edx
	vmovapd	%ymm0, (%rsp)
	movslq	%r12d, %rax
	je	.L177
.L174:
	vmovsd	(%rsp), %xmm0
	.p2align 4,,10
	.p2align 3
.L179:
	vaddsd	(%rcx,%rax,8), %xmm0, %xmm0
	addq	$1, %rax
	leal	-1(%rax), %r13d
	cmpl	%r13d, %edx
	jg	.L179
	vmovsd	%xmm0, (%rsp)
.L177:
	addl	$1, %esi
	addq	%r9, %rcx
	vaddsd	(%rsp), %xmm1, %xmm1
	cmpl	%edi, %esi
	vaddsd	8(%rsp), %xmm1, %xmm1
	vaddsd	16(%rsp), %xmm1, %xmm1
	vaddsd	24(%rsp), %xmm1, %xmm1
	jne	.L173
	vzeroupper
.L171:
	movq	8(%rbx), %rdx
	leaq	8(%rbx), %rcx
.L181:
	vmovq	%rdx, %xmm4
	movq	%rdx, %rax
	vaddsd	%xmm4, %xmm1, %xmm3
	vmovq	%xmm3, %rsi
	lock cmpxchgq	%rsi, (%rcx)
	jne	.L195
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L196
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L185:
	.cfi_restore_state
	movl	$1, %eax
	jmp	.L174
.L170:
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L182
.L196:
	call	__stack_chk_fail@PLT
.L195:
	movq	%rax, %rdx
	jmp	.L181
	.cfi_endproc
.LFE6512:
	.size	get_total_energy._omp_fn.0, .-get_total_energy._omp_fn.0
	.p2align 4
	.type	main._omp_fn.0, @function
main._omp_fn.0:
.LFB6513:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	omp_get_num_threads@PLT
	movl	%eax, %ebp
	call	omp_get_thread_num@PLT
	movl	%eax, %ecx
	movl	20(%rbx), %eax
	cltd
	idivl	%ebp
	cmpl	%edx, %ecx
	jl	.L198
.L201:
	imull	%eax, %ecx
	addl	%ecx, %edx
	leal	(%rax,%rdx), %ecx
	cmpl	%ecx, %edx
	jge	.L203
	movq	(%rbx), %rcx
	movl	16(%rbx), %r9d
	leal	1(%rdx), %esi
	movl	%eax, %eax
	movslq	%esi, %rsi
	movq	8(%rbx), %r8
	movq	24(%rcx), %rdi
	leal	7(%rdx), %ecx
	movslq	%edx, %rdx
	imull	%r9d, %ecx
	addq	%rdx, %rax
	imull	$-6, %r9d, %edx
	leaq	-8(%rdi,%rsi,8), %rsi
	leaq	(%rdi,%rax,8), %rdi
	addl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L200:
	movl	%ecx, %eax
	addq	$8, %rsi
	prefetcht2	(%r8,%rax,8)
	leal	(%rdx,%rcx), %eax
	addl	%r9d, %ecx
	vmovsd	(%r8,%rax,8), %xmm0
	vmovsd	%xmm0, -8(%rsi)
	cmpq	%rsi, %rdi
	jne	.L200
.L203:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L198:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L201
	.cfi_endproc
.LFE6513:
	.size	main._omp_fn.0, .-main._omp_fn.0
	.p2align 4
	.type	main._omp_fn.1, @function
main._omp_fn.1:
.LFB6514:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	omp_get_num_threads@PLT
	movl	%eax, %ebp
	call	omp_get_thread_num@PLT
	movl	%eax, %ecx
	movl	24(%rbx), %eax
	cltd
	idivl	%ebp
	cmpl	%edx, %ecx
	jl	.L206
.L209:
	imull	%eax, %ecx
	addl	%ecx, %edx
	leal	(%rax,%rdx), %ecx
	cmpl	%ecx, %edx
	jge	.L211
	movq	(%rbx), %rcx
	movl	16(%rbx), %r9d
	leal	1(%rdx), %esi
	movl	%eax, %eax
	movslq	%esi, %rsi
	movq	8(%rbx), %rdi
	movq	16(%rcx), %r8
	leal	7(%rdx), %ecx
	movslq	%edx, %rdx
	imull	%r9d, %ecx
	addq	%rdx, %rax
	leal	(%r9,%r9,2), %edx
	addl	%edx, %edx
	leaq	-8(%r8,%rsi,8), %rsi
	leaq	(%r8,%rax,8), %r8
	notl	%edx
	addl	20(%rbx), %edx
	addl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L208:
	movl	%ecx, %eax
	addq	$8, %rsi
	prefetcht2	(%rdi,%rax,8)
	leal	(%rdx,%rcx), %eax
	addl	%r9d, %ecx
	vmovsd	(%rdi,%rax,8), %xmm0
	vmovsd	%xmm0, -8(%rsi)
	cmpq	%r8, %rsi
	jne	.L208
.L211:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L206:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L209
	.cfi_endproc
.LFE6514:
	.size	main._omp_fn.1, .-main._omp_fn.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"w"
	.text
	.p2align 4
	.type	dump.part.0, @function
dump.part.0:
.LFB6515:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	movq	%rdx, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	leaq	.LC5(%rip), %rsi
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	fopen@PLT
	testq	%rax, %rax
	je	.L221
	movl	(%rbx), %esi
	movq	%rax, %rbp
	leaq	0(,%rsi,4), %rdi
	movq	%rsi, 8(%rsp)
	movq	%rsi, %r15
	call	malloc@PLT
	movq	%rax, %r13
	movl	4(%rbx), %eax
	testl	%eax, %eax
	je	.L215
	movq	8(%rsp), %rsi
	vxorps	%xmm1, %xmm1, %xmm1
	movl	$1, %r14d
	.p2align 4,,10
	.p2align 3
.L220:
	leal	2(%r15), %eax
	imull	%r14d, %eax
	testl	%r15d, %r15d
	je	.L219
	leal	-1(%r15), %edx
	leaq	(%r12,%rax,8), %rcx
	movl	$1, %eax
	addq	$2, %rdx
	.p2align 4,,10
	.p2align 3
.L218:
	vcvtsd2ss	(%rcx,%rax,8), %xmm1, %xmm0
	vmovss	%xmm0, -4(%r13,%rax,4)
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L218
.L219:
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	movl	$4, %esi
	movq	%r13, %rdi
	call	fwrite@PLT
	addl	$1, %r14d
	cmpl	%r14d, 4(%rbx)
	vxorps	%xmm1, %xmm1, %xmm1
	jb	.L215
	movl	(%rbx), %esi
	movq	%rsi, %r15
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L215:
	movq	%r13, %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	xorl	%eax, %eax
.L213:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L221:
	.cfi_restore_state
	movl	$2, %eax
	jmp	.L213
	.cfi_endproc
.LFE6515:
	.size	dump.part.0, .-dump.part.0
	.p2align 4
	.globl	inject_energy
	.type	inject_energy, @function
inject_energy:
.LFB6482:
	.cfi_startproc
	endbr64
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movl	8(%rcx), %r9d
	movl	%esi, %eax
	vmovd	12(%rcx), %xmm2
	movq	%fs:40, %rsi
	movq	%rsi, 56(%rsp)
	xorl	%esi, %esi
	testl	%edi, %edi
	movq	(%rcx), %rcx
	leal	2(%r9), %esi
	je	.L225
	xorl	%edi, %edi
	cmpl	$1, (%r8)
	vmovd	%esi, %xmm3
	movq	%rdx, (%rsp)
	sete	%dil
	xorl	%esi, %esi
	cmpl	$1, 4(%r8)
	movq	%rcx, 16(%rsp)
	sete	%sil
	vpinsrd	$1, %edi, %xmm2, %xmm2
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	vpinsrd	$1, %r9d, %xmm3, %xmm1
	movl	%esi, 44(%rsp)
	movq	%rsp, %rsi
	leaq	inject_energy._omp_fn.0(%rip), %rdi
	vpunpcklqdq	%xmm2, %xmm1, %xmm1
	movl	%eax, 24(%rsp)
	vmovdqu	%xmm1, 28(%rsp)
	vmovsd	%xmm0, 8(%rsp)
	call	GOMP_parallel@PLT
.L226:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L229
	xorl	%eax, %eax
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L225:
	.cfi_restore_state
	movq	%rcx, 16(%rsp)
	leaq	inject_energy._omp_fn.1(%rip), %rdi
	xorl	%ecx, %ecx
	movl	%esi, 28(%rsp)
	movq	%rsp, %rsi
	movq	%rdx, (%rsp)
	xorl	%edx, %edx
	movl	%eax, 24(%rsp)
	vmovsd	%xmm0, 8(%rsp)
	call	GOMP_parallel@PLT
	jmp	.L226
.L229:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6482:
	.size	inject_energy, .-inject_energy
	.p2align 4
	.globl	update_center
	.type	update_center, @function
update_center:
.LFB6483:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rcx, %rsi
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	addq	$-128, %rsp
	movl	12(%rdx), %ecx
	vmovq	(%rdx), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	movl	8(%rdx), %eax
	vpinsrq	$1, (%rsi), %xmm0, %xmm0
	xorl	%edx, %edx
	vbroadcastsd	.LC1(%rip), %ymm1
	movl	%ecx, 88(%rsp)
	movq	%rsp, %rsi
	xorl	%ecx, %ecx
	vmovapd	%ymm1, 32(%rsp)
	vbroadcastsd	.LC2(%rip), %ymm1
	vmovdqa	%xmm0, 64(%rsp)
	vmovapd	%ymm1, (%rsp)
	leal	2(%rax), %edi
	vmovd	%edi, %xmm0
	leaq	update_center._omp_fn.0(%rip), %rdi
	vpinsrd	$1, %eax, %xmm0, %xmm0
	vmovq	%xmm0, 80(%rsp)
	vzeroupper
	call	GOMP_parallel@PLT
	movq	120(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L233
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	xorl	%eax, %eax
	ret
.L233:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6483:
	.size	update_center, .-update_center
	.p2align 4
	.globl	update_NORTH
	.type	update_NORTH, @function
update_NORTH:
.LFB6484:
	.cfi_startproc
	endbr64
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	vmovq	(%rdx), %xmm0
	vpinsrq	$1, (%rcx), %xmm0, %xmm0
	leaq	update_NORTH._omp_fn.0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	movl	8(%rdx), %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$1, 24(%rsp)
	vmovdqa	%xmm0, (%rsp)
	leal	2(%rax), %esi
	vmovd	%esi, %xmm0
	movq	%rsp, %rsi
	vpinsrd	$1, %eax, %xmm0, %xmm0
	vmovq	%xmm0, 16(%rsp)
	call	GOMP_parallel@PLT
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L237
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L237:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6484:
	.size	update_NORTH, .-update_NORTH
	.p2align 4
	.globl	update_SOUTH
	.type	update_SOUTH, @function
update_SOUTH:
.LFB6485:
	.cfi_startproc
	endbr64
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	vmovq	(%rdx), %xmm1
	vpinsrq	$1, (%rcx), %xmm1, %xmm0
	leaq	update_SOUTH._omp_fn.0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	movl	8(%rdx), %eax
	movl	12(%rdx), %edx
	xorl	%ecx, %ecx
	vmovdqa	%xmm0, (%rsp)
	movl	%edx, 24(%rsp)
	xorl	%edx, %edx
	leal	2(%rax), %esi
	vmovd	%esi, %xmm0
	movq	%rsp, %rsi
	vpinsrd	$1, %eax, %xmm0, %xmm0
	vmovq	%xmm0, 16(%rsp)
	call	GOMP_parallel@PLT
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L241
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L241:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6485:
	.size	update_SOUTH, .-update_SOUTH
	.p2align 4
	.globl	update_WEST
	.type	update_WEST, @function
update_WEST:
.LFB6486:
	.cfi_startproc
	endbr64
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	vmovq	(%rdx), %xmm1
	vpinsrq	$1, (%rcx), %xmm1, %xmm1
	leaq	update_WEST._omp_fn.0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	movl	8(%rdx), %eax
	xorl	%ecx, %ecx
	vmovdqa	%xmm1, (%rsp)
	leal	2(%rax), %esi
	movl	%eax, 24(%rsp)
	vmovd	%esi, %xmm0
	vpinsrd	$1, 12(%rdx), %xmm0, %xmm0
	movq	%rsp, %rsi
	xorl	%edx, %edx
	vmovq	%xmm0, 16(%rsp)
	call	GOMP_parallel@PLT
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L245
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L245:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6486:
	.size	update_WEST, .-update_WEST
	.p2align 4
	.globl	update_EAST
	.type	update_EAST, @function
update_EAST:
.LFB6487:
	.cfi_startproc
	endbr64
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	vmovq	(%rdx), %xmm1
	vpinsrq	$1, (%rcx), %xmm1, %xmm1
	leaq	update_EAST._omp_fn.0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	movl	8(%rdx), %eax
	xorl	%ecx, %ecx
	movq	%rsp, %rsi
	movl	$1, 24(%rsp)
	vmovdqa	%xmm1, (%rsp)
	addl	$2, %eax
	vmovd	%eax, %xmm0
	vpinsrd	$1, 12(%rdx), %xmm0, %xmm0
	xorl	%edx, %edx
	vmovq	%xmm0, 16(%rsp)
	call	GOMP_parallel@PLT
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L249
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L249:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6487:
	.size	update_EAST, .-update_EAST
	.p2align 4
	.globl	update_NORTH_SOUTH
	.type	update_NORTH_SOUTH, @function
update_NORTH_SOUTH:
.LFB6488:
	.cfi_startproc
	endbr64
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%rcx, %r8
	vmovq	(%rdx), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	movl	8(%rdx), %eax
	testl	%edi, %edi
	vpinsrq	$1, (%r8), %xmm0, %xmm0
	leal	2(%rax), %ecx
	vmovd	%ecx, %xmm1
	movl	12(%rdx), %ecx
	vpinsrd	$1, %eax, %xmm1, %xmm2
	je	.L251
	cmpl	$1, 4(%rsi)
	je	.L258
.L251:
	movl	%ecx, 28(%rsp)
	movq	%rsp, %rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	update_NORTH_SOUTH._omp_fn.1(%rip), %rdi
	movl	$1, 24(%rsp)
	vmovdqa	%xmm0, (%rsp)
	vmovq	%xmm2, 16(%rsp)
	call	GOMP_parallel@PLT
.L252:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L259
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L258:
	.cfi_restore_state
	vpinsrd	$1, %ecx, %xmm1, %xmm1
	movl	%ecx, 32(%rsp)
	movq	%rsp, %rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	update_NORTH_SOUTH._omp_fn.0(%rip), %rdi
	movl	%eax, 24(%rsp)
	movl	$1, 28(%rsp)
	vmovdqa	%xmm0, (%rsp)
	vmovq	%xmm1, 16(%rsp)
	call	GOMP_parallel@PLT
	jmp	.L252
.L259:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6488:
	.size	update_NORTH_SOUTH, .-update_NORTH_SOUTH
	.p2align 4
	.globl	update_WEST_EAST
	.type	update_WEST_EAST, @function
update_WEST_EAST:
.LFB6489:
	.cfi_startproc
	endbr64
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movq	%rsi, %r10
	movl	8(%rdx), %esi
	vmovq	%rcx, %xmm3
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	vpinsrq	$1, (%rdx), %xmm3, %xmm0
	leal	2(%rsi), %eax
	vmovd	%eax, %xmm2
	vpinsrd	$1, 12(%rdx), %xmm2, %xmm1
	xorl	%edx, %edx
	movq	(%r9), %rax
	cmpl	$-2, 12(%r8)
	setne	%dl
	xorl	%ecx, %ecx
	cmpl	$-2, 8(%r8)
	setne	%cl
	testl	%edi, %edi
	je	.L261
	cmpl	$1, (%r10)
	je	.L268
.L261:
	movl	%ecx, 44(%rsp)
	leaq	update_WEST_EAST._omp_fn.1(%rip), %rdi
	xorl	%ecx, %ecx
	movl	%edx, 40(%rsp)
	xorl	%edx, %edx
	movl	%esi, 36(%rsp)
	movq	%rsp, %rsi
	movl	$1, 32(%rsp)
	movq	%rax, 16(%rsp)
	vmovq	%xmm1, 24(%rsp)
	vmovdqa	%xmm0, (%rsp)
	call	GOMP_parallel@PLT
.L262:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L269
	xorl	%eax, %eax
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L268:
	.cfi_restore_state
	movl	%ecx, 48(%rsp)
	leaq	update_WEST_EAST._omp_fn.0(%rip), %rdi
	xorl	%ecx, %ecx
	movl	%edx, 44(%rsp)
	xorl	%edx, %edx
	movl	%esi, 40(%rsp)
	movl	%esi, 32(%rsp)
	movq	%rsp, %rsi
	movl	$1, 36(%rsp)
	movq	%rax, 16(%rsp)
	vmovq	%xmm1, 24(%rsp)
	vmovdqa	%xmm0, (%rsp)
	call	GOMP_parallel@PLT
	jmp	.L262
.L269:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6489:
	.size	update_WEST_EAST, .-update_WEST_EAST
	.p2align 4
	.globl	update_plane
	.type	update_plane, @function
update_plane:
.LFB6490:
	.cfi_startproc
	endbr64
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%rcx, %rsi
	vmovq	(%rdx), %xmm0
	movl	12(%rdx), %ecx
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	movl	8(%rdx), %eax
	vpinsrq	$1, (%rsi), %xmm0, %xmm0
	xorl	%edx, %edx
	movq	%rsp, %rsi
	movl	%ecx, 24(%rsp)
	xorl	%ecx, %ecx
	vmovdqa	%xmm0, (%rsp)
	leal	2(%rax), %edi
	vmovd	%edi, %xmm0
	leaq	update_plane._omp_fn.0(%rip), %rdi
	vpinsrd	$1, %eax, %xmm0, %xmm0
	vmovq	%xmm0, 16(%rsp)
	call	GOMP_parallel@PLT
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L273
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L273:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6490:
	.size	update_plane, .-update_plane
	.p2align 4
	.globl	get_total_energy
	.type	get_total_energy, @function
get_total_energy:
.LFB6491:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%ecx, %ecx
	movq	%rsi, %rbx
	xorl	%edx, %edx
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	vmovq	8(%rdi), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	(%rdi), %rax
	movq	%rsp, %rsi
	leaq	get_total_energy._omp_fn.0(%rip), %rdi
	vmovq	%xmm0, 16(%rsp)
	movq	%rax, (%rsp)
	vmovd	%xmm0, %eax
	movq	$0x000000000, 8(%rsp)
	addl	$2, %eax
	movl	%eax, 24(%rsp)
	call	GOMP_parallel@PLT
	vmovsd	8(%rsp), %xmm0
	vmovsd	%xmm0, (%rbx)
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L277
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L277:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6491:
	.size	get_total_energy, .-get_total_energy
	.p2align 4
	.globl	simple_factorization
	.type	simple_factorization, @function
simple_factorization:
.LFB6494:
	.cfi_startproc
	endbr64
	cmpl	$2, %edi
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	jbe	.L279
	movl	%edi, %ebx
	movl	%edi, %ecx
	movl	$2, %ebp
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L280:
	xorl	%edx, %edx
	movl	%ecx, %eax
	divl	%ebp
	testl	%edx, %edx
	jne	.L283
	.p2align 4,,10
	.p2align 3
.L281:
	movl	%ecx, %eax
	xorl	%edx, %edx
	addl	$1, %edi
	divl	%ebp
	xorl	%edx, %edx
	movl	%eax, %ecx
	divl	%ebp
	testl	%edx, %edx
	je	.L281
.L283:
	leal	1(%rbp), %eax
	cmpl	%eax, %ebx
	je	.L282
	movl	%eax, %ebp
	jmp	.L280
	.p2align 4,,10
	.p2align 3
.L282:
	movl	%edi, (%rsi)
	movslq	%edi, %rdi
	salq	$2, %rdi
	call	malloc@PLT
	movl	$2, %ecx
	xorl	%edi, %edi
	movq	%rax, %r8
	.p2align 4,,10
	.p2align 3
.L285:
	xorl	%edx, %edx
	movl	%ebx, %eax
	leal	1(%rdi), %esi
	divl	%ecx
	movslq	%esi, %rsi
	testl	%edx, %edx
	jne	.L288
	.p2align 4,,10
	.p2align 3
.L286:
	movl	%ebx, %eax
	xorl	%edx, %edx
	movl	%ecx, -4(%r8,%rsi,4)
	movq	%rsi, %rdi
	divl	%ecx
	xorl	%edx, %edx
	addq	$1, %rsi
	movl	%eax, %ebx
	divl	%ecx
	testl	%edx, %edx
	je	.L286
.L288:
	cmpl	%ecx, %ebp
	leal	1(%rcx), %eax
	je	.L284
	movl	%eax, %ecx
	jmp	.L285
.L279:
	movl	$0, (%rsi)
	xorl	%edi, %edi
	call	malloc@PLT
	movq	%rax, %r8
.L284:
	movq	%r8, (%r12)
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6494:
	.size	simple_factorization, .-simple_factorization
	.p2align 4
	.globl	initialize_sources
	.type	initialize_sources, @function
initialize_sources:
.LFB6495:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%edi, %ebp
	xorl	%edi, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%r8d, %rbx
	movq	%rbx, %r15
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdx, 8(%rsp)
	movq	%r9, 24(%rsp)
	movl	%ebx, 20(%rsp)
	salq	$2, %rbx
	call	time@PLT
	movslq	%ebp, %rdi
	xorq	%rax, %rdi
	call	srand48@PLT
	movq	%rbx, %rdi
	call	malloc@PLT
	testl	%ebp, %ebp
	movq	%rax, %r14
	jne	.L300
	testl	%r15d, %r15d
	jle	.L301
	movq	%rax, %r15
	addq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L302:
	call	lrand48@PLT
	addq	$4, %r15
	cltd
	idivl	%r12d
	movl	%edx, -4(%r15)
	cmpq	%rbx, %r15
	jne	.L302
	movq	8(%rsp), %rax
	movl	20(%rsp), %esi
	xorl	%ecx, %ecx
	movq	%r14, %rdi
	leaq	ompi_mpi_int(%rip), %rdx
	movq	(%rax), %r8
	call	MPI_Bcast@PLT
	jmp	.L309
	.p2align 4,,10
	.p2align 3
.L300:
	movq	8(%rsp), %rax
	movl	20(%rsp), %r15d
	xorl	%ecx, %ecx
	movq	%r14, %rdi
	leaq	ompi_mpi_int(%rip), %rdx
	movq	(%rax), %r8
	movl	%r15d, %esi
	call	MPI_Bcast@PLT
	testl	%r15d, %r15d
	jle	.L305
	addq	%r14, %rbx
.L309:
	movq	%r14, %rax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L306:
	xorl	%ecx, %ecx
	cmpl	%ebp, (%rax)
	sete	%cl
	addq	$4, %rax
	addl	%ecx, %edx
	cmpq	%rbx, %rax
	jne	.L306
	movq	24(%rsp), %rax
	testl	%edx, %edx
	movl	%edx, (%rax)
	jg	.L317
.L304:
	movq	%r14, %rdi
	call	free@PLT
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L317:
	.cfi_restore_state
	movslq	%edx, %rbx
	salq	$3, %rbx
	movq	%rbx, %rdi
	call	malloc@PLT
	movq	%rax, %r12
	movq	%rax, %rbp
	addq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L308:
	call	lrand48@PLT
	movl	0(%r13), %ecx
	addq	$8, %rbp
	cqto
	idivq	%rcx
	addl	$1, %edx
	movl	%edx, -8(%rbp)
	call	lrand48@PLT
	movl	4(%r13), %ecx
	cqto
	idivq	%rcx
	addl	$1, %edx
	movl	%edx, -4(%rbp)
	cmpq	%rbp, %rbx
	jne	.L308
	movq	96(%rsp), %rax
	movq	%r12, (%rax)
	jmp	.L304
.L301:
	movq	8(%rsp), %rax
	movl	20(%rsp), %esi
	xorl	%ecx, %ecx
	movq	%r14, %rdi
	leaq	ompi_mpi_int(%rip), %rdx
	movq	(%rax), %r8
	call	MPI_Bcast@PLT
	movq	24(%rsp), %rax
	movl	$0, (%rax)
	jmp	.L304
.L305:
	movq	24(%rsp), %rax
	movl	$0, (%rax)
	jmp	.L304
	.cfi_endproc
.LFE6495:
	.size	initialize_sources, .-initialize_sources
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"buffers_ptr[EAST] allocation failed \n"
	.align 8
.LC9:
	.string	"buffers_ptr[WEST] allocation failed \n"
	.text
	.p2align 4
	.globl	memory_allocate
	.type	memory_allocate, @function
memory_allocate:
.LFB6496:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L334
	testq	%rcx, %rcx
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	je	.L322
	movl	8(%rcx), %eax
	movl	12(%rcx), %r14d
	movq	%rdi, %r13
	movq	%rdx, %r12
	leal	2(%rax), %ebx
	leal	2(%r14), %eax
	imull	%eax, %ebx
	salq	$3, %rbx
	movq	%rbx, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	movq	%rax, 0(%rbp)
	movq	%rax, %rdi
	je	.L322
	xorl	%esi, %esi
	movq	%rbx, %rcx
	movq	%rbx, %rdx
	call	__memset_chk@PLT
	movq	%rbx, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	movq	%rax, 16(%rbp)
	movq	%rax, %rdi
	je	.L322
	xorl	%esi, %esi
	movq	%rbx, %rcx
	movq	%rbx, %rdx
	sall	$3, %r14d
	call	__memset_chk@PLT
	cmpl	$-2, 8(%r13)
	jne	.L337
.L323:
	cmpl	$-2, 12(%r13)
	jne	.L325
.L326:
	xorl	%eax, %eax
.L318:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L325:
	.cfi_restore_state
	movslq	%r14d, %r14
	movq	%r14, %rdi
	call	malloc@PLT
	movq	%r14, %rdi
	movq	%rax, 24(%r12)
	movq	%rax, %rbx
	call	malloc@PLT
	orq	%rax, %rbx
	movq	%rax, 56(%r12)
	jne	.L326
	movq	stderr(%rip), %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
	call	fwrite@PLT
	jmp	.L324
	.p2align 4,,10
	.p2align 3
.L337:
	movslq	%r14d, %rbp
	movq	%rbp, %rdi
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, 16(%r12)
	movq	%rax, %rbx
	call	malloc@PLT
	orq	%rax, %rbx
	movq	%rax, 48(%r12)
	jne	.L323
	movq	stderr(%rip), %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	fwrite@PLT
.L324:
	movl	$1, %eax
	jmp	.L318
	.p2align 4,,10
	.p2align 3
.L322:
	popq	%rbx
	.cfi_def_cfa_offset 40
	movl	$-1, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L334:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE6496:
	.size	memory_allocate, .-memory_allocate
	.p2align 4
	.globl	memory_release
	.type	memory_release, @function
memory_release:
.LFB6497:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	testq	%rdi, %rdi
	je	.L340
	movq	%rdi, %rbp
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L341
	call	free@PLT
.L341:
	movq	16(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L340
	call	free@PLT
.L340:
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L343
	call	free@PLT
.L343:
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L344
	call	free@PLT
.L344:
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L345
	call	free@PLT
.L345:
	movq	56(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L346
	call	free@PLT
.L346:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6497:
	.size	memory_release, .-memory_release
	.section	.rodata.str1.8
	.align 8
.LC13:
	.ascii	"\nvalid options are ( values btw [] are the default values"
	.string	" ):\n-x    x size of the plate [10000]\n-y    y size of the plate [10000]\n-e    how many energy sources on the plate [4]\n-E    how many energy sources on the plate [1.0]\n-n    how many iterations [1000]\n-p    whether periodic boundaries applies  [0 = false]\n"
	.align 8
.LC14:
	.string	"option -%c requires an argument\n"
	.align 8
.LC15:
	.string	" -------- help unavailable ----------"
	.section	.rodata.str1.1
.LC16:
	.string	":hx:y:e:E:n:o:p:v:"
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Tasks are decomposed in a grid %d x %d\n\n"
	.align 8
.LC18:
	.string	"Task %4d :: \tgrid coordinates : %3d, %3d\n\tneighbours: N %4d    E %4d    S %4d    W %4d\n"
	.section	.rodata.str1.1
.LC19:
	.string	"error on memory_allocate"
.LC20:
	.string	"error on initialize_sources"
	.text
	.p2align 4
	.globl	initialize
	.type	initialize, @function
initialize:
.LFB6493:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	movl	%ecx, %r13d
	pushq	%r12
	.cfi_offset 12, -48
	movq	%r8, %r12
	pushq	%r10
	.cfi_offset 10, -56
	leaq	16(%rbp), %r10
	pushq	%rbx
	subq	$160, %rsp
	.cfi_offset 3, -64
	movq	(%r10), %rax
	movl	%esi, -92(%rbp)
	movq	40(%r10), %r11
	movq	24(%r10), %rsi
	movq	%rdi, -184(%rbp)
	movl	%edx, -140(%rbp)
	movq	32(%r10), %rdi
	movq	8(%r10), %rdx
	movq	%rax, -168(%rbp)
	movq	16(%r10), %rax
	movq	%r9, -88(%rbp)
	movq	%rdx, -104(%rbp)
	movq	%rax, -120(%rbp)
	movq	%rsi, -160(%rbp)
	movq	%rdi, -128(%rbp)
	movq	%r11, -112(%rbp)
	movq	48(%r10), %r8
	movq	72(%r10), %rbx
	movq	56(%r10), %r15
	movq	64(%r10), %r14
	movq	80(%r10), %rcx
	movq	%r8, -192(%rbp)
	movq	%r15, -200(%rbp)
	movq	%r14, -136(%rbp)
	movq	%rbx, -152(%rbp)
	movq	%rcx, -176(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	.LC10(%rip), %rax
	movl	$0, -96(%rbp)
	movq	%rax, (%r9)
	movq	.LC11(%rip), %rax
	movl	$0, (%rdx)
	movl	$4, (%r11)
	movl	$0, (%r8)
	movq	$0, (%r15)
	xorl	%r15d, %r15d
	movl	$1000, (%rdi)
	movq	%rax, (%r14)
	movl	$-2, %eax
	leaq	.LC16(%rip), %r14
	vmovd	%eax, %xmm0
	movq	$0, 8(%rbx)
	movq	$0, 24(%rbx)
	vpshufd	$0, %xmm0, %xmm0
	leaq	.L370(%rip), %rbx
	vmovdqu	%xmm0, (%rsi)
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%ymm0, (%rcx)
	vmovdqu	%ymm0, 32(%rcx)
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L442:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movl	%r13d, %edi
	call	getopt@PLT
	cmpl	$-1, %eax
	je	.L450
	subl	$58, %eax
	cmpl	$63, %eax
	ja	.L442
	movslq	(%rbx,%rax,4), %rax
	addq	%rbx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L370:
	.long	.L380-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L379-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L378-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L377-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L376-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L375-.L370
	.long	.L374-.L370
	.long	.L373-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L442-.L370
	.long	.L372-.L370
	.long	.L442-.L370
	.long	.L371-.L370
	.long	.L369-.L370
	.text
	.p2align 4,,10
	.p2align 3
.L369:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	-88(%rbp), %rcx
	movl	%eax, 4(%rcx)
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L371:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	-88(%rbp), %rcx
	movl	%eax, (%rcx)
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L372:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, -96(%rbp)
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L373:
	movq	optarg(%rip), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol@PLT
	movq	-104(%rbp), %rcx
	testl	%eax, %eax
	setg	%al
	movzbl	%al, %eax
	movl	%eax, (%rcx)
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L374:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	-120(%rbp), %rcx
	movl	%eax, (%rcx)
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L375:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	-128(%rbp), %rcx
	movl	%eax, (%rcx)
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L376:
	movl	-92(%rbp), %r11d
	movl	$1, %r15d
	testl	%r11d, %r11d
	jne	.L442
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L377:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	-112(%rbp), %rcx
	movl	%eax, (%rcx)
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L378:
	movq	optarg(%rip), %rdi
	xorl	%esi, %esi
	call	strtod@PLT
	movq	-136(%rbp), %rax
	vmovsd	%xmm0, (%rax)
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L379:
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L380:
	movl	optopt(%rip), %edx
	leaq	.LC14(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L442
	.p2align 4,,10
	.p2align 3
.L450:
	testl	%r15d, %r15d
	jne	.L386
	movq	-88(%rbp), %rax
	vxorps	%xmm2, %xmm2, %xmm2
	movl	(%rax), %ebx
	movl	4(%rax), %eax
	movq	%rax, %r12
	vcvtsi2sdq	%rax, %xmm2, %xmm1
	movl	%ebx, %eax
	cmpl	%r12d, %ebx
	vcvtsi2sdq	%rax, %xmm2, %xmm0
	jnb	.L451
	vdivsd	%xmm0, %xmm1, %xmm1
	movl	-140(%rbp), %ecx
	vcvttsd2sil	%xmm1, %eax
	addl	$1, %eax
	cmpl	%ecx, %eax
	jl	.L452
	movq	-168(%rbp), %rax
	movl	-140(%rbp), %ecx
	movl	$1, (%rax)
	movl	%ecx, 4(%rax)
.L403:
	movl	-92(%rbp), %r8d
	movl	-140(%rbp), %ecx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	movl	$1, %esi
	movl	%r8d, %r13d
.L408:
	cmpl	$1, %ecx
	jbe	.L402
	movq	-104(%rbp), %rax
	movl	(%rax), %r9d
	testl	%r9d, %r9d
	je	.L416
	movl	-140(%rbp), %ebx
	movl	-92(%rbp), %eax
	xorl	%edx, %edx
	leal	(%rbx,%rax), %r9d
	movl	%r9d, %eax
	subl	%esi, %eax
	divl	%ebx
	leal	(%r9,%rsi), %eax
	movl	%edx, %r10d
	xorl	%edx, %edx
	divl	%ebx
	movq	-160(%rbp), %rax
	vmovd	%r10d, %xmm4
	vpinsrd	$1, %edx, %xmm4, %xmm0
	vmovq	%xmm0, (%rax)
.L402:
	movq	-88(%rbp), %rbx
	xorl	%edx, %edx
	movl	(%rbx), %eax
	divl	%esi
	cmpl	%edx, %edi
	adcl	$0, %eax
	xorl	%edx, %edx
	movl	%eax, %edi
	movl	%eax, -64(%rbp)
	movl	4(%rbx), %eax
	movq	-152(%rbp), %rbx
	divl	%ecx
	movl	%edi, 8(%rbx)
	movl	%edi, 24(%rbx)
	cmpl	%edx, %r8d
	movl	-96(%rbp), %r8d
	adcl	$0, %eax
	testl	%r8d, %r8d
	movl	%eax, -60(%rbp)
	movl	%eax, 12(%rbx)
	movl	%eax, 28(%rbx)
	jle	.L424
	movl	-92(%rbp), %edi
	testl	%edi, %edi
	je	.L453
.L423:
	movq	-184(%rbp), %r14
	movq	(%r14), %rdi
	call	MPI_Barrier@PLT
	movl	-140(%rbp), %eax
	testl	%eax, %eax
	jle	.L424
	movl	%r12d, -88(%rbp)
	leaq	.LC18(%rip), %rbx
	movl	-92(%rbp), %r12d
	movl	%r13d, -104(%rbp)
	movq	%r14, %r13
	movl	%eax, %r14d
	jmp	.L426
	.p2align 4,,10
	.p2align 3
.L425:
	movq	0(%r13), %rdi
	addl	$1, %r15d
	call	MPI_Barrier@PLT
	cmpl	%r15d, %r14d
	je	.L424
.L426:
	cmpl	%r15d, %r12d
	jne	.L425
	subq	$8, %rsp
	movl	-104(%rbp), %r8d
	movl	%r12d, %edx
	movq	%rbx, %rsi
	movq	-160(%rbp), %rcx
	movl	$2, %edi
	movl	12(%rcx), %eax
	movl	(%rcx), %r9d
	pushq	%rax
	movl	4(%rcx), %eax
	pushq	%rax
	movl	8(%rcx), %eax
	movl	-88(%rbp), %ecx
	pushq	%rax
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	stdout(%rip), %rdi
	addq	$32, %rsp
	call	fflush@PLT
	jmp	.L425
.L451:
	vdivsd	%xmm1, %xmm0, %xmm1
	movl	-140(%rbp), %ecx
	vcvttsd2sil	%xmm1, %eax
	addl	$1, %eax
	cmpl	%ecx, %eax
	jl	.L454
	movl	-140(%rbp), %ecx
	movq	-168(%rbp), %rax
	xorl	%edx, %edx
	movl	%ecx, (%rax)
	movl	%ecx, %esi
	movl	$1, 4(%rax)
	movl	-92(%rbp), %eax
	divl	%ecx
	movl	%eax, %r8d
	movl	%eax, %r13d
	movl	%ecx, %eax
	movl	%edx, %edi
	cmpl	$1, %eax
	movl	%edx, %r12d
	movl	$1, %ecx
	jbe	.L455
.L401:
	movq	-104(%rbp), %rax
	movl	(%rax), %r10d
	testl	%r10d, %r10d
	jne	.L456
	movl	-92(%rbp), %ebx
	leal	-1(%rsi), %eax
	movl	$-2, %edx
	cmpl	%eax, %edi
	movl	$-2, %eax
	leal	1(%rbx), %r9d
	cmovnb	%eax, %r9d
	testl	%r12d, %r12d
	jle	.L414
	leal	-1(%rbx), %eax
	cltd
	idivl	-140(%rbp)
.L414:
	movq	-160(%rbp), %rax
	movl	%r9d, 8(%rax)
	movl	%edx, 12(%rax)
	jmp	.L408
	.p2align 4,,10
	.p2align 3
.L424:
	movq	-152(%rbp), %rcx
	movq	-176(%rbp), %rdx
	movq	-168(%rbp), %rsi
	movq	-160(%rbp), %rdi
	call	memory_allocate
	testl	%eax, %eax
	jne	.L457
	movq	-112(%rbp), %rax
	subq	$8, %rsp
	movl	-92(%rbp), %edi
	leaq	-64(%rbp), %rcx
	movq	-184(%rbp), %rdx
	movq	-192(%rbp), %r9
	movl	(%rax), %r8d
	movl	-140(%rbp), %esi
	pushq	-200(%rbp)
	call	initialize_sources
	popq	%rdx
	popq	%rcx
	testl	%eax, %eax
	jne	.L458
.L366:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L459
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%r10
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L457:
	.cfi_restore_state
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	movq	-176(%rbp), %rsi
	movq	-152(%rbp), %rdi
	call	memory_release
.L386:
	movl	$1, %eax
	jmp	.L366
.L456:
	movl	-92(%rbp), %ebx
	xorl	%edx, %edx
	leal	1(%rbx), %eax
	divl	%esi
	movl	%r8d, %eax
	imull	%esi, %eax
	testl	%edi, %edi
	leal	(%rdx,%rax), %r9d
	leal	-1(%rbx), %edx
	jne	.L414
	leal	1(%r13), %edx
	imull	%esi, %edx
	subl	$1, %edx
	jmp	.L414
.L416:
	movl	-92(%rbp), %ebx
	movl	$-2, %edx
	movq	-160(%rbp), %r11
	leal	-1(%rcx), %r9d
	movl	%ebx, %eax
	subl	%esi, %eax
	testl	%r13d, %r13d
	cmovle	%edx, %eax
	cmpl	%r9d, %r8d
	movl	%eax, (%r11)
	leal	(%rbx,%rsi), %eax
	cmovnb	%edx, %eax
	movl	%eax, 4(%r11)
	jmp	.L402
.L453:
	movl	%esi, %edx
	movl	$2, %edi
	leaq	.LC17(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	stdout(%rip), %rdi
	call	fflush@PLT
	jmp	.L423
.L454:
	movl	-140(%rbp), %edi
	leaq	-72(%rbp), %rdx
	leaq	-76(%rbp), %rsi
	vmovsd	%xmm1, -120(%rbp)
	call	simple_factorization
	movl	-76(%rbp), %eax
	vmovsd	-120(%rbp), %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	testl	%eax, %eax
	jle	.L396
.L428:
	movl	-140(%rbp), %edx
	vcvtsi2sdq	%rdx, %xmm2, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L396
	movq	-72(%rbp), %rdi
	subl	$1, %eax
	movl	$1, %ecx
	movl	-140(%rbp), %r9d
	leaq	(%rdi,%rax,4), %r8
	jmp	.L404
	.p2align 4,,10
	.p2align 3
.L460:
	xorl	%edx, %edx
	addq	$4, %rdi
	divl	%ecx
	vcvtsi2sdq	%rax, %xmm2, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L400
.L404:
	imull	(%rdi), %ecx
	xorl	%edx, %edx
	movl	%r9d, %eax
	divl	%ecx
	cmpq	%r8, %rdi
	movl	%eax, %esi
	jne	.L460
.L400:
	cmpl	%ebx, %r12d
	jb	.L407
	movl	%esi, %eax
	movl	%ecx, %esi
	movl	%eax, %ecx
.L407:
	movq	-168(%rbp), %rax
	vmovd	%esi, %xmm3
	xorl	%edx, %edx
	vpinsrd	$1, %ecx, %xmm3, %xmm0
	vmovq	%xmm0, (%rax)
	movl	-92(%rbp), %eax
	divl	%esi
	cmpl	$1, %esi
	movl	%edx, %edi
	movl	%edx, %r12d
	movl	%eax, %r8d
	movl	%eax, %r13d
	ja	.L401
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	jmp	.L408
.L452:
	movl	-140(%rbp), %edi
	leaq	-72(%rbp), %rdx
	leaq	-76(%rbp), %rsi
	vmovsd	%xmm1, -120(%rbp)
	call	simple_factorization
	movl	-76(%rbp), %eax
	vmovsd	-120(%rbp), %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	testl	%eax, %eax
	jg	.L428
	movl	$1, %eax
	vmovd	%eax, %xmm0
	movq	-168(%rbp), %rax
	vpinsrd	$1, -140(%rbp), %xmm0, %xmm0
	vmovq	%xmm0, (%rax)
	jmp	.L403
	.p2align 4,,10
	.p2align 3
.L458:
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
	jmp	.L386
.L455:
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	jmp	.L402
.L396:
	movl	-140(%rbp), %esi
	movl	$1, %ecx
	jmp	.L400
.L459:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6493:
	.size	initialize, .-initialize
	.section	.rodata.str1.1
.LC22:
	.string	" [ step %4d ] "
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"total injected energy is %g, system energy is %g ( in avg %g per grid point)\n\n\n"
	.text
	.p2align 4
	.globl	output_energy_stat
	.type	output_energy_stat, @function
output_energy_stat:
.LFB6498:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	vmovq	%xmm0, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%edi, %r13d
	leaq	get_total_energy._omp_fn.0(%rip), %rdi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rcx, %r12
	xorl	%ecx, %ecx
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%edx, %ebp
	xorl	%edx, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rsi, %rbx
	subq	$64, %rsp
	.cfi_def_cfa_offset 112
	vmovq	8(%rsi), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movq	(%rsi), %rax
	leaq	16(%rsp), %rsi
	movq	$0x000000000, (%rsp)
	vmovq	%xmm0, 32(%rsp)
	movq	%rax, 16(%rsp)
	vmovd	%xmm0, %eax
	movq	$0x000000000, 8(%rsp)
	addl	$2, %eax
	movq	$0x000000000, 24(%rsp)
	movl	%eax, 40(%rsp)
	call	GOMP_parallel@PLT
	leaq	8(%rsp), %rsi
	movq	%rsp, %rdi
	xorl	%r9d, %r9d
	vmovsd	24(%rsp), %xmm0
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	movl	$1, %edx
	leaq	ompi_mpi_op_sum(%rip), %r8
	leaq	ompi_mpi_double(%rip), %rcx
	vmovsd	%xmm0, 8(%rsp)
	pushq	(%r12)
	.cfi_def_cfa_offset 128
	call	MPI_Reduce@PLT
	testl	%ebp, %ebp
	popq	%rax
	.cfi_def_cfa_offset 120
	popq	%rdx
	.cfi_def_cfa_offset 112
	jne	.L462
	testl	%r13d, %r13d
	jns	.L468
.L463:
	movq	stdout(%rip), %rdi
	call	fflush@PLT
	movl	8(%rbx), %eax
	imull	12(%rbx), %eax
	vxorps	%xmm2, %xmm2, %xmm2
	vmovsd	8(%rsp), %xmm1
	vmovq	%r14, %xmm0
	movl	$2, %edi
	leaq	.LC23(%rip), %rsi
	vcvtsi2sdq	%rax, %xmm2, %xmm2
	movl	$3, %eax
	vdivsd	%xmm2, %xmm1, %xmm2
	call	__printf_chk@PLT
.L462:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L469
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L468:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC22(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L463
.L469:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6498:
	.size	output_energy_stat, .-output_energy_stat
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"MPI_thread level obtained is %d instead of %d\n"
	.align 8
.LC25:
	.string	"task %d is opting out with termination code %d\n"
	.section	.rodata.str1.1
.LC26:
	.string	"\riteration: %d"
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"data_parallel/%d_plane_%05d.bin"
	.align 8
.LC28:
	.string	"Error in dump_status. Exit with %d\n"
	.section	.rodata.str1.1
.LC29:
	.string	"\n\nResults:"
	.section	.rodata.str1.8
	.align 8
.LC30:
	.string	"time total:                        %f\n"
	.align 8
.LC31:
	.string	"time for filling buffers:          %f\n"
	.align 8
.LC32:
	.string	"time for update planes:            %f\n"
	.align 8
.LC33:
	.string	"time for waiting EAST  and WEST:   %f\n"
	.align 8
.LC34:
	.string	"time for update  EAST  and WEST:   %f\n"
	.align 8
.LC35:
	.string	"time for waiting NORTH and SOUTH:  %f\n"
	.align 8
.LC36:
	.string	"time for update  NORTH and SOUTH:  %f\n"
	.align 8
.LC37:
	.string	"time for handle borders:           %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6492:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movl	$1, %edx
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$800, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%edi, -628(%rbp)
	leaq	-628(%rbp), %rdi
	movq	%rsi, -640(%rbp)
	leaq	-640(%rbp), %rsi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	-464(%rbp), %rax
	movq	%rax, %rcx
	movq	%rax, -648(%rbp)
	call	MPI_Init_thread@PLT
	movl	-464(%rbp), %edx
	testl	%edx, %edx
	jle	.L552
	leaq	ompi_mpi_comm_world(%rip), %rbx
	leaq	-620(%rbp), %rsi
	movq	%rbx, %rdi
	leaq	-592(%rbp), %r14
	call	MPI_Comm_rank@PLT
	leaq	-616(%rbp), %rsi
	movq	%rbx, %rdi
	call	MPI_Comm_size@PLT
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movq	%r14, -832(%rbp)
	call	MPI_Comm_dup@PLT
	subq	$8, %rsp
	movq	%r14, %rdi
	leaq	-224(%rbp), %rax
	movq	%rax, -712(%rbp)
	movq	-640(%rbp), %r8
	leaq	-368(%rbp), %r9
	movl	-628(%rbp), %ecx
	movl	-616(%rbp), %edx
	pushq	%rax
	leaq	-336(%rbp), %rax
	movq	%rax, -824(%rbp)
	movl	-620(%rbp), %esi
	pushq	%rax
	leaq	-576(%rbp), %rax
	pushq	%rax
	leaq	-584(%rbp), %rax
	pushq	%rax
	leaq	-600(%rbp), %rax
	pushq	%rax
	leaq	-604(%rbp), %rax
	pushq	%rax
	leaq	-612(%rbp), %rax
	pushq	%rax
	leaq	-352(%rbp), %rax
	pushq	%rax
	leaq	-596(%rbp), %rax
	pushq	%rax
	leaq	-608(%rbp), %rax
	pushq	%rax
	leaq	-360(%rbp), %rax
	pushq	%rax
	call	initialize
	addq	$96, %rsp
	testl	%eax, %eax
	movl	%eax, -632(%rbp)
	jne	.L553
	call	MPI_Wtime@PLT
	movl	-612(%rbp), %eax
	vmovsd	-576(%rbp), %xmm5
	movq	$0x000000000, -560(%rbp)
	movl	-604(%rbp), %ebx
	movq	$0x000000000, -552(%rbp)
	testl	%eax, %eax
	movq	$0x000000000, -544(%rbp)
	movq	$0x000000000, -536(%rbp)
	movq	$0x000000000, -528(%rbp)
	movq	$0x000000000, -520(%rbp)
	movl	%eax, -772(%rbp)
	movl	%ebx, -776(%rbp)
	vmovsd	%xmm0, -568(%rbp)
	vmovsd	%xmm5, -760(%rbp)
	jle	.L474
	movq	-584(%rbp), %rax
	movl	-340(%rbp), %edx
	movl	%ebx, -764(%rbp)
	movl	-352(%rbp), %r11d
	movl	-348(%rbp), %r10d
	movq	%rax, -784(%rbp)
	movl	-600(%rbp), %eax
	movl	%r10d, -816(%rbp)
	movl	%eax, -788(%rbp)
	movl	-608(%rbp), %eax
	movl	%r11d, -812(%rbp)
	movl	%eax, -668(%rbp)
	movl	-344(%rbp), %eax
	movl	%edx, -716(%rbp)
	cmpl	$-2, %eax
	movl	%eax, -720(%rbp)
	setne	%sil
	cmpl	$-2, %edx
	setne	%cl
	orl	%ecx, %esi
	movl	-596(%rbp), %ecx
	movb	%sil, -789(%rbp)
	movl	%ecx, -768(%rbp)
	xorl	%ecx, %ecx
	cmpl	$-2, %edx
	sete	%cl
	movl	%ecx, -796(%rbp)
	xorl	%ecx, %ecx
	cmpl	$-2, %eax
	sete	%cl
	movl	%ecx, -800(%rbp)
	xorl	%ecx, %ecx
	cmpl	$-2, %r11d
	sete	%cl
	movl	%ecx, -804(%rbp)
	xorl	%ecx, %ecx
	cmpl	$-2, %r10d
	sete	%cl
	cmpl	$-2, %r11d
	setne	%sil
	cmpl	$-2, %r10d
	movl	-620(%rbp), %r10d
	movl	%ecx, -808(%rbp)
	setne	%cl
	xorl	%r9d, %r9d
	xorl	%ebx, %ebx
	orl	%ecx, %esi
	testl	%r10d, %r10d
	movq	%rbx, -704(%rbp)
	movb	%sil, -790(%rbp)
	movl	%r9d, -672(%rbp)
	je	.L554
	.p2align 4,,10
	.p2align 3
.L475:
	movq	-704(%rbp), %rax
	movl	-668(%rbp), %r9d
	vpbroadcastq	.LC38(%rip), %ymm0
	salq	$4, %rax
	testl	%r9d, %r9d
	movl	-328(%rbp,%rax), %r14d
	movq	-336(%rbp,%rax), %r12
	vmovdqa	%ymm0, -304(%rbp)
	movl	-324(%rbp,%rax), %r13d
	vmovdqa	%ymm0, -272(%rbp)
	leal	2(%r14), %ebx
	vmovq	%r12, %xmm1
	vmovd	%ebx, %xmm4
	vpunpcklqdq	%xmm1, %xmm1, %xmm7
	vpinsrd	$1, %r14d, %xmm4, %xmm3
	vpinsrd	$1, %r13d, %xmm4, %xmm5
	vmovdqa	%xmm7, -688(%rbp)
	vmovq	%xmm3, -664(%rbp)
	vmovq	%xmm5, -696(%rbp)
	je	.L476
	xorl	%eax, %eax
	cmpl	$1, -360(%rbp)
	vmovd	%r13d, %xmm4
	vmovsd	-760(%rbp), %xmm5
	sete	%al
	movq	%r12, -448(%rbp)
	movq	-648(%rbp), %rsi
	leaq	inject_energy._omp_fn.0(%rip), %rdi
	vpinsrd	$1, %eax, %xmm4, %xmm0
	xorl	%eax, %eax
	cmpl	$1, -356(%rbp)
	vmovsd	%xmm5, -456(%rbp)
	sete	%al
	vpunpcklqdq	%xmm0, %xmm3, %xmm0
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	%eax, -420(%rbp)
	movq	-784(%rbp), %rax
	vmovdqu	%xmm0, -436(%rbp)
	movq	%rax, -464(%rbp)
	movl	-788(%rbp), %eax
	movl	%eax, -440(%rbp)
	vzeroupper
	call	GOMP_parallel@PLT
.L477:
	call	MPI_Wtime@PLT
	leal	3(%r14), %eax
	movl	$8, %ecx
	leaq	(%r12,%rax,8), %rax
	vmovsd	%xmm0, -656(%rbp)
	vmovq	%rcx, %xmm0
	movq	%rax, -224(%rbp)
	movl	%ebx, %eax
	imull	%r13d, %eax
	leal	1(%rax), %edx
	leal	1(%rax,%rbx), %eax
	salq	$3, %rax
	leaq	(%r12,%rdx,8), %rdx
	cmpl	$-2, -716(%rbp)
	vpinsrq	$1, %rax, %xmm0, %xmm0
	vpaddq	-688(%rbp), %xmm0, %xmm0
	movq	%rdx, -216(%rbp)
	vmovdqa	%xmm0, -192(%rbp)
	je	.L478
	movq	-696(%rbp), %rax
	movq	-648(%rbp), %rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	main._omp_fn.0(%rip), %rdi
	movq	%r12, -456(%rbp)
	movq	%rax, -448(%rbp)
	movq	-712(%rbp), %rax
	movq	%rax, -464(%rbp)
	call	GOMP_parallel@PLT
.L478:
	cmpl	$-2, -720(%rbp)
	je	.L479
	movq	-664(%rbp), %rax
	movq	-648(%rbp), %rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	main._omp_fn.1(%rip), %rdi
	movq	%r12, -456(%rbp)
	movq	%rax, -448(%rbp)
	movq	-712(%rbp), %rax
	movl	%r13d, -440(%rbp)
	movq	%rax, -464(%rbp)
	call	GOMP_parallel@PLT
.L479:
	call	MPI_Wtime@PLT
	movl	-812(%rbp), %r15d
	vsubsd	-656(%rbp), %xmm0, %xmm0
	vaddsd	-560(%rbp), %xmm0, %xmm0
	cmpl	$-2, %r15d
	movl	%r15d, %ecx
	vmovsd	%xmm0, -560(%rbp)
	je	.L480
	subq	$8, %rsp
	xorl	%r8d, %r8d
	movl	%r14d, %esi
	movq	-592(%rbp), %r9
	leaq	-272(%rbp), %rax
	movq	-192(%rbp), %rdi
	leaq	ompi_mpi_double(%rip), %rdx
	pushq	%rax
	leaq	-304(%rbp), %rbx
	call	MPI_Irecv@PLT
	movq	%rbx, (%rsp)
	movl	%r15d, %ecx
	movl	%r14d, %esi
	movq	-224(%rbp), %rdi
	movq	-592(%rbp), %r9
	movl	$1, %r8d
	leaq	ompi_mpi_double(%rip), %rdx
	call	MPI_Isend@PLT
	popq	%rdi
	popq	%r8
.L480:
	movl	-816(%rbp), %ebx
	cmpl	$-2, %ebx
	movl	%ebx, %ecx
	je	.L481
	subq	$8, %rsp
	movl	$1, %r8d
	movl	%r14d, %esi
	movq	-592(%rbp), %r9
	leaq	-264(%rbp), %rax
	movq	-184(%rbp), %rdi
	leaq	ompi_mpi_double(%rip), %rdx
	pushq	%rax
	call	MPI_Irecv@PLT
	movl	%ebx, %ecx
	movl	%r14d, %esi
	xorl	%r8d, %r8d
	leaq	-296(%rbp), %rax
	movq	-592(%rbp), %r9
	movq	-216(%rbp), %rdi
	leaq	ompi_mpi_double(%rip), %rdx
	movq	%rax, (%rsp)
	call	MPI_Isend@PLT
	popq	%rcx
	popq	%rsi
.L481:
	movl	-720(%rbp), %ebx
	cmpl	$-2, %ebx
	movl	%ebx, %ecx
	je	.L482
	subq	$8, %rsp
	movl	$2, %r8d
	movl	%r13d, %esi
	movq	-592(%rbp), %r9
	leaq	-256(%rbp), %rax
	movq	-176(%rbp), %rdi
	leaq	ompi_mpi_double(%rip), %rdx
	pushq	%rax
	call	MPI_Irecv@PLT
	leaq	-288(%rbp), %rax
	movl	%ebx, %ecx
	movq	-592(%rbp), %r9
	movq	%rax, (%rsp)
	movq	-208(%rbp), %rdi
	leaq	ompi_mpi_double(%rip), %rdx
	movl	%r13d, %esi
	movl	$3, %r8d
	call	MPI_Isend@PLT
	popq	%rax
	popq	%rdx
.L482:
	movl	-716(%rbp), %ebx
	cmpl	$-2, %ebx
	movl	%ebx, %ecx
	je	.L483
	subq	$8, %rsp
	movl	$3, %r8d
	movl	%r13d, %esi
	movq	-592(%rbp), %r9
	leaq	-248(%rbp), %rax
	movq	-168(%rbp), %rdi
	leaq	ompi_mpi_double(%rip), %rdx
	pushq	%rax
	call	MPI_Irecv@PLT
	movl	%ebx, %ecx
	movl	$2, %r8d
	movl	%r13d, %esi
	leaq	-280(%rbp), %rax
	movq	-592(%rbp), %r9
	movq	-200(%rbp), %rdi
	leaq	ompi_mpi_double(%rip), %rdx
	movq	%rax, (%rsp)
	call	MPI_Isend@PLT
	popq	%rbx
	popq	%r15
.L483:
	call	MPI_Wtime@PLT
	xorl	$1, -632(%rbp)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movslq	-632(%rbp), %rax
	vmovq	%r12, %xmm6
	vmovapd	.LC6(%rip), %ymm7
	movl	%r13d, -376(%rbp)
	vmovapd	.LC7(%rip), %ymm1
	movq	-648(%rbp), %rsi
	vmovsd	%xmm0, -656(%rbp)
	leaq	update_center._omp_fn.0(%rip), %rdi
	movq	%rax, -704(%rbp)
	salq	$4, %rax
	movq	-336(%rbp,%rax), %rax
	vmovapd	%ymm7, -432(%rbp)
	vmovapd	%ymm1, -464(%rbp)
	vpinsrq	$1, %rax, %xmm6, %xmm2
	movq	%rax, -728(%rbp)
	movq	-664(%rbp), %rax
	vmovdqa	%xmm2, -752(%rbp)
	movq	%rax, -384(%rbp)
	vmovdqa	%xmm2, -400(%rbp)
	vzeroupper
	call	GOMP_parallel@PLT
	call	MPI_Wtime@PLT
	vsubsd	-656(%rbp), %xmm0, %xmm0
	vaddsd	-552(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -552(%rbp)
	call	MPI_Wtime@PLT
	cmpb	$0, -789(%rbp)
	movl	$0, -472(%rbp)
	movl	-800(%rbp), %r8d
	movl	-796(%rbp), %r15d
	vmovsd	%xmm0, -736(%rbp)
	je	.L489
	movq	%r12, -688(%rbp)
	movl	%r15d, %r12d
	movl	%r8d, %r15d
	jmp	.L484
	.p2align 4,,10
	.p2align 3
.L487:
	testl	%r15d, %r15d
	jne	.L550
	xorl	%ebx, %ebx
	leaq	-472(%rbp), %rsi
.L510:
	xorl	%edx, %edx
	leaq	-256(%rbp), %rdi
	xorl	%r15d, %r15d
	call	MPI_Test@PLT
	movl	-472(%rbp), %r9d
	testl	%r9d, %r9d
	sete	%al
	setne	%r15b
	movzbl	%al, %eax
	orl	%ebx, %eax
	je	.L550
.L484:
	testl	%r12d, %r12d
	jne	.L487
	leaq	-248(%rbp), %rbx
	leaq	-472(%rbp), %rsi
	xorl	%edx, %edx
	xorl	%r12d, %r12d
	movq	%rbx, %rdi
	movq	%rsi, -656(%rbp)
	call	MPI_Test@PLT
	movl	-472(%rbp), %eax
	movq	-656(%rbp), %rsi
	testl	%eax, %eax
	setne	%r12b
	testl	%r15d, %r15d
	je	.L488
	movl	%r12d, %r15d
	movq	-688(%rbp), %rax
	movq	%rsi, %r12
	testl	%r15d, %r15d
	movq	%rax, -656(%rbp)
	jne	.L546
.L555:
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	xorl	%r15d, %r15d
	call	MPI_Test@PLT
	movl	-472(%rbp), %r10d
	testl	%r10d, %r10d
	setne	%r15b
	testl	%r15d, %r15d
	je	.L555
.L546:
	movq	-656(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L489:
	call	MPI_Wtime@PLT
	vsubsd	-736(%rbp), %xmm0, %xmm0
	vaddsd	-544(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -544(%rbp)
	call	MPI_Wtime@PLT
	xorl	%eax, %eax
	movl	-668(%rbp), %r11d
	cmpl	$-2, -340(%rbp)
	setne	%al
	xorl	%edx, %edx
	cmpl	$-2, -344(%rbp)
	vmovsd	%xmm0, -656(%rbp)
	setne	%dl
	testl	%r11d, %r11d
	je	.L486
	cmpl	$1, -360(%rbp)
	je	.L556
.L486:
	movl	%eax, -424(%rbp)
	movq	-728(%rbp), %rax
	xorl	%ecx, %ecx
	leaq	update_WEST_EAST._omp_fn.1(%rip), %rdi
	movq	-648(%rbp), %rsi
	movl	%edx, -420(%rbp)
	xorl	%edx, %edx
	movq	%rax, -448(%rbp)
	movq	-696(%rbp), %rax
	movl	%r14d, -428(%rbp)
	movq	%rax, -440(%rbp)
	movq	-712(%rbp), %rax
	movl	$1, -432(%rbp)
	movq	%r12, -456(%rbp)
	movq	%rax, -464(%rbp)
	call	GOMP_parallel@PLT
.L491:
	call	MPI_Wtime@PLT
	vsubsd	-656(%rbp), %xmm0, %xmm0
	vaddsd	-536(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -536(%rbp)
	call	MPI_Wtime@PLT
	cmpb	$0, -790(%rbp)
	movl	$0, -472(%rbp)
	movl	-808(%rbp), %r15d
	movl	-804(%rbp), %r12d
	vmovsd	%xmm0, -688(%rbp)
	je	.L497
	movl	%r13d, -656(%rbp)
	movl	%r12d, %r13d
	movl	%r15d, %r12d
	jmp	.L492
	.p2align 4,,10
	.p2align 3
.L495:
	testl	%r12d, %r12d
	jne	.L551
	xorl	%ebx, %ebx
	leaq	-472(%rbp), %r15
.L509:
	xorl	%edx, %edx
	movq	%r15, %rsi
	leaq	-264(%rbp), %rdi
	xorl	%r12d, %r12d
	call	MPI_Test@PLT
	movl	-472(%rbp), %esi
	testl	%esi, %esi
	sete	%al
	setne	%r12b
	movzbl	%al, %eax
	orl	%ebx, %eax
	je	.L551
.L492:
	testl	%r13d, %r13d
	jne	.L495
	leaq	-472(%rbp), %r15
	leaq	-272(%rbp), %rbx
	xorl	%edx, %edx
	xorl	%r13d, %r13d
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	MPI_Test@PLT
	movl	-472(%rbp), %eax
	testl	%eax, %eax
	setne	%r13b
	testl	%r12d, %r12d
	je	.L496
	movl	%r13d, %r12d
	movl	-656(%rbp), %r13d
	testl	%r12d, %r12d
	jne	.L497
.L557:
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	xorl	%r12d, %r12d
	call	MPI_Test@PLT
	movl	-472(%rbp), %edi
	testl	%edi, %edi
	setne	%r12b
	testl	%r12d, %r12d
	je	.L557
	.p2align 4,,10
	.p2align 3
.L497:
	call	MPI_Wtime@PLT
	vsubsd	-688(%rbp), %xmm0, %xmm0
	vaddsd	-528(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -528(%rbp)
	call	MPI_Wtime@PLT
	movl	-668(%rbp), %r8d
	vmovsd	%xmm0, -656(%rbp)
	testl	%r8d, %r8d
	je	.L494
	cmpl	$1, -356(%rbp)
	je	.L558
.L494:
	vmovdqa	-752(%rbp), %xmm3
	movq	-664(%rbp), %rax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	-648(%rbp), %rsi
	leaq	update_NORTH_SOUTH._omp_fn.1(%rip), %rdi
	movl	%r13d, -436(%rbp)
	movl	$1, -440(%rbp)
	movq	%rax, -448(%rbp)
	vmovdqa	%xmm3, -464(%rbp)
	call	GOMP_parallel@PLT
.L499:
	call	MPI_Wtime@PLT
	movl	-768(%rbp), %ecx
	vsubsd	-656(%rbp), %xmm0, %xmm0
	vaddsd	-520(%rbp), %xmm0, %xmm0
	movl	-672(%rbp), %eax
	testl	%ecx, %ecx
	leal	1(%rax), %r13d
	vmovsd	%xmm0, -520(%rbp)
	jne	.L559
.L501:
	movl	-776(%rbp), %edx
	addl	%edx, -764(%rbp)
	cmpl	%r13d, -772(%rbp)
	je	.L474
	movl	-620(%rbp), %r10d
	movl	%r13d, -672(%rbp)
	testl	%r10d, %r10d
	jne	.L475
.L554:
	movl	-672(%rbp), %edx
	leaq	.LC26(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	stdout(%rip), %rdi
	call	fflush@PLT
	jmp	.L475
	.p2align 4,,10
	.p2align 3
.L476:
	movq	-784(%rbp), %rax
	movl	%ebx, -436(%rbp)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	vmovsd	-760(%rbp), %xmm6
	movq	%r12, -448(%rbp)
	leaq	inject_energy._omp_fn.1(%rip), %rdi
	movq	%rax, -464(%rbp)
	movl	-788(%rbp), %eax
	movq	-648(%rbp), %rsi
	vmovsd	%xmm6, -456(%rbp)
	movl	%eax, -440(%rbp)
	vzeroupper
	call	GOMP_parallel@PLT
	jmp	.L477
	.p2align 4,,10
	.p2align 3
.L559:
	vxorpd	%xmm7, %xmm7, %xmm7
	movq	-704(%rbp), %rbx
	movq	-824(%rbp), %rax
	vcvtsi2sdl	-764(%rbp), %xmm7, %xmm0
	vmulsd	-760(%rbp), %xmm0, %xmm0
	movl	-672(%rbp), %r14d
	salq	$4, %rbx
	movq	-832(%rbp), %rcx
	movl	-620(%rbp), %edx
	leaq	(%rax,%rbx), %rsi
	movl	%r14d, %edi
	call	output_energy_stat
	cmpl	$1, -768(%rbp)
	jle	.L501
	xorl	%eax, %eax
	movl	%r14d, %r9d
	movl	$100, %edx
	movl	$2, %esi
	movl	-620(%rbp), %r8d
	leaq	-160(%rbp), %r12
	leaq	.LC27(%rip), %rcx
	movq	%r12, %rdi
	call	__sprintf_chk@PLT
	cmpb	$0, -160(%rbp)
	movl	$1, %ecx
	jne	.L560
.L503:
	movq	stderr(%rip), %rdi
	leaq	.LC28(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L501
	.p2align 4,,10
	.p2align 3
.L550:
	movq	-688(%rbp), %r12
	jmp	.L489
	.p2align 4,,10
	.p2align 3
.L551:
	movl	-656(%rbp), %r13d
	jmp	.L497
	.p2align 4,,10
	.p2align 3
.L556:
	movl	%eax, -420(%rbp)
	movq	-728(%rbp), %rax
	xorl	%ecx, %ecx
	leaq	update_WEST_EAST._omp_fn.0(%rip), %rdi
	movq	-648(%rbp), %rsi
	movl	%edx, -416(%rbp)
	xorl	%edx, %edx
	movq	%rax, -448(%rbp)
	movq	-696(%rbp), %rax
	movl	%r14d, -424(%rbp)
	movq	%rax, -440(%rbp)
	movq	-712(%rbp), %rax
	movl	$1, -428(%rbp)
	movq	%r12, -456(%rbp)
	movl	%r14d, -432(%rbp)
	movq	%rax, -464(%rbp)
	call	GOMP_parallel@PLT
	jmp	.L491
	.p2align 4,,10
	.p2align 3
.L558:
	vmovdqa	-752(%rbp), %xmm4
	movq	-696(%rbp), %rax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	-648(%rbp), %rsi
	leaq	update_NORTH_SOUTH._omp_fn.0(%rip), %rdi
	movl	%r13d, -432(%rbp)
	movl	$1, -436(%rbp)
	movl	%r14d, -440(%rbp)
	movq	%rax, -448(%rbp)
	vmovdqa	%xmm4, -464(%rbp)
	call	GOMP_parallel@PLT
	jmp	.L499
.L474:
	call	MPI_Wtime@PLT
	vsubsd	-568(%rbp), %xmm0, %xmm0
	cmpl	$0, -620(%rbp)
	movq	$0x000000000, -512(%rbp)
	movq	$0x000000000, -504(%rbp)
	movq	$0x000000000, -496(%rbp)
	movq	$0x000000000, -488(%rbp)
	movq	$0x000000000, -480(%rbp)
	movq	$0x000000000, -472(%rbp)
	movq	$0x000000000, -464(%rbp)
	vmovsd	%xmm0, -568(%rbp)
	je	.L561
	pushq	%rax
	leaq	-568(%rbp), %rdi
	xorl	%r9d, %r9d
	movl	$1, %edx
	pushq	-592(%rbp)
	leaq	ompi_mpi_op_sum(%rip), %r8
	leaq	ompi_mpi_double(%rip), %rcx
	xorl	%esi, %esi
	call	MPI_Reduce@PLT
	popq	%rdx
	pushq	-592(%rbp)
	xorl	%r9d, %r9d
	leaq	-560(%rbp), %rdi
	leaq	ompi_mpi_op_sum(%rip), %r8
	movl	$1, %edx
	xorl	%esi, %esi
	leaq	ompi_mpi_double(%rip), %rcx
	call	MPI_Reduce@PLT
	popq	%rcx
	pushq	-592(%rbp)
	xorl	%r9d, %r9d
	leaq	-552(%rbp), %rdi
	leaq	ompi_mpi_op_sum(%rip), %r8
	movl	$1, %edx
	xorl	%esi, %esi
	leaq	ompi_mpi_double(%rip), %rcx
	call	MPI_Reduce@PLT
	popq	%rsi
	pushq	-592(%rbp)
	xorl	%r9d, %r9d
	leaq	-544(%rbp), %rdi
	leaq	ompi_mpi_op_sum(%rip), %r8
	movl	$1, %edx
	xorl	%esi, %esi
	leaq	ompi_mpi_double(%rip), %rcx
	call	MPI_Reduce@PLT
	popq	%r8
	pushq	-592(%rbp)
	xorl	%r9d, %r9d
	leaq	-536(%rbp), %rdi
	leaq	ompi_mpi_op_sum(%rip), %r8
	movl	$1, %edx
	xorl	%esi, %esi
	leaq	ompi_mpi_double(%rip), %rcx
	call	MPI_Reduce@PLT
	popq	%r9
	pushq	-592(%rbp)
	xorl	%r9d, %r9d
	leaq	-528(%rbp), %rdi
	leaq	ompi_mpi_op_sum(%rip), %r8
	movl	$1, %edx
	xorl	%esi, %esi
	leaq	ompi_mpi_double(%rip), %rcx
	call	MPI_Reduce@PLT
	popq	%r10
	pushq	-592(%rbp)
	xorl	%r9d, %r9d
	leaq	-520(%rbp), %rdi
	leaq	ompi_mpi_op_sum(%rip), %r8
	movl	$1, %edx
	xorl	%esi, %esi
	leaq	ompi_mpi_double(%rip), %rcx
	call	MPI_Reduce@PLT
	popq	%r11
	popq	%rbx
.L507:
	cmpl	$0, -620(%rbp)
	je	.L562
.L508:
	movl	-776(%rbp), %ecx
	movl	-772(%rbp), %eax
	orl	$-1, %edi
	vxorpd	%xmm6, %xmm6, %xmm6
	movl	-632(%rbp), %esi
	movq	-824(%rbp), %rbx
	imull	%ecx, %eax
	movl	-620(%rbp), %edx
	movq	-832(%rbp), %rcx
	xorl	$1, %esi
	movslq	%esi, %rsi
	vcvtsi2sdl	%eax, %xmm6, %xmm0
	vmulsd	-760(%rbp), %xmm0, %xmm0
	salq	$4, %rsi
	addq	%rbx, %rsi
	call	output_energy_stat
	movq	-712(%rbp), %rsi
	movq	%rbx, %rdi
	call	memory_release
	call	MPI_Finalize@PLT
.L473:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L563
	leaq	-48(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L561:
	.cfi_restore_state
	pushq	%r12
	leaq	-512(%rbp), %rsi
	xorl	%r9d, %r9d
	leaq	-568(%rbp), %rdi
	pushq	-592(%rbp)
	leaq	ompi_mpi_op_sum(%rip), %r8
	movl	$1, %edx
	leaq	ompi_mpi_double(%rip), %rcx
	call	MPI_Reduce@PLT
	popq	%r13
	pushq	-592(%rbp)
	xorl	%r9d, %r9d
	leaq	-504(%rbp), %rsi
	leaq	-560(%rbp), %rdi
	movl	$1, %edx
	leaq	ompi_mpi_op_sum(%rip), %r8
	leaq	ompi_mpi_double(%rip), %rcx
	call	MPI_Reduce@PLT
	popq	%r14
	pushq	-592(%rbp)
	xorl	%r9d, %r9d
	leaq	-496(%rbp), %rsi
	leaq	-552(%rbp), %rdi
	movl	$1, %edx
	leaq	ompi_mpi_op_sum(%rip), %r8
	leaq	ompi_mpi_double(%rip), %rcx
	call	MPI_Reduce@PLT
	popq	%r15
	pushq	-592(%rbp)
	xorl	%r9d, %r9d
	leaq	-488(%rbp), %rsi
	leaq	-544(%rbp), %rdi
	movl	$1, %edx
	leaq	ompi_mpi_op_sum(%rip), %r8
	leaq	ompi_mpi_double(%rip), %rcx
	call	MPI_Reduce@PLT
	popq	%rax
	pushq	-592(%rbp)
	xorl	%r9d, %r9d
	leaq	-480(%rbp), %rsi
	leaq	-536(%rbp), %rdi
	movl	$1, %edx
	leaq	ompi_mpi_op_sum(%rip), %r8
	leaq	ompi_mpi_double(%rip), %rcx
	call	MPI_Reduce@PLT
	popq	%rax
	pushq	-592(%rbp)
	xorl	%r9d, %r9d
	leaq	-472(%rbp), %rsi
	leaq	-528(%rbp), %rdi
	movl	$1, %edx
	leaq	ompi_mpi_op_sum(%rip), %r8
	leaq	ompi_mpi_double(%rip), %rcx
	call	MPI_Reduce@PLT
	popq	%rax
	pushq	-592(%rbp)
	xorl	%r9d, %r9d
	movq	-648(%rbp), %rsi
	movl	$1, %edx
	leaq	-520(%rbp), %rdi
	leaq	ompi_mpi_op_sum(%rip), %r8
	leaq	ompi_mpi_double(%rip), %rcx
	call	MPI_Reduce@PLT
	popq	%rax
	popq	%rdx
	jmp	.L507
.L560:
	movq	-824(%rbp), %rax
	movq	-728(%rbp), %rdi
	movq	%r12, %rdx
	leaq	8(%rax,%rbx), %rsi
	call	dump.part.0
	testl	%eax, %eax
	movl	%eax, %ecx
	je	.L501
	jmp	.L503
.L553:
	movl	-620(%rbp), %edx
	movl	%eax, %ecx
	movl	$2, %edi
	xorl	%eax, %eax
	leaq	.LC25(%rip), %rsi
	call	__printf_chk@PLT
	call	MPI_Finalize@PLT
	jmp	.L473
.L562:
	leaq	.LC29(%rip), %rdi
	call	puts@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-512(%rbp), %xmm0
	vcvtsi2sdl	-616(%rbp), %xmm2, %xmm1
	leaq	.LC30(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	movl	$10, %edi
	call	putchar@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-504(%rbp), %xmm0
	vcvtsi2sdl	-616(%rbp), %xmm2, %xmm1
	leaq	.LC31(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-496(%rbp), %xmm0
	vcvtsi2sdl	-616(%rbp), %xmm2, %xmm1
	leaq	.LC32(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	movl	$10, %edi
	call	putchar@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-488(%rbp), %xmm0
	vcvtsi2sdl	-616(%rbp), %xmm2, %xmm1
	leaq	.LC33(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-480(%rbp), %xmm0
	vcvtsi2sdl	-616(%rbp), %xmm2, %xmm1
	leaq	.LC34(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-472(%rbp), %xmm0
	vcvtsi2sdl	-616(%rbp), %xmm2, %xmm1
	leaq	.LC35(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-464(%rbp), %xmm0
	vcvtsi2sdl	-616(%rbp), %xmm2, %xmm1
	leaq	.LC36(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	movl	$10, %edi
	call	putchar@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-488(%rbp), %xmm0
	vcvtsi2sdl	-616(%rbp), %xmm2, %xmm1
	vaddsd	-480(%rbp), %xmm0, %xmm0
	movl	$1, %eax
	vaddsd	-472(%rbp), %xmm0, %xmm0
	vaddsd	-464(%rbp), %xmm0, %xmm0
	leaq	.LC37(%rip), %rsi
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	jmp	.L508
.L563:
	call	__stack_chk_fail@PLT
.L552:
	movl	$2, %edi
	movl	$1, %ecx
	leaq	.LC24(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	call	MPI_Finalize@PLT
	movl	$1, %edi
	call	exit@PLT
.L496:
	xorl	%ebx, %ebx
	testl	%eax, %eax
	sete	%bl
	jmp	.L509
.L488:
	xorl	%ebx, %ebx
	testl	%eax, %eax
	sete	%bl
	jmp	.L510
	.cfi_endproc
.LFE6492:
	.size	main, .-main
	.text
	.p2align 4
	.globl	dump
	.type	dump, @function
dump:
.LFB6499:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L564
	cmpb	$0, (%rdx)
	jne	.L569
.L564:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L569:
	jmp	dump.part.0
	.cfi_endproc
.LFE6499:
	.size	dump, .-dump
	.set	.LC1,.LC6
	.set	.LC2,.LC7
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1070596096
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC6:
	.long	0
	.long	1069547520
	.long	0
	.long	1069547520
	.long	0
	.long	1069547520
	.long	0
	.long	1069547520
	.align 32
.LC7:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.section	.rodata.cst8
	.align 8
.LC10:
	.long	10000
	.long	10000
	.align 8
.LC11:
	.long	0
	.long	1072693248
	.section	.data.rel.ro,"aw"
	.align 8
.LC38:
	.quad	ompi_request_null
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
