#	int total = 0
#	int i = 0
#	for(i=0; i<n; i++)
#		total += i
#	while(total>0)
#		total -= i

.data

space:	.asciiz " "


.text
.globl main

main:
	li $t0, 0	#soma(t0) = 0
	li $t1, 0	#i(t1) = 0
	li $t2, 10	#n(t2) = 10
	j for

for:
	slt $t3, $t1, $t2	#if t1 < t2, then 1
	beq $t3, $zero, while	#if not 0, proceed to while
	add $t0, $t0, $t1	#soma(t0) += i(t1)
	addi $t1, $t1, 1
	
	add $a0, $t0, $zero
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	
	j for

while:
	slt $t3, $t0, $zero	#if t0 < 0, then 1
	bne $t3, $zero, end	#if not 0, proceed to end
	sub $t0, $t0, $t1	#soma(t0) -= i(t1)
	
	add $a0, $t0, $zero
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	
	j while
	
end:
	add $a0, $t0, $zero
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
