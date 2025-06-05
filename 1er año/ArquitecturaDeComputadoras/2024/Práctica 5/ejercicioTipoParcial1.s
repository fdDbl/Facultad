	.data
outputIngrese1: .asciiz "Ingresar un numero entre 1 y 9:\n"
outputIngrese2: .asciiz "Debe ingresar un numero valido\n\n"
outputImpares: .asciiz "Cantidad de valores impares:"
NUMEROS: .byte 0
MAX: .word 120
CONTROL: .word 0x10000
DATA: .word 0x10008

	.code
daddi $sp, $0, 0x400
daddi $s1, $0, 0	; sumador
ld $s2, MAX($0)		; MAX
daddi $s3, $0, 0	; contador (indice)


jal INGRESAR_NUMERO
daddi $a0, $0, NUMEROS
dadd $a1, $0, $s3
jal PROCESAR_NUMEROS
halt

INGRESAR_NUMERO: ld $s6, CONTROL($0)
	ld $s7, DATA($0)
	daddi $sp, $sp, -8
	sd $ra, 0($sp)
	
	sigue: daddi $t2, $0, outputIngrese1
		sd $t2, 0($s7)
		daddi $t2, $0, 4
		sd $t2, 0($s6)
		
		daddi $t2, $0, 8
		sd $t2, 0($s6)
		ld $a0, 0($s7)		; = N
		daddi $a1, $0, 0	; = A
		daddi $a2, $0, 10	; = B
		
		jal ENTRE
		
		beqz $v0, impError
			dadd $t2, $0, $v0
			sd $t2, 0($s7)
			daddi $t2, $0, 1
			sd $t2, 0($s6)
			dadd $s1, $s1, $v0
			slt $t3, $s1, $s2
			sb $v0, NUMEROS($s3)
			daddi $s3, $s3, 1
			beqz $t3, finINGRESAR_NUMERO
				j sigue
				
	impError: daddi $t2, $0, outputIngrese2
		sd $t2, 0($s7)
		daddi $t2, $0, 4
		sd $t2, 0($s6)

	finINGRESAR_NUMERO: ld $ra, 0($sp)		; restauro $ra y pila
	daddi $sp, $sp, 8
	jr $ra

PROCESAR_NUMEROS: daddi $sp, $sp, -8
	sd $ra, 0($sp)
	daddi $t0, $0, 0	; contador de impares
	lazo:
		lb $a2, 0($a0)
		jal ES_IMPAR
		beqz $v0, sigue1
			daddi $t0, $t0, 1
		sigue1: daddi $a1, $a1, -1
		daddi $a0, $a0, 1
		bnez $a1, lazo
	daddi $t2, $0, outputImpares
	sd $t2, 0($s7)
	daddi $t2, $0, 4
	sd $t2, 0($s6)

	sd $t0, 0($s7)
	daddi $t2, $0, 1
	sd $t2, 0($s6)
	
	ld $ra, 0($sp)
	daddi $sp, $sp, 8
	jr $ra
	
ES_IMPAR: andi $v0, $a2, 1
	jr $ra

ENTRE: slt $t0, $a1, $a0
	beqz $t0, invalido
	slt $t0, $a0, $a2
	beqz $t0, invalido
		dadd $v0, $0, $a0
		j finENTRE
	invalido: daddi $v0, $0, 0
	finENTRE: jr $ra