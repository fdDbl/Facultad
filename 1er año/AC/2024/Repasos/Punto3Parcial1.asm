PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
MSJ1 DB "Arquitectura de Computadoras"
MSJ2 DB "Fin de programa"
FIN DB ?

ORG 3000H
INI_PIO: PUSH AX
MOV AL, 0FFH
OUT CA, AL
MOV AL, 0
OUT CB, AL
POP AX
RET

ORG 3100H
ACT_LUCES:
  IN AL, PA
  XOR AL, 0FFH
  OUT PB, AL
RET

ORG 3200H
CHECK_IMP:
  AND AL, 10000000B
  JNZ RETORNAR
  MOV BX, OFFSET MSJ1
  MOV AL, OFFSET MSJ2 - OFFSET MSJ1
  INT 7
  RETORNAR:
RET

ORG 3300H
CHECK_FIN:
  IN AL, PA
  AND AL, 0FFH
  JNZ RETORNAR2
    INT 0
  RETORNAR2:
RET

ORG 2000H
CALL INI_PIO

LOOP: CALL ACT_LUCES
CALL CHECK_IMP
CALL CHECK_FIN
JMP LOOP

FIN_PROGRAM:
INT 0
END
