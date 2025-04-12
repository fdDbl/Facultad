using System.Text.RegularExpressions;
using Microsoft.VisualBasic;

public class Ecuacion2 {
    private double _a,_b,_c;
    private string _exp;
    public Ecuacion2(string exp) {
        MatchCollection matches = Regex.Matches(exp, @"[+-]?\d+(?=x\^2)|[+-]?\d+(?=x(?!\^))|[+-]?\d+(?!x)");
        _a = double.Parse(matches[0].ToString());
        _b = double.Parse(matches[2].ToString());
        _c = double.Parse(matches[3].ToString());
        _exp = exp + " = 0";
    }
    public Ecuacion2(double a, double b, double c) {
        _a = a;
        _b = b;
        _c = c;
        _exp = $"{a}x^2 + {b}x + {c} = 0";
    }
    public double GetDiscriminante() {
        return Math.Pow(_b,2) - 4*_a*_c;
    }
    public int GetCantidadDeRaices() {
        return (GetDiscriminante() < 0) ? 0 : (GetDiscriminante() == 0) ? 1 : 2;
    }
    public string ÚnicaRaíz() {
        return "La única raíz de la ecuación es: " + (-_b / (2*_a));
    }
    public string DosRaíces() {
        double x1 = (-_b + Math.Sqrt(Math.Pow(_b,2)-4*_a*_c)) / (2*_a);
        double x2 = (-_b - Math.Sqrt(Math.Pow(_b,2)-4*_a*_c)) / (2*_a);
        return $"La dos reíces de la ecuación son: x1 = {x1:f3} y x2 = {x2:f3}.";
    }
    public void ImprimirRaíces() {
        string st = GetCantidadDeRaices() switch {< 0 => "No posee raíces reales.", > 1 => DosRaíces(), _ => ÚnicaRaíz()};
        Console.WriteLine(st);
    }
    public string getExpresión() {
        return _exp;
    }
}