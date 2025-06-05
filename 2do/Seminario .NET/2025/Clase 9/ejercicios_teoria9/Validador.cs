namespace ejercicios_teoria9;

class Validador<T>
{
    private List<ReglaValidacion<T>> _reglas { get; } = new();
    public Validador<T> AgregarRegla(ReglaValidacion<T> regla)
    {
        _reglas.Add(regla);
        return this;
    }

    public bool Validar(T objeto, out List<string> errores)
    {
        errores = new();
        foreach (ReglaValidacion<T> r in _reglas)
        {
            if(!r.Ok(objeto)) errores.Add(r.MensajeError);
        }
        return errores.Count == 0;
    }
}