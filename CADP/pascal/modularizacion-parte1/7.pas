
{ a) Hay que hacer el return al final de la funcion, agregando: 
    "calcularPromedio := prom;
}

program alcanceYFunciones;

var
  suma, cant: integer;

function calcularPromedio: real;
var
  prom: real;
begin
  if (cant = 0) then
    prom := -1
  else
    prom := (suma DIV cant);
    calcularPromedio := prom;
end;
begin
  writeln('Ingresar el total de los valores:');
  readln(suma);
  writeln('Ingresar la cantidad de valores:');
  readln(cant);

  if calcularPromedio <> -1 then begin
    writeln('El promedio es: ', calcularPromedio);
  end
  else
    writeln('Dividir por cero no parece ser una buena idea');

end.

{ b) Asignandole la salida de la funcion a una variable global.
    Es decir: 

    calcularPromedio := calcProm
    if (calcularPromedio <> -1) then begin
        cant := 0;
        writeln(‘El promedio es: ’ , calcProm)
    end;
}

program alcanceYFunciones;

var
  suma, cant: integer;
  calcProm:real;

function calcularPromedio: real;
var
  prom: real;
begin
  if (cant = 0) then
    prom := -1
  else
    prom := (suma DIV cant);
    calcularPromedio := prom;
end;
begin
  writeln('Ingresar el total de los valores:');
  readln(suma);
  writeln('Ingresar la cantidad de valores:');
  readln(cant);
  calcProm := calcularPromedio;
  if calcularPromedio <> -1 then begin
    writeln('El promedio es: ', calcProm);
  end
  else
    writeln('Dividir por cero no parece ser una buena idea');

end.

{ c)  i) El programa principal arrojará: ERROR

      ii) Arrojará: 8.0000000000000000E+000 (variable real).

      iii) Se ejecutará la función, asignando 48 a suma y 6 a cant, 
      así dando como resultado: El promedio es:  8.0000000000000000E+000 (variable real).

}