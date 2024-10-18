.data
F:  .word 1
N:  .word 6

.code

LD $t0, F($zero)
DADDI $t1, $zero, 1
LD $t2, N($zero)

LOOP: DMUL $t0, $t0, $t1
    DADDI $t1, $t1, 1
    BNE $t1, $t2, LOOP
SD $t0, F($zero)
HALT
