.data
DIR_CONTROL: .word 0x10000    # Dirección de memoria para el registro de control
DIR_DATA: .word 0x10008       # Dirección de memoria para el registro de datos
V: .word 15,-5,6,7,-5,4,-9,6,-55  # Vector de 9 números enteros

.code
ld $t0, DIR_CONTROL($0)       # Carga en $t0 la dirección de control
ld $t1, DIR_DATA($0)         # Carga en $t1 la dirección de datos
daddi $t2, $0, 9             # $t2 = 9 (contador del número de elementos)
daddi $t3, $0, 0             # $t3 = 0 (índice para recorrer el vector)

loop: ld $t4, V($t3)         # Carga en $t4 el elemento actual del vector
      sd $t4, 0($t1)         # Guarda el elemento en la dirección de datos
      daddi $t4, $0, 2       # $t4 = 2 (código de operación para mostrar el número)
      sd $t4, 0($t0)         # Envía el código de operación al control
      daddi $t3, $t3, 8      # Incrementa el índice en 8 (siguiente palabra)
      daddi $t2, $t2, -1     # Decrementa el contador
      bnez $t2, loop         # Si el contador no es 0, vuelve al loop
halt                         # Fin del programa
