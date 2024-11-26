	.data
outputIngrese: .asciiz "Ingrese una clave de 4 caracteres: \n("
outputIntentos: .word 5
outputIngrese2: .asciiz " intentos restantes)\n"
inputClave: .asciiz "...."
outputCorrecta: .asciiz "Clave correcta"
outputIncorrecta: .asciiz "Clave incorrecta\n\n"
clave: .asciiz "fede"
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008

	.code
ld $t6, DIR_CONTROL($0)
ld $t7, DIR_DATA($0)

ingresar: daddi $t0, $0, outputIngrese
sd $t0, 0($t7)
daddi $t0, $0, 4
sd $t0, 0($t6)
ld $t0, outputIntentos($0)
sd $t0, 0($t7)
daddi $t0, $0, 1
sd $t0, 0($t6)
daddi $t0, $0, outputIngrese2
sd $t0, 0($t7)
daddi $t0, $0, 4
sd $t0, 0($t6)

daddi $t1, $0, 0
daddi $t4, $0, 4

lectura: daddi $t0, $0, 9
sd $t0, 0($t6)
lbu $t0, 0($t7)
sb $t0, inputClave($t1)
daddi $t1, $t1, 1
daddi $t4, $t4, -1
bnez $t4, lectura

daddi $t0, $0, 4
verificar: lb $t1, inputClave($t0)
lb $t2, clave($t0)
bne $t1, $t2, incorrecta
daddi $t0, $t0, -1
bnez $t0, verificar

daddi $t0, $0, outputCorrecta
sd $t0, 0($t7)
daddi $t0, $0, 4
sd $t0, 0($t6)
j fin

incorrecta: daddi $t0, $0, outputIncorrecta
sd $t0, 0($t7)
daddi $t0, $0, 4
sd $t0, 0($t6)
ld $t0, outputIntentos($0)
daddi $t0, $t0, -1
sd $t0, outputIntentos($0)
beqz $t0, fin
j ingresar

fin: halt