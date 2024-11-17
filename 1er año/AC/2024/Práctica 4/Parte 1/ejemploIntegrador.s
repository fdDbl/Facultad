.data
cadena: .asciiz "Hola"  # Define una cadena en la sección de datos con el texto "Hola"
.code
; iniciar SP
DADDI $sp, $0, 0x400      # Inicializa el puntero de pila (Stack Pointer) a la dirección 0x400
; parámetro: dir. de cadena
DADDI $a0, $0, cadena     # Carga en $a0 la dirección de memoria de la cadena "cadena"
JAL mayus                 # Llama a la subrutina mayus para procesar la cadena
HALT                      # Detiene la ejecución del programa

mayus: DADDI $sp, $sp, -16 # Reserva espacio en la pila para guardar registros
       SD $ra, 0($sp)      # Guarda el valor del registro $ra (dirección de retorno) en la pila
       SD $s0, 8($sp)      # Guarda el valor del registro $s0 en la pila
       DADD $s0, $a0, $zero # Copia en $s0 la dirección de la cadena desde $a0 para recorrerla
loop:  LBU $a0, 0($s0)     # Carga el carácter actual (byte sin signo) desde la dirección en $s0 a $a0
       BEQ $a0, $zero, fin # Si el carácter es nulo (fin de cadena), salta a la etiqueta fin
       JAL mayusCar        # Llama a la subrutina mayusCar para convertir el carácter en mayúscula
       SB $v0, 0($s0)      # Guarda el carácter convertido (almacenado en $v0) en la posición original de la cadena
       DADDI $s0, $s0, 1   # Incrementa $s0 para apuntar al siguiente carácter de la cadena
       J loop              # Vuelve al inicio del bucle para procesar el siguiente carácter
fin:   LD $ra, 0($sp)      # Restaura el valor original del registro $ra desde la pila
       LD $s0, 8($sp)      # Restaura el valor original del registro $s0 desde la pila
       DADDI $sp, $sp, 16  # Libera el espacio reservado en la pila
       JR $ra              # Retorna al llamador (al programa principal)

mayusCar: DADD $v0, $a0, $zero # Copia el carácter recibido en $a0 al registro $v0
          SLTI $t0, $v0, 0x61  # Comprueba si $v0 (carácter) es menor a 'a' (ASCII 0x61)
          BNEZ $t0, salir      # Si $t0 != 0 (verdadero), el carácter no está en minúscula y salta a salir
          SLTI $t0, $v0, 0x7B  # Comprueba si $v0 (carácter) es menor a 'z' + 1 (ASCII 0x7B)
          BEQZ $t0, salir      # Si $t0 == 0 (falso), el carácter está fuera del rango de minúsculas y salta a salir
          DADDI $v0, $v0, -0x20 # Convierte el carácter a mayúscula restando 32 (diferencia en ASCII entre minúsculas y mayúsculas)
salir:    JR $ra               # Retorna al llamador (subrutina mayus)
