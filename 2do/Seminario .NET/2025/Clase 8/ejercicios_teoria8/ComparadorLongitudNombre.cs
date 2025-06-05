namespace ejercicios_teoria8;

public class ComparadorLongitudNombre : System.Collections.IComparer
{
    public int Compare(object? x, object? y)
    {
        int result = 1;
        if (x is INombrable i1 && y is INombrable i2)
        {
            int long1 = i1.Nombre.Length;
            int long2 = i2.Nombre.Length;
            result = long1.CompareTo(long2);
        }
        return result;
    }
}