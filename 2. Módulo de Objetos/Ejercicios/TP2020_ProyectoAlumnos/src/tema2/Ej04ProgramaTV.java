/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
    Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en 
cada día se entrevistarán a 8 personas en distinto turno. 
    a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide 
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las 
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así 
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 
40 cupos de casting. 
Una vez finalizada la inscripción:  
    b) Informar para cada día y turno el nombre de la persona a entrevistar. 
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar.

 * @author paliv
 */
public class Ej04ProgramaTV {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        String fin="ZZZ";
        Persona [][] matriz = new Persona [5][8];
        
        //ingreso datos
        int i=-1,j=-1,cupos=0;
        Persona p;
        p = leer();
        while ( (!p.getNombre().equals("ZZZ")) && cupos<40){
            j=-1;
            i++;
            while ( (!p.getNombre().equals("ZZZ")) && cupos<40 && j<7){
                cupos++;
                j++;
                matriz[i][j]=p;
                p = leer();
            }
        }
        
        //informo
        System.out.println("Elementos de la matriz: ");
        for (int k=0; k<=i; k++){
            System.out.println("Dia "+k);
            int ultimo;
            if (k==i) //si voy a recorrer la ultima fila
                ultimo=j; //tengo que recorrer hasta la columna j
            else
                ultimo=7; //sino recorro hasta el final
            for (int l=0; l<=ultimo; l++){
                System.out.println(matriz[k][l] + " ");
            }
            System.out.println();
        }
    }
    
    public static Persona leer(){
        Persona per = new Persona();
        per.setNombre(Lector.leerString());
        
        if (!per.getNombre().equals("ZZZ")){
            per.setEdad(GeneradorAleatorio.generarInt(60)+18);
            per.setDNI (GeneradorAleatorio.generarInt(1000));
        }
        
        return per;
    }
}
