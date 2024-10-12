EOI EQU 20H       ; Fin de interrupción (End of Interrupt), señal para indicar que la interrupción ha sido atendida
IMR EQU 21H       ; Registro de máscara de interrupciones (Interrupt Mask Register), controla qué interrupciones están habilitadas
INT1 EQU 25h      ; Puerto para configurar la tasa de interrupciones del temporizador
CONT EQU 10h      ; Puerto de control del temporizador (activa/desactiva)
COMP EQU 11h      ; Puerto de comparación del temporizador, ajusta la frecuencia de las interrupciones
N_TIMER EQU 20    ; Valor base para el temporizador, ajustado según la frecuencia requerida

ORG 80
IP_F10 DW RUT_TIMER ; Vector de interrupción del temporizador, apunta a la rutina RUT_TIMER

ORG 1000H
TEXTO DB "Vamos las interrupciones!" ; Cadena de texto a mostrar cada vez que ocurre una interrupción
FIN_TEXTO DB ?                       ; Marca el final del texto (carácter nulo)
CANT DB 0                            ; Contador que lleva la cuenta de cuántas veces se ha mostrado el mensaje

ORG 2000H
CLI                              ; Deshabilita interrupciones mientras se configura el temporizador
  MOV AL, 0FDH                   ; Configura la máscara de interrupciones, habilita la interrupción del temporizador (todo menos el bit 1)
  OUT IMR, AL                    ; Escribe la máscara en el registro IMR
  MOV AL, N_TIMER                ; Carga el valor base del temporizador en AL
  OUT INT1, AL                   ; Escribe el valor en el puerto del temporizador para iniciar las interrupciones periódicas
  MOV AL, 2                      ; Configura el comparador del temporizador para generar una interrupción cada 2 segundos
  OUT COMP, AL                   ; Escribe en el puerto de comparación
  MOV AL, 0                      ; Inicializa y activa el temporizador
  OUT CONT, AL                   ; Escribe en el puerto de control del temporizador
STI                              ; Habilita las interrupciones ahora que el temporizador está configurado

LAZO: CMP CANT, 5                ; Compara el valor del contador CANT con 5 (máximo de repeticiones)
  JNZ LAZO                       ; Si no se ha alcanzado 5, repite el lazo y sigue verificando
  INT 0                          ; Cuando CANT alcanza 5, interrumpe la ejecución del programa (finaliza)

ORG 3000H
RUT_TIMER: PUSH AX               ; Guarda el valor de AX en la pila (stack)
  PUSH BX                        ; Guarda el valor de BX en la pila
  MOV BX, OFFSET TEXTO           ; Carga en BX la dirección del texto a mostrar
  MOV AL, OFFSET FIN_TEXTO - OFFSET TEXTO ; Calcula la longitud del texto (diferencia entre la dirección final e inicial del texto)
  INT 7                          ; Llama a una interrupción para mostrar el texto en pantalla
  INC CANT                       ; Incrementa el contador CANT (cantidad de veces que se ha mostrado el mensaje)
  CMP CANT, 5                    ; Compara el valor de CANT con 5
  JNZ SIGUE                      ; Si CANT no es 5, sigue ejecutando la rutina
  MOV AL, 0FFh                   ; Si CANT es 5, deshabilita las interrupciones del temporizador (todas las interrupciones)
  OUT IMR, AL                    ; Escribe en el registro de máscara de interrupciones para deshabilitar el temporizador

SIGUE: MOV AL, EOI               ; Carga el valor de EOI (End of Interrupt) en AL
  OUT EOI, AL                    ; Señala el fin de la interrupción para permitir la siguiente
  MOV AL, 0                      ; Resetea el temporizador (reinicia el contador)
  OUT CONT, AL                   ; Escribe en el puerto de control para resetear el temporizador
  POP BX                         ; Restaura el valor original de BX desde la pila
  POP AX                         ; Restaura el valor original de AX desde la pila
IRET                             ; Retorno de la interrupción, vuelve a la ejecución normal
END                              ; Fin del programa
