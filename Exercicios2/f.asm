# F) Escreva, em MIPS assembly, um programa que leia um inteiro N e mostre os N primeiros números ímpares.
# Imprima os números em uma linha, separados entre si por um único espaço. Não imprima outras mensagens de texto para
# indicar entrada/saída de dados. Atenção: se o usuário informar um valor N = 4, a resposta deve ser: 1 3 5 7

.data

space:	.asciiz " "

.text
.globl main
main:
	# read integer
	li $v0, 5
	syscall
	
	add $s0, $v0, $zero	# salvando n em s0
	li $s1, 0		# i = 0

loop:
	# se i chegar em n, parar
	slt $t0, $s1, $s0
	beq $t0, $zero, end
	
	# cria o numero impar: multiplica por dois e adiciona 1
	sll $a0, $s1, 1
	addi $a0, $a0, 1
	
	# printa o numero
	li $v0, 1
	syscall
	
	#printa o espaco
	li $v0, 4
	la $a0, space
	syscall
	
	# incrementa i e continua loop
	addi $s1, $s1, 1
	j loop
	
end:
	# halt program
	li $v0, 10
	syscall