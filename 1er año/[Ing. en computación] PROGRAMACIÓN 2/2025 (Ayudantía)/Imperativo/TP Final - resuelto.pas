Program TPGrupoX; 
Uses
     sysutils;
Type
     str70= string[70];
     
	 flor = record
        identificador: integer;
	    nombre: str70;
        especie: str70;
	    continente: str70;
        de_temporada: boolean;
     end;

     lista = ^nodoLista;
     nodoLista = record
	    dato: flor;
	    sig: lista;
     end;

	fecha=record
		dia:1..31;
		mes:1..12;
		anio:integer;
	end;
	
    venta= record
		numero_factura: longint;
		fecha_venta: fecha;
		flores_vendidas: lista;
     end;

     listaVentas = ^nodoVentas;
     nodoVentas = record
            dato: venta;
            sig: listaVentas;
     end;

     nombres= array [1..20] of str70;

     {Completar con los tipos de datos necesarios}

    ventaArbol = record
		numero_factura: longint;
		fecha_venta: fecha;
    end;

    listaVentasArbol = ^nodoVentasArbol;
    nodoVentasArbol = record
        dato:ventaArbol;
        sig:listaVentasArbol;
    end;

    florArbol = record
        f:flor;
        v:listaVentasArbol;
    end;

    arbol = ^nodoArbol;
    nodoArbol = record
       dato:florArbol;
       HI,HD:arbol;
    end;

procedure cargarFecha(var f: fecha);
 var anio:integer;
begin
  f.dia:= random(30)+1;
  f.mes := random(12)+1;
  anio:=random(3)+1;
  case anio of
       1:f.anio:=2023;
       2:f.anio:=2024;
       3:f.anio:=2025;
    end;
end;

Procedure agregar(var l: listaVentas; v: venta);
var
   aux: listaVentas;
begin
     new(aux);
     aux^.dato := v;
     aux^.sig := l;
     l:= aux;
end;

Procedure agregarFlor(var l: lista; f: flor);
var
   aux: lista;
begin
     new(aux);
     aux^.dato := f;
     aux^.sig := l;
     l:= aux;
end;

procedure cargarContinentes(var v:nombres );
begin
     v[1]:='America del Sur';
     v[2]:='America Central';
     v[3]:='America del Norte';
     v[4]:='Europa';
     v[5]:='Asia';
     v[6]:='Africa';
     v[7]:='Oceania';
end;

procedure cargarNombres(var v:nombres );
begin
     v[1]:='Rosa';
     v[2]:='Hortensia';
     v[3]:='Corazon Sangrante';
     v[4]:='Flor de Cerezo';
     v[5]:='Orquidea';
     v[6]:='Tulipan';
     v[7]:='Peonias';
     v[8]:='Lirio';
     v[9]:='Freesia';
     v[10]:='Flor de Loto';
     v[11]:='Nardo';
     v[12]:='Dalia';
     v[13]:='Crisantemo';
     v[14]:='Clavel';
     v[15]:='Campanillas';
end;

procedure cargarEspecies(var v:nombres );
begin
     v[1]:='Rosaceas';
     v[2]:='Schizophragma';
     v[3]:='Fumariaceae';
     v[4]:='Prunus';
     v[5]:='Monocotiledoneas';
     v[6]:='Liliaceae';
     v[7]:='Dicotiledoneas Rizomatosas';
     v[8]:='Iridaceas';
     v[9]:='Iridaceas';
     v[10]:='Nelumbo';
     v[11]:='Asteraceas';
     v[12]:='Valerianaceae';
     v[13]:='Asteraceas';
     v[14]:='Caryophyllaceae';
     v[15]:='Campanulaceas';
end;

procedure cargarFlores(var l: lista);
var
   f: flor;
   cant, i, pos, temp: integer;
   c,n,e: nombres;
