/*
Demo que crea objetos Libro invocando a los constructores definidos. Tema 4.
 */
package tema4;

import PaqueteLectura.Lector;
/**
Modifique el programa ppal. (carpeta tema 4) para instanciar un libro con su autor, 
considerando las modificaciones realizadas en A). Los datos se ingresan por teclado.
 * @author vsanz
 */
public class LibroDemo01Constructores {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        LibroAutor a = new LibroAutor();
        
        System.out.println("Ingrese nombre del autor");
        a.setNombre(Lector.leerString());
        System.out.println("Ingrese biografía del autor");
        a.setBiografia(Lector.leerString());
        System.out.println("Ingrese título del libro, editorial, año de edición, numero ISBN y precio -EN ESE ORDEN-");
        Libro libro1= new  Libro( Lector.leerString(),   
                                 Lector.leerString(), Lector.leerInt(),   
                                 a, Lector.leerString(), Lector.leerDouble());
        
        
        System.out.println("Ingrese nombre del autor"); //como autor es un objeto se cambió el nombre en la dirección, por lo cual las dos veces va a imprimir este nombre
        a.setNombre(Lector.leerString());
        System.out.println("Ingrese título del libro, editorial y numero ISBN -EN ESE ORDEN-");
        Libro libro2= new Libro(Lector.leerString(),  Lector.leerString(), a, Lector.leerString());
        
        System.out.println(libro1.toString()); //si imprimiese libro1 antes de cargar el libro2 se imprimiría aquel autor y no el segundo
        System.out.println(libro2.toString());
        
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        
        Libro libro3= new Libro(); //nulo
    }
    
}
