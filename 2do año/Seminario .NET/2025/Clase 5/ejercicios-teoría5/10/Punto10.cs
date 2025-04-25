public class Punto10
{
    class A
    {
        private static int a;   // campo estático privado int
        private static readonly int b;  // campo estátic privado de solo lectura int
        A() { }     // constructor privado nulo
        public A(int i) : this() { }    // constructor público que llama al constructor con la firma especificada
        static A() => b = 2;    // constructor estático privado
        int c;  // campo de instancia privado
        public static void A1() => a = 1;   // método público estático vacío
        public int A1(int a) => A.a + a;    // método público de instancia que retorna un int
        public static int A2;   // campo estático público int
        static int A3 => 3;     // propiedad auto-implementada estática privada de solo lectura 
        private int A4() => 4;  // método de instancia privado que retorna un int
        public int A5 { get => 5; }     // propiedad pública auto-implementada de solo lectura que retorna un int
        int A6 { set => c = value; }    // propiedad privada auto-implementada de solo escritura
        public int A7 { get; set; }     // propiedad pública auto-implementada de lectura/escritura
        public int A8 { get; } = 8;     // propiedad pública auto-implementada de solo lectura inicializada
        public int this[int i] => i;    // indizador público auto-implementado que retorna un int
    }
}