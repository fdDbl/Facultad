/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Banco;

/**
 *
 * @author Federico Dobal
 */
public abstract class Cuenta {
    private int nroCuenta, dniCliente;
    private double saldo;
    private boolean estado;
    private int cantMovimientos;
    private Movimiento[] movimientos;

    public Cuenta(int nro, int dni) {
        setNroCuenta(nro);
        setDniCliente(dni);
        setSaldo(0);
        setEstado(true);
        setCantMovimientos(0);
        this.movimientos = new Movimiento[20];
    }
    
    public int getNroCuenta() {
        return nroCuenta;
    }

    public void setNroCuenta(int nroCuenta) {
        this.nroCuenta = nroCuenta;
    }

    public int getDniCliente() {
        return dniCliente;
    }

    public void setDniCliente(int dniCliente) {
        this.dniCliente = dniCliente;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public String getEstado() {
        if(estado)
            return "Disponible";
        else
            return "Cuenta cancelada";
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public int getCantMovimientos() {
        return cantMovimientos;
    }

    public void setCantMovimientos(int cantMovimientos) {
        this.cantMovimientos = cantMovimientos;
    }
    
    public String resumenMovimientos() {
        String aux = "";
                for(int i = 0; i < getCantMovimientos(); i++) {
                    aux += "      MOVIMIENTO " + (i+1) + ": \n" +
                           this.movimientos[i].getTipo() + " de $" + this.movimientos[i].getMonto() + "\n";
                }
        return aux;
    }
    
    public void nuevoMovimiento(String tipo, double unMonto) {
        if(getCantMovimientos() < 20)
            this.movimientos[cantMovimientos++] = new Movimiento(tipo,unMonto);
    }
    
    public void depositar(double unMonto) {
        if(this.estado == true) {
            this.saldo += unMonto;
            nuevoMovimiento("Deposito",unMonto);
        }
    }
    
    public abstract boolean esPosibleExtraer(double unMonto);
    
    public boolean extraer(double unMonto) {
        if(esPosibleExtraer(unMonto)) {
            this.saldo -= unMonto;
            nuevoMovimiento("Extraccion",unMonto);
            return true;
        } else
            return false;
    }
    
    public abstract void cobrarMantenimiento();
    
    public String resumen() {
        String aux = "----- RESUMEN DE CUENTA ----- \n" +
                "- Nro. de cuenta: " + getNroCuenta() + "\n" +
                "- DNI:  " + getDniCliente() + "\n" +
                "- ULTIMOS MOVIMIENTOS: \n" + resumenMovimientos() +
                "- Estado de la cuenta: " + getEstado() + "\n" +
                "- Saldo disponible: $" + getSaldo() + "\n";
        return aux;
    }
}
