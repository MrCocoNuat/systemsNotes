	//register uses:
	//%rsp stack pointer
	//%rax return value
	//%rbx callee saved
	//%rdi %rsi args12
	//%rdx %rcx args34
	//%r8 r9 args56
	//%rbp %r12-15 callee saved
	//%r10-11 caller saved

	//caller saved means caller has to preserve, callee is free to use
	//callee saved means caller does nothing, callee must restore before ret
	//argument registers are caller saved

	
	//the suffix of instructions indicates the working data type, b w l q for byte word dword qword
	
	.file	"mstore.c"
	.text
	.globl	multstore
	.type	multstore, @function
multstore: //void multstore(long x, long y, long *dest)
.LFB0:
	.cfi_startproc
	endbr64

	// conventional arglist: %rdi, %rsi, %rdx, ...	arranged by caller
	
	pushq	%rbx //push %rbx onto stack for saving.
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	//caller of multstore already put x,y in %rdi %rsi !
	movq	%rdx, %rbx //move %rdx = dest to %rbx
	call	mult2@PLT //call mult2(x,y), which puts result in %rax
	movq	%rax, (%rbx) //move %rax to *dest = (%rbx)
	popq	%rbx //pop from stack to restore %rbx.

	//numeric constants can be written as immediates: $-1, $0x5F, $3.14

	//specific memory addresses are written as 1234, or (%r) for the location specced by register
	//0xFF(%r) is the address %r + 255
	//most generally, Disp(Rb,%rb,%ri,S) is the location (%rb + S*%ri + Disp)
	//mov mem mem is illegal!
	
	.cfi_def_cfa_offset 8
	ret //return
	.cfi_endproc
.LFE0:
	.size	multstore, .-multstore
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
