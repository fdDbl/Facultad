	.data
string: .asciiz "ArquiTectuRa de ComPutaDoras"
longitud: .word 0

	.code
daddi $t0, $0, 0
daddi $t2, $0, 0

igual_cero: lb $t1, string($t0)
beqz $t1, fin
daddi $t2, $t2, 1
daddi $t0, $t0, 1
j igual_cero

fin: sd $t2, longitud($0)
halt