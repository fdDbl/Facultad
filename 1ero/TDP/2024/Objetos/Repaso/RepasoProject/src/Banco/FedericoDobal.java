package Banco;

public class FedericoDobal {
    
    public static void main(String[] args) {
        Cuenta CA = new CajaDeAhorro(123,47222436,true);
        Cuenta CC = new CuentaCorriente(846,45613864,5000);
        
        CA.depositar(10000);
        CC.depositar(8000);
        
        CA.extraer(5000);
        CC.extraer(20000);
        
        System.out.println(CA.resumen());
        System.out.println(CC.resumen());
    }
}
