/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sorteo;

/**
 *
 * @author fededobal
 */
public class Persona {
    private String nombre;
    private int dni;
    private double colab;
    
    public Persona(String nombre, int dni, double colab) {
        this.nombre = nombre;
        this.dni = dni;
        this.colab = colab;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public double getColab() {
        return colab;
    }

    public void setColab(double colab) {
        this.colab = colab;
    }

    @Override
    public String toString() {
        return "Persona{" + "nombre=" + nombre + ", dni=" + dni + ", colab=" + colab + '}';
    }
    
    
}
