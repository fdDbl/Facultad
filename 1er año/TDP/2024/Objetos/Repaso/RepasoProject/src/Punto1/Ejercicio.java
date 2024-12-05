package Punto1;
public class Ejercicio {
    public static void main(String[] args) {
        Proyecto p = new Proyecto("Apple",3556552,"Steve Jobs");
        
        Investigador i1 = new Investigador("Federico Dobal",3,"Bioinformática");
        Investigador i2 = new Investigador("Gonzalo Villareal",1,"Paralelismo");
        Investigador i3 = new Investigador("Néstor Castro",2,"Ingeniería");
        p.agregarInvestigador(i1);
        p.agregarInvestigador(i2);
        p.agregarInvestigador(i3);
        
        i1.agregarSubsidios(new Subsidio(750000,"Viáticos"));
        i1.agregarSubsidios(new Subsidio(250000,"Nafta"));
        i2.agregarSubsidios(new Subsidio(750000,"Viáticos"));
        i2.agregarSubsidios(new Subsidio(250000,"Nafta"));
        i3.agregarSubsidios(new Subsidio(750000,"Viáticos"));
        i3.agregarSubsidios(new Subsidio(250000,"Nafta"));
        
        p.otorgarTodos("Gonzalo Villareal");
        
        System.out.println(p.toString());
    }
    
}
