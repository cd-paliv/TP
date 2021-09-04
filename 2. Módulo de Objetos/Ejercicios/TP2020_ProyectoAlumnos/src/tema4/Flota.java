/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author paliv
 */
public class Flota {
    private final Micro [] vector;
    private int cantMicros;
    
    public Flota(){
        vector = new Micro [15];
        cantMicros=-1; //como no apunto a nada no tengo micros aka -1
    }
    
    public boolean estaCompleta(){
        return cantMicros == 14;
    }
    
    public void setMicro(Micro unMicro){
        if (cantMicros < 14){
            cantMicros++;
            vector[cantMicros]=unMicro;
        }
    }
    
    public boolean eliminarPatente(String unaPatente){ //devuelve si eliminó o no
        int i=0;
        boolean exito=false;
        while (i<=cantMicros &&(!vector[i].getPatente().equals(unaPatente))){
            i++;
        }
        if (vector[i].getPatente().equals(unaPatente)){
            for(int j = i; j < cantMicros; j++)
                vector[j]=vector[j+1];
            cantMicros--;
            exito=true;
        }
        return exito;
    }
    
    public Micro buscarPatente(String unaPatente){ //devuelve el micro con patente igual a la ingresada
        int i=0;
        while (i<=cantMicros &&(!vector[i].getPatente().equals(unaPatente))){
            i++;
        }
        if (vector[i].getPatente().equals(unaPatente)){
            return vector[i];
        }else
            return null;
    }
    
    public Micro buscarDestino(String unDestino){ //devuelve micro con destino igual al ingresado
        int i=0;
        while (i<=cantMicros &&(!vector[i].getDestino().equals(unDestino))){
            i++;
        }
        if (vector[i].getDestino().equals(unDestino)){
            return vector[i];
        }else
            return null;
    }
    
    
    
}
