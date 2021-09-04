/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
4. Generar una clase para representar círculos. Los círculos se caracterizan por su radio (double), 
el color de relleno (String)  y el color de línea (String). El círculo debe saber:  
    ▪Devolver/modificar el valor de cada uno de sus atributos (get# y set#) 
    ▪Calcular el área y devolverla (método ​calcularArea) 
    ▪Calcular el perímetro y devolverlo (método ​calcularPerimetro)

Parte 2. Ej 6. Defina constructores para la clase Círculo (definida en la Act. 3): el ​primer constructor 
debe recibir un valor para el radio y para los colores de línea y relleno; el ​segundo 
constructor no debe poseer parámetros ni código (constructor nulo).  


* @author paliv
 */
public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    public Circulo (){
        
    }
    
    public Circulo(double radio, String colorRelleno, String colorLinea){
        this.radio=radio;
        this.colorRelleno=colorRelleno;
        this.colorLinea=colorLinea;
    }
    
    public double getRadio(){
        return radio;
    }
    
    public String getColorRelleno(){
        return colorRelleno;
    }
    
    public String getColorLinea(){
        return colorLinea;
    }
    
    public void setRadio(double unRadio){
        radio=unRadio;
    }
    
    public void setColorRelleno(String unColor){
        colorRelleno=unColor;
    }
    
    public void setColorLinea(String unColor){
        colorLinea=unColor;
    }
    
    public double calcularArea(){
        double aux = radio*radio;
        return Math.PI*aux;
    }
    
    public double calcularPerimetro(){
        double aux = Math.PI*2;
        return aux*radio;
    }
    
    
    
}
