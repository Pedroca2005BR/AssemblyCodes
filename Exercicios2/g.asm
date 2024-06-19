# G) Escreva, em MIPS assembly, um programa que leia um inteiro N e mostre a soma dos n�meros de 1 at� N (inclusive).
# N�o deixe o usu�rio inserir um valor de N menor ou igual a zero. Nesse caso, continue lendo valores N, at� que um valor
# positivo seja digitado. Imprima, como resposta, apenas o valor da soma. N�o imprima outras mensagens
# de texto para indicar entrada/sa�da de dados.

.data
.text
.globl main
main:
	li $v0, 5
	syscall
	
	# se 0 nao for menor q n, tenta de novo
	slt $s0, $zero, $v0
	beq $s0, $zero, main
	
	li $s0, 1	# i = 1

loop:
	# se n for menor que i, segue em frente
	slt $t0, $v0, $s0
	bne $t0, $zero, end
	
	# segue a soma
	add $a0, $a0, $s0
	
	# incrementa e segue o loop
	addi $s0, $s0, 1
	j loop
	
end:
	# printa a soma
	li $v0, 1
	syscall
	
	# halt
	li $v0, 10
	syscall