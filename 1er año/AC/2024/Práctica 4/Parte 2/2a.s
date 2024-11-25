	.data
outputIngrese: .asciiz "Ingrese una clave de 4 caracteres: "
inputClave: .asciiz ""
outputCorrecta: .asciiz "Clave correcta"
outputIncorrecta: .asciiz "Clave incorrecta"
clave: .asciiz "fede"
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008

	.code
ld $t6, DIR_CONTROL($0)
ld $t7, DIR_DATA($0)

daddi $t0, $0, outputIngrese
sd $t0, 0($t7)
daddi $t0, $0, 4
sd $t0, 0($t6)

halt