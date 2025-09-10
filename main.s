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
	cmpl	$2, %ebx
	jbe	.L61
	movq	%rdi, %r13
	call	omp_get_num_threads@PLT
	movl	%eax, %ebp
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	leal	-2(%rbx), %eax
	divl	%ebp
	cmpl	%edx, %ecx
	jb	.L35
.L41:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L61
	leal	2(%rdx), %ebp
	leal	2(%rax), %r8d
	cmpl	%r8d, %ebp
	jnb	.L61
	movl	16(%r13), %r10d
	addl	$1, %edx
	movl	20(%r13), %r12d
	movl	$2, %ecx
	movq	8(%r13), %r11
	movq	0(%r13), %rax
	imull	%r10d, %edx
	movl	%r12d, 12(%rsp)
	movl	%r10d, %r13d
	subl	%r12d, %ecx
	vmovsd	.LC1(%rip), %xmm3
	vmovsd	.LC2(%rip), %xmm2
	subl	%r12d, %r13d
	leal	(%r10,%rdx), %edi
	leal	(%rdi,%r12), %ebx
	.p2align 4,,10
	.p2align 3
.L38:
	addl	$1, %ebp
	cmpl	$2, 12(%rsp)
	jbe	.L40
	leal	(%rcx,%rbx), %esi
	movl	%ebx, %r9d
	leal	0(%r13,%rbx), %r15d
	subl	%esi, %r9d
	subl	%edi, %r15d
	movq	%rsi, %rdx
	andl	$3, %r9d
	je	.L39
	cmpl	$1, %r9d
	je	.L53
	cmpl	$2, %r9d
	je	.L54
	leaq	0(,%rsi,8), %r9
	leal	-1(%rsi), %esi
	vmovsd	(%rax,%rsi,8), %xmm1
	movl	%edx, %esi
	addl	$1, %edx
	leal	(%r15,%rsi), %r14d
	subl	%r10d, %esi
	vmovsd	(%rax,%r14,8), %xmm0
	vaddsd	(%rax,%rsi,8), %xmm0, %xmm0
	movl	%edx, %esi
	vaddsd	(%rax,%rsi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r9), %xmm2, %xmm0
	vmovsd	%xmm0, (%r11,%r9)
.L54:
	leaq	0(,%rsi,8), %r9
	leal	-1(%rdx), %esi
	vmovsd	(%rax,%rsi,8), %xmm1
	movl	%edx, %esi
	addl	$1, %edx
	leal	(%r15,%rsi), %r14d
	subl	%r10d, %esi
	vmovsd	(%rax,%r14,8), %xmm0
	vaddsd	(%rax,%rsi,8), %xmm0, %xmm0
	movl	%edx, %esi
	vaddsd	(%rax,%rsi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r9), %xmm2, %xmm0
	vmovsd	%xmm0, (%r11,%r9)
.L53:
	leaq	0(,%rsi,8), %r9
	leal	-1(%rdx), %esi
	vmovsd	(%rax,%rsi,8), %xmm1
	movl	%edx, %esi
	addl	$1, %edx
	leal	(%r15,%rsi), %r14d
	subl	%r10d, %esi
	vmovsd	(%rax,%r14,8), %xmm0
.L64:
	vaddsd	(%rax,%rsi,8), %xmm0, %xmm0
	movl	%edx, %esi
	cmpl	%ebx, %edx
	vaddsd	(%rax,%rsi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r9), %xmm2, %xmm0
	vmovsd	%xmm0, (%r11,%r9)
	je	.L40
