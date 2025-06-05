class Hora1 {
    private int _horas;
    private int _minutos;
    private int _segundos;

    public Hora1(int h, int m, int s) {
        this._horas = h;
        this._minutos = m;
        this._segundos = s;
    }
    public void Imprimir() {
        Console.WriteLine($"{this._horas} horas, {this._minutos} minutos y {this._segundos} segundos.");
    }
}