	.data
vector: .space 400

	.text
	.globl main
main:
        move    $t1, $zero          # $t1 = sum
        la      $t2, vector+400         # $t2 = @vector[i]
        move    $t3, $zero          # $t0 = i
        li      $t0, 100
for:
        ble     $t0, $t3, fi
        lw      $t4, 0($t2)
        addu    $t1, $t1, $t4
        addiu   $t2, $t2, -4
        addiu   $t0, $t0, -1
        b       for
fi:
	jr	$ra