.L39:
	leaq	0(,%rsi,8), %r9
	leal	-1(%rdx), %esi
	vmovsd	(%rax,%rsi,8), %xmm1
	movl	%edx, %esi
	leal	1(%rdx), %r14d
	leal	(%r15,%rdx), %r12d
	subl	%r10d, %esi
	vmovsd	(%rax,%r12,8), %xmm0
	leal	(%r15,%r14), %r12d
	vaddsd	(%rax,%rsi,8), %xmm0, %xmm0
	movl	%r14d, %esi
	vaddsd	(%rax,%rsi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r9), %xmm2, %xmm0
	vmovsd	%xmm0, (%r11,%r9)
	leaq	0(,%rsi,8), %r9
	movl	%edx, %esi
	addl	$2, %edx
	vmovsd	(%rax,%rsi,8), %xmm1
	movl	%r14d, %esi
	vmovsd	(%rax,%r12,8), %xmm0
	subl	%r10d, %esi
	vaddsd	(%rax,%rsi,8), %xmm0, %xmm0
	movl	%edx, %esi
	vaddsd	(%rax,%rsi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r9), %xmm2, %xmm0
	vmovsd	%xmm0, (%r11,%r9)
	leaq	0(,%rsi,8), %r9
	leal	-1(%rdx), %esi
	vmovsd	(%rax,%rsi,8), %xmm1
	movl	%edx, %esi
	leal	2(%r14), %edx
	leal	(%r15,%rsi), %r12d
	subl	%r10d, %esi
	vmovsd	(%rax,%r12,8), %xmm0
	vaddsd	(%rax,%rsi,8), %xmm0, %xmm0
	movl	%edx, %esi
	vaddsd	(%rax,%rsi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vfmadd231sd	(%rax,%r9), %xmm2, %xmm0
	vmovsd	%xmm0, (%r11,%r9)
	leaq	0(,%rsi,8), %r9
	leal	1(%r14), %esi
	vmovsd	(%rax,%rsi,8), %xmm1
	movl	%edx, %esi
	leal	3(%r14), %edx
	leal	(%r15,%rsi), %r12d
	subl	%r10d, %esi
	vmovsd	(%rax,%r12,8), %xmm0
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L61:
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
.L40:
	.cfi_restore_state
	addl	%r10d, %ebx
	cmpl	%ebp, %r8d
	je	.L61
	addl	%r10d, %edi
	jmp	.L38
.L35:
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L41
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
	jbe	.L72
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	movl	%ebx, %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L67
.L70:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L72
	movl	16(%rbp), %r8d
	leal	1(%rax), %edi
	movl	24(%rbp), %eax
	movl	$1, %r10d
	movl	%r10d, %r11d
	movq	8(%rbp), %r9
	movq	0(%rbp), %rsi
	imull	%r8d, %eax
	vmovsd	.LC1(%rip), %xmm2
	vmovsd	.LC2(%rip), %xmm1
	subl	%r8d, %r11d
	addl	$1, %r8d
	addl	%eax, %edx
	subl	%eax, %r10d
	.p2align 4,,10
	.p2align 3
.L69:
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
	jb	.L69
.L72:
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
.L67:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L70
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
	jbe	.L81
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	movl	%ebx, %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L76
.L79:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L81
	movl	16(%rbp), %r8d
	leal	1(%rax), %edi
	movl	24(%rbp), %eax
	movl	$1, %r10d
	movl	%r10d, %r11d
	movq	8(%rbp), %r9
	movq	0(%rbp), %rsi
	imull	%r8d, %eax
	vmovsd	.LC1(%rip), %xmm2
	vmovsd	.LC2(%rip), %xmm1
	subl	%r8d, %r11d
	addl	$1, %r8d
	addl	%eax, %edx
	subl	%eax, %r10d
	.p2align 4,,10
	.p2align 3
.L78:
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
	jb	.L78
.L81:
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
.L76:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L79
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
	jbe	.L90
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	leal	-2(%rbx), %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L85
.L88:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L90
	movl	16(%rbp), %r9d
	addl	$2, %edx
	leal	2(%rax), %edi
	movq	8(%rbp), %r10
	movq	0(%rbp), %rcx
	vmovsd	.LC1(%rip), %xmm2
	movl	%r9d, %eax
	movl	%r9d, %r11d
	vmovsd	.LC2(%rip), %xmm1
	imull	%edx, %eax
	addl	24(%rbp), %eax
	sall	$4, %r11d
	movl	%eax, %r8d
	.p2align 4,,10
	.p2align 3
.L87:
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
	jb	.L87
.L90:
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
.L85:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L88
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
	jbe	.L99
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	leal	-2(%rbx), %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L94
.L97:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L99
	movl	16(%rbp), %r9d
	addl	$2, %edx
	leal	2(%rax), %edi
	movq	8(%rbp), %r10
	movq	0(%rbp), %rcx
	vmovsd	.LC1(%rip), %xmm2
	movl	%r9d, %eax
	vmovsd	.LC2(%rip), %xmm1
	leal	0(,%r9,4), %r11d
	imull	%edx, %eax
	addl	24(%rbp), %eax
	movl	%eax, %r8d
	.p2align 4,,10
	.p2align 3
.L96:
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
	jb	.L96
.L99:
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
.L94:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L97
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
	leal	1(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L108
	movq	%rdi, %r12
	call	omp_get_num_threads@PLT
	movl	%eax, %ebp
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	movl	%ebx, %eax
	divl	%ebp
	cmpl	%edx, %ecx
	jb	.L103
.L106:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L108
	addl	$1, %eax
	movl	16(%r12), %ebp
	movl	28(%r12), %r8d
	leal	1(%rdx), %ecx
	movq	8(%r12), %rdi
	movq	(%r12), %rsi
	movl	%eax, 4(%rsp)
	movl	32(%r12), %eax
	leal	(%rbp,%rbp), %r9d
	vmovsd	.LC1(%rip), %xmm4
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
.L105:
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
	jb	.L105
.L108:
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
.L103:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L106
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
	leal	1(%rbx), %eax
	cmpl	$1, %eax
	jbe	.L117
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	movl	%ebx, %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L112
.L115:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L117
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
	vmovsd	.LC1(%rip), %xmm4
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
.L114:
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
	jb	.L114
.L117:
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
.L112:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L115
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
	movl	28(%rdi), %ebx
	cmpl	$2, %ebx
	jbe	.L126
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	leal	-2(%rbx), %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L121
.L124:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L126
	movl	24(%rbp), %r8d
	addl	$2, %eax
	addl	$2, %edx
	movl	36(%rbp), %r11d
	movl	%eax, 8(%rsp)
	movl	32(%rbp), %ebx
	movl	$1, %r13d
	movl	%r8d, %eax
	movq	16(%rbp), %rsi
	movq	8(%rbp), %rcx
	subl	%r11d, %r13d
	imull	%edx, %eax
	leal	0(,%r8,8), %r15d
	vmovsd	.LC1(%rip), %xmm4
	vmovsd	.LC2(%rip), %xmm2
	movl	%r15d, 12(%rsp)
	leal	1(%rbx), %r12d
	subl	%r11d, %r12d
	leal	(%r11,%rax), %r10d
	leal	-1(%r11,%rax), %r9d
	addl	40(%rbp), %eax
	movq	%r10, %rdi
	movl	%eax, %r14d
	.p2align 4,,10
	.p2align 3
.L123:
	movl	12(%rsp), %ebx
	leaq	0(,%r10,8), %rbp
	movl	%r9d, %r10d
	leal	-1(%rax), %r15d
	vmovsd	(%rcx,%r15,8), %xmm3
	addl	$1, %edx
	leal	(%rax,%rbx), %r11d
	leaq	0(,%r14,8), %rbx
	salq	$3, %r11
	leal	1(%rax), %r14d
	prefetchw	(%rsi,%r11)
	prefetcht2	(%rcx,%r11)
	leal	1(%rdi), %r11d
	vaddsd	(%rcx,%r14,8), %xmm3, %xmm3
	vmovsd	(%rcx,%r11,8), %xmm1
	vaddsd	(%rcx,%r10,8), %xmm1, %xmm1
	movl	%edi, %r10d
	movl	%eax, %r14d
	subl	%r8d, %r10d
	subl	%r8d, %r14d
	movl	%edi, %r11d
	vmovsd	(%rcx,%r10,8), %xmm0
	leal	(%rdi,%r8), %r10d
	vaddsd	(%rcx,%r10,8), %xmm0, %xmm0
	movq	%r10, %rdi
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	(%rcx,%r14,8), %xmm0
	leal	(%rax,%r8), %r14d
	vaddsd	(%rcx,%r14,8), %xmm0, %xmm0
	vfmadd231sd	(%rcx,%rbp), %xmm2, %xmm1
	movq	%r14, %rax
	vaddsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vfmadd231sd	(%rcx,%rbx), %xmm2, %xmm0
	vmovsd	%xmm1, (%rsi,%rbp)
	vmovsd	%xmm0, (%rsi,%rbx)
	leal	(%r9,%r12), %ebx
	vmovsd	(%rsi,%rbx,8), %xmm0
	leal	(%r9,%r13), %ebx
	addl	%r8d, %r9d
	vmovsd	%xmm0, (%rsi,%rbx,8)
	leal	(%r11,%r13), %ebx
	addl	%r12d, %r11d
	vmovsd	(%rsi,%rbx,8), %xmm0
	movl	8(%rsp), %ebx
	movl	%r11d, %r11d
	cmpl	%ebx, %edx
	vmovsd	%xmm0, (%rsi,%r11,8)
	jb	.L123
.L126:
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
.L121:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L124
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
	jbe	.L139
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	leal	-2(%rbx), %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L130
.L137:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jnb	.L139
	movl	24(%rbp), %edi
	leal	2(%rax), %r8d
	addl	$2, %edx
	movl	32(%rbp), %esi
	movl	44(%rbp), %r15d
	movl	40(%rbp), %r14d
	movl	%r8d, 12(%rsp)
	movl	%edi, %eax
	movq	16(%rbp), %r11
	movq	8(%rbp), %rcx
	leal	0(,%rdi,8), %r12d
	imull	%edx, %eax
	movq	0(%rbp), %r13
	vmovsd	.LC1(%rip), %xmm3
	vmovsd	.LC2(%rip), %xmm2
	addl	%eax, %esi
	addl	36(%rbp), %eax
	movl	%esi, %r10d
	movl	%eax, %r9d
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L141:
	testl	%r15d, %r15d
	vxorpd	%xmm1, %xmm1, %xmm1
	jne	.L133
.L142:
	vxorpd	%xmm4, %xmm4, %xmm4
.L135:
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
	vaddsd	(%rcx,%r9,8), %xmm4, %xmm4
	movl	%eax, %r9d
	vaddsd	(%rcx,%r10,8), %xmm0, %xmm0
	subl	%edi, %r9d
	movq	%r10, %rsi
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, %xmm0, %xmm1
	vmovsd	(%rcx,%r9,8), %xmm0
	leal	(%rax,%rdi), %r9d
	vaddsd	(%rcx,%r9,8), %xmm0, %xmm0
	vfmadd231sd	(%rcx,%rbp), %xmm2, %xmm1
	movq	%r9, %rax
	vaddsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vfmadd231sd	(%rcx,%rbx), %xmm2, %xmm0
	vmovsd	%xmm1, (%r11,%rbp)
	vmovsd	%xmm0, (%r11,%rbx)
	movl	12(%rsp), %ebx
	cmpl	%ebx, %edx
	jnb	.L139
.L134:
	leal	(%rax,%r12), %ebx
	salq	$3, %rbx
	testl	%r14d, %r14d
	prefetchw	(%r11,%rbx)
	prefetcht2	(%rcx,%rbx)
	leal	-1(%rdx), %ebx
	je	.L141
	movq	56(%r13), %r8
	movl	%ebx, %ebp
	testl	%r15d, %r15d
	vmovsd	(%r8,%rbp,8), %xmm1
	je	.L142
.L133:
	movq	48(%r13), %rbp
	vmovsd	0(%rbp,%rbx,8), %xmm4
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L139:
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
.L130:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L137
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
	jbe	.L174
	movq	%rdi, %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	xorl	%edx, %edx
	movl	%eax, %ecx
	movl	%ebx, %eax
	divl	%r12d
	cmpl	%edx, %ecx
	jb	.L145
.L150:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	movl	%eax, 8(%rsp)
	jnb	.L174
	leal	1(%rdx), %edi
	addl	$1, %eax
	cmpl	%eax, %edi
	jnb	.L174
	movl	16(%rbp), %ecx
	movq	8(%rbp), %rbx
	movq	0(%rbp), %rax
	movl	20(%rbp), %r12d
	movl	%ecx, %esi
	imull	%edi, %esi
.L148:
	testl	%r12d, %r12d
	leal	1(%rdi), %r15d
	je	.L170
	vmovsd	.LC1(%rip), %xmm2
	vmovsd	.LC2(%rip), %xmm1
	movl	%edi, %r13d
	.p2align 4,,10
	.p2align 3
.L147:
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
	jb	.L171
	testl	%edi, %edi
	je	.L173
	cmpl	$1, %edi
	je	.L165
	cmpl	$2, %edi
	je	.L166
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
.L166:
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
.L165:
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
	jb	.L171
.L173:
	movl	%ecx, 12(%rsp)
.L149:
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
	jnb	.L149
	movl	12(%rsp), %ecx
.L171:
	cmpl	%r13d, 8(%rsp)
	movl	4(%rsp), %esi
	je	.L174
	movl	%r15d, %r13d
	addl	$1, %r15d
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L174:
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
.L170:
	.cfi_restore_state
	addl	%ecx, %esi
	cmpl	%edi, 8(%rsp)
	je	.L174
	movl	%r15d, %edi
	jmp	.L148
.L145:
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L150
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
	jl	.L177
.L189:
	imull	%eax, %esi
	vxorpd	%xmm1, %xmm1, %xmm1
	addl	%edx, %esi
	addl	%esi, %eax
	cmpl	%eax, %esi
	jge	.L178
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
.L180:
	testl	%edx, %edx
	vmovdqa	%ymm2, (%r10)
	jle	.L184
	cmpl	$3, %edx
	jle	.L192
	leaq	8(%rcx), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	(%r8,%rax), %r13
	.p2align 4,,10
	.p2align 3
.L182:
	vaddpd	(%rax), %ymm0, %ymm0
	addq	$32, %rax
	cmpq	%r13, %rax
	jne	.L182
	cmpl	%r11d, %edx
	vmovapd	%ymm0, (%rsp)
	movslq	%r12d, %rax
	je	.L184
.L181:
	vmovsd	(%rsp), %xmm0
	.p2align 4,,10
	.p2align 3
.L186:
	vaddsd	(%rcx,%rax,8), %xmm0, %xmm0
	addq	$1, %rax
	leal	-1(%rax), %r13d
	cmpl	%r13d, %edx
	jg	.L186
	vmovsd	%xmm0, (%rsp)
.L184:
	addl	$1, %esi
	addq	%r9, %rcx
	vaddsd	(%rsp), %xmm1, %xmm1
	cmpl	%edi, %esi
	vaddsd	8(%rsp), %xmm1, %xmm1
	vaddsd	16(%rsp), %xmm1, %xmm1
	vaddsd	24(%rsp), %xmm1, %xmm1
	jne	.L180
	vzeroupper
.L178:
	movq	8(%rbx), %rdx
	leaq	8(%rbx), %rcx
.L188:
	vmovq	%rdx, %xmm4
	movq	%rdx, %rax
	vaddsd	%xmm4, %xmm1, %xmm3
	vmovq	%xmm3, %rsi
	lock cmpxchgq	%rsi, (%rcx)
	jne	.L202
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L203
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L192:
	.cfi_restore_state
	movl	$1, %eax
	jmp	.L181
.L177:
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L189
.L203:
	call	__stack_chk_fail@PLT
.L202:
	movq	%rax, %rdx
	jmp	.L188
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
	jl	.L205
.L208:
	imull	%eax, %ecx
	addl	%ecx, %edx
	leal	(%rax,%rdx), %ecx
	cmpl	%ecx, %edx
	jge	.L210
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
.L207:
	movl	%ecx, %eax
	addq	$8, %rsi
	prefetcht2	(%r8,%rax,8)
	leal	(%rdx,%rcx), %eax
	addl	%r9d, %ecx
	vmovsd	(%r8,%rax,8), %xmm0
	vmovsd	%xmm0, -8(%rsi)
	cmpq	%rsi, %rdi
	jne	.L207
.L210:
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
.L205:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L208
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
	jl	.L213
.L216:
	imull	%eax, %ecx
	addl	%ecx, %edx
	leal	(%rax,%rdx), %ecx
	cmpl	%ecx, %edx
	jge	.L218
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
.L215:
	movl	%ecx, %eax
	addq	$8, %rsi
	prefetcht2	(%rdi,%rax,8)
	leal	(%rdx,%rcx), %eax
	addl	%r9d, %ecx
	vmovsd	(%rdi,%rax,8), %xmm0
	vmovsd	%xmm0, -8(%rsi)
	cmpq	%r8, %rsi
	jne	.L215
.L218:
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
.L213:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L216
	.cfi_endproc
.LFE6514:
	.size	main._omp_fn.1, .-main._omp_fn.1
	.p2align 4
	.type	memory_allocate._omp_fn.0, @function
memory_allocate._omp_fn.0:
.LFB6515:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	omp_get_num_threads@PLT
	movl	%eax, %ebx
	call	omp_get_thread_num@PLT
	movl	%eax, %ecx
	movl	8(%rbp), %eax
	cltd
	idivl	%ebx
	cmpl	%edx, %ecx
	jl	.L221
.L225:
	imull	%eax, %ecx
	leal	(%rdx,%rcx), %esi
	leal	(%rax,%rsi), %r8d
	cmpl	%r8d, %esi
	jge	.L230
	movq	0(%rbp), %rsi
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	leal	-1(%rax), %r11d
	leaq	(%rcx,%rdx), %rax
	movq	16(%rsi), %r9
	movq	(%rsi), %r10
	leaq	1(%rcx,%rdx), %rsi
	leaq	0(,%rax,8), %rdi
	addq	%r11, %rsi
	salq	$3, %rsi
	leaq	(%r10,%rdi), %rbx
	addq	%r9, %rdi
	leaq	(%r9,%rsi), %rdx
	cmpq	%rdx, %rbx
	jnb	.L226
	addq	%r10, %rsi
	cmpq	%rsi, %rdi
	jb	.L223
.L226:
	leaq	8(,%r11,8), %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdx
	call	memset@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdx
	movq	%rbx, %rdi
	xorl	%esi, %esi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	memset@PLT
	.p2align 4,,10
	.p2align 3
.L223:
	.cfi_restore_state
	movq	$0x000000000, (%r9,%rax,8)
	movq	$0x000000000, (%r10,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r8d
	jg	.L223
.L230:
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
.L221:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L225
	.cfi_endproc
.LFE6515:
	.size	memory_allocate._omp_fn.0, .-memory_allocate._omp_fn.0
	.p2align 4
	.type	memory_allocate._omp_fn.1, @function
memory_allocate._omp_fn.1:
.LFB6516:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	omp_get_num_threads@PLT
	movl	%eax, %ebx
	call	omp_get_thread_num@PLT
	movl	%eax, %ecx
	movl	8(%rbp), %eax
	cltd
	idivl	%ebx
	cmpl	%edx, %ecx
	jl	.L233
.L237:
	imull	%eax, %ecx
	leal	(%rdx,%rcx), %esi
	leal	(%rax,%rsi), %r8d
	cmpl	%r8d, %esi
	jge	.L242
	movq	0(%rbp), %rsi
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	leal	-1(%rax), %r11d
	leaq	(%rcx,%rdx), %rax
	movq	16(%rsi), %r9
	movq	48(%rsi), %r10
	leaq	1(%rcx,%rdx), %rsi
	leaq	0(,%rax,8), %rdi
	addq	%r11, %rsi
	salq	$3, %rsi
	leaq	(%r10,%rdi), %rbx
	addq	%r9, %rdi
	leaq	(%r9,%rsi), %rdx
	cmpq	%rdx, %rbx
	jnb	.L238
	addq	%r10, %rsi
	cmpq	%rsi, %rdi
	jb	.L235
.L238:
	leaq	8(,%r11,8), %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdx
	call	memset@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdx
	movq	%rbx, %rdi
	xorl	%esi, %esi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	memset@PLT
	.p2align 4,,10
	.p2align 3
.L235:
	.cfi_restore_state
	movq	$0x000000000, (%r9,%rax,8)
	movq	$0x000000000, (%r10,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r8d
	jg	.L235
.L242:
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
.L233:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L237
	.cfi_endproc
.LFE6516:
	.size	memory_allocate._omp_fn.1, .-memory_allocate._omp_fn.1
	.p2align 4
	.type	memory_allocate._omp_fn.2, @function
memory_allocate._omp_fn.2:
.LFB6517:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	omp_get_num_threads@PLT
	movl	%eax, %ebx
	call	omp_get_thread_num@PLT
	movl	%eax, %ecx
	movl	8(%rbp), %eax
	cltd
	idivl	%ebx
	cmpl	%edx, %ecx
	jl	.L245
.L249:
	imull	%eax, %ecx
	leal	(%rdx,%rcx), %esi
	leal	(%rax,%rsi), %r8d
	cmpl	%r8d, %esi
	jge	.L254
	movq	0(%rbp), %rsi
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	leal	-1(%rax), %r11d
	leaq	(%rcx,%rdx), %rax
	movq	24(%rsi), %r9
	movq	56(%rsi), %r10
	leaq	1(%rcx,%rdx), %rsi
	leaq	0(,%rax,8), %rdi
	addq	%r11, %rsi
	salq	$3, %rsi
	leaq	(%r10,%rdi), %rbx
	addq	%r9, %rdi
	leaq	(%r9,%rsi), %rdx
	cmpq	%rdx, %rbx
	jnb	.L250
	addq	%r10, %rsi
	cmpq	%rsi, %rdi
	jb	.L247
.L250:
	leaq	8(,%r11,8), %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdx
	call	memset@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdx
	movq	%rbx, %rdi
	xorl	%esi, %esi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	memset@PLT
	.p2align 4,,10
	.p2align 3
.L247:
	.cfi_restore_state
	movq	$0x000000000, (%r9,%rax,8)
	movq	$0x000000000, (%r10,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r8d
	jg	.L247
.L254:
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
.L245:
	.cfi_restore_state
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L249
	.cfi_endproc
.LFE6517:
	.size	memory_allocate._omp_fn.2, .-memory_allocate._omp_fn.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"w"
	.text
	.p2align 4
	.type	dump.part.0, @function
dump.part.0:
.LFB6518:
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
	leaq	.LC4(%rip), %rsi
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	fopen@PLT
	testq	%rax, %rax
	je	.L264
	movl	(%rbx), %esi
	movq	%rax, %rbp
	leaq	0(,%rsi,4), %rdi
	movq	%rsi, 8(%rsp)
	movq	%rsi, %r15
	call	malloc@PLT
	movq	%rax, %r13
	movl	4(%rbx), %eax
	testl	%eax, %eax
	je	.L258
	movq	8(%rsp), %rsi
	vxorps	%xmm1, %xmm1, %xmm1
	movl	$1, %r14d
	.p2align 4,,10
	.p2align 3
.L263:
	leal	2(%r15), %eax
	imull	%r14d, %eax
	testl	%r15d, %r15d
	je	.L262
	leal	-1(%r15), %edx
	leaq	(%r12,%rax,8), %rcx
	movl	$1, %eax
	addq	$2, %rdx
	.p2align 4,,10
	.p2align 3
.L261:
	vcvtsd2ss	(%rcx,%rax,8), %xmm1, %xmm0
	vmovss	%xmm0, -4(%r13,%rax,4)
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L261
.L262:
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	movl	$4, %esi
	movq	%r13, %rdi
	call	fwrite@PLT
	addl	$1, %r14d
	cmpl	%r14d, 4(%rbx)
	vxorps	%xmm1, %xmm1, %xmm1
	jb	.L258
	movl	(%rbx), %esi
	movq	%rsi, %r15
	jmp	.L263
	.p2align 4,,10
	.p2align 3
.L258:
	movq	%r13, %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	xorl	%eax, %eax
.L256:
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
.L264:
	.cfi_restore_state
	movl	$2, %eax
	jmp	.L256
	.cfi_endproc
.LFE6518:
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
	je	.L268
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
.L269:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L272
	xorl	%eax, %eax
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L268:
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
	jmp	.L269
.L272:
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
	leaq	update_center._omp_fn.0(%rip), %rdi
	vpinsrd	$1, %eax, %xmm0, %xmm0
	vmovq	%xmm0, 16(%rsp)
	call	GOMP_parallel@PLT
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L276
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L276:
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
	jne	.L280
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L280:
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
	jne	.L284
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L284:
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
	jne	.L288
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L288:
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
	jne	.L292
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L292:
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
	je	.L294
	cmpl	$1, 4(%rsi)
	je	.L301
.L294:
	movl	%ecx, 28(%rsp)
	movq	%rsp, %rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	update_NORTH_SOUTH._omp_fn.1(%rip), %rdi
	movl	$1, 24(%rsp)
	vmovdqa	%xmm0, (%rsp)
	vmovq	%xmm2, 16(%rsp)
	call	GOMP_parallel@PLT
.L295:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L302
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L301:
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
	jmp	.L295
.L302:
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
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdx, %rax
	movq	%rsi, %r10
	vmovq	%rcx, %xmm4
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	movl	8(%rax), %ebp
	movl	12(%rax), %esi
	movq	%fs:40, %rdx
	movq	%rdx, 56(%rsp)
	xorl	%edx, %edx
	movl	12(%r8), %edx
	movq	(%rax), %r11
	movl	8(%r8), %eax
	leal	2(%rbp), %ebx
	movq	(%r9), %r9
	cmpl	$-2, %edx
	vmovd	%ebx, %xmm3
	vpinsrq	$1, %r11, %xmm4, %xmm0
	setne	%r12b
	xorl	%r8d, %r8d
	vpinsrd	$1, %esi, %xmm3, %xmm1
	cmpl	$-2, %eax
	setne	%r8b
	cmpl	$-2, %edx
	je	.L304
	movq	56(%rcx), %rdx
	movl	%ebx, %r13d
	vmovsd	(%rdx), %xmm2
	vmovsd	%xmm2, (%r11,%r13,8)
	leal	-1(%rsi), %r13d
	vmovsd	(%rdx,%r13,8), %xmm2
	movl	%esi, %edx
	imull	%ebx, %edx
	vmovsd	%xmm2, (%r11,%rdx,8)
.L304:
	cmpl	$-2, %eax
	je	.L305
	movq	48(%rcx), %rax
	leal	1(%rbp), %edx
	leal	(%rbx,%rdx), %ecx
	vmovsd	(%rax), %xmm2
	vmovsd	%xmm2, (%r11,%rcx,8)
	leal	-1(%rsi), %ecx
	vmovsd	(%rax,%rcx,8), %xmm2
	movl	%esi, %eax
	imull	%ebx, %eax
	addl	%edx, %eax
	movl	%eax, %eax
	vmovsd	%xmm2, (%r11,%rax,8)
.L305:
	testl	%edi, %edi
	je	.L306
	cmpl	$1, (%r10)
	je	.L319
.L306:
	movq	%rsp, %rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	%r8d, 44(%rsp)
	leaq	update_WEST_EAST._omp_fn.1(%rip), %rdi
	movl	%r12d, 40(%rsp)
	movl	%ebp, 36(%rsp)
	movl	$1, 32(%rsp)
	movq	%r9, 16(%rsp)
	vmovq	%xmm1, 24(%rsp)
	vmovdqa	%xmm0, (%rsp)
	call	GOMP_parallel@PLT
.L307:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L320
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L319:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	%r8d, 48(%rsp)
	leaq	update_WEST_EAST._omp_fn.0(%rip), %rdi
	movl	%r12d, 44(%rsp)
	movl	%ebp, 40(%rsp)
	movl	$1, 36(%rsp)
	movq	%r9, 16(%rsp)
	movl	%ebp, 32(%rsp)
	vmovq	%xmm1, 24(%rsp)
	vmovdqa	%xmm0, (%rsp)
	call	GOMP_parallel@PLT
	jmp	.L307
.L320:
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
	jne	.L324
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L324:
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
	jne	.L328
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L328:
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
	jbe	.L330
	movl	%edi, %ebx
	movl	%edi, %ecx
	movl	$2, %ebp
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L331:
	xorl	%edx, %edx
	movl	%ecx, %eax
	divl	%ebp
	testl	%edx, %edx
	jne	.L334
	.p2align 4,,10
	.p2align 3
.L332:
	movl	%ecx, %eax
	xorl	%edx, %edx
	addl	$1, %edi
	divl	%ebp
	xorl	%edx, %edx
	movl	%eax, %ecx
	divl	%ebp
	testl	%edx, %edx
	je	.L332
.L334:
	leal	1(%rbp), %eax
	cmpl	%eax, %ebx
	je	.L333
	movl	%eax, %ebp
	jmp	.L331
	.p2align 4,,10
	.p2align 3
.L333:
	movl	%edi, (%rsi)
	movslq	%edi, %rdi
	salq	$2, %rdi
	call	malloc@PLT
	movl	$2, %ecx
	xorl	%edi, %edi
	movq	%rax, %r8
	.p2align 4,,10
	.p2align 3
.L336:
	xorl	%edx, %edx
	movl	%ebx, %eax
	leal	1(%rdi), %esi
	divl	%ecx
	movslq	%esi, %rsi
	testl	%edx, %edx
	jne	.L339
	.p2align 4,,10
	.p2align 3
.L337:
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
	je	.L337
.L339:
	cmpl	%ecx, %ebp
	leal	1(%rcx), %eax
	je	.L335
	movl	%eax, %ecx
	jmp	.L336
.L330:
	movl	$0, (%rsi)
	xorl	%edi, %edi
	call	malloc@PLT
	movq	%rax, %r8
.L335:
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
	jne	.L351
	testl	%r15d, %r15d
	jle	.L352
	movq	%rax, %r15
	addq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L353:
	call	lrand48@PLT
	addq	$4, %r15
	cltd
	idivl	%r12d
	movl	%edx, -4(%r15)
	cmpq	%rbx, %r15
	jne	.L353
	movq	8(%rsp), %rax
	movl	20(%rsp), %esi
	xorl	%ecx, %ecx
	movq	%r14, %rdi
	leaq	ompi_mpi_int(%rip), %rdx
	movq	(%rax), %r8
	call	MPI_Bcast@PLT
	jmp	.L360
	.p2align 4,,10
	.p2align 3
.L351:
	movq	8(%rsp), %rax
	movl	20(%rsp), %r15d
	xorl	%ecx, %ecx
	movq	%r14, %rdi
	leaq	ompi_mpi_int(%rip), %rdx
	movq	(%rax), %r8
	movl	%r15d, %esi
	call	MPI_Bcast@PLT
	testl	%r15d, %r15d
	jle	.L356
	addq	%r14, %rbx
.L360:
	movq	%r14, %rax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L357:
	xorl	%ecx, %ecx
	cmpl	%ebp, (%rax)
	sete	%cl
	addq	$4, %rax
	addl	%ecx, %edx
	cmpq	%rbx, %rax
	jne	.L357
	movq	24(%rsp), %rax
	testl	%edx, %edx
	movl	%edx, (%rax)
	jg	.L368
.L355:
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
.L368:
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
.L359:
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
	jne	.L359
	movq	96(%rsp), %rax
	movq	%r12, (%rax)
	jmp	.L355
.L352:
	movq	8(%rsp), %rax
	movl	20(%rsp), %esi
	xorl	%ecx, %ecx
	movq	%r14, %rdi
	leaq	ompi_mpi_int(%rip), %rdx
	movq	(%rax), %r8
	call	MPI_Bcast@PLT
	movq	24(%rsp), %rax
	movl	$0, (%rax)
	jmp	.L355
.L356:
	movq	24(%rsp), %rax
	movl	$0, (%rax)
	jmp	.L355
	.cfi_endproc
.LFE6495:
	.size	initialize_sources, .-initialize_sources
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"buffers_ptr[EAST] allocation failed \n"
	.align 8
.LC6:
	.string	"buffers_ptr[WEST] allocation failed \n"
	.text
	.p2align 4
	.globl	memory_allocate
	.type	memory_allocate, @function
memory_allocate:
.LFB6496:
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	testq	%rdx, %rdx
	je	.L373
	testq	%rcx, %rcx
	movq	%rcx, %rbx
	je	.L373
	movl	8(%rcx), %eax
	movq	%rdi, %r12
	movq	%rdx, %rbp
	leal	2(%rax), %r13d
	movl	12(%rcx), %eax
	addl	$2, %eax
	imull	%eax, %r13d
	movl	%r13d, %r14d
	salq	$3, %r14
	movq	%r14, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	movq	%rax, (%rbx)
	je	.L373
	movq	%r14, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	movq	%rax, 16(%rbx)
	je	.L373
	movl	%r13d, 8(%rsp)
	movq	%rsp, %r13
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%r13, %rsi
	leaq	memory_allocate._omp_fn.0(%rip), %rdi
	movq	%rbx, (%rsp)
	call	GOMP_parallel@PLT
	cmpl	$-2, 8(%r12)
	movl	12(%rbx), %ebx
	jne	.L390
	cmpl	$-2, 12(%r12)
	jne	.L378
.L380:
	xorl	%eax, %eax
.L369:
	movq	24(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L391
	addq	$40, %rsp
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
.L390:
	.cfi_restore_state
	movslq	%ebx, %r15
	salq	$3, %r15
	movq	%r15, %rdi
	call	malloc@PLT
	movq	%r15, %rdi
	movq	%rax, 16(%rbp)
	movq	%rax, %r14
	call	malloc@PLT
	testq	%rax, %rax
	movq	%rax, 48(%rbp)
	je	.L382
	testq	%r14, %r14
	je	.L382
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%r13, %rsi
	movl	%ebx, 8(%rsp)
	leaq	memory_allocate._omp_fn.1(%rip), %rdi
	movq	%rbp, (%rsp)
	call	GOMP_parallel@PLT
	cmpl	$-2, 12(%r12)
	je	.L380
.L378:
	movslq	%ebx, %r14
	salq	$3, %r14
	movq	%r14, %rdi
	call	malloc@PLT
	movq	%r14, %rdi
	movq	%rax, 24(%rbp)
	movq	%rax, %r12
	call	malloc@PLT
	orq	%rax, %r12
	movq	%rax, 56(%rbp)
	je	.L392
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%r13, %rsi
	movl	%ebx, 8(%rsp)
	leaq	memory_allocate._omp_fn.2(%rip), %rdi
	movq	%rbp, (%rsp)
	call	GOMP_parallel@PLT
	jmp	.L380
	.p2align 4,,10
	.p2align 3
.L373:
	movl	$-1, %eax
	jmp	.L369
.L391:
	call	__stack_chk_fail@PLT
.L382:
	movq	stderr(%rip), %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	fwrite@PLT
.L377:
	movl	$1, %eax
	jmp	.L369
.L392:
	movq	stderr(%rip), %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	fwrite@PLT
	jmp	.L377
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
	je	.L395
	movq	%rdi, %rbp
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L396
	call	free@PLT
.L396:
	movq	16(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L395
	call	free@PLT
.L395:
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L398
	call	free@PLT
.L398:
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L399
	call	free@PLT
.L399:
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L400
	call	free@PLT
.L400:
	movq	56(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L401
	call	free@PLT
.L401:
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
.LC10:
	.ascii	"\nvalid options are ( values btw [] are the default values"
	.string	" ):\n-x    x size of the plate [10000]\n-y    y size of the plate [10000]\n-e    how many energy sources on the plate [4]\n-E    how many energy sources on the plate [1.0]\n-n    how many iterations [1000]\n-p    whether periodic boundaries applies  [0 = false]\n"
	.align 8
.LC11:
	.string	"option -%c requires an argument\n"
	.align 8
.LC12:
	.string	" -------- help unavailable ----------"
	.section	.rodata.str1.1
.LC13:
	.string	":hx:y:e:E:n:o:p:v:"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"Tasks are decomposed in a grid %d x %d\n\n"
	.align 8
.LC15:
	.string	"Task %4d :: \tgrid coordinates : %3d, %3d\n\tneighbours: N %4d    E %4d    S %4d    W %4d\n"
	.section	.rodata.str1.1
.LC16:
	.string	"error on memory_allocate"
.LC17:
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
	movq	.LC7(%rip), %rax
	movl	$0, -96(%rbp)
	movq	%rax, (%r9)
	movq	.LC8(%rip), %rax
	movl	$0, (%rdx)
	movl	$4, (%r11)
	movl	$0, (%r8)
	movq	$0, (%r15)
	xorl	%r15d, %r15d
	movl	$1000, (%rdi)
	movq	%rax, (%r14)
	movl	$-2, %eax
	leaq	.LC13(%rip), %r14
	vmovd	%eax, %xmm0
	movq	$0, 8(%rbx)
	movq	$0, 24(%rbx)
	vpshufd	$0, %xmm0, %xmm0
	leaq	.L425(%rip), %rbx
	vmovdqu	%xmm0, (%rsi)
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%ymm0, (%rcx)
	vmovdqu	%ymm0, 32(%rcx)
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L497:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movl	%r13d, %edi
	call	getopt@PLT
	cmpl	$-1, %eax
	je	.L505
	subl	$58, %eax
	cmpl	$63, %eax
	ja	.L497
	movslq	(%rbx,%rax,4), %rax
	addq	%rbx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L425:
	.long	.L435-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L434-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L433-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L432-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L431-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L430-.L425
	.long	.L429-.L425
	.long	.L428-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L497-.L425
	.long	.L427-.L425
	.long	.L497-.L425
	.long	.L426-.L425
	.long	.L424-.L425
	.text
	.p2align 4,,10
	.p2align 3
.L424:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	-88(%rbp), %rcx
	movl	%eax, 4(%rcx)
	jmp	.L497
	.p2align 4,,10
	.p2align 3
.L426:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	-88(%rbp), %rcx
	movl	%eax, (%rcx)
	jmp	.L497
	.p2align 4,,10
	.p2align 3
.L427:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, -96(%rbp)
	jmp	.L497
	.p2align 4,,10
	.p2align 3
.L428:
	movq	optarg(%rip), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol@PLT
	movq	-104(%rbp), %rcx
	testl	%eax, %eax
	setg	%al
	movzbl	%al, %eax
	movl	%eax, (%rcx)
	jmp	.L497
	.p2align 4,,10
	.p2align 3
.L429:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	-120(%rbp), %rcx
	movl	%eax, (%rcx)
	jmp	.L497
	.p2align 4,,10
	.p2align 3
.L430:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	-128(%rbp), %rcx
	movl	%eax, (%rcx)
	jmp	.L497
	.p2align 4,,10
	.p2align 3
.L431:
	movl	-92(%rbp), %r11d
	movl	$1, %r15d
	testl	%r11d, %r11d
	jne	.L497
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L497
	.p2align 4,,10
	.p2align 3
.L432:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	-112(%rbp), %rcx
	movl	%eax, (%rcx)
	jmp	.L497
	.p2align 4,,10
	.p2align 3
.L433:
	movq	optarg(%rip), %rdi
	xorl	%esi, %esi
	call	strtod@PLT
	movq	-136(%rbp), %rax
	vmovsd	%xmm0, (%rax)
	jmp	.L497
	.p2align 4,,10
	.p2align 3
.L434:
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	jmp	.L497
	.p2align 4,,10
	.p2align 3
.L435:
	movl	optopt(%rip), %edx
	leaq	.LC11(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L497
	.p2align 4,,10
	.p2align 3
.L505:
	testl	%r15d, %r15d
	jne	.L441
	movq	-88(%rbp), %rax
	vxorps	%xmm2, %xmm2, %xmm2
	movl	(%rax), %ebx
	movl	4(%rax), %eax
	movq	%rax, %r12
	vcvtsi2sdq	%rax, %xmm2, %xmm1
	movl	%ebx, %eax
	cmpl	%r12d, %ebx
	vcvtsi2sdq	%rax, %xmm2, %xmm0
	jnb	.L506
	vdivsd	%xmm0, %xmm1, %xmm1
	movl	-140(%rbp), %ecx
	vcvttsd2sil	%xmm1, %eax
	addl	$1, %eax
	cmpl	%ecx, %eax
	jl	.L507
	movq	-168(%rbp), %rax
	movl	-140(%rbp), %ecx
	movl	$1, (%rax)
	movl	%ecx, 4(%rax)
.L458:
	movl	-92(%rbp), %r8d
	movl	-140(%rbp), %ecx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	movl	$1, %esi
	movl	%r8d, %r13d
.L463:
	cmpl	$1, %ecx
	jbe	.L457
	movq	-104(%rbp), %rax
	movl	(%rax), %r9d
	testl	%r9d, %r9d
	je	.L471
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
.L457:
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
	jle	.L479
	movl	-92(%rbp), %edi
	testl	%edi, %edi
	je	.L508
.L478:
	movq	-184(%rbp), %r14
	movq	(%r14), %rdi
	call	MPI_Barrier@PLT
	movl	-140(%rbp), %eax
	testl	%eax, %eax
	jle	.L479
	movl	%r12d, -88(%rbp)
	leaq	.LC15(%rip), %rbx
	movl	-92(%rbp), %r12d
	movl	%r13d, -104(%rbp)
	movq	%r14, %r13
	movl	%eax, %r14d
	jmp	.L481
	.p2align 4,,10
	.p2align 3
.L480:
	movq	0(%r13), %rdi
	addl	$1, %r15d
	call	MPI_Barrier@PLT
	cmpl	%r15d, %r14d
	je	.L479
.L481:
	cmpl	%r15d, %r12d
	jne	.L480
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
	jmp	.L480
.L506:
	vdivsd	%xmm1, %xmm0, %xmm1
	movl	-140(%rbp), %ecx
	vcvttsd2sil	%xmm1, %eax
	addl	$1, %eax
	cmpl	%ecx, %eax
	jl	.L509
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
	jbe	.L510
.L456:
	movq	-104(%rbp), %rax
	movl	(%rax), %r10d
	testl	%r10d, %r10d
	jne	.L511
	movl	-92(%rbp), %ebx
	leal	-1(%rsi), %eax
	movl	$-2, %edx
	cmpl	%eax, %edi
	movl	$-2, %eax
	leal	1(%rbx), %r9d
	cmovnb	%eax, %r9d
	testl	%r12d, %r12d
	jle	.L469
	leal	-1(%rbx), %eax
	cltd
	idivl	-140(%rbp)
.L469:
	movq	-160(%rbp), %rax
	movl	%r9d, 8(%rax)
	movl	%edx, 12(%rax)
	jmp	.L463
	.p2align 4,,10
	.p2align 3
.L479:
	movq	-152(%rbp), %rcx
	movq	-176(%rbp), %rdx
	movq	-168(%rbp), %rsi
	movq	-160(%rbp), %rdi
	call	memory_allocate
	testl	%eax, %eax
	jne	.L512
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
	jne	.L513
.L421:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L514
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
.L512:
	.cfi_restore_state
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	movq	-176(%rbp), %rsi
	movq	-152(%rbp), %rdi
	call	memory_release
.L441:
	movl	$1, %eax
	jmp	.L421
.L511:
	movl	-92(%rbp), %ebx
	xorl	%edx, %edx
	leal	1(%rbx), %eax
	divl	%esi
	movl	%r8d, %eax
	imull	%esi, %eax
	testl	%edi, %edi
	leal	(%rdx,%rax), %r9d
	leal	-1(%rbx), %edx
	jne	.L469
	leal	1(%r13), %edx
	imull	%esi, %edx
	subl	$1, %edx
	jmp	.L469
.L471:
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
	jmp	.L457
.L508:
	movl	%esi, %edx
	movl	$2, %edi
	leaq	.LC14(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	stdout(%rip), %rdi
	call	fflush@PLT
	jmp	.L478
.L509:
	movl	-140(%rbp), %edi
	leaq	-72(%rbp), %rdx
	leaq	-76(%rbp), %rsi
	vmovsd	%xmm1, -120(%rbp)
	call	simple_factorization
	movl	-76(%rbp), %eax
	vmovsd	-120(%rbp), %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	testl	%eax, %eax
	jle	.L451
.L483:
	movl	-140(%rbp), %edx
	vcvtsi2sdq	%rdx, %xmm2, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L451
	movq	-72(%rbp), %rdi
	subl	$1, %eax
	movl	$1, %ecx
	movl	-140(%rbp), %r9d
	leaq	(%rdi,%rax,4), %r8
	jmp	.L459
	.p2align 4,,10
	.p2align 3
.L515:
	xorl	%edx, %edx
	addq	$4, %rdi
	divl	%ecx
	vcvtsi2sdq	%rax, %xmm2, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L455
.L459:
	imull	(%rdi), %ecx
	xorl	%edx, %edx
	movl	%r9d, %eax
	divl	%ecx
	cmpq	%r8, %rdi
	movl	%eax, %esi
	jne	.L515
.L455:
	cmpl	%ebx, %r12d
	jb	.L462
	movl	%esi, %eax
	movl	%ecx, %esi
	movl	%eax, %ecx
.L462:
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
	ja	.L456
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	jmp	.L463
.L507:
	movl	-140(%rbp), %edi
	leaq	-72(%rbp), %rdx
	leaq	-76(%rbp), %rsi
	vmovsd	%xmm1, -120(%rbp)
	call	simple_factorization
	movl	-76(%rbp), %eax
	vmovsd	-120(%rbp), %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	testl	%eax, %eax
	jg	.L483
	movl	$1, %eax
	vmovd	%eax, %xmm0
	movq	-168(%rbp), %rax
	vpinsrd	$1, -140(%rbp), %xmm0, %xmm0
	vmovq	%xmm0, (%rax)
	jmp	.L458
	.p2align 4,,10
	.p2align 3
.L513:
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	jmp	.L441
.L510:
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	jmp	.L457
.L451:
	movl	-140(%rbp), %esi
	movl	$1, %ecx
	jmp	.L455
.L514:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6493:
	.size	initialize, .-initialize
	.section	.rodata.str1.1
.LC19:
	.string	" [ step %4d ] "
	.section	.rodata.str1.8
	.align 8
.LC20:
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
	jne	.L517
	testl	%r13d, %r13d
	jns	.L523
.L518:
	movq	stdout(%rip), %rdi
	call	fflush@PLT
	movl	8(%rbx), %eax
	imull	12(%rbx), %eax
	vxorps	%xmm2, %xmm2, %xmm2
	vmovsd	8(%rsp), %xmm1
	vmovq	%r14, %xmm0
	movl	$2, %edi
	leaq	.LC20(%rip), %rsi
	vcvtsi2sdq	%rax, %xmm2, %xmm2
	movl	$3, %eax
	vdivsd	%xmm2, %xmm1, %xmm2
	call	__printf_chk@PLT
.L517:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L524
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
.L523:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC19(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L518
.L524:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6498:
	.size	output_energy_stat, .-output_energy_stat
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"MPI_thread level obtained is %d instead of %d\n"
	.align 8
.LC22:
	.string	"task %d is opting out with termination code %d\n"
	.align 8
.LC23:
	.string	"data_parallel/%d_plane_%05d.bin"
	.align 8
.LC24:
	.string	"Error in dump_status. Exit with %d\n"
	.section	.rodata.str1.1
.LC25:
	.string	"\n\nResults:"
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"time total:                        %f\n"
	.align 8
.LC27:
	.string	"time for filling buffers:          %f\n"
	.align 8
.LC28:
	.string	"time for update planes:            %f\n"
	.align 8
.LC29:
	.string	"time for waiting EAST  and WEST:   %f\n"
	.align 8
.LC30:
	.string	"time for update  EAST  and WEST:   %f\n"
	.align 8
.LC31:
	.string	"time for waiting NORTH and SOUTH:  %f\n"
	.align 8
.LC32:
	.string	"time for update  NORTH and SOUTH:  %f\n"
	.align 8
.LC33:
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
	subq	$704, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%edi, -596(%rbp)
	leaq	-596(%rbp), %rdi
	movq	%rsi, -608(%rbp)
	leaq	-608(%rbp), %rsi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	-432(%rbp), %rax
	movq	%rax, %rcx
	movq	%rax, -616(%rbp)
	call	MPI_Init_thread@PLT
	movl	-432(%rbp), %edx
	testl	%edx, %edx
	jle	.L615
	leaq	ompi_mpi_comm_world(%rip), %rbx
	leaq	-588(%rbp), %rsi
	movq	%rbx, %rdi
	leaq	-560(%rbp), %r14
	call	MPI_Comm_rank@PLT
	leaq	-584(%rbp), %rsi
	movq	%rbx, %rdi
	call	MPI_Comm_size@PLT
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movq	%r14, -752(%rbp)
	call	MPI_Comm_dup@PLT
	subq	$8, %rsp
	movq	%r14, %rdi
	leaq	-224(%rbp), %rax
	movq	%rax, -648(%rbp)
	movq	-608(%rbp), %r8
	leaq	-368(%rbp), %r9
	movl	-596(%rbp), %ecx
	movl	-584(%rbp), %edx
	pushq	%rax
	leaq	-336(%rbp), %rax
	movq	%rax, -744(%rbp)
	movl	-588(%rbp), %esi
	pushq	%rax
	leaq	-544(%rbp), %rax
	pushq	%rax
	leaq	-552(%rbp), %rax
	pushq	%rax
	leaq	-568(%rbp), %rax
	pushq	%rax
	leaq	-572(%rbp), %rax
	pushq	%rax
	leaq	-580(%rbp), %rax
	pushq	%rax
	leaq	-352(%rbp), %rax
	pushq	%rax
	leaq	-564(%rbp), %rax
	pushq	%rax
	leaq	-576(%rbp), %rax
	pushq	%rax
	leaq	-360(%rbp), %rax
	pushq	%rax
	call	initialize
	addq	$96, %rsp
	testl	%eax, %eax
	movl	%eax, -656(%rbp)
	jne	.L616
	call	MPI_Wtime@PLT
	movl	-580(%rbp), %eax
	vmovsd	-544(%rbp), %xmm5
	movq	$0x000000000, -528(%rbp)
	movl	-572(%rbp), %r10d
	movq	$0x000000000, -520(%rbp)
	leaq	ompi_mpi_double(%rip), %r14
	testl	%eax, %eax
	movq	$0x000000000, -512(%rbp)
	movq	$0x000000000, -504(%rbp)
	movq	$0x000000000, -496(%rbp)
	movq	$0x000000000, -488(%rbp)
	movl	%eax, -696(%rbp)
	movl	%r10d, -700(%rbp)
	vmovsd	%xmm0, -536(%rbp)
	vmovsd	%xmm5, -688(%rbp)
	jle	.L529
	movq	-552(%rbp), %rax
	movl	-348(%rbp), %edi
	movl	%r10d, -672(%rbp)
	movl	-352(%rbp), %esi
	movl	-344(%rbp), %ebx
	movq	%rax, -712(%rbp)
	movl	-568(%rbp), %eax
	cmpl	$-2, %edi
	setne	%dl
	cmpl	$-2, %esi
	movl	-340(%rbp), %ecx
	movl	%ebx, -640(%rbp)
	movl	%eax, -704(%rbp)
	movl	-576(%rbp), %eax
	movl	%ecx, -660(%rbp)
	movl	%eax, -600(%rbp)
	setne	%al
	orl	%eax, %edx
	movl	-564(%rbp), %eax
	cmpl	$-2, %ebx
	movl	%esi, -664(%rbp)
	movb	%dl, -713(%rbp)
	setne	%dl
	cmpl	$-2, %ecx
	movl	%eax, -692(%rbp)
	setne	%al
	orl	%eax, %edx
	xorl	%eax, %eax
	cmpl	$-2, %ecx
	movl	%edi, -668(%rbp)
	sete	%al
	movb	%dl, -714(%rbp)
	movl	%eax, -720(%rbp)
	xorl	%eax, %eax
	cmpl	$-2, %ebx
	sete	%al
	movl	%eax, -724(%rbp)
	xorl	%eax, %eax
	cmpl	$-2, %esi
	sete	%al
	movl	%eax, -728(%rbp)
	xorl	%eax, %eax
	cmpl	$-2, %edi
	sete	%al
	xorl	%r11d, %r11d
	xorl	%r15d, %r15d
	movl	%eax, -732(%rbp)
	movl	%r11d, -636(%rbp)
	.p2align 4,,10
	.p2align 3
.L530:
	movslq	%r15d, %rbx
	movl	-600(%rbp), %esi
	vpbroadcastq	.LC34(%rip), %ymm0
	movq	%rbx, %rax
	salq	$4, %rax
	testl	%esi, %esi
	vmovdqa	%ymm0, -304(%rbp)
	movl	-328(%rbp,%rax), %ecx
	vmovdqa	%ymm0, -272(%rbp)
	vmovd	-324(%rbp,%rax), %xmm1
	movq	-336(%rbp,%rax), %rax
	leal	2(%rcx), %edx
	je	.L617
	movq	%rax, -416(%rbp)
	xorl	%esi, %esi
	movq	-712(%rbp), %rax
	vmovd	%edx, %xmm5
	cmpl	$1, -360(%rbp)
	vpinsrd	$1, %ecx, %xmm5, %xmm0
	vmovsd	-688(%rbp), %xmm6
	leaq	inject_energy._omp_fn.0(%rip), %rdi
	sete	%sil
	movq	%rax, -432(%rbp)
	xorl	%edx, %edx
	movl	-704(%rbp), %eax
	cmpl	$1, -356(%rbp)
	vpinsrd	$1, %esi, %xmm1, %xmm1
	movq	-616(%rbp), %rsi
	vmovsd	%xmm6, -424(%rbp)
	sete	%dl
	movl	%eax, -408(%rbp)
	vpunpcklqdq	%xmm1, %xmm0, %xmm0
	xorl	%ecx, %ecx
	movl	%edx, -388(%rbp)
	xorl	%edx, %edx
	vmovdqu	%xmm0, -404(%rbp)
	vzeroupper
	call	GOMP_parallel@PLT
.L531:
	call	MPI_Wtime@PLT
	movq	%rbx, %rax
	movl	$8, %esi
	salq	$4, %rax
	vmovsd	%xmm0, -624(%rbp)
	vmovq	%rsi, %xmm0
	movl	-328(%rbp,%rax), %r12d
	movl	-324(%rbp,%rax), %r13d
	movq	-336(%rbp,%rax), %rax
	leal	3(%r12), %edx
	leal	2(%r12), %r8d
	leaq	(%rax,%rdx,8), %rdx
	vmovq	%rax, %xmm3
	movq	%rdx, -224(%rbp)
	movl	%r8d, %edx
	vpunpcklqdq	%xmm3, %xmm3, %xmm1
	imull	%r13d, %edx
	leal	1(%rdx), %ecx
	leal	1(%rdx,%r8), %edx
	salq	$3, %rdx
	leaq	(%rax,%rcx,8), %rcx
	cmpl	$-2, -660(%rbp)
	vpinsrq	$1, %rdx, %xmm0, %xmm0
	movq	%rcx, -216(%rbp)
	vpaddq	%xmm1, %xmm0, %xmm0
	vmovdqa	%xmm0, -192(%rbp)
	je	.L532
	vmovd	%r8d, %xmm5
	movq	%rax, -424(%rbp)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	%rax, -656(%rbp)
	movq	-616(%rbp), %rsi
	vpinsrd	$1, %r13d, %xmm5, %xmm0
	leaq	main._omp_fn.0(%rip), %rdi
	movq	-648(%rbp), %rax
	movl	%r8d, -632(%rbp)
	vmovq	%xmm0, -416(%rbp)
	movq	%rax, -432(%rbp)
	call	GOMP_parallel@PLT
	movq	-656(%rbp), %rax
	movl	-632(%rbp), %r8d
.L532:
	cmpl	$-2, -640(%rbp)
	je	.L533
	movq	%rax, -424(%rbp)
	vmovd	%r8d, %xmm6
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	-648(%rbp), %rax
	movq	-616(%rbp), %rsi
	vpinsrd	$1, %r12d, %xmm6, %xmm0
	leaq	main._omp_fn.1(%rip), %rdi
	movl	%r13d, -408(%rbp)
	movq	%rax, -432(%rbp)
	vmovq	%xmm0, -416(%rbp)
	call	GOMP_parallel@PLT
.L533:
	call	MPI_Wtime@PLT
	movl	-664(%rbp), %ecx
	vsubsd	-624(%rbp), %xmm0, %xmm0
	vaddsd	-528(%rbp), %xmm0, %xmm0
	cmpl	$-2, %ecx
	vmovsd	%xmm0, -528(%rbp)
	je	.L534
	subq	$8, %rsp
	leaq	-304(%rbp), %r10
	leaq	-272(%rbp), %rax
	movq	-560(%rbp), %r9
	movq	%r10, -624(%rbp)
	xorl	%r8d, %r8d
	movq	%r14, %rdx
	movl	%r12d, %esi
	pushq	%rax
	movq	-192(%rbp), %rdi
	call	MPI_Irecv@PLT
	movq	-624(%rbp), %r10
	movq	%r14, %rdx
	movq	-560(%rbp), %r9
	movl	-664(%rbp), %ecx
	movq	-224(%rbp), %rdi
	movl	$1, %r8d
	movl	%r12d, %esi
	movq	%r10, (%rsp)
	call	MPI_Isend@PLT
	popq	%r9
	popq	%r10
.L534:
	movl	-668(%rbp), %ecx
	cmpl	$-2, %ecx
	je	.L535
	subq	$8, %rsp
	movl	$1, %r8d
	movq	%r14, %rdx
	movl	%r12d, %esi
	leaq	-264(%rbp), %rax
	movq	-560(%rbp), %r9
	movq	-184(%rbp), %rdi
	pushq	%rax
	call	MPI_Irecv@PLT
	leaq	-296(%rbp), %rax
	xorl	%r8d, %r8d
	movq	-216(%rbp), %rdi
	movq	%rax, (%rsp)
	movl	-668(%rbp), %ecx
	movq	%r14, %rdx
	movl	%r12d, %esi
	movq	-560(%rbp), %r9
	call	MPI_Isend@PLT
	popq	%rdi
	popq	%r8
.L535:
	movl	-640(%rbp), %r12d
	cmpl	$-2, %r12d
	movl	%r12d, %ecx
	je	.L536
	subq	$8, %rsp
	movl	$2, %r8d
	movq	%r14, %rdx
	movl	%r13d, %esi
	leaq	-256(%rbp), %rax
	movq	-560(%rbp), %r9
	movq	-176(%rbp), %rdi
	pushq	%rax
	call	MPI_Irecv@PLT
	movl	%r12d, %ecx
	movl	%r13d, %esi
	movq	%r14, %rdx
	leaq	-288(%rbp), %rax
	movq	-560(%rbp), %r9
	movq	-208(%rbp), %rdi
	movl	$3, %r8d
	movq	%rax, (%rsp)
	call	MPI_Isend@PLT
	popq	%rcx
	popq	%rsi
.L536:
	movl	-660(%rbp), %r12d
	cmpl	$-2, %r12d
	movl	%r12d, %ecx
	je	.L537
	subq	$8, %rsp
	movl	$3, %r8d
	movq	%r14, %rdx
	movl	%r13d, %esi
	leaq	-248(%rbp), %rax
	movq	-560(%rbp), %r9
	movq	-168(%rbp), %rdi
	pushq	%rax
	call	MPI_Irecv@PLT
	leaq	-280(%rbp), %rax
	movq	%r14, %rdx
	movl	%r12d, %ecx
	movq	%rax, (%rsp)
	movq	-560(%rbp), %r9
	movl	$2, %r8d
	movl	%r13d, %esi
	movq	-200(%rbp), %rdi
	call	MPI_Isend@PLT
	popq	%rax
	popq	%rdx
.L537:
	call	MPI_Wtime@PLT
	movl	%r15d, %esi
	movq	%rbx, %rax
	leaq	update_center._omp_fn.0(%rip), %rdi
	xorl	$1, %esi
	salq	$4, %rax
	vmovsd	%xmm0, -632(%rbp)
	movl	%esi, -656(%rbp)
	movslq	%esi, %rsi
	movl	-328(%rbp,%rax), %edx
	movq	%rsi, -624(%rbp)
	salq	$4, %rsi
	vmovq	-336(%rbp,%rax), %xmm0
	vpinsrq	$1, -336(%rbp,%rsi), %xmm0, %xmm0
	movl	-324(%rbp,%rax), %ecx
	leal	2(%rdx), %eax
	movq	-616(%rbp), %rsi
	vmovdqa	%xmm0, -432(%rbp)
	vmovd	%eax, %xmm0
	vpinsrd	$1, %edx, %xmm0, %xmm0
	movl	%ecx, -408(%rbp)
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	vmovq	%xmm0, -416(%rbp)
	call	GOMP_parallel@PLT
	call	MPI_Wtime@PLT
	vsubsd	-632(%rbp), %xmm0, %xmm0
	vaddsd	-520(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -520(%rbp)
	call	MPI_Wtime@PLT
	cmpb	$0, -714(%rbp)
	movl	$0, -440(%rbp)
	movl	-724(%rbp), %r8d
	movl	-720(%rbp), %r15d
	vmovsd	%xmm0, -680(%rbp)
	je	.L543
	movq	%rbx, -632(%rbp)
	movl	%r15d, %ebx
	movl	%r8d, %r15d
	jmp	.L538
	.p2align 4,,10
	.p2align 3
.L541:
	testl	%r15d, %r15d
	jne	.L613
	xorl	%r12d, %r12d
	leaq	-440(%rbp), %r13
.L567:
	xorl	%edx, %edx
	movq	%r13, %rsi
	leaq	-256(%rbp), %rdi
	xorl	%r15d, %r15d
	call	MPI_Test@PLT
	movl	-440(%rbp), %r13d
	testl	%r13d, %r13d
	sete	%al
	setne	%r15b
	movzbl	%al, %eax
	orl	%r12d, %eax
	je	.L613
.L538:
	testl	%ebx, %ebx
	jne	.L541
	leaq	-440(%rbp), %r13
	leaq	-248(%rbp), %r12
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	MPI_Test@PLT
	movl	-440(%rbp), %eax
	testl	%eax, %eax
	setne	%bl
	testl	%r15d, %r15d
	je	.L542
	movl	%ebx, %r15d
	movq	-632(%rbp), %rbx
	testl	%r15d, %r15d
	jne	.L543
.L618:
	xorl	%edx, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	xorl	%r15d, %r15d
	call	MPI_Test@PLT
	movl	-440(%rbp), %eax
	testl	%eax, %eax
	setne	%r15b
	testl	%r15d, %r15d
	je	.L618
	.p2align 4,,10
	.p2align 3
.L543:
	call	MPI_Wtime@PLT
	vsubsd	-680(%rbp), %xmm0, %xmm0
	vaddsd	-512(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -512(%rbp)
	call	MPI_Wtime@PLT
	movq	-624(%rbp), %rdi
	movq	%rbx, %rcx
	xorl	%r9d, %r9d
	salq	$4, %rcx
	movl	-340(%rbp), %r11d
	vmovsd	%xmm0, -632(%rbp)
	salq	$4, %rdi
	movl	-328(%rbp,%rcx), %esi
	movl	-324(%rbp,%rcx), %edx
	movq	-336(%rbp,%rdi), %r8
	movl	-344(%rbp), %edi
	cmpl	$-2, %r11d
	setne	%r9b
	leal	2(%rsi), %eax
	xorl	%r10d, %r10d
	movq	-336(%rbp,%rcx), %rcx
	cmpl	$-2, %edi
	vmovd	%eax, %xmm7
	setne	%r10b
	cmpl	$-2, %r11d
	vpinsrd	$1, %edx, %xmm7, %xmm0
	je	.L540
	movq	-168(%rbp), %r11
	movl	%eax, %r12d
	vmovsd	(%r11), %xmm1
	vmovsd	%xmm1, (%rcx,%r12,8)
	leal	-1(%rdx), %r12d
	vmovsd	(%r11,%r12,8), %xmm1
	movl	%eax, %r11d
	imull	%edx, %r11d
	vmovsd	%xmm1, (%rcx,%r11,8)
.L540:
	cmpl	$-2, %edi
	je	.L545
	movq	-176(%rbp), %r11
	leal	1(%rsi), %edi
	leal	(%rax,%rdi), %r12d
	vmovsd	(%r11), %xmm1
	imull	%edx, %eax
	vmovsd	%xmm1, (%rcx,%r12,8)
	leal	-1(%rdx), %r12d
	vmovsd	(%r11,%r12,8), %xmm1
	addl	%edi, %eax
	movl	%eax, %eax
	vmovsd	%xmm1, (%rcx,%rax,8)
.L545:
	movl	-600(%rbp), %r11d
	testl	%r11d, %r11d
	je	.L546
	cmpl	$1, -360(%rbp)
	je	.L619
.L546:
	movl	%esi, -396(%rbp)
	movq	-648(%rbp), %rax
	xorl	%edx, %edx
	leaq	update_WEST_EAST._omp_fn.1(%rip), %rdi
	movq	-616(%rbp), %rsi
	movq	%rcx, -424(%rbp)
	xorl	%ecx, %ecx
	movl	%r10d, -388(%rbp)
	movl	%r9d, -392(%rbp)
	movl	$1, -400(%rbp)
	movq	%r8, -416(%rbp)
	movq	%rax, -432(%rbp)
	vmovq	%xmm0, -408(%rbp)
	call	GOMP_parallel@PLT
.L547:
	call	MPI_Wtime@PLT
	vsubsd	-632(%rbp), %xmm0, %xmm0
	vaddsd	-504(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -504(%rbp)
	call	MPI_Wtime@PLT
	cmpb	$0, -713(%rbp)
	movl	$0, -440(%rbp)
	movl	-732(%rbp), %r8d
	movl	-728(%rbp), %r15d
	vmovsd	%xmm0, -680(%rbp)
	je	.L553
	movq	%rbx, -632(%rbp)
	movl	%r15d, %ebx
	movl	%r8d, %r15d
	jmp	.L548
	.p2align 4,,10
	.p2align 3
.L551:
	testl	%r15d, %r15d
	jne	.L614
	xorl	%r12d, %r12d
	leaq	-440(%rbp), %r13
.L566:
	xorl	%edx, %edx
	leaq	-264(%rbp), %rdi
	movq	%r13, %rsi
	xorl	%r15d, %r15d
	call	MPI_Test@PLT
	movl	-440(%rbp), %r8d
	testl	%r8d, %r8d
	sete	%al
	setne	%r15b
	movzbl	%al, %eax
	orl	%r12d, %eax
	je	.L614
.L548:
	testl	%ebx, %ebx
	jne	.L551
	leaq	-440(%rbp), %r13
	leaq	-272(%rbp), %r12
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	MPI_Test@PLT
	movl	-440(%rbp), %eax
	testl	%eax, %eax
	setne	%bl
	testl	%r15d, %r15d
	je	.L552
	movl	%ebx, %r15d
	movq	-632(%rbp), %rbx
	testl	%r15d, %r15d
	jne	.L553
.L620:
	xorl	%edx, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	xorl	%r15d, %r15d
	call	MPI_Test@PLT
	movl	-440(%rbp), %r9d
	testl	%r9d, %r9d
	setne	%r15b
	testl	%r15d, %r15d
	je	.L620
	.p2align 4,,10
	.p2align 3
.L553:
	call	MPI_Wtime@PLT
	vsubsd	-680(%rbp), %xmm0, %xmm0
	salq	$4, %rbx
	vaddsd	-496(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, -496(%rbp)
	call	MPI_Wtime@PLT
	movl	-328(%rbp,%rbx), %eax
	movq	-624(%rbp), %rcx
	movl	-600(%rbp), %r10d
	vmovsd	%xmm0, -632(%rbp)
	vmovq	-336(%rbp,%rbx), %xmm0
	leal	2(%rax), %edx
	salq	$4, %rcx
	vmovd	%edx, %xmm1
	testl	%r10d, %r10d
	movl	-324(%rbp,%rbx), %edx
	vpinsrq	$1, -336(%rbp,%rcx), %xmm0, %xmm0
	vpinsrd	$1, %eax, %xmm1, %xmm2
	je	.L550
	cmpl	$1, -356(%rbp)
	je	.L621
.L550:
	movq	-616(%rbp), %rsi
	movl	%edx, -404(%rbp)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	update_NORTH_SOUTH._omp_fn.1(%rip), %rdi
	vmovdqa	%xmm0, -432(%rbp)
	movl	$1, -408(%rbp)
	vmovq	%xmm2, -416(%rbp)
	call	GOMP_parallel@PLT
.L555:
	call	MPI_Wtime@PLT
	movl	-692(%rbp), %edi
	vsubsd	-632(%rbp), %xmm0, %xmm0
	vaddsd	-488(%rbp), %xmm0, %xmm0
	movl	-636(%rbp), %eax
	testl	%edi, %edi
	leal	1(%rax), %r12d
	vmovsd	%xmm0, -488(%rbp)
	jne	.L622
.L557:
	movl	-700(%rbp), %ebx
	addl	%ebx, -672(%rbp)
	cmpl	%r12d, -696(%rbp)
	je	.L529
	movl	%r12d, -636(%rbp)
	movl	-656(%rbp), %r15d
	jmp	.L530
	.p2align 4,,10
	.p2align 3
.L617:
	movq	%rax, -416(%rbp)
	movq	-712(%rbp), %rax
	xorl	%ecx, %ecx
	leaq	inject_energy._omp_fn.1(%rip), %rdi
	vmovsd	-688(%rbp), %xmm7
	movl	%edx, -404(%rbp)
	xorl	%edx, %edx
	movq	%rax, -432(%rbp)
	movl	-704(%rbp), %eax
	movq	-616(%rbp), %rsi
	vmovsd	%xmm7, -424(%rbp)
	movl	%eax, -408(%rbp)
	vzeroupper
	call	GOMP_parallel@PLT
	jmp	.L531
	.p2align 4,,10
	.p2align 3
.L622:
	vxorpd	%xmm7, %xmm7, %xmm7
	movq	-624(%rbp), %r13
	movq	-744(%rbp), %rax
	vcvtsi2sdl	-672(%rbp), %xmm7, %xmm0
	vmulsd	-688(%rbp), %xmm0, %xmm0
	movl	-636(%rbp), %r15d
	salq	$4, %r13
	movq	-752(%rbp), %rcx
	movl	-588(%rbp), %edx
	leaq	(%rax,%r13), %rsi
	movl	%r15d, %edi
	call	output_energy_stat
	cmpl	$1, -692(%rbp)
	jle	.L557
	xorl	%eax, %eax
	movl	%r15d, %r9d
	movl	$100, %edx
	movl	$2, %esi
	movl	-588(%rbp), %r8d
	leaq	-160(%rbp), %rbx
	leaq	.LC23(%rip), %rcx
	movq	%rbx, %rdi
	call	__sprintf_chk@PLT
	cmpb	$0, -160(%rbp)
	movl	$1, %ecx
	movq	-336(%rbp,%r13), %rdi
	jne	.L623
.L559:
	movq	stderr(%rip), %rdi
	leaq	.LC24(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L557
	.p2align 4,,10
	.p2align 3
.L614:
	movq	-632(%rbp), %rbx
	jmp	.L553
	.p2align 4,,10
	.p2align 3
.L613:
	movq	-632(%rbp), %rbx
	jmp	.L543
	.p2align 4,,10
	.p2align 3
.L619:
	movl	%esi, -392(%rbp)
	movq	-648(%rbp), %rax
	xorl	%edx, %edx
	leaq	update_WEST_EAST._omp_fn.0(%rip), %rdi
	movl	%esi, -400(%rbp)
	movq	-616(%rbp), %rsi
	movq	%rcx, -424(%rbp)
	xorl	%ecx, %ecx
	movl	%r10d, -384(%rbp)
	movl	%r9d, -388(%rbp)
	movl	$1, -396(%rbp)
	movq	%r8, -416(%rbp)
	movq	%rax, -432(%rbp)
	vmovq	%xmm0, -408(%rbp)
	call	GOMP_parallel@PLT
	jmp	.L547
	.p2align 4,,10
	.p2align 3
.L621:
	movq	-616(%rbp), %rsi
	vpinsrd	$1, %edx, %xmm1, %xmm1
	movl	%edx, -400(%rbp)
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	update_NORTH_SOUTH._omp_fn.0(%rip), %rdi
	movl	$1, -404(%rbp)
	movl	%eax, -408(%rbp)
	vmovdqa	%xmm0, -432(%rbp)
	vmovq	%xmm1, -416(%rbp)
	call	GOMP_parallel@PLT
	jmp	.L555
.L529:
	call	MPI_Wtime@PLT
	vsubsd	-536(%rbp), %xmm0, %xmm0
	cmpl	$0, -588(%rbp)
	movq	$0x000000000, -480(%rbp)
	movq	$0x000000000, -472(%rbp)
	movq	$0x000000000, -464(%rbp)
	movq	$0x000000000, -456(%rbp)
	movq	$0x000000000, -448(%rbp)
	movq	$0x000000000, -440(%rbp)
	movq	$0x000000000, -432(%rbp)
	vmovsd	%xmm0, -536(%rbp)
	je	.L624
	pushq	%rax
	leaq	-536(%rbp), %rdi
	xorl	%r9d, %r9d
	movq	%r14, %rcx
	pushq	-560(%rbp)
	leaq	ompi_mpi_op_sum(%rip), %r8
	movl	$1, %edx
	xorl	%esi, %esi
	call	MPI_Reduce@PLT
	popq	%rdx
	pushq	-560(%rbp)
	xorl	%r9d, %r9d
	leaq	-528(%rbp), %rdi
	movq	%r14, %rcx
	movl	$1, %edx
	xorl	%esi, %esi
	leaq	ompi_mpi_op_sum(%rip), %r8
	call	MPI_Reduce@PLT
	popq	%rcx
	pushq	-560(%rbp)
	xorl	%r9d, %r9d
	leaq	-520(%rbp), %rdi
	movq	%r14, %rcx
	movl	$1, %edx
	xorl	%esi, %esi
	leaq	ompi_mpi_op_sum(%rip), %r8
	call	MPI_Reduce@PLT
	popq	%rsi
	pushq	-560(%rbp)
	xorl	%r9d, %r9d
	leaq	-512(%rbp), %rdi
	movq	%r14, %rcx
	movl	$1, %edx
	xorl	%esi, %esi
	leaq	ompi_mpi_op_sum(%rip), %r8
	call	MPI_Reduce@PLT
	popq	%r8
	pushq	-560(%rbp)
	xorl	%r9d, %r9d
	leaq	-504(%rbp), %rdi
	movq	%r14, %rcx
	movl	$1, %edx
	xorl	%esi, %esi
	leaq	ompi_mpi_op_sum(%rip), %r8
	call	MPI_Reduce@PLT
	popq	%r9
	pushq	-560(%rbp)
	xorl	%r9d, %r9d
	leaq	-496(%rbp), %rdi
	movq	%r14, %rcx
	movl	$1, %edx
	xorl	%esi, %esi
	leaq	ompi_mpi_op_sum(%rip), %r8
	call	MPI_Reduce@PLT
	popq	%r10
	pushq	-560(%rbp)
	xorl	%r9d, %r9d
	leaq	-488(%rbp), %rdi
	movq	%r14, %rcx
	movl	$1, %edx
	xorl	%esi, %esi
	leaq	ompi_mpi_op_sum(%rip), %r8
	call	MPI_Reduce@PLT
	popq	%r11
	popq	%rbx
.L564:
	cmpl	$0, -588(%rbp)
	je	.L625
.L565:
	movl	-700(%rbp), %ebx
	movl	-696(%rbp), %eax
	vxorpd	%xmm6, %xmm6, %xmm6
	orl	$-1, %edi
	movl	-656(%rbp), %r15d
	movq	-752(%rbp), %rcx
	imull	%ebx, %eax
	movq	-744(%rbp), %rbx
	movl	-588(%rbp), %edx
	xorl	$1, %r15d
	movslq	%r15d, %rsi
	vcvtsi2sdl	%eax, %xmm6, %xmm0
	vmulsd	-688(%rbp), %xmm0, %xmm0
	salq	$4, %rsi
	addq	%rbx, %rsi
	call	output_energy_stat
	movq	-648(%rbp), %rsi
	movq	%rbx, %rdi
	call	memory_release
	call	MPI_Finalize@PLT
.L528:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L626
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
.L624:
	.cfi_restore_state
	pushq	%r12
	leaq	-480(%rbp), %rsi
	xorl	%r9d, %r9d
	movq	%r14, %rcx
	pushq	-560(%rbp)
	leaq	-536(%rbp), %rdi
	movl	$1, %edx
	leaq	ompi_mpi_op_sum(%rip), %r8
	call	MPI_Reduce@PLT
	popq	%r13
	pushq	-560(%rbp)
	xorl	%r9d, %r9d
	leaq	-472(%rbp), %rsi
	leaq	-528(%rbp), %rdi
	movq	%r14, %rcx
	movl	$1, %edx
	leaq	ompi_mpi_op_sum(%rip), %r8
	call	MPI_Reduce@PLT
	popq	%r15
	pushq	-560(%rbp)
	xorl	%r9d, %r9d
	leaq	-464(%rbp), %rsi
	leaq	-520(%rbp), %rdi
	movq	%r14, %rcx
	movl	$1, %edx
	leaq	ompi_mpi_op_sum(%rip), %r8
	call	MPI_Reduce@PLT
	popq	%rax
	pushq	-560(%rbp)
	xorl	%r9d, %r9d
	leaq	-456(%rbp), %rsi
	leaq	-512(%rbp), %rdi
	movq	%r14, %rcx
	movl	$1, %edx
	leaq	ompi_mpi_op_sum(%rip), %r8
	call	MPI_Reduce@PLT
	popq	%rax
	pushq	-560(%rbp)
	xorl	%r9d, %r9d
	leaq	-448(%rbp), %rsi
	leaq	-504(%rbp), %rdi
	movq	%r14, %rcx
	movl	$1, %edx
	leaq	ompi_mpi_op_sum(%rip), %r8
	call	MPI_Reduce@PLT
	popq	%rax
	pushq	-560(%rbp)
	xorl	%r9d, %r9d
	leaq	-440(%rbp), %rsi
	leaq	-496(%rbp), %rdi
	movq	%r14, %rcx
	movl	$1, %edx
	leaq	ompi_mpi_op_sum(%rip), %r8
	call	MPI_Reduce@PLT
	popq	%rax
	pushq	-560(%rbp)
	xorl	%r9d, %r9d
	movq	-616(%rbp), %rsi
	movl	$1, %edx
	movq	%r14, %rcx
	leaq	-488(%rbp), %rdi
	leaq	ompi_mpi_op_sum(%rip), %r8
	call	MPI_Reduce@PLT
	popq	%rax
	popq	%rdx
	jmp	.L564
.L623:
	movq	-744(%rbp), %rax
	movq	%rbx, %rdx
	leaq	8(%rax,%r13), %rsi
	call	dump.part.0
	testl	%eax, %eax
	movl	%eax, %ecx
	je	.L557
	jmp	.L559
.L616:
	movl	-588(%rbp), %edx
	movl	%eax, %ecx
	movl	$2, %edi
	xorl	%eax, %eax
	leaq	.LC22(%rip), %rsi
	call	__printf_chk@PLT
	call	MPI_Finalize@PLT
	jmp	.L528
.L625:
	leaq	.LC25(%rip), %rdi
	call	puts@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-480(%rbp), %xmm0
	vcvtsi2sdl	-584(%rbp), %xmm2, %xmm1
	leaq	.LC26(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	movl	$10, %edi
	call	putchar@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-472(%rbp), %xmm0
	vcvtsi2sdl	-584(%rbp), %xmm2, %xmm1
	leaq	.LC27(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-464(%rbp), %xmm0
	vcvtsi2sdl	-584(%rbp), %xmm2, %xmm1
	leaq	.LC28(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	movl	$10, %edi
	call	putchar@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-456(%rbp), %xmm0
	vcvtsi2sdl	-584(%rbp), %xmm2, %xmm1
	leaq	.LC29(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-448(%rbp), %xmm0
	vcvtsi2sdl	-584(%rbp), %xmm2, %xmm1
	leaq	.LC30(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-440(%rbp), %xmm0
	vcvtsi2sdl	-584(%rbp), %xmm2, %xmm1
	leaq	.LC31(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-432(%rbp), %xmm0
	vcvtsi2sdl	-584(%rbp), %xmm2, %xmm1
	leaq	.LC32(%rip), %rsi
	movl	$1, %eax
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	movl	$10, %edi
	call	putchar@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$2, %edi
	vmovsd	-456(%rbp), %xmm0
	vcvtsi2sdl	-584(%rbp), %xmm2, %xmm1
	vaddsd	-448(%rbp), %xmm0, %xmm0
	movl	$1, %eax
	vaddsd	-440(%rbp), %xmm0, %xmm0
	vaddsd	-432(%rbp), %xmm0, %xmm0
	leaq	.LC33(%rip), %rsi
	vdivsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	jmp	.L565
.L626:
	call	__stack_chk_fail@PLT
.L615:
	movl	$2, %edi
	movl	$1, %ecx
	leaq	.LC21(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	call	MPI_Finalize@PLT
	movl	$1, %edi
	call	exit@PLT
.L552:
	xorl	%r12d, %r12d
	testl	%eax, %eax
	sete	%r12b
	jmp	.L566
.L542:
	xorl	%r12d, %r12d
	testl	%eax, %eax
	sete	%r12b
	jmp	.L567
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
	je	.L627
	cmpb	$0, (%rdx)
	jne	.L632
.L627:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L632:
	jmp	dump.part.0
	.cfi_endproc
.LFE6499:
	.size	dump, .-dump
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1070596096
	.align 8
.LC2:
	.long	0
	.long	1071644672
	.align 8
.LC7:
	.long	10000
	.long	10000
	.align 8
.LC8:
	.long	0
	.long	1072693248
	.section	.data.rel.ro,"aw"
	.align 8
.LC34:
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
