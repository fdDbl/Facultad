double r1 = 17 / 3;
double r2 = 17 / 3.0;
Console.WriteLine(r1);
Console.WriteLine(r2);
Console.WriteLine(r1+r2);

Console.WriteLine("--------------------");

int x = 2;
int y = 5;
Console.WriteLine(x != 0 && y / x == 2);
Console.WriteLine(x != 0 & y / x == 2);
Console.WriteLine(x == 0 || y / x == 2);
Console.WriteLine(x == 0 | y / x == 2);

Console.WriteLine("--------------------");

Console.Write("Ingrese su nombre: ");
string nom = Console.ReadLine();
Console.WriteLine("Hola, " + nom + "!");

Console.WriteLine("--------------------");

string booleano1 = (5+2 == 7) ? "100% real" : "Fake";
Console.WriteLine(booleano1);

Console.WriteLine("--------------------");

int n = 5;
string st1 = n switch {< 177 => "Es menor a 177", > 177 => "Es mayor a 177", _ => "Es 177"};
Console.WriteLine(st1);

Console.WriteLine("--------------------");

Console.Write("Ingrese un N para la sumatoria (1..N): ");
string st2 = Console.ReadLine();
int N = int.Parse(st2);
int sum = 0;
for(int i=0; i<=N; i++) {
    sum += i;
}
Console.Write("Resultado: " + sum);