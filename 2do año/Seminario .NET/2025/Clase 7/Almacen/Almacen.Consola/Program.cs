using Almacen.Aplicacion;
using Almacen.Repositorios;

//configuro las dependencias
IRepositorioProducto repo = new RepositorioProductoTXT();
ProductoValidador pValidador = new ProductoValidador();

//creo los casos de uso
var agregarProducto = new AgregarProductoUseCase(repo, pValidador);
var listarProductos = new ListarProductosUseCase(repo);
var obtenerProducto = new GetProductoUseCase(repo);
var modificarProducto = new ModificarProductoUseCase(repo);
var eliminarProducto = new EliminarProductoUseCase(repo);

//ejecuto los casos de uso
try
{
    agregarProducto.Ejecutar(new Producto() { Nombre = "Yerba", Precio = 1000 });
}
catch (Exception e)
{
    Console.WriteLine(e.Message);
}

try
{
    agregarProducto.Ejecutar(new Producto() { Nombre="Azúcar",Precio=500});
}
catch (Exception e)
{
    Console.WriteLine(e.Message);
}

var lista = listarProductos.Ejecutar();
foreach(Producto p in lista)
{
    Console.WriteLine(p);
}

Console.WriteLine(obtenerProducto.Ejecutar(3)?.ToString());
modificarProducto.Ejecutar(new Producto() { Id=3,Nombre="Yerba",Precio=1000 });
eliminarProducto.Ejecutar(3);
lista = listarProductos.Ejecutar();

foreach(Producto p in lista)
{
    Console.WriteLine(p);
}

Console.ReadKey();