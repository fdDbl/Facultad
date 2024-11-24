.data
    coorX: .byte 24        # Coordenada X con valor 24
    coorY: .byte 10        # Coordenada Y con valor 10
    color: .byte 255, 0, 255, 0  # Array de 4 bytes que define un color (RGBA)
    DIR_CONTROL: .word32 0x10000  # Dirección de control
    DIR_DATA: .word32 0x10008     # Dirección de datos
.code
    # Carga las direcciones base de control y datos
    lwu $s6, DIR_CONTROL($0)  # Carga la dirección de control en $s6
    lwu $s7, DIR_DATA($0)     # Carga la dirección de datos en $s7

    # Configura coordenada X
    lbu $s0, coorX($0)        # Carga el valor de coorX (24) en $s0
    sb $s0, 5($s7)            # Almacena la coordenada X en offset 5 de datos

    # Configura el color
    lwu $s2, color($0)        # Carga los 4 bytes de color en $s2
    sw $s2, 0($s7)            # Almacena el color en la dirección base de datos

    # Configura coordenada Y
    lbu $s1, coorY($0)        # Carga el valor de coorY (10) en $s1
pintar:
    sb $s1, 4($s7)            # Almacena la coordenada Y en offset 4 de datos

    # Ejecuta la operación
    daddi $s3, $0, 5          # Carga el valor 5 en $s3
    sd $s3, 0($s6)            # Almacena el 5 en la dirección de control

    daddi $s1, $s1, 1         # Suma 1 a la coordenada Y
    slti $s4, $s1, 21         # Si la coorY no llegó a 21...
    bnez $s4, pintar          # ...que siga pintando (la coorY=21 no se pinta)
halt
