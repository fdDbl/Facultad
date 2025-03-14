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
string st2 = "c:\\windows\\system";
Console.WriteLine(st2);

Console.WriteLine("\n--------- Punto 4 ---------");
string msj = Console.ReadLine();
Console.WriteLine((string.IsNullOrWhiteSpace(msj)) ? "Hola mundo" : ("Bienvenido seas " + msj));

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

Console.WriteLine("\n--------- Punto 8 ---------");
string st;
Console.WriteLine(st=Console.ReadLine()); // Esta instrucción es válida y primero hay que pensarla desde dentro del WriteLine.
/* Primero se guarda en st lo que se lee desde teclado mediante st=Console.ReadLine(). 
Una vez guardado el valor, Console.WriteLine() imprime el valor que se le asignó a st. */

Console.WriteLine("\n--------- Punto 9 ---------");
Console.WriteLine("-- SIMETRÍA DE PALABRAS --");
Console.WriteLine("Palabra 1:");
string palabra1 = Console.ReadLine();
Console.WriteLine("Palabra 2:");
string palabra2 = Console.ReadLine();
bool simetricas = true;
if(palabra1.Length == palabra2.Length) {
    for (int i=0; i<palabra1.Length; i++) {
        if(palabra1[i] != palabra2[palabra2.Length - 1 - i]) {
            simetricas = false;
            break;
        }
    }
}
Console.WriteLine(simetricas ? "Son simétricas" : "No son simétricas");

Console.WriteLine("\n--------- Punto 10 ---------");
int n = 17;
int m = 29;
Console.WriteLine("Múltiplos de 17 o 29 entre 1 y 1000:");
for(int i=1; i<1000; i++) {
    if(i % n == 0 || i % m == 0) // Para que no se repitan los múltiplos
        Console.WriteLine(i);
}

Console.WriteLine("\n--------- Punto 11 ---------");
Console.WriteLine("10/3 = " + 10 / 3);
Console.WriteLine("10.0/3 = " + 10.0 / 3);
Console.WriteLine("10/3.0 = " + 10 / 3.0);
int a = 10, b = 3;
Console.WriteLine("Si a y b son variables enteras, si a=10 y b=3");
Console.WriteLine("entonces a/b = " + a / b);
double c = 3;
Console.WriteLine("Si c es una variable double, c=3");
Console.WriteLine("entonces a/c = " + a / c);
/* Llegamos fácilmente a la conclusión de que solo basta que un operando sea de punto flotante para que el resultado directo (es decir,
sin declarar una variable resultado, sino simplemente imprimiendo la operación) sea también de punto flotante. */
// Se puede concluir que el operador "/" devuelve resultados tanto enteros cómo en punto flotante.
// Cuando se usa el operador + entre un string y un dato numérico, se produce una conversión implícita del número a cadena y luego se realiza una concatenación.

Console.WriteLine("\n--------- Punto 12 ---------");
Console.WriteLine("Ingrese el entero para ver sus divisores:");
int ent = int.Parse(Console.ReadLine());
if(ent != 0) {
    for(int i = 1; i<=ent; i++)
        if(ent % i == 0)
            Console.WriteLine(i);
}

Console.WriteLine("\n--------- Punto 13 ---------");
int aa = 50;
int bb = 0;
// El problema es que si usamos & para evaluar la condicion, sí o sí se va a evaluar aunque b = 0 y
// automáticamente se evaluaría una división por cero, cosa que da error. Se debe reemplazar el & por
// && (AND en cortocircuito) para que si la primera condición es falsa, no se tenga que evaluar la otra.
if ((bb != 0) && /* <- acá */ (aa/bb > 5))
    Console.WriteLine(aa/bb);

Console.WriteLine("\n--------- Punto 14 ---------");
int aaa = 10;
int bbb = 20;
int menor = (aaa < bbb) ? aaa : bbb;
Console.WriteLine($"El menor valor es: {menor}");

Console.WriteLine("\n--------- Punto 15 ---------");
/* int i = 0; */ // El error es que hay una variable i ya declarada cuando el bloque for intenta declarar otra más.
for (int i = 1; i <= 10;) // Se soluciona declarando i solo una vez.
{
    Console.WriteLine(i++);
}

Console.WriteLine("\n--------- Punto 16 ---------");
int j = 1;
if (--j == 0)
{
Console.WriteLine("cero");
}
if (j++ == 0)
{
Console.WriteLine("cero");
}
Console.WriteLine(j);


Console.ReadKey();