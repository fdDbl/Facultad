// Dado el siguiente programa:
program anidamientos;
    procedure leer;
    var
        letra : char;
    function analizarLetra : boolean;
        begin
            if (letra >= 'a') and (letra <= 'z') then
                analizarLetra := true;
            else if (letra >= 'A') and (letra <= 'Z') then
                analizarletra := false;
        end; { fin de la funcion analizarLetra }
    begin
        readln(letra);
        if (analizarLetra) then
            writeln('Se trata de una minúscula')
        else
            writeln('Se trata de una mayúscula');
        end; { fin del procedure leer}
var
    ok : boolean;
begin { programa principal }
    leer;
    ok := analizarLetra;
    if ok then
        writeln('Gracias, vuelva prontosss');
end.

{   a. La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer, pero esto
    puede traer problemas en el código del programa principal.
        i) ¿Qué clase de problema encuentra?
        ii) ¿Cómo se puede resolver el problema para que el programa compile y funcione correctamente? }
    
{       i, ii) El problema es que la funcion analizarLetra se encuentra localizada en el proceso, y no puede ser leída
            por el programa principal. Además, el programa principal NO CONOCE la variable "letra" cuando invoca la funcion. 
            Para ello se debe declarar la función FUERA del proceso, y declarar la variable correspondiente a la
            función de la siguiente manera: }
    
program anidamientos;
    function analizarLetra(letra: char): boolean;
        begin
            if (letra >= 'a') and (letra <= 'z') then
                analizarLetra := true;
            else if (letra >= 'A') and (letra <= 'Z') then
                analizarletra := false;
        end; { funcion analizarLetra movida }
    procedure leer;
    var
        lt: char;
    begin
        readln(lt);
        if (analizarLetra(lt)) then
            writeln('Se trata de una minúscula')
        else
            writeln('Se trata de una mayúscula');
        end; { fin del procedure leer}
var
    ok : boolean;
    lt: char; { variable lt declarada }
begin { programa principal }
    leer;
    ok := analizarLetra(lt); { variable lt insertada en la función }
    if ok then
        writeln('Gracias, vuelva prontosss');
end.

{   b. La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable
    letra.
        i) ¿De qué valores se trata?
        ii) ¿Qué sucede en nuestro programa si se ingresa uno de estos valores?
        iii) ¿Cómo se puede resolver este problema? }
    
{       i) Se trata de caracteres cómo símbolos y dígitos.
        ii) Al ingresarse uno de esos valores, el programa los ingresará a las estructuras de control
            del proceso, que compara los valores ingresados con caracteres de letras solamente.
        iii) Para resolverlo, antes de hacer las comparaciones necesarias en las estructuras de control,
            debemos asegurarnos de que los valores ingresados pertenezcan al alfabeto, así: }

program anidamientos;
    function analizarLetra(letra: char): boolean;
        begin
            if ((letra >= 'a') and (letra <= 'z')) or ((letra >= 'A') and (letra <= 'Z')) { asegurarnos de que son letras } then begin 
                if (letra >= 'a') and (letra <= 'z') then { y ejecuta las estructuras de control una vez que nos aseguramos. }
                    analizarLetra := true
                else if (letra >= 'A') and (letra <= 'Z') then
                    analizarletra := false
                else writeln('Ingresar solo letras.') { un else final por las dudas jeje }
            end;
        end; { fin de la funcion analizarLetra }
    procedure leer;
    var
        lt : char;
    begin
        readln(lt);
        if (analizarLetra(lt)) then
            writeln('Se trata de una minúscula')
        else
            writeln('Se trata de una mayúscula');
        end; { fin del procedure leer}
var
    ok : boolean;
    lt : char;
begin { programa principal }
    leer;
    ok := analizarLetra(lt);
    if ok then
        writeln('Gracias, vuelva prontosss');
end.