	.data
signe:		.word 0
exponent:	.word 0
mantissa:	.word 0
cfixa:		.word 0x0000CC00
cflotant:	.float 0.0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)

	la	$t0, cfixa
	lw	$a0, 0($t0)
	la	$a1, signe
	la	$a2, exponent
	la	$a3, mantissa
	jal	descompon

	la	$a0, signe
	lw	$a0,0($a0)
	la	$a1, exponent
	lw	$a1,0($a1)
	la	$a2, mantissa
	lw	$a2,0($a2)
	jal	compon

	la	$t0, cflotant
	swc1	$f0, 0($t0)

	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr	$ra


descompon:
	slt $t0, $a0, $zero
	sw $t0, 0($a1)
	sll $a0, $a0, 1
	
if:	bne $a0, $zero, else
	li $t0, 0
	b fi
	
else:	li $t0, 18
while: 	blt $a0, $zero, end
	sll $a0, $a0, 1
	addiu $t0, $t0, -1
	b while
	
end:	sra $a0, $a0, 8
	li $t1, 0x7FFFFF
	and $a0, $a0, $t1
	addi $t0, $t0, 127
	
fi:	sw $t0, 0($a2)
	sw $a0, 0($a3)

	jr $ra

compon:
	sll $t0, $a0, 31
	sll $t1, $a1, 23
	or $v0, $t0, $t1
	or $v0, $v0, $a2
	mtc1 $v0, $f0
	jr $ra

