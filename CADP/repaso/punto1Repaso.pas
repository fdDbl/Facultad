program punto1Practica;
const
    dimFG = 5;
type
    vGeneros = array[1 .. dimFG] of integer;
    sGeneros = 1 .. dimFG;
    actores = record
        dni:integer;
        ApeYNom:string;
        edad: Integer;
        gen: sGeneros;
    end;
    lista=^nodo;
    nodo=record
        dato:actores;
        sig:lista;
    end;

procedure agregarNodo(var L:lista; a:actores);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=a;
    nue^.sig:=L;
    L:=nue;
end;

procedure leer(var a:actores);
begin
    readLn(a.dni);
    ReadLn(a.ApeYNom);
    ReadLn(a.edad);
    ReadLn(a.gen);
end;

procedure cargar(var L:lista);
var
    a:actores;
    dniComp: integer;
begin
    dnicomp:= 345;
    repeat
        leer(a);
        agregarNodo(L,a);
    until (a.dni=dniComp);
end;

function descomponer(dni:integer):boolean;
var
    ultDigit:integer;
    cdp:integer;
    cdim:integer;
begin
    cdp:=0;
    cdim:=0;
    while(dni<>0) do begin
        ultDigit:=dni MOD 10;
        if(ultDigit MOD 2 = 0) then
            cdp:=cdp+1
        else
            cdim:=cdim+1;
        dni:=dni DIV 10;
    end;
    if(cdp>cdim) then
        descomponer:=true
    else
        descomponer:=false;
end;

procedure puntoA(dni:integer;var cdp:integer);
var
    dDNI:boolean;
begin
    dDNI:=descomponer(dni);
    if(dDNI) then
        cdp:=cdp+1;
end;
procedure iniGen(var vG:vGeneros);
var
    i:integer;
begin
    for i:= 1 to dimFG do
      vg[i]:=0;
end;
procedure puntoB1(gen:sGeneros;var vG:vGeneros);
var
    i:integer;
begin
    for i:= 1 to dimFG do
        vG[gen]:=vG[gen]+1;
end;

procedure puntoB2(vG:vGeneros);
var
    i,maximo1,maximo2,genML1,genML2:integer;
begin
    maximo1:=-1;
    maximo2:=-1;
    for i := 1 to dimFG do begin
        if (vG[i] > maximo1) then begin
            maximo1 := vG[i];
            genML1 := i;
        end
        else if (vG[i] > maximo2) then begin
            maximo2 := vG[i];
            genML2 := i;
        end;
    end;
    writeLn('Primer codigo de genero mas elegido: ',genML1);
    writeLn('Segundo codigo de genero mas elegido: ',genML2);
end;

procedure recorrer(L:lista; var vG:vGeneros);
var
    cDNIPar:integer;
    GenML1,GenML2,cantECode1,cantECode2:integer;
    inicioL:lista;
begin
    cDNIPar:=0;
    iniGen(vG);
    while(L<>nil) do begin
        puntoA(L^.dato.dni,cDNIPar);
        puntoB1(L^.dato.gen,vG);
        L:=L^.sig;
    end;
    writeln('Cantidad de personas cuyo DNI contiene más dígitos pares que impares: ',cDNIPar);
    puntoB2(vG);
end;

procedure eliminarDNI(var L:lista; dni:integer);
var
    nAct,nAnt:lista;
begin
    nAct := L;
    nAnt := nil;
    while(nAct<>nil) and (nAct^.dato.dni <> dni) do begin
        nAnt:=nAct;
        nAct:=nAct^.sig;
    end;
    if(nAct<>nil) then begin
        if(nAnt=nil) then
            L := nAct^.sig
        else
            nAnt^.sig:=nAct^.sig;
        dispose(nAct);
        writeln('DNI ', dni, ' eliminado de la lista.');
    end
    else
        WriteLn('DNI ',dni,' no encontrado.');
end;

procedure buscarDNI(var L:lista);
var
    dniElim:integer;
begin
    writeLn('Indique el DNI a eliminar:');
    readLn(dniElim);
    eliminarDNI(L,dniElim);
end;

var
    L:lista;
    vG:vGeneros;
begin
    L:=nil;
    cargar(L);
    recorrer(L,vG);
    buscarDNI(L);
end.
