namespace Almacen.Aplicacion;

public class ModificarProductoUseCase(IRepositorioProducto repo)
{
    public void Ejecutar(Producto p)
    {
        repo.ModificarProducto(p);
    }
}