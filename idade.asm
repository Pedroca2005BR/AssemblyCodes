#C) Escreva, em MIPS assembly, um programa que leia a idade e o tempo de serviço de um trabalhador e informe se ele pode ou não se 
# aposentar. Em sua resposta, imprima apenas as palavras “sim” ou “nao” (sem acento). Não imprima outras mensagens de texto para 
# indicar entrada/saída de dados. As condições para aposentadoria são:

# Ter pelo menos 65 anos OU

# Ter trabalhado pelo menos 35 anos OU

# Ter pelo menos 60 anos e ter trabalhado pelo menos 30 anos.

.data

msg1:	.asciiz "sim"
msg2:	.asciiz "nao"

.text
.globl	main

main:
	li $v0, 5	# 5 = read integer
	syscall
	add $s0, $v0, $zero	# s0 = idade
	
	li $v0, 5	# 5 = read integer
	syscall
	add $s1, $v0, $zero	# s1 = tempo de servico
	
	slti $t0, $s0, 65	# if idade < 65, then 1
	beq $t0, $zero, sim	# if 0, go to sim
	
	slti $t0, $s1, 35	# if tempo < 35, then 1
	beq $t0, $zero, sim	# if 0, go to sim
	
	
	
	slti $t0, $s0, 60	# if idade < 60, then 1
	bne $t0, $zero, nao	# if 1, go to nao
	
	slti $t0, $s1, 30	# if tempo < 30, then 1
	bne $t0, $zero, nao	# if 1, go to nao
	
	j sim
	
sim:	
	la $a0, msg1
	j end
nao:	
	la $a0, msg2
	j end

end:
	li $v0, 4	# 4 = print string
	syscall