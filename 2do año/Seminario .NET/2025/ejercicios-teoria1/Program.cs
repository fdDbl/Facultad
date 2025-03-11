Console.WriteLine("--------- Punto 1 ---------");
/* La principal diferencia entre Write() y WriteLine() de System.Console es que el primero
permite a la siguiente salida en consola continuar en la misma línea, mientras que WriteLine()
establece un salto de línea (\n) implícito. 
    El método Console.ReadKey() obtiene la tecla que va a presionar el usuario una vez invocado 
    dicho método. */
while(Console.ReadKey().Key != ConsoleKey.Enter) {} // Espera a que presione enter...
string st1 = "Hola ";
Console.Write(st1);
while(Console.ReadKey().Key != ConsoleKey.Enter) {} // Espera a que presione enter...
Console.Write(st1 += "Mundo");

Console.WriteLine("\n--------- Punto 2 ---------");
Console.WriteLine("Holaaa Mundo\nHello World\tHi everyone\nChau\\");

Console.WriteLine("\n--------- Punto 3 ---------");
/* Para prescindir del @, se puede usar \\ para evitar el código de escape que produce la \ simple. */
string st = "c:\\windows\\system";
Console.WriteLine(st);

Console.WriteLine("\n--------- Punto 4 ---------");
string msj = Console.ReadLine();
Console.WriteLine((msj == "") ? "Hola mundo" : ("Bienvenido seas " + msj));

Console.WriteLine("\n--------- Punto 5 ---------");
msj = Console.ReadLine();
string impresion = msj switch {"Juan" => "¡Hola Amigo!", "María" => "Buenos días Señora", "Alberto" => "Hola Alberto", "" => "¡Buen día Mundo!", _ => "Buen día " + msj};
Console.WriteLine(impresion);

Console.WriteLine("\n--------- Punto 6 ---------");
msj = Console.ReadLine();
while(msj != "") {
    Console.WriteLine(msj.Length);
    msj = Console.ReadLine();
}

Console.WriteLine("\n--------- Punto 7 ---------");
/* La instrucción Console.WriteLine("100".Length) imprime el tamaño del string especificado (en este
    caso es "100", que no es un numero sino una cadena, por lo que va a imprimir "3"): */
Console.WriteLine("100".Length);

Console.ReadKey();