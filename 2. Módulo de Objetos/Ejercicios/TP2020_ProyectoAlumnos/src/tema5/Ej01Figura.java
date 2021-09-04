/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

import PaqueteLectura.Lector;

/**
 *
 * @author paliv
 */
public class Ej01Figura {
    public static void main(String[] args) {
        Figura [] f = new Figura[3];
        
        System.out.println("Cuadrado");
        System.out.println("Ingrese lado del cuadrado");
        double lado=Lector.leerDouble();
        System.out.println("Ingrese color de relleno");
        String CR=Lector.leerString();
        System.out.println("Ingrese color de línea");
        String CL=Lector.leerString();
        f[0] = new Cuadrado(lado, CR, CL);
        
        System.out.println("Triángulo");
        System.out.println("Ingrese lado 1 del triángulo");
        lado = Lector.leerDouble();
        System.out.println("Ingrese lado 2 del triángulo");
        double lado2 = Lector.leerDouble();
        System.out.println("Ingrese lado 3 del triángulo");
        double lado3 = Lector.leerDouble();
        System.out.println("Ingrese color de relleno");
        CR=Lector.leerString();
        System.out.println("Ingrese color de línea");
        CL=Lector.leerString();
        f[1] = new Triangulo (CR,CL,lado,lado2,lado3);
        
        System.out.println("Círculo");
        System.out.println("Ingrese radio del círculo");
        double radio=Lector.leerDouble();
        System.out.println("Ingrese color de relleno");
        CR=Lector.leerString();
        System.out.println("Ingrese color de línea");
        CL=Lector.leerString();
        f[2] = new Circulo(radio, CR, CL);
        
        for (int i=0; i<3; i++)
            System.out.println(f[i].toString());
        
    }
}
