using System.Collections;

namespace ejercicios_teoria8;
static class VectorDeEnterosExtension
{
    public static void Print(this int[] vector, string leyenda)
    {
        Console.WriteLine(leyenda + string.Join(", ", vector));
    }
    public static int[] Seleccionar(this int[] vector, FuncionEntera f)
    {
        var v = vector.ToArray();
        for (var i = 0; i < v.Length; i++)
            v[i] = f(v[i]);
        return v;
    }
    public static int[] Donde(this int[] vector, Predicado p)
    {
        List<int> l = new();
        for (var i = 0; i < vector.Length; i++)
            if(p(vector[i]))
                l.Add(vector[i]);
        return l.ToArray();;
    }
}