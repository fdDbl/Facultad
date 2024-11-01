.data
A:  .word 10
B:  .word 6
S:  .word 0
P:  .word 0
D:  .word 0

.code
    LD R1, A(R0)
    LD R2, B(R0)

a+b:
    DADD R3, R1, R2
    SD R3, S(R0)

2+(a*b):
    DMUL R3, R1, R2
    DADDI R3, R3, 2
    SD R3, P(R0)

a^2/b:
    DMUL R3, R1, R1
    DDIV R3, R3, R2
    SD R3, D(R0)

HALT
