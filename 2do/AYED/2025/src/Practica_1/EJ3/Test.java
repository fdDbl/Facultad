/*
    Creación de instancias mediante el uso del operador new
    a. Cree una clase llamada Estudiante con los atributos especificados abajo y sus
    correspondientes métodos getters y setters (haga uso de las facilidades que brinda
    eclipse)
        ● nombre
        ● apellido
        ● comision
        ● email
        ● direccion
    b. Cree una clase llamada Profesor con los atributos especificados abajo y sus
    correspondientes métodos getters y setters (haga uso de las facilidades que brinda
    eclipse)
        ● nombre
        ● apellido
        ● email
        ● catedra
        ● facultad
    c. Agregue un método de instancia llamado tusDatos() en la clase Estudiante y en la
    clase Profesor, que retorne un String con los datos de los atributos de las mismas.
    Para acceder a los valores de los atributos utilice los getters previamente
    definidos.
    d. Escriba una clase llamada Test con el método main, el cual cree un arreglo con 2
    objetos Estudiante, otro arreglo con 3 objetos Profesor, y luego recorra ambos
    arreglos imprimiendo los valores obtenidos mediante el método tusDatos(). Recuerde
    asignar los valores de los atributos de los objetos Estudiante y Profesor invocando los
    respectivos métodos setters.
    e. Agregue dos breakpoints, uno en la línea donde itera sobre los estudiantes y otro en la
    línea donde itera sobre los profesores
    f. Ejecute la clase Test en modo debug y avance paso a paso visualizando si el
    estudiante o el profesor recuperado es lo esperado.
 */
package Practica_1.EJ3;
import java.util.Random;
public class Test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estudiante[] arregloE = new Estudiante[2];
        Profesor[] arregloP = new Profesor[3];
        Random rand = new Random();
        for(int i=0; i<2; i++) {
            arregloE[i] = new Estudiante();
            arregloE[i].setNombre("Fulanito " + i);
            arregloE[i].setApellido("De tal " + i);
            arregloE[i].setEmail(rand.nextInt(5000) + ".mail" + "@alumnos.unlp.edu.ar");
            arregloE[i].setDireccion(rand.nextInt(100) + " Address");
            arregloE[i].setComision(rand.nextInt(50));
        }
        for(int i=0; i<3; i++) {
            arregloP[i] = new Profesor();
            arregloP[i].setNombre("Menganito " + i);
            arregloP[i].setApellido("De tal " + i);
            arregloP[i].setEmail(rand.nextInt(5000) + ".docente" + "@info.unlp.edu.ar");
            arregloP[i].setFacultad("Facultad " + rand.nextInt(100));
            arregloP[i].setCatedra(rand.nextInt(50));
        }
        for(int i=0; i<2; i++) {
            System.out.println(arregloE[i].tusDatos());
        }
        for(int i=0; i<3; i++) {
            System.out.println(arregloP[i].tusDatos());
        }
    }
    
}
