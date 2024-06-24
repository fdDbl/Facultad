program seis;
const
    cObjCat = 7;
type
    sObjCat = 1 .. 7;
    vObjCat = array[sObjCat] of integer;

    descubridor = record
        nom:string;
        ano:integer;
    end;
    obj = record
        cod:integer;
        cat:sObjCat;
        nom:string;
        dist:real;
        desc:descubridor;
    end;

    lista = ^nodo;
    nodo = record
        dato:obj;
        sig:lista;
    end;
procedure leer(var o:obj);
begin
    writeln('Codigo de objeto:'); readln(o.cod);
    if(o.cod <> -1) then begin
        writeln('Categoria (1 .. 7):'); readln(o.cat);
        writeln('Nombre del objeto:'); readln(o.nom);
        writeln('Distancia a la tierra (a.l.):'); readln(o.dist);
        writeln('Nombre del descubridor:'); readln(o.desc.nom);
        writeln('Año de descubrimiento:'); readln(o.desc.ano);
    end;
end;
procedure agregarAtras(var pI,pF:lista; o:obj);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=o;
    if(pI = nil) then begin
        pI:=nuevo;
        pF:=nuevo;
    end
    else begin
        pF^.sig:=nuevo;
        pF:=nuevo;
    end;
end;
procedure cargarLista(var pI:lista);
var
    o:obj;
    pF:lista;
begin
    leer(o);
    while(o.cod <> -1) do begin
        agregarAtras(pI,pF,o);
        leer(o);
    end;
end;

procedure codObjMasLejanos(L:lista;var c1,c2:integer;var d1,d2:real);
begin
    if(L^.dato.dist > d1) then begin
        d2 := d1;
        d1 := L^.dato.dist;
        c1 := L^.dato.cod;
    end
    else if(L^.dato.dist > d2) then begin
        d2 := L^.dato.dist;
        c2 := L^.dato.cod;
    end;
end;
procedure cantDescGalileo(L:lista;var cant:integer);
begin
    if((L^.dato.cat = 2) and (L^.dato.desc.nom = 'Galileo Galilei') and (L^.dato.desc.ano < 1600)) then
        cant:=cant+1;
end;
procedure iniCats(var vector:vObjCat);
var
    i:integer;
begin
    for i:= 1 to cObjCat do
        vector[i] := 0;
end;
procedure cantObjCat(L:lista;var vector:vObjCat);
var
    nCat:sObjCat;
begin
    nCat:=L^.dato.cat;
    vector[nCat] := vector[nCat] + 1;
end;
function analizarDigitos(c:integer):boolean;
var
    ultDigit,cantPares,cantImpares:integer;
    ok:boolean;
begin
    cantPares:=0;
    cantImpares:=0;
    ok:=false;
    while(c <> 0) do begin
        ultDigit := c MOD 10;
        if(ultDigit MOD 2 = 0) then
            cantPares:=cantPares+1
        else
            cantImpares:=cantImpares+1;
        c := c DIV 10;
    end;
    if(cantPares>cantImpares) then
        ok:=true;
    analizarDigitos:=ok;
end;
procedure nomEstrellas(L:lista);
var
    cat,code:integer;
    nomEstrella:string;
begin
    cat:=L^.dato.cat;
    if(cat=1) then begin
        code:=L^.dato.cod;
        nomEstrella:=L^.dato.nom;
        if(analizarDigitos(code)) then
            writeLn('La estrella llamada "',nomEstrella,'" posee mas digitos pares que impares en su codigo');
    end;
end;
procedure informar(c1,c2,cGalileo:integer;vector:vObjCat);
var
    i:integer;
begin
    writeLn('Los codigos de los dos objetos más lejanos de la tierra que se hayan observado son: ',c1,' y ',c2);
    writeLn('La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600 son: ',cGalileo);
    writeLn('Cantidad de objetos observados por cada categoría:');
    for i:= 1 to cObjCat do 
        writeLn('Categoria ',i,': ',vector[i],' objetos');
end;
procedure analizarLista(L:lista;var vCategorias:vObjCat);
var
    codML1,codML2:integer; distML1,distML2:real;
    cantGalileo:integer;
begin
    distML1:=-1; distML2:=-1;
    cantGalileo:=0;
    iniCats(vCategorias);
    while(L <> nil) do begin
        codObjMasLejanos(L,codML1,codML2,distML1,distML2);
        cantDescGalileo(L,cantGalileo);
        cantObjCat(L,vCategorias);
        nomEstrellas(L);
        L:=L^.sig;
    end;
    informar(codML1,codML2,cantGalileo,vCategorias);
end;
var
    L:lista;
    vCats:vObjCat;
begin
    L:=nil;
    cargarLista(L);
    analizarLista(L,vCats);
end.