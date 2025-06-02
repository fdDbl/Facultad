using AL.Aplicacion.Interfaces;
using AL.Aplicacion.Entidades;

namespace AL.Aplicacion.UseCases;

public class ListarClientesUseCase(IRepositorioCliente repositorio):ClienteUseCase(repositorio)
{
    public List<Cliente> Ejecutar()
  {
      return Repositorio.GetClientes();
  }
}
