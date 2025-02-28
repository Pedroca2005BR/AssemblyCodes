# J) Escreva, em MIPS assembly, um programa, dividido em dois subprogramas, para: ler 6 valores inteiros
# informados pelo usuário e armazenar em um array (subprograma), percorrer o array e retornar o maior
# valor presente (subprograma), imprimir o maior valor (main). Em sua resposta, imprima apenas o maior
# valor. Não imprima outras mensagens de texto para indicar entrada/saída de dados.


.data

vetor:	.word 0, 0, 0, 0, 0, 0
#debugger:	.asciiz "Chegado"

.text
.globl main

main:
	# comeca o programa chamando a funcao
	# lembrando que o vetor vai ser passado como argumento pras duas funcoes
	la $a0, vetor
	jal lerVal
	
	add $a0, $v0, $zero	# posiciona o retorno para imprimir
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

.data
.text

lerVal:
	li $t1, 0	# i = 0
	li $t2, 6	# n = 6
	
lerValLoop:
	beq $t1, $t2, endLerVal	# quando i for n, corta para o fim
	
	# le o valor
	li $v0, 5
	syscall
	
	# desloca
	sll $t3, $t1, 2		# coloca em t3 o tamanho do deslocamento
	add $t4, $a0, $t3	# endereco = base + deslocamento
	
	# altera o valor no vetor
	sw $v0, 0($t4)
	
	# incrementa i e resume loop
	addi $t1, $t1, 1
	j lerValLoop
	
endLerVal:
	j getMaior
	
	
.data
.text
getMaior:
	lw $t0, 0($a0)		# inicia o maior como o primeiro numero no vetor
	li $t1, 1		# i = 1
	li $t2, 6		# n = 6
	
getMaiorLoop:
	beq $t1, $t2, endGetMaior	# fecha o loop quando i == n
	
	# desloca
	sll $t3, $t1, 2		# coloca em t3 o tamanho do deslocamento
	add $t4, $a0, $t3	# endereco = base + deslocamento
	
	# checa pra ver se o maior eh menor que o valor em t4
	lw $t6, 0($t4)			# setta t6 como o valor q t4 contem
	slt $t5, $t0, $t6		
	bne $t5, $zero, newMaior	# se for maior, troca o maior
	
	# senao, segue o ciclo sem mudancas
	addi $t1, $t1, 1
	j getMaiorLoop

newMaior:
	lw $t0, 0($t4)	# altera o novo maior
	addi $t1, $t1, 1	# incrementa i
	j getMaiorLoop	# segue loop
	
endGetMaior:
	# passa os parametros e retorna pra main
	add $v0, $t0, $zero
	jr $ra