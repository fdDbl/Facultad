program carrera;
const
    CANTP = 5000;
type
    sCat = 1..5;
    participante = record
        dni:integer;
        nomyap:integer;
        cat:sCat;
        fechaI:String;
    end;
    vParticipantes = Array[1..CANTP] of participante;
    
    rCat = record
        p:participante;
        cantI:integer;
    end;
    vCategorias = Array[1..5] of rCat;
    
    lista = ^nodo;
    nodo = record
        dato:participante;
        sig:lista;
    end;
procedure cargarCategorias(v1:vParticipantes; dimL:integer; var v2:vCategorias);
var
    i:integer;
begin
    for i := 1 to 5 do
        v2[i].cantI := 0
    
    for i := 1 to dimL do begin
        v2[v1[i].cat].p := v1[i];
        v2[v1[i].cat].p := v2[v1[i].cat].p + 1;
    end;
end;
procedure cargarEstructura(v:vCategorias; var L:lista);
    procedure agregarAdelante(p:participante; var L:lista);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato:=p;
        nue^.sig:=L;
        L := nue;
    end;
var
    i:integer; j:integer;
begin
    for i := 1 to 5 do
        if(v[i].cantI <= 50) then
            for j := 1 to cantI do
                agregarAdelante(v[i].p,L);
    end;
end;
var
    v1:vParticipantes;
    v2: vCategorias;
    L:lista;
    dimL:integer;
begin
    cargarParticipantes(v1,dimL);  // SE DISPONE
    cargarCategorias(v1,dimL,v2);
    L:=nil;
    cargarEstructura(v2,L);
end.
