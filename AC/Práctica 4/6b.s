	.data
V: .word 5,2,6

	.code
daddi $t2, $zero, V
daddi $t5, $zero, 3
daddi $t0, $zero, 0

loop:
    lw    $t1, 0($t2)
    dadd   $t0, $t0, $t1
    daddi $t2, $t2, 8
    daddi $t5, $t5, -1
    bnez   $t5, loop
halt
