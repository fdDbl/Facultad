using System.Collections;

namespace ejercicios_teoria9;

class ListaEnlazada<T> : IEnumerable<T>
{
    private Nodo<T>? _cabeza;
    private Nodo<T>? _cola;

    public void AgregarAdelante(T t)
    {
        Nodo<T> nue = new(t);
        if (_cabeza == null) _cola = nue;
        else nue.Proximo = _cabeza;
        _cabeza = nue;
    }
    public void AgregarAtras(T t)
    {
        Nodo<T> nue = new(t);
        if (_cabeza == null) _cabeza = nue;
        else _cola.Proximo = nue;
        _cola = nue;
    }
    public IEnumerator<T> GetEnumerator()
    {
        var aux = _cabeza;
        while (aux != null)
        {
            yield return aux.Valor;
            aux = aux.Proximo;
        }
    }
    IEnumerator IEnumerable.GetEnumerator()
    {
        return GetEnumerator();
    }
}