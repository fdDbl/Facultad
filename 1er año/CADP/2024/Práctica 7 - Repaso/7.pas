program siete;
const
    cM = 24;
type
    sNotas = 4 .. 10;
    vM = array[1 .. cM] of real;
    alumno = record
        nro : integer;
        ap : string;
        nom : string;
        email : string;
        anoing : integer;
        anoeg : integer;
        notas : vM;
    end;

    lista = ^nodo;
    nodo = record
        dato : alumno;
        sig : lista;
    end;
procedure ordVector(var v:vM);
var
    i,j,p:integer;
    item:real;
begin
    for i := 1 to cM-1 do begin
        p:=i;
        for j := i+1 to cM do
            if(v[j] > v[p]) then
                p:=j;
        item := v[p];
        v[p] := v[i];
        v[i] := item;
    end;
end;
procedure leerNotas(var v:vM);
var
    i:integer;
begin
    for i := 1 to cM do begin
        writeLn('Materia ',i,':');
        readLn(v[i]);
    end;
end;
procedure leer(var a:alumno);
begin
    writeLn('Nro del alumno:'); readLn(a.nro);
    if(a.nro <> -1) then begin
        writeLn('Apellido del alumno:'); readLn(a.ap);
        writeLn('Nombre del alumno:'); readLn(a.nom);
        writeLn('Email del alumno:'); readLn(a.email);
        writeLn('Año de ingreso del alumno:'); readLn(a.anoing); 
        writeLn('Año de egreso del alumno:'); readLn(a.anoeg);
        writeLn('Notas del alumno (no aplazos):'); leerNotas(a.notas); ordVector(a.notas);
    end;
end;
procedure agAdelante(var pI:lista;a:alumno);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=a;
    nuevo^.sig:=nil;
    if(pI = nil) then
        pI:=nuevo
    else begin
        nuevo^.sig:=pI;
        pI:=nuevo;
    end;
end;
procedure cargarLista(var L:lista);
var
    a:alumno;
begin
    leer(a);
    while(a.nro <> -1) do begin
        agAdelante(L,a);
        leer(a);
    end;
end;

procedure p2a(L:lista);
var
    i:integer;
    nTotal:real;
    prom:real;
begin
    nTotal:=0;
    for i := 1 to cM do
        nTotal:=nTotal + L^.dato.notas[i];
    prom := nTotal / cM;
    writeLn('Promedio de notas obtenido por ',L^.dato.nom,' ',L^.dato.ap,': ',prom);
end;
function analizarDigitos(n:integer):boolean;
var
    ok:boolean;
    ultDigit:integer;
begin
    ok:=true;
    while(n <> 0) and (ok = true) do begin
        ultDigit:=n MOD 10;
        if(ultDigit MOD 2 <> 0) then begin
            ok:=true;
            n:=n DIV 10;
        end
        else
            ok:=false;
    end;
    analizarDigitos:=ok;
end;
function analizarAno(ano:integer):boolean;
var
    ok:boolean;
begin
    if(ano = 2012) then
        ok:=true
    else
        ok:=false;
    analizarAno:=ok;
end;
procedure p2b(L:lista; var cant:integer);
var
    anoing,nroalu:integer;
begin
    anoing:=L^.dato.anoing;
    nroalu:=L^.dato.nro;
    if(analizarDigitos(nroalu)=true) and (analizarAno(anoing)=true) then
        cant:=cant+1;
end;
procedure p2c(L:lista; var r1,r2:integer; var a1,a2,n1,n2,e1,e2:string);
var
    ap,nom,email:string;
    cantAnos:integer;
begin
    cantAnos := (L^.dato.anoeg-L^.dato.anoing);
    ap:=L^.dato.ap; nom:=L^.dato.nom; email:=L^.dato.email;

    if(cantAnos < r1) then begin
        r2 := r1;
        r1 := cantAnos;
        a2:=a1;
        a1:=ap;
        n2:=n1;
        n1:=nom;
        e2:=e1;
        e1:=email;
    end
    else if(cantAnos < r2) then begin
        r2 := cantAnos;
        a2:=ap;
        n2:=nom;
        e2:=email;
    end;
end;
procedure informarp2b(cant:integer);
begin
    writeLn('Cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente por dígitos impares: ',cant);
end;
procedure informarp2c(r1,r2:integer;ap1,ap2,nom1,nom2,email1,email2:string);
begin
    writeLn('1ER ALUMNO RECIBIDO EN MENOR TIEMPO:');
    writeLn('Nombre: ',nom1);
    writeLn('Apellido: ',ap1);
    writeLn('Email: ',email1);
    writeLn('Cantidad de años: ',r1);
    writeLn('2DO ALUMNO RECIBIDO EN MENOR TIEMPO:');
    writeLn('Nombre: ',nom2);
    writeLn('Apellido: ',ap2);
    writeLn('Email: ',email2);
    writeLn('Cantidad de años: ',r2);
end;
procedure alumnoAEliminar(var nro:integer);
begin
    writeLn('Ingrese el numero del alumno a eliminar:');
    readLn(nro);
end;
procedure eliminarAlumno(var L:lista; nro:integer);
var 
    act,ant:lista;
    apEliminado:string;
begin
    act := L;
    ant := nil;
    
    // Buscar el alumno en la lista
    while (act <> nil) and (act^.dato.nro <> nro) do
    begin
        ant := act;
        act := act^.sig;
    end;
    
    // Si el alumno fue encontrado
    if act <> nil then
    begin
        // Si el alumno a eliminar es el primero de la lista
        if ant = nil then
            L := act^.sig
        else
            ant^.sig := act^.sig;
        
        // Liberar la memoria del nodo eliminado
        apEliminado:=act^.dato.ap;
        dispose(act);
        
        writeLn('Alumno ',apEliminado,' con numero ', nro, ' eliminado.');
    end
    else
        writeLn('Alumno con numero ', nro, ' no encontrado.');
end;
procedure recorrerLista(L:lista);
var
    cantAlu2012Impares:integer;
    recmin1,recmin2:integer;
    nomRecMasRapido1,nomRecMasRapido2:string;
    apRecMasRapido1,apRecMasRapido2:string;
    emailRecMasRapido1,emailRecMasRapido2:string;
begin
    cantAlu2012Impares := 0;
    recmin1:= 10;
    recmin2 := 10;
    while(L<>nil) do begin
        p2a(L);
        p2b(L,cantAlu2012Impares);
        p2c(L,recmin1,recmin2,apRecMasRapido1,apRecMasRapido2, nomRecMasRapido1,nomRecMasRapido2,emailRecMasRapido1,emailRecMasRapido2);
        L:=L^.sig;
    end;
    informarp2b(cantAlu2012Impares);
    informarp2c(recmin1,recmin2,apRecMasRapido1,apRecMasRapido2,
                nomRecMasRapido1,nomRecMasRapido2,emailRecMasRapido1,emailRecMasRapido2);
end;
procedure eliminar(var L:lista);
var
    nroAluElim:integer;
begin
    alumnoAEliminar(nroAluElim);
    eliminarAlumno(L,nroAluElim);
end;
var
    L:lista;
begin
    L := nil;
    cargarLista(L);
    recorrerLista(L);
    eliminar(L);
end.