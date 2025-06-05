using System;
using AL.Aplicacion.Interfaces;

namespace AL.Aplicacion.UseCases;

public abstract class ClienteUseCase(IRepositorioCliente repositorio) //La utilidad de esta clase es ser la superclase de todos los useCases de Cliente
{
    protected IRepositorioCliente Repositorio { get; } = repositorio; //Protected para que puedan ser usadas por las subclases
}
