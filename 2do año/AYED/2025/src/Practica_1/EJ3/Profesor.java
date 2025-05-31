/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica_1.EJ3;

/**
 *
 * @author Federico Dobal
 */
public class Profesor {
    private String nombre;
    private String apellido;
    private int catedra;
    private String email;
    private String facultad;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getCatedra() {
        return catedra;
    }

    public void setCatedra(int catedra) {
        this.catedra = catedra;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFacultad() {
        return facultad;
    }

    public void setFacultad(String facultad) {
        this.facultad = facultad;
    }

    public String tusDatos() {
        return "PROFESOR: {" + "nombre=" + getNombre() + ", apellido=" + getApellido() + ", catedra=" + getCatedra() + ", email=" + getEmail() + ", facultad=" + getFacultad() + '}';
    }

    
}
