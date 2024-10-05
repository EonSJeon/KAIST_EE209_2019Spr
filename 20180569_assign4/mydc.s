### --------------------------------------------------------------------
### Assignment4 mydc.s
###
### 20180569 Jeon Sangeon
### Desk Calculator (dc)
### --------------------------------------------------------------------

	.equ   ARRAYSIZE, 20
	.equ   EOF, -1
	
.section ".rodata"

scanfFormat:
	.asciz "%s"
stackEmpty:
	.asciz "dc:stack empty\n"
displayFormat:
	.asciz "%d\n"
### --------------------------------------------------------------------

        .section ".data"

### --------------------------------------------------------------------

        .section ".bss"
buffer:
        .skip  ARRAYSIZE

### --------------------------------------------------------------------

	.section ".text"

	## -------------------------------------------------------------
	## int main(void)
	## Runs desk calculator program.  Returns 0.
	## -------------------------------------------------------------

	.globl  main
	.type   main,@function

main:

	pushl   %ebp
	movl    %esp, %ebp

input:

	## dc number stack initialized. %esp = %ebp
	
	## scanf("%s", buffer)
	pushl	$buffer
	pushl	$scanfFormat
	call    scanf
	addl    $8, %esp

	## check if user input EOF
	cmp	$EOF, %eax
	je	quit

########################################################
########################################################
########################################################
	## check if user input digit
	
	movl	$0, %ebx
	movzbl	buffer(,%ebx,1), %ecx
	pushl	%ecx
	call 	isdigit
	## %eax: isdigit
	addl	$4, %esp
	## %ecx: first letter

	cmp	$0, %eax
	jne	digit

#########################################################
#########################################################

##Operaters Switch
	## user input '_'
	cmp	$95, %ecx
	je	inputneg
	
	## user input 'p'
	cmp	$112, %ecx
	je	inputp	

	## user input 'q'
	cmp	$113, %ecx
	je	quit
	
	## user input '+'
	cmp	$43, %ecx
	je	inputplus
	
	## user input '-'
	cmp	$45, %ecx
	je	inputminus

	## user input '*'
	cmp	$42, %ecx
	je	inputmul

	## user input '/'
	cmp	$47, %ecx
	je	inputdivq

	## user input '%'
	cmp	$37, %ecx
	je	inputdivr

	## user input '^'
	cmp	$94, %ecx
	je	inputexp

	## user input 'f'
	cmp	$102, %ecx
	je	inputf

	## user input 'c'
	cmp	$99, %ecx
	je	inputc
	
	## user input 'd'
	cmp	$100, %ecx
	je	inputd
	
	## user input 'r'
	cmp	$114, %ecx
	je	inputr

	## user input wrong
	jmp	input

#########################################################
#########################################################

##Tool funcs

twoOpds:
## Pops 1st opd in %ebx,
##      2nd opd in %eax
	movl	(%esp), %ecx
	## %ecx: old eip
	addl	$4, %esp
	cmp	%esp, %ebp
	je	inputEmpty1
	popl 	%ebx
	## %ebx: opd1

	cmp	%esp, %ebp
	je	inputEmpty2
	popl	%eax
	## %eax: opd2

	pushl	%ecx
	ret
#########################################################
inputEmpty1:
## When 1st opd is empty
	pushl	$stackEmpty
	call 	printf
	addl	$4, %esp
	jmp	input
#########################################################
inputEmpty2:
## When 2nd opd is empty
	subl	$4, %esp
	pushl	$stackEmpty
	call 	printf
	addl	$4, %esp
	jmp	input

#########################################################
#########################################################

##Store funcs

digit:
## user input digit
	pushl	$buffer
	call	atoi
	addl	$4, %esp
	## %eax: input int
	pushl	%eax
	jmp 	input

#########################################################
#########################################################

##Calculate funcs

inputneg:
## user input '_'
	movl	$1, %eax
	movzbl	buffer(,%eax,1), %ebx
	## %ebx: second letter

	pushl	%ebx
	call 	isdigit
	addl	$4, %esp
	cmp	$0, %eax
	je	input

	movl	$1, %ebx
	addl	$buffer, %ebx
	## %ebx: addr of 2nd letter
	pushl	%ebx
	call	atoi
	## %eax: pos val
	addl	$4, %esp
	negl	%eax
	## %eax: neg val

	pushl	%eax
	jmp	input
