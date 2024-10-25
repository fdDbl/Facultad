; ¿Qué cambios se deberían realizar al programa del inciso b) si los elementos fueran de 32 bits:
; V: .word32 5, 2, 6?

	.data
V:  .word32 5,2,6
RES:  .word32 0

	.code
daddi $t2, $zero, 0
daddi $t5, $zero, 3
daddi $t0, $zero, 0

loop:
    lw $t1, V($t2)  ; utilizo lw en vez de ld
    dadd $t0, $t0, $t1
    daddi $t2, $t2, 4   ; incremento el índice en 4 ya que 32 bits = 4 bytes
    daddi $t5, $t5, -1
    bnez $t5, loop
sd $t0, RES($zero)
halt
