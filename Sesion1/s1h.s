# PRACTICA 1 #######################

	.data
	cadena: .byte -1, -1, -1, -1, -1, -1
		.align 2
	vec: .word 5, 6, 8, 9, 1
	
	.text
	.globl main
main:
	li $s0, 0
	
while:	li $t0, 5
	bge $s0, $t0, fi
	
	la $t1, vec
	la $t2, cadena
	sll $t3, $s0, 2
	subu $t1, $t1, $t3
	lw $t3, 16($t1)
	addiu $t3, $t3, 0x30
	addu $t2, $t2, $s0
	sb $t3, 0($t2)
	
	addiu $s0, $s0, 1
	b while
	
fi:
	la $t4, cadena
	sb $zero, 5($t4)
	
	li $v0, 4
	move $a0, $t4
	syscall

	jr $ra		# main retorna al codi de startup

