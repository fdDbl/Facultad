program generarArchivoHorasExtras;
type
    registroHoras = record
        departamento: integer;
        division: integer;
        nroEmpleado: integer;
        categoria: integer;
        horasExtras: integer;
    end;

    archivoHoras = file of registroHoras;

// procedure crearArchivoHorasExtras;
// var
//     aH: archivoHoras;
//     r: registroHoras;
// begin
//     assign(aH, 'horasExtras.dat');
//     rewrite(aH);

//     { Departamento 1, División 1 }
//     r.departamento := 1;
//     r.division := 1;

//     r.nroEmpleado := 100; r.categoria := 3; r.horasExtras := 12; write(aH, r);
//     r.nroEmpleado := 101; r.categoria := 2; r.horasExtras := 8; write(aH, r);
//     r.nroEmpleado := 105; r.categoria := 1; r.horasExtras := 15; write(aH, r);

//     { Departamento 1, División 2 }
//     r.division := 2;

//     r.nroEmpleado := 110; r.categoria := 2; r.horasExtras := 9; write(aH, r);
//     r.nroEmpleado := 112; r.categoria := 3; r.horasExtras := 10; write(aH, r);

//     { Departamento 2, División 1 }
//     r.departamento := 2;
//     r.division := 1;

//     r.nroEmpleado := 200; r.categoria := 1; r.horasExtras := 6; write(aH, r);
//     r.nroEmpleado := 201; r.categoria := 1; r.horasExtras := 7; write(aH, r);

//     { Departamento 2, División 2 }
//     r.division := 2;

//     r.nroEmpleado := 210; r.categoria := 2; r.horasExtras := 4; write(aH, r);
//     r.nroEmpleado := 211; r.categoria := 3; r.horasExtras := 11; write(aH, r);
//     r.nroEmpleado := 215; r.categoria := 2; r.horasExtras := 5; write(aH, r);

//     { Departamento 3, División 1 - solo un empleado }
//     r.departamento := 3;
//     r.division := 1;

//     r.nroEmpleado := 300; r.categoria := 2; r.horasExtras := 13; write(aH, r);

//     close(aH);
// end;

begin
    // crearArchivoHorasExtras;
    
end.
