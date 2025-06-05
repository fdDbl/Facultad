class Siete {
    public static void Resolver() {
        char c1 = 'A';
        char c2 = 'A';
        Console.WriteLine(c1 == c2);
        object o1 = c1;
        object o2 = c2;
        Console.WriteLine(o1 == o2);
        /* La tercera y sexta línea no son iguales ya que las variables primitivas comparan su valor,
        pero los objetos comparan sus referencias. */
    }
}