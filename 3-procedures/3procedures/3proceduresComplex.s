	.file	"3procedures.c"
	.text
	.p2align 4
	.globl	f
	.type	f, @function
f:
.LFB0:
	.cfi_startproc
	endbr64
	leaq	4(%rdi,%rdi), %rax
	ret
	.cfi_endproc
.LFE0:
	.size	f, .-f
	.p2align 4
	.globl	g
	.type	g, @function
g:
.LFB1:
	.cfi_startproc
	endbr64
	leaq	(%rdi,%rdi), %rax
	ret
	.cfi_endproc
.LFE1:
	.size	g, .-g
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
