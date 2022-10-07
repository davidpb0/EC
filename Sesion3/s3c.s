	# Sessio 3

	.data 
mat:	.word 0,0,2,0,0,0
	.word 0,0,4,0,0,0
	.word 0,0,6,0,0,0
	.word 0,0,8,0,0,0
	
resultat: .word 0

	.text 
	.globl main
main:
# Escriu aqui el teu codi del main
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $t0, resultat
	la $a0, mat
	jal suma_col
	sw $v0, 0($t0)
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
	

suma_col:
# Escriu aqui el teu codi de la subrutina
	la $t0, mat+8
	move $t1, $zero
	move $t2, $zero
	li $t4, 4
for:	bge $t2, $t4, fi
	lw $t5, 0($t0)
	addu $t1, $t1, $t5
	addiu $t0, $t0, 24
	addiu $t2, $t2, 1
	b for
fi: jr $ra




