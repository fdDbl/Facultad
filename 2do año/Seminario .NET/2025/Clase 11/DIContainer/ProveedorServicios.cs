namespace DIContainer;
class ProveedorServicios
{
    public ILogger GetLogger()
        => new LoggerConsola();
    public IServicioX GetServicioX()
        => new ServicioX(this.GetLogger());
}