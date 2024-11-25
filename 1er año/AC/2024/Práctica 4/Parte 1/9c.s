	.data
string: .asciiz "ArquiTectuRa de ComPutaDoras"
cant: .word 0

	.code
daddi $t0, $0, 0
daddi $t1, $0, 0

lazo: lb $t4, string($t0)
beqz $t4, fin

slti $t7, $t4, 91
beqz $t7, noMayus
slti $t7, $t4, 64
bnez $t7, noMayus

esMayus: daddi $t1, $t1, 1
noMayus: daddi $t0, $t0, 1
j lazo

fin: sd $t1, cant($0)
halt