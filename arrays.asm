



.data

arrA:	.byte	'a', 'b', 'c', '1', '2'
arrB:	.word	1, 3, 4096

.text
.globl main

main:
	# endereco = base + deslocamento
	
	la $t0, arrB	#posicao 0 -> endereco = base + 0
	
	li $s0, 0	# soma = 0
	li $s1, 0	# i = 0
	
	# deslocamento eh calculado usando sll
	sll $t1, $s1, 2	# esta linha esta multiplicando i(s1) por 4, pois 4 eh o tamanho do endereco de word
	
	# agora que temos o deslocamento, podemos adquirir o endereco buscado
	add $s2, $t0, $t1	# enderecoBuscado = base + deslocamentoDeMemoria
	
	lw $t2, 0($s2)	# esta linha pega o valor(word) que esta guardado no endereco s2 e coloca em t2
	
	add $s0, $s0, $t2	# soma += arrB[0]
	
	
	# agora que sabemos fazer, podemos testar com outros valores de i
	addi $s1, $s1, 1
	
	sll $t1, $s1, 2
	add $s2, $t0, $t1
	lw $t2, 0($s2)
	add $s0, $s0, $t2
	
	
	#agora tentamos com um loop:
	li $s0, 0	# soma = 0
	li $s1, 0	# i = 0
	li $s3, 3	# n = 3
	
	
doWhile:
	#codigo ja feito anteriormente
	sll $t1, $s1, 2
	add $s2, $t0, $t1
	lw $t2, 0($s2)
	add $s0, $s0, $t2
	
	addi $s1, $s1, 1
	bne $s1, $s3, doWhile	# if i != n, repeat doWhile
	
	add $a0, $zero, $s0	# coloco a soma no a0
	li $v0, 1	# 1 = print integer
	syscall
	