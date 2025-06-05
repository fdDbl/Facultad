/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Subsidios_Sep2022;

/**
 *
 * @author Federico Dobal
 */
public class Bien {
    private String descripcion;
    private int cantidad;
    private double costoUnitario;

    public Bien(String descripcion, int cantidad, double costoUnitario) {
        this.descripcion = descripcion;
        this.cantidad = cantidad;
        this.costoUnitario = costoUnitario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public double getCostoUnitario() {
        return costoUnitario;
    }
    
    public double getCostoFinal() {
        return getCantidad() * getCostoUnitario();
    }

    @Override
    public String toString() {
        return "Bien{" + "descripcion=" + descripcion + ", cantidad=" + cantidad + ", costoUnitario=" + costoUnitario + '}';
    }

}
