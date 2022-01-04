//swap3(long *xp, long *yp, long *xp) sets x,y,z to y,z,x 
swap3:
	pushq %rbx
	//push to save for later
	pushq %rbp
	//push to save for later 
	movq (%rdi), %rbx
	//move *xp = x to %rbx = x
	movq (%rsi), %rbp
	//move *yp = y to %rbp = y
	movq %rbp, (%rdi)
	//move y to *xp
	movq (%rdx), %rbp
	//move *zp = z to %rbp = z
	movq %rbp, (%rsi)
	//move z to *yp
	movq %rbx, (%rdx)
	//move x to *zp
	popq %rbp
	//restore %rbp
	popq %rbx
	//restore %rbx
