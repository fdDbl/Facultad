; COMENTARIOS EXPLICATIVOS HECHOS CON IA. CÓDIGO HECHO POR MÍ.

; Definición de constantes
IMR EQU 21H        ; Registro de máscara de interrupciones (Interrupt Mask Register)
EOI EQU 20H        ; Código de fin de interrupción (End of Interrupt)
INT2 EQU 26H       ; Puerto para configurar la interrupción 2 (del hardware)
DATO EQU 40H       ; Puerto donde se envían los datos para que sean impresos
ESTADO EQU 41H     ; Puerto de estado para controlar y monitorear el estado de la impresora
IDHS EQU 5         ; Identificador de la interrupción para el hardware (HS)

; Dirección donde se ubica la rutina de interrupción
ORG 20
DW SUBRUT_HS       ; Dirección de la rutina de interrupción para HS

; Definición del mensaje a enviar
ORG 1000H
MSJ DB "UNIVERSIDAD NACIONAL DE LA PLATA"  ; Mensaje a mostrar
FIN DB ?                                   ; Marca el final del mensaje

; Programa principal
ORG 2000H
MOV BX, OFFSET MSJ   ; Carga la dirección de inicio del mensaje en BX (puntero al mensaje)
MOV CL, OFFSET FIN - OFFSET MSJ ; Calcula la longitud del mensaje (diferencia entre inicio y fin) y la almacena en CL

; Configuración del hardware y las interrupciones
CLI                  ; Deshabilita las interrupciones mientras se configura el hardware
  MOV AL, 11111011B  ; Configura la máscara de interrupciones, habilitando la interrupción del hardware HS (INT2)
  OUT IMR, AL        ; Escribe la máscara en el registro IMR para habilitar la interrupción HS
  MOV AL, IDHS       ; Carga el identificador de la interrupción del hardware
  OUT INT2, AL       ; Configura la interrupción 2 con el ID del hardware (HS)
  MOV AL, 10000000B  ; Configura el puerto de estado para habilitar el estado de impresión mediante interrupción
  OUT ESTADO, AL     ; Escribe en el puerto de estado para activar el hardware
STI                  ; Habilita las interrupciones después de la configuración

; Lazo principal del programa, espera hasta que se haya enviado todo el mensaje
MAIN: CMP CL, 0       ; Compara el valor de CL (contador de caracteres) con 0
JNZ MAIN              ; Si CL no es 0, sigue esperando en el bucle
IN AL, ESTADO         ; Lee el estado del hardware
AND AL, 01111111B     ; Limpia el bit 7 (pone el hardware en modo consulta de estado)
OUT ESTADO, AL        ; Escribe el nuevo estado en el puerto de control
INT 0                 ; Termina el programa cuando el mensaje se ha enviado completamente

; Rutina de servicio de interrupción (ISR) para manejar el envío del mensaje
ORG 3000H
SUBRUT_HS: PUSH AX       ; Guarda el registro AX en la pila
  MOV AL, [BX]           ; Carga el carácter apuntado por BX (mensaje) en AL
  OUT DATO, AL           ; Envía el carácter al puerto de datos (DATO)
  INC BX                 ; Incrementa BX para apuntar al siguiente carácter del mensaje
  DEC CL                 ; Decrementa el contador CL (cantidad de caracteres restantes)
  JNZ SIGUE              ; Si CL no es 0, sigue procesando los caracteres restantes
    MOV AL, 0FFH         ; Si CL es 0, desactiva todas las interrupciones
    OUT IMR, AL
SIGUE: MOV AL, EOI       ; Señala que la interrupción ha sido atendida
  OUT EOI, AL            ; Envía la señal de fin de interrupción
POP AX                   ; Restaura el valor original de AX
IRET                     ; Retorna de la interrupción y vuelve al flujo normal del programa

END                       ; Fin del programa
