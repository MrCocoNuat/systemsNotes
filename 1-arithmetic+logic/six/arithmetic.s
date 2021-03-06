	.file	"arithmetic.c"
	.text
	.globl	six
	.type	six, @function
six:
.LFB0:
	.cfi_startproc
	endbr64

	//long six(long x);
	
	leaq	(%rdi,%rdi,2), %rax //moves %rdi * 3 to %rax (NOT (%rdi * 3))
	//lea is like mov, but won't dereference the result of source.
	
	addq	%rax, %rax //moves %rax + %rax to %rax. Higher multiplications of 2 are usually bitshifted.

	//multiplications of 1,2,2+1,4,4+1,8,8+1 are achieved by lea
	//multiplications of 2^n are by sal
	//multiplications of 1,2 are easy by add

	//by combining lea and sal, lots of integer muls are easy
	
	//other arithmetic instrucs:
	//add, sub, imul, xor, or, and

	//unary operations:
	//inc, dec, neg (arithmetic), not (logical)

	//bitshifts:
	//sal shl are arithmetic and logical leftshifts (the exact same thing)
	//sar shr are arithmetic (signextend) and logical (zerofill) rightshifts
	
	//bigger multiplies for 128bit result exist too

	


	ret //return %rax
	
	.cfi_endproc
.LFE0:
	.size	six, .-six
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
