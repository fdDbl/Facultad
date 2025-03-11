/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Final12_02_2025;

/**
 *
 * @author Federico Dobal
 */
public class Oficina {
    private boolean alquilada;
    private double montoDiario;
    private Persona personaAlquilando;

    public Oficina() {
        this.alquilada = false;
        this.montoDiario = 0;
        this.personaAlquilando = null;
    }
    
    public boolean isAlquilada() {
        return this.alquilada;
    }
    
    public void incrementarMonto(int unPorcentaje) {
        this.montoDiario = this.montoDiario + (this.montoDiario * unPorcentaje) / 100;
    }
    
    public double getMontoDiario() {
        return this.montoDiario;
    }
    
    public void alquilar(String unNombre, int unDNI, double monto) {
        this.personaAlquilando = new Persona(unDNI, unNombre);
        this.montoDiario = monto;
        this.alquilada = true;
    }
    
    public int dniDePersonaAlquilando() {
        return this.personaAlquilando.getDNI();
    }
}   
