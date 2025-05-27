using Almacen.Aplicacion;

namespace Almacen.Repositorios;

public class RepositorioProductoTXT : IRepositorioProducto
{
    readonly string _nombreArch = "productos.txt";
    public void AgregarProducto(Producto producto)
    {
        int idAct = 1;
        if (File.Exists(_nombreArch))
        {
            var productos = ListarProductos();
            int maxId = 0;
            foreach (Producto p in productos)
                if (p.Id > maxId)
                    maxId = p.Id;
            idAct = maxId + 1;
        }
        producto.Id = idAct;
        using var sw = new StreamWriter(_nombreArch, true);
        sw.WriteLine(producto.Id);
        sw.WriteLine(producto.Nombre);
        sw.WriteLine(producto.Precio);
    }
    public List<Producto> ListarProductos()
    {
        var resultado = new List<Producto>();
        using var sr = new StreamReader(_nombreArch);
        while (!sr.EndOfStream)
        {
            var producto = new Producto();
            producto.Id = int.Parse(sr.ReadLine() ?? "");
            producto.Nombre = sr.ReadLine() ?? "";
            producto.Precio = int.Parse(sr.ReadLine() ?? "");
            resultado.Add(producto);
        }
        return resultado;
    }
    public Producto? GetProducto(int id)
    {
        using var sr = new StreamReader(_nombreArch);
        var productos = ListarProductos();
        var producto = new Producto();
        foreach (Producto p in productos)
            if (p.Id == id)
                return p;
        return producto;
    }
    public void ModificarProducto(Producto producto)
    {
        var productos = ListarProductos();
        for (int i = 0; i < productos.Count; i++)
        {
            if (productos[i].Id == producto.Id)
            {
                productos[i] = producto;
                break;
            }
        }
        ActualizarTXT(productos);
    }
    public void EliminarProducto(int id)
    {
        var productos = ListarProductos();
        for (int i = 0; i < productos.Count; i++)
        {
            if (productos[i].Id == id)
            {
                productos.RemoveAt(i);
                break;
            }
        }
        ActualizarTXT(productos);
    }
    private void ActualizarTXT(List<Producto> p)
    {
        using var sw = new StreamWriter(_nombreArch, false);
        foreach (var pr in p)
        {
            sw.WriteLine(pr.Id);
            sw.WriteLine(pr.Nombre);
            sw.WriteLine(pr.Precio);
        }
    }
}
