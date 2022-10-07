# PRACTICA 1 #######################

	.data
	A:.word 3, 5, 7
	punter: .word 0
	
	

	.text
	.globl main
main:
	la $t0, punter
	la $t1, A
	addiu $t1, $t1, 8
	sw, $t1, 0($t0)
	
	lw $s0, 0($t1)
	addiu $s0, $s0, 2
	
	lw $t2, -8($t1)
	addu $s0, $t2, $s0
	
	sw $s0, -4($t1)
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	jr $ra		# main retorna al codi de startup

