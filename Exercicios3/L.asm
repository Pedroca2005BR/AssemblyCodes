# L) Escreva, em MIPS assembly, um programa que leia 4 valores inteiros e os armazene em um array A. A
# seguir, leia 6 inteiros e os armazene em um array B. Crie um subprograma que compute e retorne quantos
# elementos estão presentes em A e B simultaneamente. O main deve imprimir a resposta. Não imprima
# outras mensagens de texto para indicar entrada/saída de dados.

.data

A:	.word 0, 0, 0, 0
B:	.word 0, 0, 0, 0, 0, 0

.text
.globl main

main:
	# iniciando os valores
	li $s1, 0	# i = 0
	la $s0, A
	li $s2, 4	# n = 4

ALoop:
	beq $s1, $s2, preBLoop		# continua pro loop B quando i == n
	
	# read integer
	li $v0, 5
	syscall
	
	sll $t0, $s1, 2		# t0 = deslocamento
	add $t1, $s0, $t0	# endereco = base + deslocamento
	
	sw $v0, 0($t1)		# guarda o numero lido no vetor
	
	# incrementa e segue o loop
	addi $s1, $s1, 1
	j ALoop
	
preBLoop:
	# iniciando os valores
	li $s1, 0	# i = 0
	la $s0, B
	li $s2, 6	# n = 4
	
BLoop:
	beq $s1, $s2, main2		# continua pro main quando i == n
	
	# read integer
	li $v0, 5
	syscall
	
	sll $t0, $s1, 2		# t0 = deslocamento
	add $t1, $s0, $t0	# endereco = base + deslocamento
	
	sw $v0, 0($t1)		# guarda o numero lido no vetor
	
	# incrementa e segue o loop
	addi $s1, $s1, 1
	j BLoop
	
main2:
	jal compare
	
	# salvando retorno e imprimindo
	add $a0, $v0, $zero
	li $v0, 1
	syscall
	
	# halt
	li $v0, 10
	syscall
	
.data
.text
compare:
	li $t0, 0	# i = 0
	li $t1, 4	# n = 4
	li $t3, 6	# m = 6
	
	la $s0, A
	la $s1, B
	
	li $v0, 0	# quantidadeDeRepeticoes = 0

iLoop:
	beq $t0, $t1, endcmp	# se i == n, acabou
	li $t2, 0	# j = 0
	
	# desloca o i para o local certo
	sll $s2, $t0, 2
	add $s3, $s0, $s2	#endereco = base + deslocamento
	lw $s4, 0($s3)		# s4 = A[i]
	
jLoop:
	beq $t2, $t3, endiLoop	# se j == m, segue o iLoop
	
	# desloca o j para o local certo
	sll $s2, $t2, 2
	add $s3, $s1, $s2	#endereco = base + deslocamento
	lw $s5, 0($s3)		# s5 = B[j]
	
	# agora eh so comparar se sao iguais
	beq $s4, $s5, iguais
	
	# se nao forem, incremento o j e sigo em frente
	addi $t2, $t2, 1
	j jLoop
	
iguais:
	# incremento o contador e sigo para o fim do iLoop
	# posso seguir pois ja sei que o numero em i esta em b tambem e n preciso contar repetidos
	addi $v0, $v0, 1
	
endiLoop:
	addi $t0, $t0, 1
	j iLoop




endcmp:		jr $ra
	