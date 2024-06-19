# E) Escreva, em MIPS assembly, um programa que leia um inteiro N e implemente um contador regressivo,
# mostrando na tela os números de N até 1. Imprima os números em uma linha, separados entre si por um único espaço.
# Não imprima outras mensagens de texto para indicar entrada/saída de dados.

.data

space:	.asciiz " "

.text
.globl main
main:
	li $v0, 5
	syscall
	
	add $s0, $v0, $zero	# i = n
	
loop:
	# se for 0, cabou
	beq $s0, $zero, end
	
	# printa numero
	add $a0, $s0, $zero
	li $v0, 1
	syscall
	
	# printa o espaco
	la $a0, space
	li $v0, 4
	syscall
	
	# subtrai e segue
	subi $s0, $s0, 1
	j loop
	
end:
	li $v0, 10
	syscall
	