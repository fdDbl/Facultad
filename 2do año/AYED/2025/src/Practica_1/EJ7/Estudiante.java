package Practica_1.EJ7;
/**
 *
 * @author Federico Dobal
 */
public class Estudiante {
    private String nombre;
    private String apellido;
    private String fechaNacimiento;
    private String propuesta;
    private double promedio;
    private int cantMateriasEnCurso;

    public Estudiante(String nombre, String apellido, String fechaNacimiento, String propuesta, double promedio, int cantMateriasEnCurso) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
        this.propuesta = propuesta;
        this.promedio = promedio;
        this.cantMateriasEnCurso = cantMateriasEnCurso;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public String getPropuesta() {
        return propuesta;
    }

    public double getPromedio() {
        return promedio;
    }

    public int getCantMateriasEnCurso() {
        return cantMateriasEnCurso;
    }

    @Override
    public String toString() {
        return "Estudiante{" + "nombre=" + nombre + ", apellido=" + apellido + ", fechaNacimiento=" + fechaNacimiento + ", propuesta=" + propuesta + ", promedio=" + promedio + ", cantMateriasEnCurso=" + cantMateriasEnCurso + '}';
    }
    
    public void bajarDeAlgunaMateria() {
        this.cantMateriasEnCurso--;
    }
    
    public void dejarLibre() {
        this.cantMateriasEnCurso = 0;
        this.propuesta = "LIBRE";
    }
    
}
