# D) Escreva, em MIPS assembly, um programa que leia as medidas dos 3 lados de um triângulo e informe o tipo de triângulo: 
# equilátero, isósceles ou escaleno. Em sua resposta, imprima apenas o nome do tipo (sem acentos). 
# Não imprima outras mensagens de texto para indicar entrada/saída de dados.

.data

equi:	.asciiz "equilatero"
isos:	.asciiz "isosceles"
esca:	.asciiz "escaleno"

.text
.globl	main

main:
	li $v0, 5	# 5 = read integer
	syscall
	add $s0, $v0, $zero	# s0 = lado 1
	
	li $v0, 5	# 5 = read integer
	syscall
	add $s1, $v0, $zero	# s1 = lado 2
	
	li $v0, 5	# 5 = read integer
	syscall
	add $s2, $v0, $zero	# s2 = lado 3
	
	
	beq $s0, $s1, doisIguais
	
	beq $s1, $s2, isosceles
	
	beq $s0, $s2, isosceles
	
	j escaleno
	
doisIguais:
	beq $s0, $s2, equilatero
	j isosceles
	
equilatero:
	la $a0, equi
	j end
isosceles:
	la $a0, isos
	j end
escaleno:
	la $a0, esca
	j end
end:
	li $v0, 4
	syscall
	
	
	
	
	
	