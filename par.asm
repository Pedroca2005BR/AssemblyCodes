# Retorna se um numero eh par ou nao


.data

impar:	.asciiz "impar"
par:	.asciiz "par"

.text
.globl main
main:
	li $v0, 5	# 5 = read int
	syscall
	
	# prepare function call
	add $a0, $zero, $v0
	jal parFunction
	
	bne $v0, $zero, i	# if not 0, impar

p:
	la $a0, par
	j trueEnd

i:	la $a0, impar

trueEnd:
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	
.data
.text
parFunction:
	# and retorna se o ultimo bit do numero de um numero eh igual a 1
	andi $v0, $a0, 1	# 1 = eh par	0 = eh impar
	
	jr $ra
