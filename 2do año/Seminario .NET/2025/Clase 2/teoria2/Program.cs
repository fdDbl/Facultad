// Las lineas comentadas tienen algunos errores:
byte b = 10;
double x = 12.25;
int i = b;
double y = i;
// short j = i; ERROR ya que al asignarle un valor entero a un short, se perdería parte del entero
/* Solución: */ short j = (short) i;
// i = x; ERROR por la misma razón (x es double)
/* Solución: */ i = (int) x;

int k = 123;
Object o = k; // BOXING: k pasa a ser un Object
int m = (int)o; // UNBOXING: m trae un entero del Object o

object obj = 7.3; // obj apunta a un valor de tipo double
Console.WriteLine(obj);
obj = "Casa"; // ahora de tipo string
Console.WriteLine(obj);
obj = 4; // ahora de tipo int
Console.WriteLine(obj);

i = 1;
int? f = i;
i = (int)f;
f = null;
// i = (int)j; No se puede porque j es null
i = f.HasValue ? f.Value : -1;
i = f != null ? (int)f : -1;
i = f ?? -1;

Console.ReadKey();