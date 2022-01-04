	.file	"2while.c"
	.text
	.globl	count
	.type	count, @function
count:
.LFB0:
	.cfi_startproc
	endbr64
	movl	$0, %eax //move 0 to %rax, [ans = 0]
	
.L2:
	movq	%rdi, %rdx //mov %rdi to %rdx [temp = x]
	andl	$1, %edx //and 0x1 with %rdx [temp = temp & 0x1]
	addq	%rdx, %rax //add %rdx to %rax [ans = ans + temp]
	shrq	%rdi //logic rightshift %rdi [x = x >> 1]. DO NOT sar, or loops
	jne	.L2 //jump to .L2 if %rdi is not 0, or ~ZF [if (x) goto loop]
	ret //return %rax [return ans]

	//translating a while loop to do-while to goto to assembly is easier
	//translating while to goto is doable by jumping to the middle too:

	/*
		goto test;
	loop:
		body
	test:
		if (Test) goto loop ;
	done:	
	*/

	//jumptables for switch statements are popular
	//usually switches need n/2 tests on average (linear)
	//but if switch(x) where x is an integer in [1,n]
	//then random access of jump table entries is possible

	/* If %rdi holds the switch case, and %rax will hold the ans var:


		(checks for %rdi out of bounds, and move so that min = 0)
		(might look like subq 10, %rdi \n cmpq 5, %rdi)
		(j(condition like ja for cmp) .Ldefault)
		(i.e. translate by -10 and if >5 or <0 jump to default)
		(<0 looks like huge number to cmp, so still above)

		jmp .jumpTable( ,%rdi,8) //jump to %rdi * 8 + jumpTable

	
		.align 8 //IP better be aligned to the same scale as %rdi
	jumpTable:
		jmp .L12  <jumpTable + 0>
		jmp .Ldefault <jumpTable + 8>
		jmp .L1415 <jumpTable + 16>
		jmp .L1415 <jumpTable + 24> ...
	*/

	//no matter which case, only 2 jumps

	//how about 1 jump? Use jmp*

	//.quad creates a quadword (long) equal in value to the arg

	/*
		jmp* .jmpTbl(,$rdi,8) 

		.align 8
	.jmpTbl:
		.quad .L10
		.quad .L11
		.quad .L12
		.quad .Ldefault
		.quad .L1415
		.quad .L1415
	*/

	//jmp* jumps to the LOCATION that the argument contains
	
	.cfi_endproc
.LFE0:
	.size	count, .-count
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