begin
     cargarContinentes(c);
     cargarNombres(n);
     cargarEspecies(e);
     cant := random(6)+1;
     if(cant MOD 2 =0)then
     begin
        with(f) do begin
           identificador := 150;
           nombre:='Agapanto';
		   especie:='Agapanthoideae';
		   continente:='Africa';
           de_temporada:=true;
        end;
        agregarFlor(l, f);
     end;
     for i:=1 to cant do
     begin
       with(f)do begin
          identificador:= random(1000)+1;
          pos:= random(15)+1;
          nombre:= n[pos];
          especie:= e[pos];
          pos:= random(7)+1;
          continente:=c[pos];
          temp:=random(8);
          if(temp MOD 2 <> 0)then
            de_temporada:=false
          else
            de_temporada:=true;
       end;
       agregarFlor(l, f);
     end;
end;

procedure crearLista(var l: listaVentas);
var
   v: venta;
   cant,i: integer;
begin
     cant := random(100)+1;
     for i:=1 to cant do
     begin
          with(v) do begin
               numero_factura:= random (1000000)+1;
               cargarFecha(fecha_venta);
               flores_vendidas:= nil;
               cargarFlores(flores_vendidas);
          end;
          agregar(l, v);
       end;
end;


procedure imprimirFlor(f: flor);
var temp:str70;
begin
     with (f) do begin
          if(de_temporada)then
               temp:='Si'
          else
              temp:='No';
          writeln('FLOR: ', nombre, ' | ID: ',identificador, ' | ESPECIE: ', especie, ' | CONTINENTE: ', continente, ' | ES DE TEMPORADA?: ', temp);
     end;
end;

procedure imprimirFlores(l: lista);
begin
     while (l <> nil) do begin
          imprimirFlor(l^.dato);
          l:= l^.sig;
     end;
end;

procedure imprimir(v: venta);
begin
     with (v) do begin
          writeln('');
          writeln('VENTA: ', numero_factura, ' | FECHA: ', fecha_venta.dia,'/',fecha_venta.mes,'/',fecha_venta.anio);
          imprimirFlores(flores_vendidas);
     end;
end;

procedure imprimirLista(l: listaVentas);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure agregarAdelante(var L:listaVentasArbol; v:ventaArbol);
var
    nue:listaVentasArbol;
begin
    new(nue);
    nue^.dato := v;
    nue^.sig := L;
    L := nue;
end;

procedure insertarArbol(var a:arbol; f:flor; v:ventaArbol);
begin
    if(a=nil) then begin
        new(a);
        a^.dato.f := f;
        a^.HI := nil;
        a^.HD := nil;
        a^.dato.v := nil;
        agregarAdelante(a^.dato.v,v);
    end else
        if(a^.dato.f.identificador < f.identificador) then
            insertarArbol(a^.HD,f,v)
        else if(a^.dato.f.identificador > f.identificador) then
            insertarArbol(a^.HI,f,v)
        else begin
            agregarAdelante(a^.dato.v,v);
        end;
end;

procedure cargarArbol(var a:arbol; l:listaVentas);
var
    v:ventaArbol;
    l2:lista;
begin
    while(l <> nil) do begin
        v.numero_factura := l^.dato.numero_factura;
        v.fecha_venta := l^.dato.fecha_venta;
        l2 := l^.dato.flores_vendidas;
        while(l2 <> nil) do begin
            insertarArbol(a,l2^.dato,v);
            l2 := l2^.sig;
        end;
        l := l^.sig;
    end;
end;

procedure imprimirArbol(a:arbol);
var
    aux:listaVentasArbol;
begin
    if(a <> nil) then begin
        imprimirArbol(a^.HI);

        imprimirFlor(a^.dato.f);
        aux := a^.dato.v;
        while(aux <> nil) do begin
            writeln('Factura nro ', aux^.dato.numero_factura);
            writeln('Fecha: ', aux^.dato.fecha_venta.dia , '/' , aux^.dato.fecha_venta.mes , '/' , aux^.dato.fecha_venta.anio);
            aux := aux^.sig;
        end;
        
        imprimirArbol(a^.HD);
    end;
end;
procedure busquedaAcotada(a:arbol);
var
    cant:integer;
    aux:listaVentasArbol;
