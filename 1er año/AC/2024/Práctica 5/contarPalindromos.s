# Sección de datos
.data
# Definición del texto a analizar
texto: .asciiz "Nos sometemos a problemas si se usa un radar para reconocer ese oso azul"

.text
        # Inicialización del programa
        daddi   $sp, $0, 0x400      # Inicializa el stack pointer al tope de la memoria
        daddi   $a0, $0, texto      # Carga la dirección del texto en $a0
        jal     contar_palindromos   # Llama a la función principal
        halt                         # Termina el programa

# Función principal que cuenta los palíndromos
contar_palindromos:
        # Prólogo de la función - guarda registros en el stack
        daddi   $sp, $sp, -48       # Reserva espacio en el stack
        sd      $ra, 0($sp)         # Guarda dirección de retorno
        sd      $s0, 8($sp)         # Guarda registros que se usarán
        sd      $s1, 16($sp)
        sd      $s2, 24($sp)
        sd      $s3, 32($sp)
        sd      $s4, 40($sp)

        # Inicialización de registros
        dadd    $s0, $a0, $0        # $s0 = inicio de la palabra actual
        dadd    $s1, $a0, $0        # $s1 = puntero móvil en el texto
        daddi   $s2, $0, 32         # $s2 = código ASCII del espacio (32)
        dadd    $s4, $0, $0         # $s4 = contador de palíndromos (inicializado a 0)

# Bucles principales para procesar el texto
while1: lbu     $s3, 0($s1)         # Carga un carácter del texto
while2: daddi   $s1, $s1, 1         # Avanza al siguiente carácter
        dadd    $a0, $s0, $0        # Prepara inicio de palabra para es_palindromo
        daddi   $a1, $s1, -2        # Prepara fin de palabra para es_palindromo
        beqz    $s3, procesa        # Si es fin de texto, procesa la última palabra
        bne     $s3, $s2, while1    # Si no es espacio, continúa buscando

# Procesa una palabra encontrada
procesa:jal     es_palindromo       # Verifica si la palabra es palíndromo
        dadd    $s4, $s4, $v0       # Suma al contador si es palíndromo
        beqz    $s3, terminar       # Si es fin de texto, termina

# Salta espacios en blanco consecutivos
saltea_blancos:
        dadd    $s0, $s1, $0        # Actualiza inicio de siguiente palabra
        lbu     $s3, 1($s1)         # Carga siguiente carácter
        daddi   $s1, $s1, 1         # Avanza puntero
        beqz    $s3, terminar       # Si es fin de texto, termina
        bne     $s3, $s2, while2    # Si no es espacio, procesa siguiente palabra
        j       saltea_blancos      # Si es espacio, sigue saltando espacios

# Epílogo de la función principal
terminar:
        dadd    $v0, $s4, $0        # Prepara valor de retorno (cantidad de palíndromos)
        # Restaura registros guardados
        ld      $ra, 0($sp)
        ld      $s0, 8($sp)
        ld      $s1, 16($sp)
        ld      $s2, 24($sp)
        ld      $s3, 32($sp)
        ld      $s4, 40($sp)
        daddi   $sp, $sp, 48        # Restaura el stack pointer
        jr      $ra                 # Retorna

# Función que verifica si una palabra es palíndromo
es_palindromo:
        dadd    $v0, $0, $0         # Inicializa resultado como falso (0)

# Bucle que compara caracteres desde los extremos hacia el centro
lazo:   lbu     $t0, 0($a0)         # Carga carácter desde el inicio
        daddi   $a0, $a0, 1         # Avanza puntero inicio
        lbu     $t1, 0($a1)         # Carga carácter desde el final
        daddi   $a1, $a1, -1        # Retrocede puntero final
        slt     $t2, $a1, $a0       # Verifica si los punteros se cruzaron
        bne     $t0, $t1, no_es     # Si caracteres son diferentes, no es palíndromo
        beqz    $t2, lazo           # Si no se cruzaron, sigue comparando
        daddi   $v0, $0, 1          # Si llegó aquí, es palíndromo (retorna 1)

no_es:  jr      $ra                 # Retorna resultado