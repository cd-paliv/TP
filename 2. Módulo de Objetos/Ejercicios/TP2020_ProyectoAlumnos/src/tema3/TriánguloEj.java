/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

//import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

/**
1.   B- ​Realizar un programa principal que instancie un triángulo, le cargue información leída desde 
teclado  e informe en consola el perímetro y el área.  
 * @author paliv
 */
public class TriánguloEj {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        /* Parte 1
        Triangulo t = new Triangulo();
        //System.out.println("Ingrese lado 1 del triángulo");
        t.setLado1(GeneradorAleatorio.generarDouble(20));
        //System.out.println("Ingrese lado 2 del triángulo");
        t.setLado2(GeneradorAleatorio.generarDouble(20));
        //System.out.println("Ingrese lado 3 del triángulo");
        t.setLado3(GeneradorAleatorio.generarDouble(20));
        //System.out.println("Ingrese color del relleno del triángulo");
        t.setColorRelleno("Rojo");
        //System.out.println("Ingrese color de la linea del triángulo");
        t.setColorLinea("Amarillo");
        t.calcularArea();
        t.calcularPerimetro();
        System.out.println("El área de un triangulo con los lados "+t.getLado1()+", "+t.getLado2()+", "+t.getLado3()+" es: "+t.getArea()+", y el perímetro: "+t.getPerimetro());
        */
        
        //Parte 2.
        Triangulo t1 = new Triangulo("Rojo", "Amarillo", GeneradorAleatorio.generarDouble(20), GeneradorAleatorio.generarDouble(20), GeneradorAleatorio.generarDouble(20));
        System.out.println(t1.toString());
        
        Triangulo t2 = new Triangulo(); //nulo
        
    }
}
