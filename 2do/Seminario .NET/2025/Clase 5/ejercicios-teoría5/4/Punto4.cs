public class Punto4
{
    public static void Run()
    {
        Console.WriteLine("----- PUNTO 4 -----");
        Console.WriteLine("4. a) Funciona bien. Primero se asigna s_a = 0, después se llama al cons. estático y " +
                          "luego al de instancia");
        Console.WriteLine("4. b) Los constructores estáticos no pueden ser mas accesibles que privados.");
        Console.WriteLine("4. c) Los cons. estáticos no pueden recibir parámetros.");
        Console.WriteLine("4. d) Funciona.");
        Console.WriteLine("4. e) Ningún método o constructor estático puede modificar una variable de instancia.");
        Console.WriteLine("4. f) Funciona.");
        Console.WriteLine("4. g) Le falta el readonly a la variable estática para que se asigne en tiempo de ejecución.");
        Console.WriteLine("4. h) Los campos const deben ser evaluables en tiempo de compilación");
        Console.WriteLine("4. i) Funciona.");
        Console.WriteLine("4. j) No se puede asignar algo a una variable readonly.");
        Console.WriteLine("4. k) Es válido.");
        Console.WriteLine("4. l) Los indizadores no pueden ser estáticos.");
        
    }
    // 4. a)
    // class A {
    //     static int s_a=0;
    //     static A() {
    //         s_a++;
    //     }
    //     public A() {
    //         s_a++;
    //     }
    // }
    
    // 4. b)
    // class A {
    //     static int s_a = 0;
    //     public static A() {
    //         s_a++;
    //     }
    //     A() {
    //         s_a++;
    //     }
    // }
    
    // 4. c)
    // class A {
    //     static int s_a = 0;
    //     static A(int a) {
    //         s_a=a;
    //     }
    //     A(int a) {
    //         s_a = a;
    //     }
    // }
    
    // 4. d)
    // class A {
    //     static int s_a = 0;
    //     int a = 0;
    //     static A() {
    //         s_a = 30;
    //     }
    //     A(int a) {
    //         s_a = a;
    //         this.a = a;
    //     }
    // }
    
    // 4. e)
    // class A {
    //     static int s_a = 0;
    //     int a = 0;
    //     static A() {
    //         a = 30;
    //     }
    //     A(int a) {
    //         a = s_a;
    //     }
    // }
    
    // 4. f)
    // class A {
    //     static int s_a = 1;
    //     int a = 0;
    //     static A() => s_a += s_a;
    //     public static A GetInstancia() => new A(1);
    //     A(int a) => this.a = a + s_a;
    // }
    
    // 4. g)
    // class A {
    //     const double PI = 3.1416;
    //     static double DoblePI = 2 * PI;
    // }
    
    // 4. h)
    // class A {
    //     static double PI = 3.1416;
    //     const double DoblePI = 2*PI;
    // }
    
    // 4. i)
    // class A {
    //     static readonly List<int> _lista;
    //     static A() {
    //         _lista = new List<int>();
    //     }
    //     public static void P(int i) {
    //         _lista.Add(i);
    //     }
    // }
    
    // 4. j)
    // class A {
    //     static readonly List<int> _lista;
    //     static A() {
    //         _lista = new List<int>();
    //     }
    //     public static void P(List<int> li) {
    //         _lista = li;
    //     }
    // }

    // 4. k)
    // class A
    // {
    //     static int[] vector = { 1, 2, 3 };
    //     public int this[int i]
    //     {
    //         get { return vector[i]; }
    //     }
    // }

    // 4. l)
    // class A
    // {
    //     static int[] vector = { 1, 2, 3 };
    //     public static int this[int i]
    //     {
    //         get { return vector[i]; }
    //     }
    // }
}