	.data
n: .word 5

	.code
daddi $sp, $0, 0x400
ld $a0, n($0)
jal factorial
dadd $t0, $0, $v0
halt

factorial: daddi $sp, $sp, -16
	sd $ra, 0($sp)
	sd $s0, 8($sp)
	beqz $a0, fin1
	dadd $s0, $0, $a0
	daddi $a0, $a0, -1
	jal factorial
	dmul $v0, $v0, $s0
	j fin2
	
	fin1: daddi $v0, $0, 1
	
	fin2: ld $ra, 0($sp)
	ld $s0, 8($sp)
	daddi $sp, $sp, 16
	jr $ra