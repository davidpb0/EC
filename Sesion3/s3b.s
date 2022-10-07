	# Sessio 3

	.data 
# Declara aqui les variables mat1, mat4 i col
	.align 2
mat1: 	.space 120
mat4:	 .word 2, 3, 1, 2, 4, 3
col: 	 .word 2 

	.text 
	.globl main
main:
# Escriu aqui el programa principal
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	la $t0, mat4
	la $t1, col
	lw $t2, 8($t0)
	move $a0, $t0
	move $a1, $t2
	move $a2, $t1
	jal subr
	la $t3, mat1
	sw $v0, 108($t3)
	li $a1, 1
	li $a2, 1
	jal subr
	sw $v0, 0($t3)
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
	


subr:
# Escriu aqui el codi de la subrutina
	#la $t0, mat1+20
	#sll $t1, $a2, 2
	#li $t2, 12
	#mult 4t2, $a1
	#mflo $t2
	#addu $t2, $t2, $t1
	#addu $t2, $a0, $t2
	#lw $t2, 0($t2)
	#li $t3, 24
	#mult $t3, $a2
	#mflo $t3
	#addu $t3, $t0, $t3
	#sw $t2, 0($t3)
	#move $v0, $a1
	
	
	la $t0, mat1
	li $t1, 24
	multu $a2, $t1
	mflo $t1
	addu $t0, $t0, $t1
	li $t1, 6
	mult $a1, $t1
	mflo $t1
	addu $t1, $t1, $a2
	sll $t1, $t1, 2
	addu $t1, $a0, $t1
	lw $t1, -12($t1)
	sw $t1, 20($t0)
	move $v0, $a1
	jr $ra


