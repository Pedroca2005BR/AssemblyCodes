# I) Escreva, em MIPS assembly, um programa que leia dois valores A e B e passe-os como parâmetros para
# um subprograma que computa e devolve a soma dos valores no intervalo [A, B]. Em sua resposta, imprima
# apenas o valor da soma. Não imprima outras mensagens de texto para indicar entrada/saída de dados.

.data

space:	.asciiz " "

.text
.globl main

main:
	# salva em s0 o valor A
	li $v0, 5
	syscall
	add $s0, $zero, $v0
	
	# salva em s1 o valor B
	li $v0, 5
	syscall
	add $s1, $zero, $v0
	
	# preparando os parametros
	add $a0, $zero, $s0
	add $a1, $zero, $s1
	
	jal intervalSum		# chamando funcao
	
	add $a0, $v0, $zero	# pega o retorno e salva em a0
	
	# imprime soma
	li $v0, 1
	syscall
	
	# halt
	li $v0, 10
	syscall
	
	
.data
.text
intervalSum:
	# primeiro teste: exclusivo
	slt $t1, $a0, $a1
	beq $t1, $zero, back
	
	# adiciona a soma
	add $t0, $t0, $a0
	
	# incrementa e resume loop
	addi $a0, $a0, 1
	j intervalSum
	
back:
	add $v0, $zero, $t0
	jr $ra