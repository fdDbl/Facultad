package temp;
/**
 *
 * @author Federico Dobal
 */
public class Auto extends Vehículo {
    private boolean baul;

    public Auto(boolean baul, String marca, String modelo, double precio, double peso) {
        super(marca, modelo, precio, peso);
        this.baul = baul;
    }

    public boolean isBaul() {
        return baul;
    }
    
    
}
