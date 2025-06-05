; 1) CALCULAR POSITIVOS
	.data
V: .byte 5, -3, 6, -50, 4, 3, -2, 9, 1, -6
POS: .byte 0

	.code
dadd $t0, $zero, $zero  ; índice del vector
dadd $t3, $zero, $zero  ; cantidad de positivos
daddi $t5, $zero, 10    ; cantidad de elementos del vector

lazo:
    lb $t1, V($t0)
    andi $t2, $t1, 0x80
    bnez $t2, sigue
        daddi $t3, $t3, 1
sigue:
    daddi $t0, $t0, 1
    daddi $t5, $t5, -1
    bnez $t5, lazo

sb $t3, POS($zero)  ; en este programa debería devolver 6 en POS
halt

; 2) CALCULAR MÁXIMO
	.data
V: .byte 5, -3, 6, -50, 4, 3, -2, 9, 1, -6
MAX: .byte 0

	.code
dadd $t0, $zero, $zero  ; índice del vector
dadd $t3, $zero, $zero  ; valor máximo
daddi $t5, $zero, 10    ; cantidad de elementos del vector

lazo:
    lb $t1, V($t0)
    slt $t2, $t1, $t3
    bnez $t2, sigue
        dadd $t3, $zero, $t1
sigue:
    daddi $t0, $t0, 1
    daddi $t5, $t5, -1
    bnez $t5, lazo

sb $t3, MAX($zero)  ; en este programa debería devolver 9 en MAX
halt

3) MODIFICAR VALORES
	.data
V: .byte 5, -3, 6, -50, 4, 3, -2, 9, 1, -6

	.code
dadd $t0, $zero, $zero  ; índice del vector
daddi $t5, $zero, 10    ; cantidad de elementos del vector
daddi $t3, $zero, 2     ; por cuánto multiplicar

lazo:
    lb $t1, V($t0)
    dmul $t1, $t1, $t3
    sb $t1, V($t0)
    daddi $t0, $t0, 1
    daddi $t5, $t5, -1
    bnez $t5, lazo
halt
