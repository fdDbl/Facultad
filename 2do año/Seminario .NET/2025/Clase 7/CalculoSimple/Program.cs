using CalculoSimple;

ILogger logger = new LoggerArchivo();
Calculador calc = new Calculador(logger);
calc.Calcular(3);

Console.ReadKey();