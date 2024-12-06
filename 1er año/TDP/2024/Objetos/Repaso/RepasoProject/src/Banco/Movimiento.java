/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Banco;

/**
 *
 * @author Federico Dobal
 */
public class Movimiento {
    private String tipo;
    private double monto;
    
    public Movimiento(String unTipo, double unMonto) {
        this.tipo = unTipo;
        this.monto = unMonto;
    }

    public String getTipo() {
        return tipo;
    }

    public double getMonto() {
        return monto;
    }
}
