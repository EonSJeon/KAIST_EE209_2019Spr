	.file	"wc209.c"
	.comm	c,4,4
	.globl	state
	.bss
	.align 4
	.type	state, @object
	.size	state, 4
state:
	.zero	4
	.globl	nLetr
	.align 4
	.type	nLetr, @object
	.size	nLetr, 4
nLetr:
	.zero	4
	.globl	nWord
	.align 4
	.type	nWord, @object
	.size	nWord, 4
nWord:
	.zero	4
	.globl	nLine
	.align 4
	.type	nLine, @object
	.size	nLine, 4
nLine:
	.zero	4
	.globl	err_line
	.align 4
	.type	err_line, @object
	.size	err_line, 4
err_line:
	.zero	4
	.text
	.globl	out_word
	.type	out_word, @function
out_word:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	__ctype_b_loc
	movq	(%rax), %rax
	movl	c(%rip), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$8192, %eax
	testl	%eax, %eax
	je	.L2
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
	jmp	.L5
.L2:
	movl	c(%rip), %eax
	cmpl	$47, %eax
	jne	.L4
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
	movl	$2, state(%rip)
	jmp	.L5
.L4:
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
	movl	nWord(%rip), %eax
	addl	$1, %eax
	movl	%eax, nWord(%rip)
	movl	$1, state(%rip)
.L5:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	out_word, .-out_word
	.globl	in_word
	.type	in_word, @function
in_word:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	__ctype_b_loc
	movq	(%rax), %rax
	movl	c(%rip), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$8192, %eax
	testl	%eax, %eax
	je	.L7
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
	movl	$0, state(%rip)
	jmp	.L10
.L7:
	movl	c(%rip), %eax
	cmpl	$47, %eax
	jne	.L9
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
	movl	$3, state(%rip)
	jmp	.L10
.L9:
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
.L10:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	in_word, .-in_word
	.globl	start_com_out
	.type	start_com_out, @function
start_com_out:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	__ctype_b_loc
	movq	(%rax), %rax
	movl	c(%rip), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$8192, %eax
	testl	%eax, %eax
	je	.L12
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
	movl	nWord(%rip), %eax
	addl	$1, %eax
	movl	%eax, nWord(%rip)
	movl	$0, state(%rip)
	jmp	.L16
.L12:
	movl	c(%rip), %eax
	cmpl	$42, %eax
	jne	.L14
	movl	nLine(%rip), %eax
	movl	%eax, err_line(%rip)
	movl	$4, state(%rip)
	jmp	.L16
.L14:
	movl	c(%rip), %eax
	cmpl	$47, %eax
	jne	.L15
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
	movl	nWord(%rip), %eax
	addl	$1, %eax
	movl	%eax, nWord(%rip)
	movl	$3, state(%rip)
	jmp	.L16
.L15:
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
	movl	nWord(%rip), %eax
	addl	$1, %eax
	movl	%eax, nWord(%rip)
	movl	$1, state(%rip)
.L16:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	start_com_out, .-start_com_out
	.globl	start_com_in
	.type	start_com_in, @function
start_com_in:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	__ctype_b_loc
	movq	(%rax), %rax
	movl	c(%rip), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$8192, %eax
	testl	%eax, %eax
	je	.L18
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
	movl	$0, state(%rip)
	jmp	.L22
.L18:
	movl	c(%rip), %eax
	cmpl	$42, %eax
	jne	.L20
	movl	nLine(%rip), %eax
	movl	%eax, err_line(%rip)
	movl	$4, state(%rip)
	jmp	.L22
.L20:
	movl	c(%rip), %eax
	cmpl	$47, %eax
	jne	.L21
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
	jmp	.L22
.L21:
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
	movl	$1, state(%rip)
.L22:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	start_com_in, .-start_com_in
	.globl	in_com
	.type	in_com, @function
in_com:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	c(%rip), %eax
	cmpl	$42, %eax
	jne	.L24
	movl	$5, state(%rip)
	jmp	.L26
.L24:
	movl	c(%rip), %eax
	cmpl	$10, %eax
	jne	.L26
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
.L26:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	in_com, .-in_com
	.globl	end_com
	.type	end_com, @function
end_com:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	c(%rip), %eax
	cmpl	$47, %eax
	jne	.L28
	movl	$0, state(%rip)
	jmp	.L31
.L28:
	movl	c(%rip), %eax
	cmpl	$10, %eax
	jne	.L30
	movl	nLetr(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLetr(%rip)
	movl	$4, state(%rip)
	jmp	.L31
.L30:
	movl	c(%rip), %eax
	cmpl	$42, %eax
	je	.L31
	movl	$4, state(%rip)
.L31:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	end_com, .-end_com
	.globl	state_changing
	.type	state_changing, @function
state_changing:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	c(%rip), %eax
	cmpl	$10, %eax
	jne	.L33
	movl	nLine(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLine(%rip)
.L33:
	movl	state(%rip), %eax
	cmpl	$5, %eax
	ja	.L42
	movl	%eax, %eax
	movq	.L36(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L36:
	.quad	.L35
	.quad	.L37
	.quad	.L38
	.quad	.L39
	.quad	.L40
	.quad	.L41
	.text
.L35:
	movl	$0, %eax
	call	out_word
	jmp	.L34
.L37:
	movl	$0, %eax
	call	in_word
	jmp	.L34
.L38:
	movl	$0, %eax
	call	start_com_out
	jmp	.L34
.L39:
	movl	$0, %eax
	call	start_com_in
	jmp	.L34
.L40:
	movl	$0, %eax
	call	in_com
	jmp	.L34
.L41:
	movl	$0, %eax
	call	end_com
	nop
.L34:
.L42:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	state_changing, .-state_changing
	.section	.rodata
	.align 8
.LC0:
	.string	"Error: line %d: unterminated comment\n"
.LC1:
	.string	"%d %d %d\n"
	.text
	.globl	terminating
	.type	terminating, @function
terminating:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	state(%rip), %eax
	cmpl	$5, %eax
	ja	.L44
	movl	%eax, %eax
	movq	.L46(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L46:
	.quad	.L50
	.quad	.L50
	.quad	.L47
	.quad	.L50
	.quad	.L48
	.quad	.L48
	.text
.L47:
	movl	nWord(%rip), %eax
	addl	$1, %eax
	movl	%eax, nWord(%rip)
	jmp	.L44
.L48:
	movl	err_line(%rip), %edx
	movq	stderr(%rip), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$1, %eax
	jmp	.L49
.L50:
	nop
.L44:
	movl	nLetr(%rip), %esi
	movl	nWord(%rip), %ecx
	movl	nLine(%rip), %edx
	movq	stdout(%rip), %rax
	movl	%esi, %r8d
	movl	$.LC1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$0, %eax
.L49:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	terminating, .-terminating
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	getchar
	movl	%eax, c(%rip)
	movl	c(%rip), %eax
	cmpl	$-1, %eax
	je	.L53
	movl	nLine(%rip), %eax
	addl	$1, %eax
	movl	%eax, nLine(%rip)
	movl	$0, %eax
	call	state_changing
	jmp	.L53
.L54:
	movl	$0, %eax
	call	state_changing
.L53:
	call	getchar
	movl	%eax, c(%rip)
	movl	c(%rip), %eax
	cmpl	$-1, %eax
	jne	.L54
	movl	$0, %eax
	call	terminating
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
