# jal eh uma instrucao que armazena o valor do Program Counter em $ra e depois pula para uma label
# isso eh usado para chamar funcoes que retornam no local correto

# jr (jump register) eh uma instrucao que usa jump para o endereco guardado em um registrador
# eh usado para retornar para main depois de terminar uma funcao




# Exemplo: Fatorial

.data

ask:	.asciiz "Informe o valor: "
ans:	.asciiz "Resposta: "

.text
.globl main
main:
	li $v0, 4	# 4 = print string
	la $a0, ask
	syscall
	
	li $v0, 5	# 5 = read int
	syscall
	
	
	# chamando a funcao
	
	#primeiro passo: preparar os parametros
	add $a0, $v0, $zero	# colocando valor de v0 em a0
	
	#segundo passo: chamar funcao
	jal fatorial
	
	add $s0, $v0, $zero	# salvo o valor de retorno em s0
	
	la $a0, ans
	li $v0, 4	# 4 = print string
	syscall
	
	add $a0, $s0, $zero	# boto s0 em a0
	li $v0, 1	# 1 = print int
	syscall
	
	li $v0, 10	# 10 = exit
	syscall



.data
.text
fatorial:
	li $t0, 1	# f = 1
	li $t1, 2	# i = 2
	addi $a0, $a0, 1	# resolvendo bugs totalmente evitaveis  ;)

loop:
	slt $t2, $t1, $a0	# i < n, then 1
	beq $t2, $zero, endFat	# if not, go to endFat
	
	mul $t0, $t0, $t1	# f *= i
	addi $t1, $t1, 1	# i += 1
	j loop			# volta pro inicio
	
endFat:
	add $v0, $t0, $zero	# boto o valor de f no retorno
	jr $ra		# volta pra main
