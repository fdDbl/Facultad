package Practica_3.EJ4;
/**
 *
 * @author Federico Dobal
 */
public class AreaEmpresa {
    private final String id;
    private final int tardanza;

    public AreaEmpresa(String id, int t) {
        this.id = id;
        tardanza = t;
    }
    
    public String getId() {
        return id;
    }

    public int getTardanza() {
        return tardanza;
    }
    
}
