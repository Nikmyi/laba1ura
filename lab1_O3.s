	.file	"lab1.c"
	.text
	.p2align 4
	.globl	gcd2
	.def	gcd2;	.scl	2;	.type	32;	.endef
	.seh_proc	gcd2
gcd2:
	.seh_endprologue
	movl	%ecx, %eax
	testl	%edx, %edx
	je	.L1
	.p2align 4
	.p2align 4
	.p2align 3
.L3:
	movl	%edx, %ecx
	cltd
	idivl	%ecx
	movl	%ecx, %eax
	testl	%edx, %edx
	jne	.L3
.L1:
	movl	%ecx, %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	gcd3
	.def	gcd3;	.scl	2;	.type	32;	.endef
	.seh_proc	gcd3
gcd3:
	.seh_endprologue
	movl	%ecx, %eax
	testl	%edx, %edx
	je	.L12
	.p2align 4
	.p2align 4
	.p2align 3
.L9:
	movl	%edx, %r9d
	cltd
	idivl	%r9d
	movl	%r9d, %eax
	testl	%edx, %edx
	jne	.L9
	testl	%r8d, %r8d
	jne	.L11
	jmp	.L16
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L14:
	movl	%edx, %r8d
.L11:
	movl	%r9d, %eax
	movl	%r8d, %r9d
	cltd
	idivl	%r8d
	testl	%edx, %edx
	jne	.L14
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	movl	%ecx, %r9d
	testl	%r8d, %r8d
	jne	.L11
.L16:
	movl	%r9d, %r8d
	movl	%r8d, %eax
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\202\321\200\320\270 \320\275\320\260\321\202\321\203\321\200\320\260\320\273\321\214\320\275\321\213\321\205 \321\207\320\270\321\201\320\273\320\260 A B C: \0"
.LC1:
	.ascii "%d %d %d\0"
.LC2:
	.ascii "\320\236\321\210\320\270\320\261\320\272\320\260 \320\262\320\262\320\276\320\264\320\260\0"
	.align 8
.LC3:
	.ascii "\320\247\320\270\321\201\320\273\320\260 \320\264\320\276\320\273\320\266\320\275\321\213 \320\261\321\213\321\202\321\214 \320\275\320\260\321\202\321\203\321\200\320\260\320\273\321\214\320\275\321\213\320\274\320\270 (> 0)\0"
	.align 8
.LC4:
	.ascii "\320\235\320\260\320\270\320\274\320\265\320\275\321\214\321\210\320\270\320\271 \320\276\320\261\321\211\320\270\320\271 \320\264\320\265\320\273\320\270\321\202\320\265\320\273\321\214 = 1 (\320\264\321\200\321\203\320\263\320\270\321\205 \320\276\320\261\321\211\320\270\321\205 \320\264\320\265\320\273\320\270\321\202\320\265\320\273\320\265\320\271 \320\275\320\265\321\202)\0"
	.align 8
.LC5:
	.ascii "\320\235\320\260\320\270\320\261\320\276\320\273\321\214\321\210\320\270\320\271 \320\276\320\261\321\211\320\270\320\271 \320\264\320\265\320\273\320\270\321\202\320\265\320\273\321\214 \321\207\320\270\321\201\320\265\320\273 %d, %d, %d = %d\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rcx
	call	printf
	leaq	68(%rsp), %rdx
	leaq	76(%rsp), %r9
	leaq	72(%rsp), %r8
	leaq	.LC1(%rip), %rcx
	call	scanf
	cmpl	$3, %eax
	jne	.L29
	movl	68(%rsp), %ebx
	testl	%ebx, %ebx
	jle	.L20
	movl	72(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L20
	movl	76(%rsp), %r9d
	testl	%r9d, %r9d
	jle	.L20
	movl	%r8d, %edx
	movl	%ebx, %eax
	.p2align 4
	.p2align 4
	.p2align 3
.L21:
	movl	%edx, %ecx
	cltd
	idivl	%ecx
	movl	%ecx, %eax
	testl	%edx, %edx
	jne	.L21
	movl	%r9d, %r10d
	.p2align 4
	.p2align 4
	.p2align 3
.L22:
	movl	%ecx, %eax
	movl	%r10d, %ecx
	cltd
	idivl	%r10d
	movl	%edx, %r10d
	testl	%edx, %edx
	jne	.L22
	movl	%edx, 60(%rsp)
	cmpl	$1, %ecx
	je	.L30
	movl	%ecx, 32(%rsp)
	movl	%ebx, %edx
	leaq	.LC5(%rip), %rcx
	call	printf
	movl	60(%rsp), %r10d
.L17:
	movl	%r10d, %eax
	addq	$80, %rsp
	popq	%rbx
	ret
.L20:
	leaq	.LC3(%rip), %rcx
	call	puts
.L19:
	movl	$1, %r10d
	movl	%r10d, %eax
	addq	$80, %rsp
	popq	%rbx
	ret
.L29:
	leaq	.LC2(%rip), %rcx
	call	puts
	jmp	.L19
.L30:
	leaq	.LC4(%rip), %rcx
	call	puts
	movl	60(%rsp), %r10d
	jmp	.L17
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev6, Built by MSYS2 project) 16.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
