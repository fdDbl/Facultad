class Punto8 {
    public static void Run() {
        // PROGRAMA 1:
        // Foo f = new Foo();
        // f.Imprimir();
        // class Foo
        // {
        // string? _bar;
        // public void Imprimir()
        // {
        // Console.WriteLine(_bar.Length);
        // }
        // }
        Console.WriteLine("Las variables de instancia siempre se inicializan automáticamente en null. El programa no funciona ya que no se puede pedir un .Length sobre una referencia nula.");

        // PROGRAMA 2:
        // Foo f = new Foo();
        // f.Imprimir();
        // class Foo
        // {
        // public void Imprimir()
        // {
        // string? bar;
        // Console.WriteLine(bar.Length);
        // }
        // }
        Console.WriteLine("Las variables locales NO se inicializan automáticamente. En este caso, el programa directamente ni compila.");
    }
}