	.data
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
saludo: .asciiz "Holaa!"

	.code
ld $t0, DIR_CONTROL($0)
ld $t1, DIR_DATA($0)

daddi $t2, $0, saludo
sd $t2, 0($t1)

daddi $t2, $0, 4
sd $t2, 0($t0)
halt
