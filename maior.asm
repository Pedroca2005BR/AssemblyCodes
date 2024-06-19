# Escreva, em MIPS assembly, um programa que leia 4 valores inteiros digitados pelo usuário e mostre qual o maior deles. 
# Em sua resposta, imprima apenas o maior dos 4 valores digitados. Não imprima outras mensagens de texto para indicar entrada/saída 
# de dados.

.data

v:	.word 0, 0, 0, 0

.text
.globl	main

main:
	li $s0, 0	# i = 0
	li $s1, 4	# n = 3
	la $t0, v
	lw $t1, 0($t0)	# maior = v[0]
	j readLoop
	
readLoop:
	beq $s0, $s1, testLoop	# i==n -> testLoop
	li $v0, 5	# 5 = read integer
	syscall
	
	sll $s2, $s0, 2		# calculo do deslocamento
	add $s3, $t0, $s2	# endereco = base + deslocamento
	sw $v0, 0($s3)		# guarda v0 no espaco certo do vetor
	addi $s0, $s0, 1	# incrementa o i
	j readLoop
	
testLoop:
	beq $s0, $zero, main2	# i==0 -> main2
	
	sll $s2, $s0, 2		# calculo do deslocamento
	add $s3, $t0, $s2	# endereco = base + deslocamento
	lw $t2, 0($s3)		# t2 = v[i]
	
	slt $t3, $t1, $t2	# if maior < v[i], then 1
	bne $t3, $zero, changeBigger	#if 1, go to changeBigger
	subi $s0, $s0, 1	# decrementa o i
	j testLoop

changeBigger:
	add $t1, $zero, $t2	# maior = v[i]
	subi $s0, $s0, 1	# i -= 1
	j testLoop		# volta pro loop
	
main2:
	add $a0, $zero, $t1	# botando o maior em a0
	li $v0, 1		# 1 = print integer
	syscall
	
	