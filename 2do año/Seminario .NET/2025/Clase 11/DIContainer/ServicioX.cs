namespace DIContainer;
public class ServicioX (ILogger logger): IServicioX
{
    public void Ejecutar()
    {
        logger.Log("ServicioX comenzando su ejecución");
        for (int i = 1; i <= 100_000_000; i++) ; //consumo tiempo simulando ejecución
        logger.Log("ServicioX ejecución finalizada");
    }
}