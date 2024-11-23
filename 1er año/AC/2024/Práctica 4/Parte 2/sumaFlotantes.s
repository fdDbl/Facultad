.data
DIR_CONTROL: .word 0x10000    # Dirección de memoria para el registro de control 
DIR_DATA: .word 0x10008       # Dirección de memoria para el registro de datos
A: .double 5.6                # Variable A con valor en punto flotante 5.6
B: .double 10.4               # Variable B con valor en punto flotante 10.4

.code
ld $t3, DIR_CONTROL($0)       # Carga en $t3 la dirección de control
ld $t4, DIR_DATA($0)         # Carga en $t4 la dirección de datos
l.d f1, A($0)                # Carga en f1 el valor de A (5.6)
l.d f2, B($0)                # Carga en f2 el valor de B (10.4)
add.d f5, f1, f2             # Suma los valores en punto flotante: f5 = f1 + f2
s.d f5, 0($t4)               # Almacena el resultado de la suma en la dirección de datos
daddi $t5, $0, 3             # Carga el valor inmediato 3 en $t5
sd $t5, 0($t3)               # Almacena el valor 3 en la dirección de control
halt                         # Detiene la ejecución del programa
