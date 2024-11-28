	.data
CONTROL: .word 0x10000
DATA: .word 0x10008
naranja: .byte 255, 128, 0, 0
pares: .word 10, 15, 24, 12, 30, 31, 42, 21, 33, 33

	.code
daddi $sp, $0, 0x400
ld $s6, CONTROL($0)
ld $s7, DATA($0)
daddi $a0, $0, pares
daddi $a1, $0, 5
jal GRAFICAR
halt

GRAFICAR: daddi $sp, $sp, -32
	sd $ra, 0($sp)
	sd $s0, 8($sp)
	sd $s1, 16($sp)
	sd $s2, 24($sp)
	
	dadd $s0, $0, $a0
	dadd $s1, $0, $a1
	lwu $s2, naranja($0)
	sw $s2, 0($s7)
	
	lazo:
		ld $a0, 0($s0)
		daddi $s0, $s0, 8
		ld $a1, 0($s0)
		daddi $s0, $s0, 8	; dejo para el siguiente loop
		jal DIFERENCIA
		
		sd $v0, 4($s7)
		sd $v0, 5($s7)
		daddi $t1, $0, 5
		sd $t1, 0($s6)
		
		daddi $s1, $s1, -1
		bnez $s1, lazo
		
	ld $ra, 0($sp)
	ld $s0, 8($sp)
	ld $s1, 16($sp)
	ld $s2, 24($sp)
	daddi $sp, $sp, 32
	jr $ra

DIFERENCIA: slt $t0, $a0, $a1
	beqz $t0, a0mayora1
		dsub $v0, $a1, $a0
		j finDiferencia
	a0mayora1: dsub $v0, $a0, $a1
	finDiferencia: jr $ra