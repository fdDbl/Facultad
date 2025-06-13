package Practica_5.EJ5;

public class Persona {
    private String tipo;
    private String nombre;
    private String domicilio;
    private boolean cobrado;

    public Persona(String tipo, String nombre, String domicilio, boolean cobrado) {
        this.tipo = tipo;
        this.nombre = nombre;
        this.domicilio = domicilio;
        this.cobrado = cobrado;
    }

    public String getTipo() {
        return tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public boolean isCobrado() {
        return cobrado;
    }

    @Override
    public String toString() {
        return "Persona{" +
                "tipo='" + tipo + '\'' +
                ", nombre='" + nombre + '\'' +
                ", domicilio='" + domicilio + '\'' +
                '}';
    }
}