package Teorico_040722;

public class Programa {

    public static void main(String[] args) {
        A a = new B(1);
        System.out.println(a.uno());
    }
}
    
// EL PROGRAMA NO COMPILA YA QUE EL MÉTODO dos() DE B SE LLAMA RECURSIVAMENTE CON return this.dos() Y NO TERMINA.
// LA SOLUCIÓN SERÍA CAMBIAR this POR super.