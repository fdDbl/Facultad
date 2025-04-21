class Punto11
{
    public static void Run()
    {
        string st;
        string st1 = "";
        string st2 = "";
        string st3 = "";
        string st4 = "";

        if (st1 == null)
        {
            if (st2 == null)
            {
                st = st3;
            }
            else
            {
                st = st2;
            }
        }
        else
        {
            st = st1;
        }
        if (st4 == null)
        {
            st4 = "valor por defecto";
        }

        // ARREGLADO CON NULL-COALESCING:
        
        st = st1 ?? st2 ?? st3;
        st4 ??= "Valor por defecto";
    }
}