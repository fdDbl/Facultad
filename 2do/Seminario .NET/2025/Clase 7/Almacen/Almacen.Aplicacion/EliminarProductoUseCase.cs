namespace Almacen.Aplicacion;

public class EliminarProductoUseCase(IRepositorioProducto repo)
{
    public void Ejecutar(int id)
    {
        repo.EliminarProducto(id);
    }
}