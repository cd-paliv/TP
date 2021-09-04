/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
1.    A- ​Definir una clase para representar triángulos. Un triángulo se caracteriza por el tamaño de sus 
3 lados (double), el color de relleno (String) y el color de línea (String).  
El triángulo debe saber:  
    ▪Devolver/modificar el valor de cada uno de sus atributos (métodos ​get# y set#)  
    ▪Calcular el área y devolverla (método ​calcularArea) 
    ▪Calcular el perímetro y devolverlo (método ​calcularPerimetro) 
NOTA: Calcular el área con la fórmula [sqr.s(s-a)(s-b)(s-c)], donde a,b y c son los lados y s=a+b+c/2.
 La función raíz cuadrada es Math.sqrt(#)

   B- ​Realizar un programa principal que instancie un triángulo, le cargue información leída desde 
teclado  e informe en consola el perímetro y el área.  


Parte 2. Ej 1. ​Defina constructores para la clase Triángulo (definida en la Act. 3): el ​primer 
constructor debe recibir un valor para cada lado y para los colores de línea y relleno; el 
segundo constructor no debe poseer parámetros ni código (constructor nulo). 
* 
 * @author paliv
 */
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private double area;
    private double perimetro;
    private String colorRelleno;
    private String colorLinea;
    
    public String getColorRelleno(){
        return colorRelleno;
    }
    
    public String getColorLinea(){
        return colorLinea;
    }
    
    public double getLado1(){
        return lado1;
    }
    
    public double getLado2(){
        return lado2;
    }
    
    public double getLado3(){
        return lado3;
    }
    
    public double getArea(){
        return area;
    }
    
    public double getPerimetro(){
        return perimetro;
    }
    
    public void setColorRelleno(String unRelleno){
        colorRelleno = unRelleno;
    }
    
    public void setColorLinea(String unaLinea){
        colorLinea = unaLinea;
    }
    
    public void setLado1(double unLado){
         lado1 = unLado;
    }
    
    public void setLado2(double unLado){
         lado2 = unLado;
    }
    
    public void setLado3(double unLado){
         lado3 = unLado;
    }
    
    public void calcularArea(){
        double s = (perimetro)/2;
        area=Math.sqrt(s * (s-lado1) * (s-lado2) * (s-lado3));
    }
    
    public void calcularPerimetro (){
        perimetro = lado1 + lado2 + lado3;
    }
    
    public Triangulo (String unRelleno, String unaLinea, double unLado, double unLado2, double unLado3){
        colorRelleno = unRelleno;
        colorLinea = unaLinea;
        lado1 = unLado;
        lado2 = unLado2;
        lado3 = unLado3;
    }
    
    public Triangulo(){
   
    }
    
    @Override
    public String toString(){
        String aux;
        aux= "Triangulo relleno "+colorRelleno+" linea "+colorLinea+" lados: "+lado1+", "+lado2+", "+lado3;
        return aux;
    }
}
