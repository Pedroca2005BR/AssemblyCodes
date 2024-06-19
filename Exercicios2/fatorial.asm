# H) Escreva, em MIPS assembly, um programa que leia um inteiro N e mostre o seu fatorial. Imprima apenas o valor do
# fatorial como resposta. Não imprima outras mensagens de texto para indicar entrada/saída de dados.

.data
.text
.globl main
main:	
	# pego o n
	li $v0, 5
	syscall
	
	li $a0, 1	# iniciando fat como 1
	li $s0, 2	# iniciando i como 2

loop:
	# se n for menor que i, segue em frente
	slt $t0, $v0, $s0
	bne $t0, $zero, end
	
	# adiciona no fatorial
	mul $a0, $a0, $s0
	
	# incrementa o i e segue loop
	addi $s0, $s0, 1
	j loop

end:
	# printa o fatorial
	li $v0, 1
	syscall
	
	# halt
	li $v0, 10
	syscall