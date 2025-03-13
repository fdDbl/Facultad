/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Subsidios_Sep2022;

/**
 *
 * @author Federico Dobal
 */
public class SubsidioEstadía extends Subsidio {
    private String destino;
    private double costoPasajes;
    private int cantDias;
    private double montoHotelXDia;

    public SubsidioEstadía(String nombre, String plan, Fecha fec, String destino, double costoPasajes, int cantDias, double montoHotelXDia) {
        super(nombre,plan,fec);
        this.destino = destino;
        this.costoPasajes = costoPasajes;
        this.cantDias = cantDias;
        this.montoHotelXDia = montoHotelXDia;
    }

    public String getDestino() {
        return destino;
    }

    public double getCostoPasajes() {
        return costoPasajes;
    }

    public int getCantDias() {
        return cantDias;
    }

    public double getMontoHotelXDia() {
        return montoHotelXDia;
    }
    
    public double montoTotalSubsidio() {
        return getCostoPasajes() + getCantDias() * getMontoHotelXDia();
    }
    
    public String toString() {
        String aux = "----- SUBSIDIO ESTADÍA -----\n";
        aux += super.toString() + "\n";
        aux += "Monto total: " + montoTotalSubsidio() + "\n";
        aux += "Lugar de destino: " + getDestino() + "\n";
        aux += "Días de estadía: " + getCantDias() + "\n";
        return aux;
    }
    
}
