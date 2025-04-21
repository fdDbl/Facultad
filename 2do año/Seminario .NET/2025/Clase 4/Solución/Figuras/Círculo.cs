namespace Figuras;
public class Círculo
{
    private double _radio;
    public Círculo(double r) {
        _radio = r;
    }
    public double GetArea() {
        return Math.PI * Math.Pow(_radio, 2);
    }
}
