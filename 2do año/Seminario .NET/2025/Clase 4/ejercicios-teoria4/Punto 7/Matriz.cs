public class Matriz {
    private double[,] _m;
    public Matriz(int filas, int columnas) {
        _m = new double[filas,columnas];
    }
    public Matriz(double[,] matriz) {
        _m = matriz;
    }
    public void SetElemento(int fila, int columna, double elemento) {
        _m[fila,columna] = elemento;
    }
    public double GetElemento(int fila, int columna) {
        return _m[fila,columna];
    }
    public void Imprimir() {
        for (int k = 0; k < _m.GetLength(0) * _m.GetLength(1); k++) {
            Console.Write(_m[k / _m.GetLength(1), k % _m.GetLength(1)]);
            Console.Write((k % _m.GetLength(1) < _m.GetLength(1) - 1) ? " " : "\n");
        }
    }
    public void Imprimir(string formatString) {
        for (int k = 0; k < _m.GetLength(0) * _m.GetLength(1); k++) {
            Console.Write(_m[k / _m.GetLength(1), k % _m.GetLength(1)].ToString(formatString));
            Console.Write((k % _m.GetLength(1) < _m.GetLength(1) - 1) ? " " : "\n");
        }
    }
    public double[] GetFila(int fila) {
        double[] aux = new double[_m.GetLength(1)];
        for(int i = 0; i < _m.GetLength(1); i++)
            aux[i] = _m[fila,i];
        return aux;
    }
    public double[] GetColumna(int columna) {
        double[] aux = new double[_m.GetLength(0)];
        for(int i = 0; i < _m.GetLength(0); i++)
            aux[i] = _m[i,columna];
        return aux;
    }
    public double[]? GetDiagonalPrincipal() {
        if(_m.GetLength(0) != _m.GetLength(1))
            return null;
        double[] aux = new double[_m.GetLength(0)];
        for (int i = 0; i < _m.GetLength(0); i++)
            aux[i] = _m[i, i];
        return aux;
    }
    public double[]? GetDiagonalSecundaria() {
        if(_m.GetLength(0) != _m.GetLength(1))
            return null;
        double[] aux = new double[_m.GetLength(0)];
        int j = _m.GetLength(0)-1;
        for (int i = 0; i < _m.GetLength(0); i++, j--)
            aux[i] = _m[i, j];
        return aux;
    }
    public double[][] getArregloDeArreglo() {
        double[][] aux = new double[_m.GetLength(0)][];
        for (int i = 0; i < _m.GetLength(0); i++)
            aux[i] = new double[_m.GetLength(1)];

        for (int i = 0; i < _m.GetLength(0) * _m.GetLength(1); i++)
            aux[i / _m.GetLength(1)][i % _m.GetLength(1)] = _m[i / _m.GetLength(1), i % _m.GetLength(1)];
        return aux;
    }
    public static bool SameSize(Matriz A) {
        return A.GetLength(0) == _m.GetLength(0) && A.GetLength(1) == _m.GetLength(1);
    }
    public int GetLength(int d) {
        return _m.GetLength(d);
    }
    public void sumarle(Matriz m) {
        if (!(m.GetLength(0) == _m.GetLength(0) && m.GetLength(1) == _m.GetLength(1)))
            return;
        for (int i = 0; i < _m.GetLength(0) * _m.GetLength(1); i++)
            _m[i / _m.GetLength(1), i % _m.GetLength(1)] = _m[i / _m.GetLength(1), i % _m.GetLength(1)] + m.GetElemento(i / m.GetLength(1), i % m.GetLength(1));
    }
    public void restarle(Matriz m)
    public void multiplicarPor(Matriz m) {}

}