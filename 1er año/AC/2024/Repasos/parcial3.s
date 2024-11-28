	.data
CONTROL: .word 0x10000
DATA: .word 0x10008

purpura: .byte 128, 0, 128, 0
datos: .word 1, 50, 35, 16, 15, 15, -1, 8, 49, 49, 3, 33

	.code
daddi $sp, $0, 0x400
daddi $a0, $0, datos
daddi $a1, $0, 6
jal GRAFICAR
halt

GRAFICAR: daddi $sp, $sp, -40
	sd $ra, 0($sp)
	sd $s0, 8($sp)
	sd $s1, 16($sp)
	sd $s6, 24($sp)
	sd $s7, 32($sp)
	
	dadd $s0, $0, $a0
	dadd $s1, $0, $a1
	ld $s6, CONTROL($0)
	ld $s7, DATA($0)
	lwu $t0, purpura($0)
	sw $t0, 0($s7)
	
	par: ld $a0, 0($s0)
		jal EN_RANGO
		beqz $v0, siguientePar
			dadd $t0, $0, $v0	; $t0 = coordX
			ld $a0, 8($s0)
			jal EN_RANGO
			beqz $v0, siguientePar
				sd $t0, 4($s7)	; coordX
				sd $v0, 5($s7)	; coordY
				daddi $t0, $0, 5
				sd $t0, 0($s6)
		siguientePar: daddi $s0, $s0, 16
			daddi $s1, $s1, -2
			bnez $s1, par
	
	ld $ra, 0($sp)
	ld $s0, 8($sp)
	ld $s1, 16($sp)
	ld $s6, 24($sp)
	ld $s7, 32($sp)
	daddi $sp, $sp, 40
	jr $ra

EN_RANGO: daddi $t1, $0, -1
	daddi $t2, $0, 50
	slt $v0, $t1, $a0
	beqz $v0, finRango
	slt $v0, $a0, $t2
	finRango: jr $ra