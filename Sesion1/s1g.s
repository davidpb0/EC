# PRACTICA 1 #######################

	.data
	fib: .space 40
	

	.text
	.globl main
main:
	li $s0, 2
	la $t1, fib
	li $t2, 1
	sw, $zero, 0($t1)
	sw $t2, 4($t1)
	
while:
	slti $t0, $s0, 10
	beq $t0, $zero, fi
	
	sll $t2, $s0, 2
	addu $t3, $t1, $t2
	lw $t2, -4($t3)
	lw $t4, -8($t3)
	addu $t2, $t2, $t4
	sw $t2, 0($t3)
	
	addiu $s0, $s0, 1
	b while
	

fi:
	jr $ra		# main retorna al codi de startup

