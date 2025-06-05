DATO EQU 40h
ESTADO EQU 41h
ORG 1000h ; Memoria de datos
 msj DB "INGENIERIA E INFORMATICA"
 fn DB ?
ORG 3000h
 poll: in al,ESTADO
 and al,1
 jnz poll
 ret
ORG 3200h
 imprimir_caracter_hand: push ax
 call poll
 pop ax
 out DATO, al
 ret
ORG 2000H
 in al, ESTADO
 and al, 7Fh
 ; Prog principal
 ; modo consulta de estado
 out ESTADO, al
 mov bx, offset msj
 mov cl, offset fn- offset msj
 lazo: mov al, [bx]
 call imprimir_caracter_hand
 inc bx
 dec cl
 jnz lazo
 int 0
end
