	.file	"lab1.c"
	.text
	.globl	gcd2
	.def	gcd2;	.scl	2;	.type	32;	.endef
	.seh_proc	gcd2
gcd2:
	.seh_endprologue
	movl	%ecx, %eax
	movl	%edx, %r8d
	testl	%edx, %edx
	je	.L1
	.p2align 4
.L3:
	movl	%r8d, %ecx
	cltd
	idivl	%r8d
	movl	%edx, %r8d
	movl	%ecx, %eax
	testl	%edx, %edx
	jne	.L3
.L1:
	movl	%ecx, %eax
	ret
	.seh_endproc
	.globl	gcd3
	.def	gcd3;	.scl	2;	.type	32;	.endef
	.seh_proc	gcd3
gcd3:
	.seh_endprologue
	movl	%ecx, %eax
	movl	%edx, %r10d
	testl	%edx, %edx
	je	.L11
	.p2align 5
.L8:
	movl	%r10d, %r9d
	cltd
	idivl	%r10d
	movl	%edx, %r10d
	movl	%r9d, %eax
	testl	%edx, %edx
	jne	.L8
.L7:
	testl	%r8d, %r8d
	je	.L12
	.p2align 5
.L10:
	movl	%r8d, %ecx
	movl	%r9d, %eax
	cltd
	idivl	%r8d
	movl	%edx, %r8d
	movl	%ecx, %r9d
	testl	%edx, %edx
	jne	.L10
.L6:
	movl	%ecx, %eax
	ret
.L11:
	movl	%ecx, %r9d
	jmp	.L7
.L12:
	movl	%r9d, %ecx
	jmp	.L6
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
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rcx
	call	printf
	leaq	60(%rsp), %rdx
	leaq	52(%rsp), %r9
	leaq	56(%rsp), %r8
	leaq	.LC1(%rip), %rcx
	call	scanf
	cmpl	$3, %eax
	jne	.L23
	movl	60(%rsp), %ebx
	testl	%ebx, %ebx
	jle	.L18
	movl	56(%rsp), %esi
	testl	%esi, %esi
	jle	.L18
	movl	52(%rsp), %eax
	movl	%eax, %edi
	testl	%eax, %eax
	jle	.L18
	movl	%eax, %r8d
	movl	%esi, %edx
	movl	%ebx, %ecx
	call	gcd3
	cmpl	$1, %eax
	je	.L24
	movl	%eax, 32(%rsp)
	movl	%edi, %r9d
	movl	%esi, %r8d
	movl	%ebx, %edx
	leaq	.LC5(%rip), %rcx
	call	printf
.L22:
	movl	$0, %eax
	jmp	.L15
.L23:
	leaq	.LC2(%rip), %rcx
	call	puts
	jmp	.L20
.L18:
	leaq	.LC3(%rip), %rcx
	call	puts
.L20:
	movl	$1, %eax
.L15:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L24:
	leaq	.LC4(%rip), %rcx
	call	puts
	jmp	.L22
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev6, Built by MSYS2 project) 16.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
