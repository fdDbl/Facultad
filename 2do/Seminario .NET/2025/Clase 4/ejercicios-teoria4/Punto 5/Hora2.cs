class Hora2 {
    private int _horas;
    private int _minutos;
    private double _segundos;
    public Hora2(int h, int m, double s) {
        this._horas = h;
        this._minutos = m;
        this._segundos = s;
    }
    public Hora2(double t) {
        this._horas = (int) t;
        this._minutos = (int)((t - this._horas) * 60);
        double segundos = (((t - this._horas) * 60) - this._minutos) * 60;
        if(Math.Round(segundos) == 60)
            segundos = 0;
        this._segundos = segundos;
    }
    public void Imprimir() {
        Console.WriteLine($"{this._horas} horas, {this._minutos} minutos y {this._segundos:f3} segundos.");
    }

}