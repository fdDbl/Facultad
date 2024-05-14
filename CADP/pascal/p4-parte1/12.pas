program doce;
{ En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
 irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
 Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo Local. 
 Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
    a. La cantidad de galaxias de cada tipo.
    b. La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
       porcentaje que esto representa respecto a la masa de todas las galaxias.
    c. La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
    d. El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa. }
const
    dimF = 53;
type
    kg = real;
    pc = real;
    str10 = string[10];
    gal = record
        nombre: string;
        tipo: str10;
        masa: kg;
        distancia: pc;
    end;
    vGalaxia = array[1 .. dimF] of gal;
    vTipoGalaxia = array[1 .. 4] of integer;
var
    galaxia: vGalaxia;
    galaxiaTipo: vTipoGalaxia;

procedure cargarDatos(var galaxy: vGalaxia; var galaxyType: vTipoGalaxia);
var
    i:integer;
begin
    for i := 1 to 4 do 
        galaxyType[i] := 0;

    for i:= 1 to dimF do begin
        writeln('');
        writeln('GALAXIA #',i);

        write('Nombre: ');
        readln(galaxy[i].nombre);

        write('Tipo: ');
        readln(galaxy[i].tipo);
            if(galaxy[i].tipo='Eliptica') then
                galaxyType[1] := galaxyType[1] + 1
            else if(galaxy[i].tipo='Espiral') then
                galaxyType[2] := galaxyType[2] + 1
            else if(galaxy[i].tipo='Lenticular') then
                galaxyType[3] := galaxyType[3] + 1
            else if(galaxy[i].tipo='Irregular') then
                galaxyType[4] := galaxyType[4] + 1;

        write('Masa (kg): ');
        readln(galaxy[i].masa);

        write('Distancia a la tierra (pc): ');
        readln(galaxy[i].distancia);
        end;
    writeln('');
end;

procedure analizarDatosA(var galaxy: vGalaxia; var galaxyType: vTipoGalaxia);
begin
    writeln('CANTIDAD DE GALAXIAS ELIPTICAS: ',galaxyType[1]);
    writeln('CANTIDAD DE GALAXIAS ESPIRAL: ',galaxyType[2]);
    writeln('CANTIDAD DE GALAXIAS LENTICULARES: ',galaxyType[3]);
    writeln('CANTIDAD DE GALAXIAS IRREGULARES: ',galaxyType[4]);
end;

procedure analizarDatosB(var galaxy: vGalaxia; var galaxyType: vTipoGalaxia);
var
    i:integer;
    masaTotalTodas:real;
    masaTotalPrincipales:real;
    porcMasaTotal:real;
begin
    masaTotalTodas:=0;
    masaTotalPrincipales:=0;
    for i:= 1 to dimF do begin
        if(galaxy[i].nombre='Via Lactea') or 
        (galaxy[i].nombre='Andromeda') or 
        (galaxy[i].nombre='Triangulo') then
        begin
            masaTotalPrincipales:=masaTotalPrincipales+galaxy[i].masa;
        end;
        masaTotalTodas:=masaTotalTodas+galaxy[i].masa;
    end;
    porcMasaTotal:=(masaTotalPrincipales * 100)/masaTotalTodas;
    writeln('');
    writeln('MASA TOTAL ACUMULADA DE LAS GALAXIAS PRINCIPALES: ',masaTotalPrincipales);
    writeln('PORCENTAJE QUE ESTO REPRESENTA RESPECTO A LA MASA DE TODAS LAS GALAXIAS: ',porcMasaTotal);
end;

procedure analizarDatosC(var galaxy: vGalaxia; var galaxyType: vTipoGalaxia);
var
    i:integer;
    cantGalNoIrr:integer;
begin
    cantGalNoIrr:=0;
    for i:= 1 to dimF do begin
        if(galaxy[i].tipo <> 'Irregular') and
        (galaxy[i].distancia < 1000) then
            cantGalNoIrr:=cantGalNoIrr+1;
    end;
    writeln('');
    writeln('CANTIDAD DE GALAXIAS NO IRREGULARES QUE SE ENCUENTRAN A MENOS DE 1000 PC: ',cantGalNoIrr);
end;

procedure analizarDatosD(var galaxy: vGalaxia; var galaxyType: vTipoGalaxia);
type
    vNombresMayorMasa = array[1 .. 2] of string;
    vMasasMayorMasa = array[1 .. 2] of real;

    vNombresMenorMasa = array[1 .. 2] of string;
    vMasasMenorMasa = array[1 .. 2] of real;
var
    NomMayorMasa:vNombresMayorMasa;
    MasaMayorMasa:vMasasMayorMasa;

    NomMenorMasa:vNombresMenorMasa;
    MasaMenorMasa:vMasasMenorMasa;

    i:integer;
begin
    for i:= 1 to 2 do begin
        MasaMayorMasa[i]:=0;
        MasaMenorMasa[i]:=30000;
    end;
    for i:= 1 to dimF do begin
        if(galaxy[i].masa > MasaMayorMasa[1]) then 
        begin
            NomMayorMasa[1]:=galaxy[i].nombre;
            MasaMayorMasa[1]:=galaxy[i].masa;
        end
        else 
        if(galaxy[i].masa > MasaMayorMasa[2]) then
        begin
            NomMayorMasa[2]:=galaxy[i].nombre;
            MasaMayorMasa[2]:=galaxy[i].masa;
        end;
    end;
    for i:= 1 to dimF do begin
        if(galaxy[i].masa < MasaMenorMasa[1]) then 
        begin
            NomMenorMasa[1]:=galaxy[i].nombre;
            MasaMenorMasa[1]:=galaxy[i].masa;
        end
        else 
        if(galaxy[i].masa < MasaMenorMasa[2]) then 
        begin
            NomMenorMasa[2]:=galaxy[i].nombre;
            MasaMenorMasa[2]:=galaxy[i].masa;
        end;
    end;
    writeln('');
    writeln('TOP 2 GALAXIAS CON MAYOR MASA:');
    writeln(NomMayorMasa[1]);
    writeln(NomMayorMasa[2]);
    writeln('TOP 2 GALAXIAS CON MENOR MASA:');
    writeln(NomMenorMasa[1],' (galaxia con menor masa)');
    writeln(NomMenorMasa[2]);
    
end;

begin
    cargarDatos(galaxia,galaxiaTipo);
    analizarDatosA(galaxia,galaxiaTipo);
    analizarDatosB(galaxia,galaxiaTipo);
    analizarDatosC(galaxia,galaxiaTipo);
    analizarDatosD(galaxia,galaxiaTipo);
end.