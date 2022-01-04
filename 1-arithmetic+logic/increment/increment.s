	.file	"increment.c"
	.text
	.globl	increment
	.type	increment, @function
increment:
.LFB0:
	.cfi_startproc
	endbr64

	//void increment(long *xp)
	movq	(%rdi), %rax //moves *xp to %rax
	addq	$1, %rax //adds 1 to %rax
	movq	%rax, (%rdi) //moves *xp+1 to *xp
	ret
	.cfi_endproc
.LFE0:
	.size	increment, .-increment
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
