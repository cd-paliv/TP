/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;

/**
4. Realizar un programa principal que instancie un círculo, le cargue información leída de teclado 
e informe en consola el perímetro y el área. 
* 
 * @author paliv
 */
public class CirculoEj {
    public static void main(String[] args) {
        
        Circulo c = new Circulo();
        System.out.println("Ingrese radio");
        c.setRadio(Lector.leerDouble());
        c.setColorRelleno("Amarillo");
        c.setColorLinea("Rojo");
        
        System.out.println("Área del circulo "+c.calcularArea());
        System.out.println("Perimetro del circulo "+c.calcularPerimetro());
        
        Circulo c1 = new Circulo();
        Circulo c2 = new Circulo(15.2, "Azul", "Violeta");
    }
}
