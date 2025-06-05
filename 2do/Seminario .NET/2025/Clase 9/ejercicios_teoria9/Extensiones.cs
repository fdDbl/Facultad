namespace ejercicios_teoria9;

public static class Extensiones
{
    public static void ForEach<T>(this IEnumerable<T> secuencia, Action<T> action)
    {
        foreach (var t in secuencia) action(t);
    }

    public static IEnumerable<T> Donde<T>(this IEnumerable<T> secuencia, Predicado<T> predicate)
    {
        List<T> lista = new();
        foreach (var t in secuencia)
        {
            if (predicate(t))
                lista.Add(t);
        }

        return lista;
    }

    public static IEnumerable<TResult> Seleccionar<T, TResult>(this IEnumerable<T> secuencia, Func<T, TResult> selector)
    {
        foreach (var t in secuencia)
            yield return selector(t);
    }
}