namespace CalculoSimple;
class Calculador(ILogger logger)
{
    public void Calcular(int n)
    {
        int resul = (n + 5) * (n + 7);
        logger.Log($"Fin de Calculo - (resul={resul})");
    }
}