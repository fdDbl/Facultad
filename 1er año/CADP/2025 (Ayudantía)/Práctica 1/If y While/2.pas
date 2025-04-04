program dos;
var
    X:real;
begin
    readln(X);
    if(X < 0) then
        X := X*(-1);
    writeln('Valor absoluto de X: ', X);
end.