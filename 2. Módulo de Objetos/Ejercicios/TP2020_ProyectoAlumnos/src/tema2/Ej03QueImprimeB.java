/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author vsanz
 */
public class Ej03QueImprimeB {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona p1; 
        Persona p2;
        p1 = new Persona();
        p1.setNombre("Pablo Sotile");
        p1.setDNI(11200413);
        p1.setEdad(40);
        p2 = new Persona();
        p2.setNombre("Julio Toledo");
        p2.setDNI(22433516);
        p2.setEdad(51);
        p1 = p2;  //hago que el objeto p1 guarde lo que tiene p2 (se pisa la info)
        p1.setEdad( p1.getEdad() + 1 ); //le sumo 1 a la edad de un objeto, pero como apuntan a la misma dirección se reemplaza en los dos objetos
        System.out.println(p2.toString());
        System.out.println(p1.toString());
        System.out.println( (p1 == p2) ); //el objeto p1 esta en la misma dirección que p2?
        System.out.println(p1.equals(p2));
    }
    
}
