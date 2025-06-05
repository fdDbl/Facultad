{
Realice un programa que resuelva lo siguiente: dos amigos juegan a la batalla naval (simplificada). Para esto cada amigo dispone de su tablero de 20 filas x 15 columnas donde en alguna posición del tablero tiene ubicados cada uno de sus 7 barcos (cada barco se encuentra en una única posición). El juego consiste en lo siguiente:
Se juegan 10 rondas, en cada ronda, cada jugador invoca a la función dameNumeroFila y a la función dameNumeroColumna y a partir de esos valores se debe invocar al procedimiento juego, que dado un tablero, una fila y una columna, retorna verdadero si había un barco en esa posición o falso en caso contrario. Primero juega el jugador 1 y luego el 2 hasta que ocurran las 10 rondas.
Luego de las 10 rondas se debe informar el puntaje de cada jugador, es decir, a cuantos barcos del otro jugador ha logrado hundir.
NOTAS: Las funciones dameNumeroFila y dameNumeroColumna no deben implementarse, solo invocarse. El resto de los módulos utilizados deben implementarse. Además declarar todas las estructuras utilizadas. Tenga en cuenta que el mismo barco no debe contabilizarse dos veces, es decir, si por azar se consulta por la fila 1 columna 2 y ahí se encontraba un barco, si en alguna otra ronda al mismo jugador le tocan esos mismos valores ya no se contará como que allí hay un barco porque ya fue hundido.
}

program batallaNaval;
const
    FILAS = 20;
    COLUMNAS = 15;
    BARCOS = 7;
    RONDAS = 10;
type
    sBarcos = 1..BARCOS;
    sFilas = 1..FILAS;
    sColumnas = 1..COLUMNAS;
    
    barco = record
        filas:sFilas;
        columnas:sColumnas;
    end;
    vBarcos = Array[sBarcos] of barco;
    
    jugador = record
        puntaje:integer;
        tablero:vBarcos;
    end;

function hayBarco(j:jugador;fila:sFilas;columna:sColumnas;var barco:integer):boolean;
var
    hay:boolean;
    i:integer;
begin
    hay:=false;
    i:=1;
    while(i<=BARCOS) and (not hay) do begin
        if(j.tablero[i].filas = fila) and (j.tablero[i].columnas = columna) then begin
            hay:=true;
            barco:=i;
        end else
            i:=i+1;
    end;
    hayBarco := hay;
end;

procedure ini(var j:jugador);
var
    fRandom:sFilas;
    cRandom:sColumnas;
    i:integer;
    b:integer;
begin
    j.puntaje := 0;
        
    for i := 1 to BARCOS do begin
        fRandom := Random(FILAS)+1;
        cRandom := Random(COLUMNAS)+1;
        while(hayBarco(j,fRandom,cRandom,b)) do begin
            fRandom := Random(FILAS)+1;
            cRandom := Random(COLUMNAS)+1;
        end;
        j.tablero[i].filas := fRandom;
        j.tablero[i].columnas := cRandom;
        writeln(fRandom,',',cRandom);
    end;
end;

procedure juego(var j:jugador; fila:sFilas; columna:sColumnas);
var
    b:integer;
begin
    if(hayBarco(j,fila,columna,b)) then begin
        j.tablero[b].filas:=0;
        j.tablero[b].columnas:=0;
        j.puntaje := j.puntaje + 1;
    end;
end;

function dameNumeroFila():sFilas;
begin
    writeln('Indique una fila (1-20)');
    readln(dameNumeroFila);
end;

function dameNumeroColumna():sColumnas;
begin
    writeln('Indique una columna (1-15)');
    readln(dameNumeroColumna);
end;

var
    j1,j2:jugador;
    i:integer;
    fila:sFilas;
    columna:sColumnas;
begin
    Randomize;
    writeln('---------- BARCOS DEL JUGADOR 1 ----------');
    ini(j1);
    writeln('---------- BARCOS DEL JUGADOR 2 ----------');
    ini(j2);
    for i := 1 to RONDAS do begin
        fila:=dameNumeroFila();
        columna:=dameNumeroColumna();
        juego(j1,fila,columna);
        
        fila:=dameNumeroFila();
        columna:=dameNumeroColumna();
        juego(j2,fila,columna);
    end;
    writeln('---------- PUNTAJE DEL JUGADOR 1 ----------');
    writeln(j1.puntaje);
    writeln('---------- PUNTAJE DEL JUGADOR 2 ----------');
    writeln(j2.puntaje);
end.
