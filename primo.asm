# Escrever um subptograma que verifique se um valor informado pelo usuario eh primo

.data

sim:	.asciiz "primo"
nao:	.asciiz "nao primo"

.text
.globl main
main:
	li $v0, 5	# 5 = read integer
	syscall
	
	# chamando funcao primo
	add $a0, $v0, $zero
	jal primo
	
	# retorno em v0
	beq $v0, $zero, negativo

positivo:
	la $a0, sim
	j trueEnd
negativo:
	la $a0, nao
trueEnd:
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall

.data
.text
primo:
	# passo 1: ver se eh par ou 1
	li $t0, 1
	beq $t0, $a0, false
	
	andi $t0, $a0, 1	# t0 = 1 se ultimo bit = 1
	beq $t0, $zero, false	# if 0, par, ou seja, nao primo
	
	# passo 2: loop
	li $t0, 3	# i = 3
loop:
	rem $t1, $a0, $t0	# t1 = a0 % i
	beq $t1, $zero, false	# se nao tiver resto, nao eh primo
	
	mul $t1, $t0, $t0	# t1 = i^2
	slt $t2, $t1, $a0	# t2 = t1 < a0
	beq $t2, $zero, true	# se nao for menor, vai pra true
	
	
	addi $t0, $t0, 2	# soma i em 2
	j loop
	
false:
	li $v0, 0
	jr $ra
true:
	li $v0, 1
	jr $ra
