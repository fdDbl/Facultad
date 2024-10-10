DATO EQU 40H
ESTADO EQU 41H

ORG 1000H
MSJ DB "Estoy usando la impresora a través del Handshake"
FIN DB ?

ORG 2000H
IN AL, ESTADO
AND AL, 01111111B ; Como quiero hacerlo por CONSULTA DE ESTADO, coloco el bit de interrupción en 0 (queda 0xxxxxxx)
OUT ESTADO, AL

MOV BX, OFFSET MSJ
POLL: IN AL, ESTADO
AND AL, 1
JNZ POLL
MOV AL, [BX]
OUT DATO, AL
INC BX
CMP BX, OFFSET FIN
JNZ POLL

INT 0
END
