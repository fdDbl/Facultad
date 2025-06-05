class Tres {
    public static void Resolver() {
        Console.WriteLine("Las conversiones de tipo implícitas las hace directamente el compilador sin necesidad de manipulación humana. Por ejemplo:");
        int i = 60;
        Console.WriteLine(i);
        double d = i;
        Console.WriteLine(d + ": ya que el rango y resolución de los double es más extenso que el de los enteros, la conversión se hace automáticamente.");
        Console.WriteLine("Las conversiones explícitas necesitan ser indicadas por el programador ya que suponen conversiones sensibles y con pérdida de información. Por ejemplo:");
        double f = 123.456;
        Console.WriteLine(f);
        byte b = (byte)f;
        Console.WriteLine(b + ": la conversión de double a byte supone la pérdida de los números luego de la coma en este caso, así que se debe indicar el prefijo (byte) antes de la variable double");
    }
}