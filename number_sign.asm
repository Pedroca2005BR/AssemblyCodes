#Escreva, em MIPS assembly, um programa que 
# leia um �nico valor inteiro digitado pelo usu�rio e informe se o valor digitado � positivo ou negativo. Em sua resposta, 
# imprima apenas as palavras �positivo� ou �negativo�. N�o imprima outras mensagens de texto para indicar entrada/sa�da de dados.

.data

nega:	.asciiz "negativo"
posi:	.asciiz "positivo"

.text
.globl	main

main:
	li $v0, 5	#5 = read integer
	syscall
	
	slt $t0, $v0, $zero	# if v0 < zero, then 1
	bne $t0, $zero, negative	# if 1, then negative
	
	la $a0, posi	# else positive
	j end

negative:	la $a0, nega

end:	
	li $v0, 4	#4 = print string
	syscall