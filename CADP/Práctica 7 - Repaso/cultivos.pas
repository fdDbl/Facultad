{ Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que 
les provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada, 
nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo 
de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas 
dedicadas y la cantidad de meses que lleva el ciclo de cultivo.

    a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información 
    se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada 
    empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no 
    debe procesarse).
    
    Una vez leída y almacenada la información, calcular e informar:
        b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código 
        de empresa posee al menos dos ceros.
        c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto 
        al total de hectáreas.
        d. La empresa que dedica más tiempo al cultivo de maíz
        e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5 
        hectáreas de todas las empresas que no son estatales. }

program cultivos;
const
    cCultivos = 20;
type
    sProp = (E,P);
    sTipoCult = (T,M,S,G);
    sCult = 0..cCultivos;
    rCult = record
        tipo : sTipoCult;
        cantH : integer;
        cantM : integer;
    end;
    vCult = array[sCult] of rCult;
    empresa = record
        code : integer;
        nom : string;
        prop : sProp;
        ciudad : string;
        cantCult : sCult;
        cult : vCult;
    end;
    lista = ^nodo;
    nodo = record
        dato:empresa;
        sig:lista;
    end;
procedure leerCultivos(var c:vCult; var cant:sCult);
var
    seguir : boolean;
    i: sCult;
begin
    i := 1; seguir := true;
    while(i <= 20) and (seguir) do begin
        writeLn('--- CULTIVO ',i,' ---');
        write('Tipo de cultivo (T. Trigo; M. Maiz; S. Soja; G. Girasol): '); readLn(c[i].tipo);
        write('Cantidad de hectáreas que ocupa: '); readLn(c[i].cantH);
        if(c[i].cantH <> 0) then begin
            write('Cantidad de meses que lleva el ciclo de cultivo: '); readLn(c[i].cantM);
        end
        else seguir := false;
        i := i + 1;
    end;
    cant:=i-1;
end;
procedure leerEmpresa(var e:empresa);
begin
    write('Codigo de empresa: '); readLn(e.code);
    if(e.code <> -1) then begin
        write('Nombre de empresa: '); readLn(e.nom);
        write('Propiedad de la empresa (E. Estatal; P. Privada): '); readLn(e.prop);
        write('Ciudad donde radica la empresa: '); readLn(e.ciudad);
        leerCultivos(e.cult,e.cantCult);
    end;
end;
procedure agregarEmpresa(var L:lista; e:empresa);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=e;
    nuevo^.sig:=L;
    L:=nuevo;
end;
procedure cargarEmpresas(var L:lista);
var
    e : empresa;
    i : integer;
begin
    i:=1;
    writeLn('--- EMPRESA ',i,' ---');
    leerEmpresa(e);
    while(e.code <> -1) do begin
        agregarEmpresa(L,e);
        i:=i+1;
        writeLn('--- EMPRESA ',i,' ---');
        leerEmpresa(e);
    end;
end;
function cantCeros(code:integer):integer;
var
    cant:integer;
begin
    cant:=0;
    while(code <> 0) do begin
        if(code MOD 10 = 0) then
            cant := cant + 1;
        code := code DIV 10;
    end;
    cantCeros := cant;
end;
function cultivaTrigo(v:vCult;cantC:sCult):boolean;
var
    ok:boolean;
    i:integer;
begin
    ok:=false;
    if(cantC <> 0) then
        for i := 1 to cantC do
            if(v[i].tipo = T) then ok:=true;
    cultivaTrigo:=ok; 
end;
function cultivaSoja(v:vCult;cantC:sCult):boolean;
var
    ok:boolean;
    i:integer;
begin
    ok:=false;
    if(cantC <> 0) then
        for i := 1 to cantC do
            if(v[i].tipo = S) then ok:=true;
    cultivaSoja:=ok; 
end;
function cantSoja(v:vCult;cantC:sCult):integer;
var
    cantAct:integer;
    i : sCult;
begin
    cantAct := 0;
    for i := 1 to cantC do
        if(v[i].tipo = S) then cantAct:=cantAct+v[i].cantH;
    cantSoja := cantAct;
end;
function cumpleA(code:integer; ciu:string; cantC:sCult; v:vCult):boolean;
var
    ok:boolean;
begin
    ok:=false;
    if(cantCeros(code) >= 2) and (ciu='San Miguel del Monte') and (cultivaTrigo(v,cantC)) then ok := true;
    cumpleA := ok;
end;
procedure sumarH(var cant:integer; v:vCult; cantC:sCult);
var
    cantActual:integer; i:sCult;
begin
    if(cantC <> 0) then begin
        cantActual := 0;
        for i := 1 to cantC do
            cantActual := cantActual + v[i].cantH;
    end;
    cant := cant + cantActual;
end;
procedure maxTiempoMaiz(nom:string; v:vCult; cantC:sCult; var max:integer; var nomMax:string);
var
    tiempoMaiz:integer; i:sCult;
begin
    if(cantC <> 0) then begin
        tiempoMaiz:=0;
        for i := 1 to cantC do
            if(v[i].tipo = M) then tiempoMaiz := tiempoMaiz + v[i].cantM;
    end;
    if(tiempoMaiz > max) then begin
        max := tiempoMaiz;
        nomMax := nom;
    end;
end;

procedure calcEInformar(L:lista);
var
    cantHSoja:integer; cantH:integer; porcSoja:real;
    max:integer; nomMax:string;
begin
    cantHSoja:=0; cantH:=0;
    max:=-1;
    while(L <> nil) do begin
        if(cumpleA(L^.dato.code,L^.dato.ciudad,L^.dato.cantCult,L^.dato.cult)) then 
            writeLn('Empresa radicada en “San Miguel del Monte” que cultiva trigo y cuyo código de empresa posee al menos dos ceros: ', L^.dato.nom);
        if(cultivaSoja(L^.dato.cult,L^.dato.cantCult)) then cantHSoja := cantHSoja + cantSoja(L^.dato.cult,L^.dato.cantCult);
        sumarH(cantH,L^.dato.cult,L^.dato.cantCult);
        maxTiempoMaiz(L^.dato.nom,L^.dato.cult,L^.dato.cantCult,max,nomMax);
        L:=L^.sig;
    end;
    porcSoja:=(cantHSoja * 100)/cantH;
    writeLn('Cantidad de hectareas dedicadas a la soja: ',cantHSoja,' (',porcSoja,'% de todas las hectareas)');
    writeLn('Empresa que dedica mas tiempo al maiz: ',nomMax);

end;
var
    LEmpresas:lista;
begin
    LEmpresas:=nil;
    cargarEmpresas(LEmpresas);
    calcEInformar(LEmpresas);
end.