/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Banco;

/**
 *
 * @author Federico Dobal
 */
public class CuentaCorriente extends Cuenta {
    private double acuerdo;
    
    public CuentaCorriente(int nro, int dni, double acu) {
        super(nro,dni);
        this.acuerdo = acu;
    }
    
    public boolean esPosibleExtraer(double unMonto) {
        return ((getSaldo() + getAcuerdo()) > unMonto);
    }
    
    public void cobrarMantenimiento() {
        double mantenimiento = (this.acuerdo * 50);
        if(extraer(mantenimiento)) {
            System.out.println("Se ha cobrado el mantenimiento de su cuenta ($" + mantenimiento + "). \n");
        } else {
            this.setEstado(false);
            System.out.println("Su cuenta HA SIDO CANCELADA ya que no posee el saldo suficiente para abonar el mantenimiento de la misma ($" + mantenimiento + "). \n");
        }
    }

    public double getAcuerdo() {
        return acuerdo;
    }

    public void setAcuerdo(double acuerdo) {
        this.acuerdo = acuerdo;
    }
    
    public String resumen() {
        String aux = super.resumen() + "Esta cuenta tiene un acuerdo de: $" + getAcuerdo() + "\n";
        return aux;
    }
}
