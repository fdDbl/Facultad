/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Subsidios_Sep2022;

/**
 *
 * @author Federico Dobal
 */
public class SubsidioBienes extends Subsidio {
    private Bien[] bienes;
    private int DIMF;
    private int cantBienes;

    public SubsidioBienes(String nombre, String plan, Fecha fec, int N) {
        super(nombre,plan,fec);
        this.bienes = new Bien[N];
        for(int i=0; i<N; i++)
            this.bienes[i] = null;
        this.DIMF = N;
        this.cantBienes = 0;
    }    

    private void setDIMF(int DIMF) {
        this.DIMF = DIMF;
    }

    private void setCantBienes(int cantBienes) {
        this.cantBienes = cantBienes;
    }

    public int getDIMF() {
        return DIMF;
    }

    public int getCantBienes() {
        return cantBienes;
    }

    public boolean agregarBien(String desc, int cant, double costo) {
        if(getCantBienes() < getDIMF()) {
            this.bienes[this.cantBienes++] = new Bien(desc,cant,costo);
            return true;
        } else
            return false;
    }
    
    public double montoTotalSubsidio() {
        double Monto_total_subsidio_bienes = 0;
        for(int i=0; i<getCantBienes(); i++) {
            Monto_total_subsidio_bienes += this.bienes[i].getCostoFinal();
        }
        return Monto_total_subsidio_bienes;
    }
    
    public String toString() {
        String aux = "----- SUBSIDIO DE BIENES -----\n";
        aux += super.toString() + "\n";
        aux += montoTotalSubsidio() + "\n";
        for(int i=0; i<getCantBienes(); i++) {
            aux += this.bienes[i].getDescripcion() + "\n";
        }
        return aux;
    }
}
