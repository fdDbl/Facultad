.data
L:  .word 0
N:  .word 10

.code

LD $t0, L($zero)
LD $t1, N($zero)
DADDI $t2, $zero, 2

WHILE:
    DDIV $t1, $t1, $t2
    DADDI $t0, $t0, 1
    SLT $t3, $zero, $t1
    BNEZ $t3, WHILE

HALT
