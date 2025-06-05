package Practica_1.EJ5;

/**
 *
 * @author Federico Dobal
 */
public class Resultado {
    private int min;
    private int max;
    private double prom;
    
    public Resultado() {}
    
    public Resultado(int min, int max, double prom) {
        this.min = min;
        this.max = max;
        this.prom = prom;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public void setProm(double prom) {
        this.prom = prom;
    }
    
    @Override
    public String toString() {
        return "Resultado: {" + "Valor máximo=" + max + ", Valor mínimo:=" + min + ", Promedio=" + prom + '}';
    }
    
    
}
