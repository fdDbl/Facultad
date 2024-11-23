	.data
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
A: .word 25
B: .word 50

	.code
ld $t3, DIR_CONTROL($0)
ld $t4, DIR_DATA($0)

ld $t1, A($0)
ld $t2, B($0)

dadd $t5, $t1, $t2
sd $t5, 0($t4)

daddi $t5, $0, 1
sd $t5, 0($t3)
halt
