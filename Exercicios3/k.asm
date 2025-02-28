# K) Escreva, em MIPS assembly, um programa que leia um valor inteiro e o repasse para um subprograma.
# Se o valor for um quadrado perfeito, o subprograma deve retornar 1; caso contrário, retornar zero. O main
# deve imprimir como resposta apenas o valor retornado. Em sua resposta, imprima apenas o maior valor.
# Não imprima outras mensagens de texto para indicar entrada/saída de dados.

.data

.text
.globl main
main:
	# lendo inteiro
	li $v0, 5
	syscall
	
	# mandando para a funcao
	add $a0, $zero, $v0
	jal quadPerfect
	
	# pegando o resultado e imprimindo
	add $a0, $v0, $zero
	li $v0, 1
	syscall
	
	# halt
	li $v0, 10
	syscall

.data
.text
quadPerfect:
	li $t0, 1	# i = 1

loop:
	mul $t1, $t0, $t0	# t1 = i*i
	slt $t2, $t1, $a0	# i^2 < n
	beq $t2, $zero, endLoop	# not if, go to endLoop
	addi $t0, $t0, 1	# i += 1
	j loop

endLoop:
	beq $t1, $a0, sim	# if i^2 == n, yes
nao:
	li $v0, 0
	jr $ra
sim:
	li $v0, 1
	jr $ra
