# l (load) e s (store) podem ser usados de diversas formas
# Primeiramente sobre o tamanho de dados:

# .byte = 8 bits
# .half = 16 bits		half from halfword
# .word = 32 bits		usado para inteiros
# .double = 64 bits		geralmente usado para numeros flutuantes






.data

x:	.word 1
y:	.word 2
z:	.word 5

.text

main:
	lw $s1, x
	lw $s2, y
	
	add $s0, $s1, $s2
	sw $s0, z
	