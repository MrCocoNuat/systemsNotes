	.file	"4forstruct.c"
	.text
	.globl	f
	.type	f, @function
f:
.LFB0:
	.cfi_startproc
	endbr64
	movl	$0, %eax
.L2:
	cmpq	$9, %rax
	jg	.L4   		;using the jmp to out technique, not jmp to mid
	movq	88(%rdi,%rax,8), %rdx ;88+s+8i is address of c[i]
	;; rdx is caller saved, free to clobber
	movq	%rdx, 8(%rdi,%rax,8)  ;8+s+8i is the address of b[i]
	addq	$1, %rax	      ;increment i
	jmp	.L2
.L4:
	ret 			;done

	;; how to align struct st?
	;; struct must be on most stringent boundary.
	;; to avoid wasted padding, programmer puts BIGGEST PARTS FIRST

	
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
