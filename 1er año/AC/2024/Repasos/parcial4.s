	.data
CONTROL:  .word 0x10000
DATA:     .word 0x10008

numeros:  .word 12, 7, 18, 5, 24, 9   # Lista de números a procesar.
color_par:  .byte 255, 0, 0, 0           # Color rojo para los pares.
color_impar: .byte 0, 0, 255, 0          # Color azul para los impares.

	.code
daddi $sp, $0, 0x400
daddi $a0, $0, numeros
daddi $a1, $0, 6
jal DIBUJAR
halt

DIBUJAR: daddi $sp, $sp, -56
	sd $ra, 0($sp)
	sd $s0, 8($sp)
	sd $s1, 16($sp)
	sd $s2, 24($sp)
	sd $s3, 32($sp)
	sd $s6, 40($sp)
	sd $s7, 48($sp)
	
	dadd $s0, $0, $a0
	dadd $s1, $0, $a1
	ld $s6, CONTROL($0)
	ld $s7, DATA($0)
	lwu $t0, color_par($0)
	dadd $s2, $0, $t0
	lwu $t0, color_impar($0)
	dadd $s3, $0, $t0
	
	lazo: ld $a0, 0($s0)
		jal ES_PAR
		sd $v0, 4($s7)
		sd $v0, 5($s7)
		beqz $v0, dibujar_impar
			sw $s2, 0($s7)	; cargo color_par
			daddi $t0, $0, 5
			sd $t0, 0($s6)
			j fin_lazo
		dibujar_impar: sw $s3, 0($s7)	; cargo color_impar
			daddi $t0, $0, 5
			sd $t0, 0($s6)
		
		fin_lazo: daddi $s0, $s0, 8
		daddi $s1, $s1, -1
		bnez $s1, lazo
	
	ld $ra, 0($sp)
	ld $s0, 8($sp)
	ld $s1, 16($sp)
	ld $s2, 24($sp)
	ld $s3, 32($sp)
	ld $s6, 40($sp)
	ld $s7, 48($sp)
	daddi $sp, $sp, 56
	jr $ra
	
ES_PAR: andi $v0, $a0, 1
	xori $v0, $v0, 1	; invierto bit ya que me pide que si es par salga 1 y si es impar salga 0
	jr $ra