#########################################################
inputplus:
## user input '+'
	call	twoOpds
	## %ebx: opd1
	## %eax: opd2
	addl	%ebx, %eax
	## %eax: opd2+opd1
	pushl	%eax
	jmp 	input
#########################################################
inputminus:
## user input '-'
	call	twoOpds
	## %ebx: opd1
	## %eax: opd2
	subl	%ebx, %eax
	## %eax: opd2-opd1
	pushl	%eax
	jmp 	input
#########################################################
inputmul:
## user input '*'
	call	twoOpds
	## %ebx: opd1
	## %eax: opd2
	movl	$0, %edx
	imull	%ebx
	## %eax: opd2*opd1
	pushl	%eax
	jmp input
#########################################################
inputdivq:
## user input '/'
	call	twoOpds
	## %ebx: opd1
	## %eax: opd2
	cmp	$0, %eax
	jl	inputdivq1
	movl	$0, %edx
	idivl	%ebx
	## %eax: opd2/opd1
	pushl	%eax
	jmp 	input
inputdivq1:
	negl	%eax
	movl	$0, %edx
	idivl	%ebx
	## %eax: opd2/opd1
	negl	%eax
	## %eax: opd2/opd1
	pushl	%eax
	jmp	input
#########################################################
inputdivr:
## user input '%'
	call	twoOpds
	## %ebx: opd1
	## %eax: opd2
	cmp	$0, %eax
	jl	input
	cmp	$0, %ebx
	jl	input
	movl	$0, %edx
	idivl	%ebx
	## %edx: opd2%opd1
	pushl	%edx
	jmp input

#########################################################
inputexp:
## user input '^'
	call	twoOpds
	## %ebx: exponent
	## %eax: base

	cmp	$0, %ebx
	jl	input

	movl	%ebx, %esi
	movl	%eax, %ebx
	movl	$1, %eax
	## %esi: exponent
	## %ebx: base
	## %eax: return val
inputexp1:
	movl	$0, %edx
	imull	%ebx
	## %eax= %eax*%ebx
	subl	$1, %esi
	cmp	$0, %esi
	jne	inputexp1

	pushl	%eax
	jmp	input
	
#########################################################
#########################################################

##Advanced funcs

inputp:
## user input 'p'
	cmp	%esp, %ebp
	je	inputEmpty1
	pushl	$displayFormat
	call	printf
	addl	$4, %esp
	jmp	input
#########################################################
inputf:
## user input 'f'
	cmp	%esp, %ebp
	je	inputEmpty1
	movl	%esp, %ebx
	## %ebx: a val of %esp
inputf1:
	pushl	(%ebx)
	pushl	$displayFormat
	call	printf
	addl	$8, %esp
	addl	$4, %ebx
	cmp	%ebx, %ebp
	jne	inputf1
	jmp	input
#########################################################
inputc:
## user input 'c'
	cmp	%esp, %ebp
	je	inputEmpty1
inputc1:
	cmp	%esp ,%ebp
	je	input
	addl	$4, %esp
	jmp	inputc1
#########################################################
inputd:
	cmp	%esp, %ebp
	je	inputEmpty1
	pushl	(%esp)
	jmp	input
#########################################################
inputr:
## user input 'r'
	cmp	%esp, %ebp
	je	inputEmpty1
	addl	$4, %esp

	cmp	%esp, %ebp
	je	inputEmpty2
	subl	$4, %esp	
inputr1:
	movl	%esp, %eax
	movl	%esp, %esi
	movl	%ebp, %esp
	subl	$4, %esp
	## %esp: from bottom to top
	## %eax: from top to bottom
	## %esi: return point
inputr2:
	cmp	%esp, %eax
	jge	inputr3
	movl	(%esp), %ebx
	movl	(%eax), %ecx
	## %ebx: temp restore for bottom
	## %ecx: temp restore for top
	movl	%ecx, (%esp)
	movl	%ebx, (%eax)
	addl	$4, %eax
	subl	$4, %esp
	jmp	inputr2
inputr3:
	movl	%esi, %esp
	jmp	input

#########################################################
#########################################################
#########################################################
quit:	
	## return 0
	movl    $0, %eax
	movl    %ebp, %esp
	popl    %ebp
	ret
