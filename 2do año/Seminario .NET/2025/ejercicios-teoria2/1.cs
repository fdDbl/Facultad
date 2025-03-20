class Uno {
    public static void Resolver() {
        object o1 = "A";
        object o2 = o1;
        o2 = "Z";
        Console.WriteLine(o1 + " " + o2);
        /* o1 sigue conteniendo el valor "A" ya que los string son inmutables. Al asignar "Z" a o2, se
        se hace una nueva reserva de memoria HEAP para o2 y deja de tener la misma referencia que o1. */
    }
}