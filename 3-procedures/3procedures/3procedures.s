	.file	"3procedures.c"
	.text
	.globl	g
	.type	g, @function
g: 				;here is g
.LFB1:
	.cfi_startproc
	endbr64
	leaq	(%rdi,%rdi), %rax ;place 2*y into %rax 
	ret			  ;return %rax
	.cfi_endproc
.LFE1:
	.size	g, .-g
	.globl	f
	.type	f, @function
f:				;Here is f
.LFB0:
	.cfi_startproc
	endbr64
	addq	$2, %rdi 	;add 2 to x
	call	g		;call g, x is already in %rdi

	//call first places %rip onto stack so it can come back,
	//then starts the next stackframe, (calleesaved registers,
	//local variables, arguments for subfunctions).
	
	ret			;return %rax, placed by g
	.cfi_endproc
.LFE0:
	.size	f, .-f
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
