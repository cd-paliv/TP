/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author paliv
 */
public class Circulo extends Figura{
    private double radio;
    
    public Circulo(double radio, String colorRelleno, String colorLinea){
        super(colorRelleno, colorLinea);
        this.radio=radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    @Override
    public double calcularArea(){
        double aux = radio*radio;
        return Math.PI*aux;
    }
    
    @Override
    public double calcularPerimetro(){
        double aux = Math.PI*2;
        return aux*radio;
    }
    
    @Override
    public String toString(){
       String aux = super.toString() + 
                    " Radio: " + getRadio();
       return aux;
    }
}
