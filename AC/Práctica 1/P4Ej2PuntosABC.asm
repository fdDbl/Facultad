; A) Completar las instrucciones del siguiente programa, que envía a una subrutina 3 valores A, B y C a través de registros AL, AH y CL, calcula AL+AH-CL, y devuelve el resultado en DL. 
org 1000h      ; Definición de los valores en memoria
A db 8         ; Definir A con el valor 8
B db 5         ; Definir B con el valor 5
C db 4         ; Definir C con el valor 4
D db ?         ; Definir D sin valor inicial, se llenará más tarde

org 3000h      ; Subrutina CALC que realiza el cálculo AL + AH - CL
CALC: mov DL, AL  ; Mover el valor del registro AL al registro DL
      add DL, AH  ; Sumar el valor del registro AH al registro DL
      sub DL, CL  ; Restar el valor del registro CL al registro DL
      ret         ; Retornar de la subrutina

org 2000h      ; Programa principal que prepara y llama a la subrutina CALC
      mov AL, A   ; Mover el valor de A (8) al registro AL
      mov AH, B   ; Mover el valor de B (5) al registro AH
      mov CL, C   ; Mover el valor de C (4) al registro CL
      call CALC   ; Llamar a la subrutina CALC para realizar el cálculo
      mov D, DL   ; Mover el resultado de DL a la variable D
      hlt         ; Detener la ejecución del programa
end

; B) Idem el inciso anterior, pero los valores A, B y C se reciben mediante  pasaje de parámetros por valor a través de la pila. El resultado se devuelve de igual forma por el registro dl y por valor.
org 1000h      ; Definición de los valores en memoria
A db 8         ; Definir A con el valor 8
B db 5         ; Definir B con el valor 5
C db 4         ; Definir C con el valor 4
D db ?         ; Definir D sin valor inicial, se llenará más tarde

org 3000h      ; Inicio de la subrutina CALC, que realiza operaciones con los valores de la pila
CALC: push bx  ; Guardar el registro BX en la pila para preservarlo
      mov bx, sp  ; Mover el valor del puntero de pila SP al registro BX
      add bx, 8   ; Ajustar BX para apuntar al tercer valor apilado (que es C)
      mov dl, [bx] ; Mover el valor apuntado por BX (C) al registro DL
      sub bx, 2   ; Ajustar BX para apuntar al segundo valor apilado (que es B)
      add dl, [bx] ; Sumar el valor apuntado por BX (B) al registro DL
      sub bx, 2   ; Ajustar BX para apuntar al primer valor apilado (que es A)
      sub dl, [bx] ; Restar el valor apuntado por BX (A) del registro DL
      pop bx      ; Restaurar el valor original de BX desde la pila
      ret         ; Retornar de la subrutina

org 2000h      ; Programa principal
      mov AL, A  ; Mover el valor de A (8) al registro AL
      push AX    ; Guardar el valor de AX (que contiene AL) en la pila
      mov AL, B  ; Mover el valor de B (5) al registro AL
      push AX    ; Guardar el valor de AX en la pila
      mov AL, C  ; Mover el valor de C (4) al registro AL
      push AX    ; Guardar el valor de AX en la pila
      call CALC  ; Llamar a la subrutina CALC para realizar la operación
      mov D, DL  ; Mover el resultado de DL (calculado en CALC) a D
      pop AX     ; Recuperar y descartar el valor más alto de la pila (C)
      pop AX     ; Recuperar y descartar el siguiente valor de la pila (B)
      pop AX     ; Recuperar y descartar el último valor de la pila (A)
      hlt        ; Detener la ejecución del programa
end

; C) Modificar el programa anterior para enviar los parámetros A, B y C a través de la pila pero ahora por referencia.
org 1000h      ; Definición de los valores en memoria
A db 8         ; Definir A con el valor 8
B db 5         ; Definir B con el valor 5
C db 4         ; Definir C con el valor 4
D db ?         ; Definir D sin valor inicial, se llenará más tarde

org 3000h      ; Subrutina CALC, que toma los valores desde la pila por referencia
CALC: push bx  ; Guardar el valor actual de BX en la pila
      mov bx, sp  ; Mover el puntero de pila SP a BX para acceder a los parámetros apilados
      add bx, 8   ; Ajustar BX para apuntar al tercer valor apilado (referencia a C)
      mov bx, [bx] ; Mover la dirección de memoria de C desde la pila a BX
      mov dl, [bx] ; Mover el valor de C al registro DL
      mov bx, sp  ; Resetear BX al puntero de pila
      add bx, 6   ; Ajustar BX para apuntar al segundo valor apilado (referencia a B)
      mov bx, [bx] ; Mover la dirección de memoria de B desde la pila a BX
      add dl, [bx] ; Sumar el valor de B al registro DL
      mov bx, sp  ; Resetear BX al puntero de pila
      add bx, 4   ; Ajustar BX para apuntar al primer valor apilado (referencia a A)
      mov bx, [bx] ; Mover la dirección de memoria de A desde la pila a BX
      sub dl, [bx] ; Restar el valor de A del registro DL
      pop bx      ; Restaurar el valor original de BX desde la pila
      ret         ; Retornar de la subrutina

org 2000h      ; Programa principal que envía las referencias de A, B y C a la subrutina
      mov AX, offset A  ; Mover la dirección de memoria de A a AX
      push AX           ; Apilar la dirección de A en la pila
      mov AX, offset B  ; Mover la dirección de memoria de B a AX
      push AX           ; Apilar la dirección de B en la pila
      mov AX, offset C  ; Mover la dirección de memoria de C a AX
      push AX           ; Apilar la dirección de C en la pila
      call CALC         ; Llamar a la subrutina CALC
      mov D, DL         ; Mover el resultado almacenado en DL a la variable D
      pop AX            ; Desapilar la dirección de C (no usada)
      pop AX            ; Desapilar la dirección de B (no usada)
      pop AX            ; Desapilar la dirección de A (no usada)
      hlt               ; Detener la ejecución del programa
end
