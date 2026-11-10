	.file	"lab1.c"
	.text
	.globl	gcd2
	.def	gcd2;	.scl	2;	.type	32;	.endef
	.seh_proc	gcd2
gcd2:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	jmp	.L2
.L3:
	movl	24(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	16(%rbp), %eax
	cltd
	idivl	24(%rbp)
	movl	%edx, 24(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, 16(%rbp)
.L2:
	cmpl	$0, 24(%rbp)
	jne	.L3
	movl	16(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	gcd3
	.def	gcd3;	.scl	2;	.type	32;	.endef
	.seh_proc	gcd3
gcd3:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	24(%rbp), %edx
	movl	16(%rbp), %eax
	movl	%eax, %ecx
	call	gcd2
	movl	%eax, %ecx
	movl	32(%rbp), %eax
	movl	%eax, %edx
	call	gcd2
	addq	$32, %rsp
	popq	%rbp
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
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-16(%rbp), %r8
	leaq	-12(%rbp), %rdx
	leaq	-8(%rbp), %rax
	leaq	.LC1(%rip), %rcx
	movq	%r8, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	call	scanf
	cmpl	$3, %eax
	je	.L8
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$1, %eax
	jmp	.L14
.L8:
	movl	-8(%rbp), %eax
	testl	%eax, %eax
	jle	.L10
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	jle	.L10
	movl	-16(%rbp), %eax
	testl	%eax, %eax
	jg	.L11
.L10:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$1, %eax
	jmp	.L14
.L11:
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	gcd3
	movl	%eax, -4(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L12
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L13
.L12:
	movl	-16(%rbp), %r9d
	movl	-12(%rbp), %r8d
	movl	-8(%rbp), %eax
	leaq	.LC5(%rip), %rcx
	movl	-4(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%eax, %edx
	call	printf
.L13:
	movl	$0, %eax
.L14:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev6, Built by MSYS2 project) 16.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
