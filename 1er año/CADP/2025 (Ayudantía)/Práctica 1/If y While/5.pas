program cinco;
var
    legajo:integer;
    promedio:real;
    cantAlumnosLeidos:integer;
    cantPromediosMayores65:integer;
    cantDestacados:integer;
begin
    cantAlumnosLeidos := 0;
    cantPromediosMayores65 := 0;
    cantDestacados := 0;

    readln(legajo);
    while(legajo <> -1) do begin
        readln(promedio);

        cantAlumnosLeidos := cantAlumnosLeidos + 1;
        if(promedio > 6.5) then
            cantPromediosMayores65 := cantPromediosMayores65 + 1;
        if(promedio > 8.5) and (legajo < 2500) then
            cantDestacados := cantDestacados + 1;
        
        readln(legajo);
    end;
    writeln('Cantidad de alumnos leída: ', cantAlumnosLeidos);
    writeln('Cantidad de alumnos con promedio mayor a 6.5: ', cantPromediosMayores65);
    writeln('Porcentaje de alumnos destacados: ', ((cantDestacados * 100) / cantAlumnosLeidos):0:2 ,'%');
end.