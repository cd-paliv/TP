/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
Un objeto partido puede crearse sin valores iniciales o enviando en el mensaje de creación el nombre del 
equipo local, el nombre del visitante, la cantidad de goles del local y del visitante (en ese 
orden).
Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en el 
campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con 
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga informar: 
 
- La cantidad de partidos que ganó River. 
- El total de goles que realizó Boca jugando de local. 
- El porcentaje de partidos finalizados con empate.  

 * @author paliv
 */
public class Ej06Partido {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        String fin="ZZZ";
        int df=20;
        int dl=0;
        Partido [] vector = new Partido [df];
        
        System.out.println("Ingrese el nombre del equipo visitante");
        String visitante=Lector.leerString();
        while ((!visitante.equals(fin)) && (dl<df)){
            //ingreso datos
            Partido p = new Partido();
            p.setVisitante(visitante);
            System.out.println("Ingrese cantidad de goles del equipo visitante");
            p.setGolesVisitante(Lector.leerInt());
            System.out.println("Ingrese nombre del equipo local");
            p.setLocal(Lector.leerString());
            System.out.println("Ingrese cantidad de goles del equipo local");
            p.setGolesLocal(Lector.leerInt());
            
            vector[dl]=p;
            dl++;
            System.out.println("Otro partido");
            System.out.println("Ingrese el nombre del equipo visitante");
            visitante=Lector.leerString();
        }
        
        //busco
        int i, cantRiver=0, cantBoca=0, cantEmpate=0;
        for (i=0; i<dl; i++){ //CUENTA TODO MAL JASDJSJ
            if (vector[i].getLocal().equals("Boca"))
                cantBoca=cantBoca + vector[i].getGolesLocal();
            if (vector[i].hayGanador()){
                if (vector[i].getGanador().equals("River"))
                    cantRiver++;
            }else
                if (vector[i].hayEmpate())
                    cantEmpate++;
            
        }
        
        //imprimo
        System.out.println("River ganó "+cantRiver+" partidos.");
        System.out.println("Boca metió "+cantBoca+" goles como local.");
        if (dl != 0)
            System.out.println("Porcentaje de partidos empatados: %"+(cantEmpate*100)/dl);
    }
}
