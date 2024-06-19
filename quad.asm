# Leia um inteiro do usuario e veja se eh um quadrado perfeito

.data

y:	.asciiz	"sim"
n:	.asciiz "nao"

.text
.globl main
main:
	li $v0, 5	# 5 = read int
	syscall
	
	add $a0, $v0, $zero	# preparo parametros
	jal quad

	add $s0, $zero, $v0	# pego o retorno e coloco em s0
	beq $s0, $zero, no	# if false, go to no
	
yes:
	la $a0, y
	j trueEnd

no:	la $a0, n

trueEnd:
	li $v0, 4	# 4 = print string
	syscall
	
	li $v0, 10
	syscall
.data
.text
quad:
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