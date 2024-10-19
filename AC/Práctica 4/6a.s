	.data
V: .word 5,2,6

	.code
ld $t1, V($t2)
daddi $t2, $t2, 8
ld $t3, V($t2)
daddi $t2, $t2, 8
ld $t4, V($t2)

dadd $t1, $t1, $t3
dadd $t1, $t1, $t4		; guardo en $t1 la suma de los tres valores

halt
