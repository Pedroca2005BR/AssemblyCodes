# labels sao extremamente importantes na programacao assembly devido as operacoes do tipo j
# operacoes do tipo j podem pular para pontos no codigo quando acham um label

# beq R1, R2, label => se R1 == R2, vai pra label
# bne R1, R2, label => se R1 != R2, vai pra label
# slt R1, R2, R3 => se R2 for menor que R3, R1 = 1. if not, R1 = 0
# CAUTION: slt coloca o resultado do teste em um registrador para que voce use um beq ou bne depois






# A declaracao de .data abaixo diz para o programa guardar os proximos dados na memoria especial para dados
# Isso significa que os dados abaixo nao podem ser alterados
.data

msg1:	.asciiz "Informe a temperatura: "
solido:	.asciiz "solido"
liquido:.asciiz "liquido"
gasoso:	.asciiz "gasoso"

# A declaracao de .text abaixo diz para o programa guardar os proximos dados na memoria especial para instrucoes
.text
.globl main


main:
	# mostrar mensagem na tela
	la $a0, msg1	# load msg1 em $a0
	li $v0, 4	# 4 = print string in $a0
	syscall
	
	# leitura do valor digitado em v0
	li $v0, 5	# 5 = ler inteiro e botar em v0
	syscall
	
# determinar o estado fisico da agua

if1:	
	slt $t0, $v0, $zero	#testa se v0 eh menor que zero e bota a resposta em t0
	bne $t0, $zero, sol	#se t0 for diferente de 0, entao eh 1, ou seja, v0 eh menor que zero
if2:
	li $t1, 100	#bota valor 100 em t1
	slt $t0, $v0, $t1	#testa se v0 eh menor que t1 e bota em t0
	beq $t0, $zero, gas	#se t0 for igual a zero, entao eh 0, ou seja, v0 eh maior que t1
	
liq:	
	la $a0, liquido	#bota liquido em a0
	j end_if
sol:
	la $a0, solido	#bota solido em a0
	j end_if
gas:
	la $a0, gasoso	#bota gasoso em a0
	j end_if

end_if:
	li $v0, 4	# 4 = print string em a0
	syscall
