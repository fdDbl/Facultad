package temp;
/**
 *
 * @author Federico Dobal
 */
public class Vehículo {
    private String marca;
    private String modelo;
    private double precio;
    private double peso;

    public Vehículo(String marca, String modelo, double precio, double peso) {
        this.marca = marca;
        this.modelo = modelo;
        this.precio = precio;
        this.peso = peso;
    }

    public String getMarca() {
        return marca;
    }
    
    public String getModelo() {
        return modelo;
    }

    public double getPrecio() {
        return precio;
    }

    public double getPeso() {
        return peso;
    }
    
}
