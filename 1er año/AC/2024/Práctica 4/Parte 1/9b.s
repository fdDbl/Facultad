	.data
cadena: .asciiz "adbdcdedfdgdhdid"
car: .ascii "d"
cant: .word 0

	.code
daddi $t0, $0, 0
lb $t1, car($0)
daddi $t2, $0, 0

igual_cero: lb $t3, cadena($t0)
beqz $t3, fin
beq $t1, $t3, inc
j sig
inc: daddi $t2, $t2, 1
sig: daddi $t0, $t0, 1
j igual_cero

fin: sd $t2, cant($0)
halt