	.data
result: .word 0
num:	.byte ';'

	.text
	.globl main
main:

# COPIA EL TEU CODI AQUI
	la $t0, result
	la $t1, num
	
	lb $t1, 0($t1)
	sw $zero, 0($t0)
	
	li $t2, 0x61
	li $t3, 0x7a
	blt $t1, $t2, if2
	bgt $t1, $t3, if2
si:	move $t0, $t1
	b fi
if2:	li $t2, 0x41
	li $t3, 0x5a
	blt $t1, $t2, else
	bgt $t1, $t3, else
	b si
	
else:	li $t2, 0x30
	li $t3, 0x39
	blt $t1, $t2, else2
	bgt $t1, $t3, else2
	addiu $t0, $t1, -0x30
	b fi
	
else2:	li $t4, -1
	move $t0, $t4
	

fi:	jr $ra

