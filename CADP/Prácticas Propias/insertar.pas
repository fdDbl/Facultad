procedure insertar (Var pI: listaE; valor:integer);
Var
 actual,anterior,nuevo:listaE;
Begin
  new (nuevo);
  nuevo^.elem:= valor;
  nuevo^.sig:=nil;
  
  if (pI = nil) then
    pI:= nuevo
  else begin
    actual:= pI;
    ant:=pI;
    while (actual <> nil) and (actual^.elem < nuevo^.elem) do   
     begin
      anterior:=actual;
      actual:= actual^.sig;
     end;
     if (actual = pI) then 
   begin
     nuevo^.sig:= pI;   pI:= nuevo;
   end
  else
    begin
     anterior^.sig:= nuevo;   nuevo^.sig:= actual;
    end;
  end; //else
End;