begin
    if(a <> nil) then begin
        if(a^.dato.f.identificador >= 100) then begin
            if(a^.dato.f.identificador <= 500) then begin
                busquedaAcotada(a^.HI);

                aux := a^.dato.v;
                cant := 0;
                while(aux <> nil) do begin
                    if(aux^.dato.fecha_venta.anio = 2024) or 
                    ((aux^.dato.fecha_venta.anio = 2023) and (aux^.dato.fecha_venta.mes >= 11)) or
                    ((aux^.dato.fecha_venta.anio = 2025) and (aux^.dato.fecha_venta.mes = 1)) then
                        cant := cant + 1;
                    
                    aux := aux^.sig;
                end;
                if(cant > 0) then
                    writeln('ID: ', a^.dato.f.identificador, ', Nombre: ', a^.dato.f.nombre, ', Cantidad de ventas en el rango especificado: ', cant);
                
                busquedaAcotada(a^.HD);
            end else busquedaAcotada(a^.HI);
        end else busquedaAcotada(a^.HD);
    end;
end;

function contarVentas(L:listaVentasArbol): integer;
begin
    if(L <> nil) then
        contarVentas := 1 + contarVentas(L^.sig)
    else
        contarVentas := 0;
end;

procedure busquedaMinimo(a:arbol; var min1,min2:integer; var f1,f2:flor);
var
    cantVentas:integer;
begin
    if(a <> nil) then begin
        busquedaMinimo(a^.HI,min1,min2,f1,f2);

        if(a^.dato.f.de_temporada) then begin
            cantVentas := contarVentas(a^.dato.v);
            if(cantVentas < min1) then begin
                f1.nombre := a^.dato.f.nombre;
                f1.especie := a^.dato.f.especie;
                f1.continente := a^.dato.f.continente;
                min2 := min1;
                f2 := f1;
                min1 := cantVentas;
            end else if(cantVentas < min2) then begin
                f2.nombre := a^.dato.f.nombre;
                f2.especie := a^.dato.f.especie;
                f2.continente := a^.dato.f.continente;
                min2 := cantVentas;
            end;
        end;

        busquedaMinimo(a^.HD,min1,min2,f1,f2);
    end;
end;

function minimo(a:arbol): florArbol;
begin
    if(a^.HI = nil) then
        minimo := a^.dato
    else
        minimo := minimo(a^.HI);
end;

procedure borrarNodo(var a:arbol; id:integer);
var
    aux:arbol;
begin
    if(a <> nil) then begin
        if(a^.dato.f.identificador = 150) then begin
            if(a^.HI = nil) then begin
                aux := a;
                a := a^.HD;
                dispose(aux);
            end else
            if(a^.HD = nil) then begin
                aux := a;
                a := a^.HI;
                dispose(aux);
            end else begin
                a^.dato := minimo(a^.HD);
                borrarNodo(a^.HD, a^.dato.f.identificador);
            end;
        end else
            if(a^.dato.f.identificador < id) then
                borrarNodo(a^.HD,id)
            else
                borrarNodo(a^.HI,id);
    end;
end;

var
   l: listaVentas;
   a:arbol;
   f1,f2:flor;
   min1,min2:integer;
   id:integer;
begin
    Randomize;

    l:= nil;
    crearLista(l); {carga automatica de la estructura disponible}
    writeln ('LISTA GENERADA: ');
    imprimirLista(l);

    {Completar el programa}
    a:=nil;
    cargarArbol(a,l);
    imprimirArbol(a);
    writeln();

    busquedaAcotada(a);
    writeln();

    min1 := 30000;
    min2 := 30000;
    busquedaMinimo(a,min1,min2,f1,f2);
    writeln('-- PRIMER FLOR DE TEMPORADA MENOS VENDIDA: ', f1.nombre, ', ', f1.especie, ', ', f1.continente);
    writeln('-- SEGUNDA FLOR DE TEMPORADA MENOS VENDIDA: ', f2.nombre, ', ', f2.especie, ', ', f2.continente);
    writeln();

    writeln('Estructura antes del borrado:');
    imprimirArbol(a);
    writeln('Estructura luego del borrado:');
    id:=150;
    borrarNodo(a,id);
    imprimirArbol(a);
    writeln();

    writeln('Fin del programa');
    readln;
end.