namespace Almacen.Aplicacion;

public class AgregarProductoUseCase(IRepositorioProducto repo, ProductoValidador validador)
{
    public void Ejecutar(Producto producto)
    {
        if (!validador.Validar(producto, out string msjError))
            throw new Exception(msjError);
        repo.AgregarProducto(producto);
    }
}