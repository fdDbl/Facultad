.data
A:  .word 8
B:  .word 6
C:  .word 0

.code
    LD $t0, A($zero)
    LD $t1, B($zero)

    BEQ $t0, $zero, SALTO1
        SLT $t3, $t1, $t0
        BEQZ $t3, SALTO2
            DADD $t2, $t1, $zero
            SD $t2, C($zero)
            J FINAL
SALTO1:
        SD $zero, C($zero)
        J FINAL
SALTO2:
        DADD $t2, $t0, $t0
        SD $t2, C($zero)
FINAL:
    HALT
