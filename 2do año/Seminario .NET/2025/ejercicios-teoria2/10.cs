using System.Text;
class Diez {
    public static void Resolver() {
        object[] v = new object[10];
        v[0] = new StringBuilder("Net");
        for (int i = 1; i < 10; i++) {
            v[i] = v[i - 1];
        }
        (v[5] as StringBuilder).Insert(0, "Framework .");
        foreach (StringBuilder s in v)
            Console.WriteLine(s);

        /* PILA: 
            // v[0] -> StringBuilder("Framework.Net") //
            // v[1] -> StringBuilder("Framework.Net") //
            // v[2] -> StringBuilder("Framework.Net") //
            // v[3] -> StringBuilder("Framework.Net") //
            // v[4] -> StringBuilder("Framework.Net") //
            // v[5] -> StringBuilder("Framework.Net") //
            // v[6] -> StringBuilder("Framework.Net") //
            // v[7] -> StringBuilder("Framework.Net") //
            // v[8] -> StringBuilder("Framework.Net") //
            // v[9] -> StringBuilder("Framework.Net") //
            // v[10] -> StringBuilder("Framework.Net") //

            TODOS apuntan a StringBuilder("Framework.Net") ya que v[5] tiene la misma referencia
            que todos los elementos del vector.
        */
        /* MEMORIA HEAP:
            // -> StringBuilder("Framework.Net") //
        */

        v[5] = new StringBuilder("CSharp");
        foreach (StringBuilder s in v)
            Console.WriteLine(s);

        /* PILA: 
            // v[0] -> StringBuilder("Framework.Net") //
            // v[1] -> StringBuilder("Framework.Net") //
            // v[2] -> StringBuilder("Framework.Net") //
            // v[3] -> StringBuilder("Framework.Net") //
            // v[4] -> StringBuilder("Framework.Net") //
            // v[5] -> StringBuilder("CSharp") //
            // v[6] -> StringBuilder("Framework.Net") //
            // v[7] -> StringBuilder("Framework.Net") //
            // v[8] -> StringBuilder("Framework.Net") //
            // v[9] -> StringBuilder("Framework.Net") //
            // v[10] -> StringBuilder("Framework.Net") //

            TODOS apuntan a StringBuilder("Framework.Net") excepto v[5] porque este ahora apunta
            a una nueva referencia desde que se hizo v[5] = new StringBuilder("CSharp");
        */

        /* MEMORIA HEAP:
            // -> StringBuilder("Framework.Net") //
            // -> StringBuilder("CSharp") // nueva referencia de objeto
        */
    }
}