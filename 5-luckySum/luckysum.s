luckysum:
	xor %rax, %rax
	test $13, %rdi
	je unluckya
	test $13, %rsi
	je unluckyb
	test $13, %rdx
	je unluckyc
	addq %rdx, %rax
unluckyc:
	addq %rsi, %rax
unluckyb:
	addq %rdi, %rax
unluckya:
	ret
