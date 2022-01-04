	.file	"3sum.c"
	.text
	.p2align 4
	.globl	sum2
	.type	sum2, @function
sum2:
.LFB0:
	.cfi_startproc
	endbr64
	leaq	(%rdi,%rsi), %rax
	ret
	.cfi_endproc
.LFE0:
	.size	sum2, .-sum2
	.p2align 4
	.globl	sum3
	.type	sum3, @function
sum3:
.LFB1:
	.cfi_startproc
	endbr64
	addq	%rsi, %rdi
	leaq	(%rdi,%rdx), %rax
	ret
	.cfi_endproc
.LFE1:
	.size	sum3, .-sum3
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
