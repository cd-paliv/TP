/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

/**
2. Genere un programa principal que cree una balanza e inicie una compra. Lea información desde 
teclado correspondiente a los ítems comprados (peso en kg y precio por kg) hasta que se ingresa 
uno con peso 0.  Registre cada producto en la balanza. Al finalizar, informe el resumen de la compra. 
 * @author paliv
 */
public class BalanzaEj {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Balanza b = new Balanza();
        b.iniciarCompra();
        double precio;
        
        System.out.println("Ingrese peso en kg de producto -0 para finalizar ingreso de datos-");
        Producto prod = new Producto();
        prod.setPesoEnKg(Lector.leerDouble());
        while (prod.getPesoEnKg() != 0){
            //System.out.println("Ingrese peso en kg de producto");
            prod.setDescripcion(Lector.leerString());
            precio = Lector.leerDouble();
            b.registrarProducto(prod, precio);
            System.out.println("Ingrese peso en kg de producto");
            prod.setPesoEnKg(Lector.leerDouble());
        }
        System.out.println(b.devolverResumenDeCompra());
    }
}
