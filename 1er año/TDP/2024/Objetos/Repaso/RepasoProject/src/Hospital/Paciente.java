/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Hospital;

/**
 *
 * @author Federico Dobal
 */
public class Paciente {
    private int dni;
    private String nombre, obraSocial;

    public Paciente(int dni, String nombre, String obraSocial) {
        this.dni = dni;
        this.nombre = nombre;
        this.obraSocial = obraSocial;
    }

    public int getDni() {
        return dni;
    }

}
