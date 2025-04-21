using System.Text.RegularExpressions;
using Microsoft.VisualBasic;

class Ecuacion2 {
    private double _a,_b,_c;
    private string _exp;
    public Ecuacion2(string exp) {
        MatchCollection matches = Regex.Matches(exp.Replace(" ", ""), @"[+-]?\d+(?=x\^2)|[+-]?\d+(?=x(?!\^))|[+-]?\d+(?!x)");
        if (matches.Count < 3)
            throw new FormatException("Expresión inválida. Asegúrate de usar el formato 'ax^2 + bx + c'.");
        try {
            _a = double.Parse(matches[0].Value);
            _b = double.Parse(matches[2].Value);
            _c = double.Parse(matches[3].Value);
        } catch (FormatException) {
            throw new FormatException("No se pudieron convertir los coeficientes a números.");
        }
        _exp = $"{_a}x^2 + {_b}x + {_c} = 0";
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
        return $"La dos raíces de la ecuación son: x1 = {x1:f3} y x2 = {x2:f3}.";
    }
    public void ImprimirRaíces() {
        string st = GetCantidadDeRaices() switch {< 0 => "No posee raíces reales.", > 1 => DosRaíces(), _ => ÚnicaRaíz()};
        Console.WriteLine(st);
    }
    public string getExpresión() {
        return _exp;
    }
}