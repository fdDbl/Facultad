public class Matriz
{
    private double[,] matriz;

    public double this[int i, int j]
    {
        get { return matriz[i, j]; }
        set { this.matriz[i, j] = value; }
    }

    public Matriz(int fila, int columnas)
    {
        this.matriz = new double [fila, columnas];
    }

    public Matriz(double[,] matriz)
    {
        this.matriz = matriz;
    }

    public void imprimir()
    {
        for (int i = 0; i < this.matriz.GetLength(0) * this.matriz.GetLength(1); i++)
        {
            Console.Write(this.matriz[i / this.matriz.GetLength(1), i % this.matriz.GetLength(1)]);
            Console.Write(i % this.matriz.GetLength(1) == this.matriz.GetLength(1) - 1 ? "\n" : " ");
        }
    }

    public void imprimir(String stringFormat)
    {
        for (int i = 0; i < this.matriz.GetLength(0) * this.matriz.GetLength(1); i++)
        {
            Console.Write(
                this.matriz[i / this.matriz.GetLength(1), i % this.matriz.GetLength(1)].ToString(stringFormat));
            Console.Write(i % this.matriz.GetLength(1) == this.matriz.GetLength(1) - 1
                ? "\n"
                : " ");
        }
    }

    public double[] GetFila(int fila)
    {
        double[] f = new double [this.matriz.GetLength(1)];
        for (int i = 0; i < this.matriz.GetLength(1); i++)
        {
            f[i] = this.matriz[fila, i];
        }

        return f;
    }

    public double[] GetColumnas(int columna)
    {
        double[] c = new double [this.matriz.GetLength(0)];
        for (int i = 0; i < this.matriz.GetLength(0); i++)
        {
            c[i] = this.matriz[i, columna];
        }

        return c;
    }

    public double[] getDiagonalPrincipal()
    {
        int f = this.matriz.GetLength(1);
        double[] v = new double [f];
        for (int i = 0; i < this.matriz.GetLength(1); i++)
        {
            v[i] = matriz[i, i];
        }

        return v;
    }

    public double[] getDiagonalSecundaria()
    {
        int f = this.matriz.GetLength(1);
        double[] v = new double [f];
        int j = this.matriz.GetLength(1) - 1;
        for (int i = 0; i < this.matriz.GetLength(1); i++)
        {
            v[i] = matriz[j--, i];
        }

        return v;
    }

    public void sumarle(Matriz m)
    {
        for (int i = 0; i < this.matriz.GetLength(0); i++)
        {
            for (int j = 0; j < this.matriz.GetLength(1); j++)
            {
                double sum = m.matriz[i, j];
                this.matriz[i, j] += sum;
            }
        }
    }
}