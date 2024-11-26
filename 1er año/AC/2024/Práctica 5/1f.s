	.data
CONTROL: .word 0x10000
DATA: .word 0x10008

	.code
lw $t0, CONTROL($0)
lw $t1, DATA($0)

daddi $t2, $0, 8	; leer exponente
sw $t2, 0($t0)
lw $a0, 0($t1)		; guardo exponente en $a0

daddi $a1, $0, 2	; guardo base 2 en $a1
jal potencia
dadd $t2, $0, $v0

lw $a0, 0($t1)		; guardo exponente otra vez en $a0 (IMPORTANTE)
daddi $a1, $0, 3	; guardo base 3 en $a1
jal potencia
dadd $t3, $0, $v0

dadd $t4, $t2, $t3	; realizo suma de las dos potencias

sw $t4, 0($t1)
daddi $t4, $0, 1
sw $t4, 0($t0)

halt

potencia: daddi $v0, $0, 1
	loop: beqz $a0, terminar
		daddi $a0, $a0, -1
		dmul $v0, $v0, $a1
		j loop
	terminar: jr $ra