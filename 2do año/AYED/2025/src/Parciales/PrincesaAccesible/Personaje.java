package Parciales.PrincesaAccesible;

public class Personaje {
    private String tipo;

    public Personaje() {}
    public Personaje(String t) { tipo = t; }

    public boolean esDragon() { return tipo.equals("Dragon"); }
    public boolean esPrincesa() { return tipo.equals("Princesa"); }

    @Override
    public String toString() {
        return "Soy... " + tipo;
    }
}
