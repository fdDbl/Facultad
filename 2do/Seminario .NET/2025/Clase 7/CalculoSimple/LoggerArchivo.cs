namespace CalculoSimple;

class LoggerArchivo : ILogger
{
    public void Log(string mensaje)
    {
        using var sw = new StreamWriter("registro.log", true);
        sw.WriteLine($"{DateTime.Now} {mensaje}");
    }
}