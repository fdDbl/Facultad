/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Librería;

/**
 *
 * @author fededobal
 */
public class Ticket {
    private int nroTicket;
    private int dni;
    private int cantLibros;
    private double monto;
    private String medioDePago;
    
    public Ticket(int nro, int dni, int cant, double monto, String medio) {
        this.nroTicket = nro;
        this.dni = dni;
        this.cantLibros = cant;
        this.monto = monto;
        this.medioDePago = medio;
    }

    public int getNroTicket() {
        return nroTicket;
    }

    public void setNroTicket(int nroTicket) {
        this.nroTicket = nroTicket;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getCantLibros() {
        return cantLibros;
    }

    public void setCantLibros(int cantLibros) {
        this.cantLibros = cantLibros;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMedioDePago() {
        return medioDePago;
    }

    public void setMedioDePago(String medioDePago) {
        this.medioDePago = medioDePago;
    }
    
    public String toString() {
        return "Nro de ticket: " + this.nroTicket +
               ", DNI: " + this.dni +
               ", Cantidad de libros: " + this.cantLibros +
               ", Monto abonado: " + this.monto +
               ", Medio de pago: " + this.medioDePago;
    }
}
