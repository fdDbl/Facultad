namespace Figuras;
public class Rectángulo
{
    private double _base;
    private double _altura;
    public Rectángulo(double b, double a) {
        _base = b;
        _altura = a;
    }
    public double GetArea() {
        return _base * _altura;
    }
}
