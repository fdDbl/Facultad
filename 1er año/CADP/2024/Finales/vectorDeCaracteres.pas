program vectorCaracteres;
const
    dimF=15;
type
    alfabeto = 'a'..'z';
    vCaracteres = Array[1..dimF] of alfabeto;
    vRepeticiones = Array[alfabeto] of integer;
    
procedure introducirAlfabeto(var v:vCaracteres);
var
    i:integer;
begin
    for i := 1 to dimF do begin
        readln(v[i]);
    end;
end;

procedure generarV2(v1:vCaracteres;var v2:vRepeticiones);
    procedure iniV2(var v2:vRepeticiones);
    var
        i:char;
    begin
        for i := 'a' to 'z' do
            v2[i] := 0;
    end;
var
    i:integer;
begin
    for i := 1 to dimF do
        v2[v1[i]] := v2[v1[i]] + 1;
end;

procedure imprimirV1(v:vCaracteres);
var
    i:integer;
begin
    writeln('---------- V1 ----------');
    for i := 1 to dimF do
        writeln(v[i]);
end;

procedure imprimirV2(v:vRepeticiones);
var
    i:char;
begin
    writeln('---------- V2 ----------');
    for i := 'a' to 'z' do
        writeln(v[i]);
end;

var
    v1:vCaracteres; v2:vRepeticiones;
begin
    introducirAlfabeto(v1);
    generarV2(v1,v2);
    
    imprimirV1(v1);
    imprimirV2(v2);
end.
