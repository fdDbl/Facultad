.data
pos_X:.byte 0
pos_Y:.byte 0
color_rojo:.byte 255, 0, 0, 0
color_azul:.byte 0, 0, 255, 0
CONTROL:.word32 0x10000
DATA:.word32 0x10008
.code
lbu $s0, pos_Y(r0)
lbu $s1, pos_X(r0)
lwu $s2, color_rojo(r0)
lwu $s3, color_azul(r0)
daddi $s4, $0, 1
otra_f:dadd $a0, $0, $s0
beqz $s4 , invertir
daddi $a1, $s2, 0 ; color rojo en $a1
daddi $a2, $s3, 0 ; color azul en $a2
j salteo

invertir: daddi $a2, $s2, 0 ; color rojo en $a2
daddi $a1, $s3, 0 ; color rojo en $a1

salteo: jal fila_alternativa
daddi $s0, $s0, 1 ; incremento coord y
lbu $s1, pos_X(r0) ; reinicio coord x
xori $s4, $s4, 1
slti $s5, $s0, 50
bnez $s5, otra_f
halt

fila_alternativa: lwu $t6, CONTROL(r0)
lwu $t7, DATA(r0)
daddi $t0, $0, 0
daddi $t1, $0, 1
sb $a0, 4($t7) ; fila fija
seguir:sb $t0, 5($t7)
beqz $t1 , color
daddi $t4, $a1, 0 ;color 1
j salto
color:daddi $t4, $a2, 0 ;color 2
salto:sw $t4, 0($t7)
xori $t1, $t1, 1 ;invierte valor
daddi $t2, $0, 5
sd $t2, 0($t6) ; 5 en control
daddi $t0, $t0,1 ; incremento coord x
slti $t9, $t0, 50
bnez $t9, seguir
jr $ra