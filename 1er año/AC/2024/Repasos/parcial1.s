	.data
CONTROL: .word 0x10000
DATA: .word 0x10008
gris: .byte 128,128,128,0
pares: .word 8,16,20,24,3,5,15,31

	.code
daddi $sp, $0, 0x400
daddi $a0, $0, pares
daddi $a1, $0, 4
jal GRAFICAR
halt

GRAFICAR: ld $s6, CONTROL($0)
	ld $s7, DATA($0)
	daddi $sp, $sp, -24
	sd $ra, 0($sp)
	sd $s0, 8($sp)
	sd $s1, 16($sp)	
	dadd $s0, $0, $a0	; dir de pares
	dadd $s1, $0, $a1	; contador de pares
	lwu $t0, gris($0)
	loop: ld $a0, 0($s0)	; primer elemento del par
		daddi $s0, $s0, 8
		ld $a1, 0($s0)		; segundo elemento del par
		daddi $s1, $s1, -1	; decremento contador de pares
		jal PROMEDIO
		sd $v0, 4($s7)	; coorX
		sd $v0, 5($s7)	; coorY
		sw $t0, 0($s7)	; color
		daddi $t1, $0, 5
		sd $t1, 0($s6)	; imprimo
		bnez $s1, loop
	ld $ra, 0($sp)
	ld $s0, 8($sp)
	ld $s1, 16($sp)
	daddi $sp, $sp, 24
	jr $ra

PROMEDIO: dadd $v0, $a0, $a1
	daddi $t3, $0, 2
	ddiv $v0, $v0, $t3
	jr $ra