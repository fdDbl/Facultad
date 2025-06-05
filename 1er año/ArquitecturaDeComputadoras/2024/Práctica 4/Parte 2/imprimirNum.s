.data
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
num: .word 5

.code
ld $t2, DIR_CONTROL($0)
ld $t3, DIR_DATA($0)
ld $t1, num($0); cargo el num 
sd $t1,0($t3); guardo en DATA 
daddi $t1,$0, 1; cod. imprimir 
sd $t1, 0($t2); imprimo
halt
