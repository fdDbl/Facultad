/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Subsidios_Sep2022;

/**
 *
 * @author Federico Dobal
 */
public class Fecha {
    private int dia;
    private int mes;
    private int año;
    
    public Fecha(int unDia, int unMes, int unAño) {
        this.dia = unDia;
        this.mes = unMes;
        this.año = unAño;
    }

    public int getDia() {
        return dia;
    }

    public int getMes() {
        return mes;
    }

    public int getAño() {
        return año;
    }
    
    public String toString() {
        return getDia() + "/" + getMes() + "/" + getAño();
    }
}
