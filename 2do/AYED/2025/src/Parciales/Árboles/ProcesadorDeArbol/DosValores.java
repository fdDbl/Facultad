package Parciales.Árboles.ProcesadorDeArbol;

import java.util.List;

public class DosValores {
    private List<Integer> valores;
    private Integer cantValores;

    public DosValores(List<Integer> L, Integer I) {
        valores = L;
        cantValores = I;
    }

    @Override
    public String toString() { return "Lista de valores: " + valores.toString() + "\nCantidad de valores: " + cantValores; }
}
