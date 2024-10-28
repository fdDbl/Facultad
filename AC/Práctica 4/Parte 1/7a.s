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
