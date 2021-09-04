/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

//import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

/**
 Utilizando la clase Persona (ya implementada). Realice un programa que almacene en 
un vector 15 personas. La información de cada persona debe leerse de teclado. Luego de 
almacenar la información: 
    - Informe la cantidad de personas mayores de 65 años. 
   -  Muestre la representación de la persona con menor DNI. 

 * @author paliv
 */
public class Ej02Personas {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Persona [] vector = new Persona [15];
        
        //ingreso personas
        int i,suma=0;
        for (i=0; i<15; i++){
            Persona p = new Persona();
            //System.out.println("Ingrese nombre");
            p.setNombre(GeneradorAleatorio.generarString(10));
            //p.setNombre (Lector.leerString());
            //System.out.println("Ingrese edad");
            p.setEdad(GeneradorAleatorio.generarInt(20)+18);
            //p.setEdad(Lector.leerInt());
            //System.out.println("Ingrese DNI");
            p.setDNI (GeneradorAleatorio.generarInt(1000));
            //p.setDNI (Lector.leerInt());
            vector[i]=p;
        }
        
        //mayores a 65 y menor dni
        int cantMayor=0, min=999;
        Persona minP=null;
        for (i=0; i<15; i++){
            if (65>vector[i].getEdad())
                cantMayor = cantMayor +1;
            if (min>vector[i].getDNI()){
                min=vector[i].getDNI();
                minP=vector[i];
            }
        }
        
        //imprimo
        if (minP != null && cantMayor != 0){
            System.out.println("Cantidad de personas mayores a 65: "+cantMayor);
            System.out.println("Persona con menor DNI: "+minP);
        }else 
            System.out.println("No hay elementos en el vector");
    }
}
