/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Banco;

/**
 *
 * @author Federico Dobal
 */
public class CajaDeAhorro extends Cuenta {
    private boolean TarjetaDeCredito;
    
    public CajaDeAhorro(int nro, int dni, boolean TDC) {
        super(nro,dni);
        setTarjetaDeCredito(TDC);
    }
    
    public boolean esPosibleExtraer(double unMonto) {
        return this.getSaldo() >= unMonto;
    }
    
    public void cobrarMantenimiento() {
        double base;
        if(this.TarjetaDeCredito)
            base = 2000;
        else
            base = 1000;
        
        double mantenimiento = (base + (1/(this.getSaldo()+1)));
        if(this.esPosibleExtraer(mantenimiento)) {
            this.extraer(mantenimiento);
            System.out.println("Se ha cobrado el mantenimiento de su cuenta ($" + mantenimiento + "). \n");
        } else {
            this.setEstado(false);
            System.out.println("Su cuenta HA SIDO CANCELADA ya que no posee el saldo suficiente para abonar el mantenimiento de la misma ($" + mantenimiento + "). \n");
        }
            
    }

    public void setTarjetaDeCredito(boolean TarjetaDeCredito) {
        this.TarjetaDeCredito = TarjetaDeCredito;
    }
    
    public String tieneTDC() {
        if(TarjetaDeCredito)
            return "Esta cuenta tiene una tarjeta de credito activa";
        else
            return "Esta cuenta no tiene tarjeta de crédito";
    }
    
    public String resumen() {
        String aux = super.resumen() + tieneTDC() + "\n";
        return aux;
    }
}
