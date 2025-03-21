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
        //dibujar el estado de la pila y la mem. heap
        //en este punto de la ejecución

        /* PILA: 
            // 0x[direccionVector] //
        */

        /* MEMORIA HEAP:
            // v[0] //
            // v[1] //
            // v[2] //
            // v[3] //
            // v[4] //
            // v[5] //
            // v[6] //
            // v[7] //
            // v[8] //
            // v[9] //
            // v[10] //
        */

        v[5] = new StringBuilder("CSharp");
        foreach (StringBuilder s in v)
            Console.WriteLine(s);
        //dibujar el estado de la pila y la mem. heap
        //en este punto de la ejecución

        /* PILA: 
            // 0x[direccionVector] //
        */

        /* MEMORIA HEAP:
            // v[0] //
            // v[1] //
            // v[2] //
            // v[3] //
            // v[4] //
            // v[5] apunta a una nueva dirección diferente a la de todos los demás elementos //
            // v[6] //
            // v[7] //
            // v[8] //
            // v[9] //
            // v[10] //
        */
    }
}