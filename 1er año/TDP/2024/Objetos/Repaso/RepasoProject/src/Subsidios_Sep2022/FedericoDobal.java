package Subsidios_Sep2022;
/**
 *
 * @author Federico Dobal
 */
public class FedericoDobal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        SubsidioEstadía S1 = new SubsidioEstadía("Federico","Plan 1",new Fecha(15,6,2025),"Neuquén",500000,7,150000);
        SubsidioBienes S2 = new SubsidioBienes("Paola","Plan 2",new Fecha(5,9,2023),15);
        
        S2.agregarBien("Cafetera Philips con filtro reutilizable.", 5, 35000);
        
        System.out.println(S1.toString());
        System.out.println(S2.toString());
    }
    
}
