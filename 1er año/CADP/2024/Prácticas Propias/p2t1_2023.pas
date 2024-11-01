program biza;
const
    cG = 5;
type
    sG = 1..cG;
    vVizGen = array[sG] of integer;
    sesion = record
        tit : string;
        art : string;
        gen : sG;
        viz : integer;
    end;

    lista = ^nodo;
    nodo = record
        dato : sesion;
        sig : lista;
    end;
procedure leer(var s:sesion);
begin
    writeLn('Titulo de sesion:'); readLn(s.tit);
    writeLn('Artista:'); readLn(s.art);
    writeLn('Genero (1-5):'); readLn(s.gen);
    writeLn('Cantidad de visualizaciones:'); readLn(s.viz);
end;
procedure insertarOrdenado(var pI:lista;s:sesion);
var
    nuevo:lista;
    act,ant:lista;
begin
    new(nuevo);
    nuevo^.dato:=s;
    act:=pI;
    ant:=pI;
    while(act <> nil) and (s.tit > act^.dato.tit) do begin
        ant:=act;
        act:=ant^.sig;
    end;
    if (act = ant) then
        pI:=nuevo
    else
        ant^.sig:=nuevo;
    nuevo^.sig:=act;
end;
procedure cargar(var L:lista);
var
    s:sesion;
begin
    repeat
        leer(s);
        insertarOrdenado(L,s);
    until (s.art = 'Peso Pluma');
end;

procedure iniv1(var v:vVizGen);
var
    i:integer;
begin
    for i := 1 to cG do
        v[i]:=0;
end;
procedure genMasVisualizaciones1(L:lista;var v:vVizGen);
begin
    v[L^.dato.gen]:=v[L^.dato.gen]+1;
end;
function digitViz(viz:integer):boolean;
var
    aux,ultDigit,cantPares,cantImpares:integer;
    igualParesImpares:boolean;
begin
    aux:=viz;
    cantPares:=0;
    cantImpares:=0;
    while(aux <> 0) do begin
        ultDigit:=aux MOD 10;
        if(ultDigit MOD 2 = 0) then
            cantPares:=cantPares+1
        else
            cantImpares:=cantImpares+1;
        aux:=aux DIV 10;
    end;
    if(cantPares=cantImpares) then
        igualParesImpares:=true
    else
        igualParesImpares:=false;
    digitViz:=igualParesImpares;
end;
procedure cantReggaeton(L:lista;var cant:integer);
var
    cantViz:integer;
    gen:integer;
begin
    cantViz:=L^.dato.viz;
    gen:=L^.dato.gen;
    if(gen = 2) and (digitViz(cantViz)) then
        cant:=cant+1;
end;
procedure genMasVisualizaciones2(v:vVizGen);
var
    i:integer;
    max1,max2,gen1,gen2:integer;
begin
    max1:=-1;
    max2:=-1;
    for i := 1 to cG do begin
        if(v[i] > max1) then
        begin
            max2 := max1;
            gen1 := i;
            gen2 := gen1;
            max1 := v[i];
        end
        else if(v[i] > max2) then
        begin
            max2 := v[i];
            gen2 := i;
        end;
    end;
    writeLn('1ER CODIGO DE GENERO MAS ESCUCHADO: ',gen1);
    writeLn('2DO CODIGO DE GENERO MAS ESCUCHADO: ',gen2);
end;
procedure informarCantReggaeton(cant:integer);
begin
    writeLn('Cantidad de sesiones del genero Reggaeton cuya cantidad de visualizaciones contiene la misma cantidad de digitos pares que impares: ',cant);
end;
procedure recorrer(L:lista; var v1:vVizGen);
var
    cantReg:integer;
begin
    iniv1(v1);
    cantReg:=0;
    while(L<>nil) do begin
        genMasVisualizaciones1(L,v1); {FALTA HACER TOP 2}
        cantReggaeton(L,cantReg);
        L:=L^.sig;
    end;
    genMasVisualizaciones2(v1);
    informarCantReggaeton(cantReg);
end;

procedure eliminarTit(var L:lista; t:string);
var
    act,ant:lista;
begin
    act:=L;
    ant:=nil;
    while(act <> nil) and (act^.dato.tit <> t) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(act <> nil) then begin
        if(ant=nil) then
            L:=act^.sig
        else
            ant^.sig:=act^.sig;
    dispose(act);
    writeLn('Se ha eliminado la sesion con el titulo: ',t);
    end
    else
        writeLn('No se ha encontrado');
end;

procedure eliminar(var L:lista);
var
    titEliminar:string;
begin
    writeLn('Indique el titulo de la cancion a eliminar:');
    readLn(titEliminar);
    eliminarTit(L,titEliminar);
end;
var
    L:lista;
    vectorGeneros:vVizGen;
begin
    L:=nil;
    cargar(L);
    recorrer(L,vectorGeneros);
    eliminar(L);
end.