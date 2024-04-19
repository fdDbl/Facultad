program Ejercicio3;
    procedure suma(num1: integer; var num2:integer);
    begin
        num2 := num1 + num2;
        num1 := 0;
    end;
    var
        i, x : integer;
    begin
        read(x); { leo la variable x }
        for i:= 1 to 5 do
            suma(i,x);
        write(x); { imprimo las variable x }
    end.

{   a. ¿Qué imprime si se lee el valor 10 en la variable x ?
    b. Qué imprime si se lee el valor 10 en la variable x y se cambia el encabezado del procedure por:
        procedure suma(num1: integer; num2:integer);
    c. Qué sucede si se cambia el encabezado del procedure por:
        procedure suma(var num1: integer; var num2:integer); }

{   a. Imprime '25'. Ya que suma (for i:= 1 to 5) + x = (1+2+3+4+5) + 10 = 15 + 10.
    b. Se lee lo que se ingresa en el write, ya que el parametro no va a sacar nada.
    c. Error. Ya que, el procedimiento, al poder modificar la variable i directamente en el programa principal,
        i vuelve a 0 a cada rato, y se queda iterando constantemente (directamente da error porque es una declaración ilegal).  }