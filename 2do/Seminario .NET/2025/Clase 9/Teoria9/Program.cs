int a = 17;
int b = 23;
Swap<int>(ref a, ref b);
Console.WriteLine($"a={a} y b={b}");

string st1 = "hola";
string st2 = "chau"; 
Swap<string>(ref st1, ref st2);
Console.WriteLine($"st1={st1} y st2={st2}");

int i = Mayor<int>(100, 55);
Console.WriteLine(i);
string st = Mayor<string>("hola", "mundo");
Console.WriteLine(st);
Console.WriteLine(Mayor<char>('A', 'B'));

void Swap<T>(ref T a, ref T b)
{
    T temp = a;
    a = b;
    b = temp;
}

T Mayor<T>(T a, T b) where T : IComparable
{
    if (a.CompareTo(b) > 0) return a;
    return b;
}