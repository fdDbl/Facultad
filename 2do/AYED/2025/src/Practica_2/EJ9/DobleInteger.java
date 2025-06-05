package Practica_2.EJ9;
/**
 *
 * @author Federico Dobal
 */
public class DobleInteger {
    private Integer I1;
    private Integer I2;

    public DobleInteger(Integer i1, Integer i2) {
        this.I1 = i1;
        this.I2 = i2;
    }

    public Integer getI1() {
        return I1;
    }

    public void setI1(Integer I1) {
        this.I1 = I1;
    }

    public Integer getI2() {
        return I2;
    }

    public void setI2(Integer I2) {
        this.I2 = I2;
    }

    public String toString() {
        return "{" + I1 + "|" + I2 + "}";
    }
}
