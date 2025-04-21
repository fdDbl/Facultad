class Punto9 {
    public static void Run() {
        Console.WriteLine("No se puede declarar otra firma '{acceso} {retorno} Metodo(int n)' porque ya hay otro método con el mismo alcance, nombre, y tipo y cantidad de parámetros");
        // class A {
        //     public void Metodo(short n) {
        //         Console.Write("short {0} - ", n);
        //     }
        //     public void Metodo(int n) {
        //         Console.Write("int {0} - ", n);
        //     }
        //     // public int Metodo(int n) {
        //     //     return n + 10;
        //     // }
        // }
    }
}