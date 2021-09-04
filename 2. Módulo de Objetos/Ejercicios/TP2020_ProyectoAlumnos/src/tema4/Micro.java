/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
4-A- Definir una clase para representar micros. Un micro conoce su patente, destino, hora 
salida, el estado de sus 20 asientos (es decir si está o no ocupado) y la cantidad de asientos 
ocupados al momento.  Lea detenidamente a) y b) y luego implemente.
    a) Implemente un constructor que permita iniciar el micro con una patente,  un destino y 
una hora de salida (recibidas por parámetro) y sin pasajeros.
    b) Implemente métodos para:
        i.devolver/modificar patente, destino y hora de salida
        ii.devolver la cantidad de asientos ocupados
        iii.devolver si el micro está lleno
        iv.validar un número de asiento recibido como parámetro (es decir, devolver si está 
        en rango o no)
        v.devolver el estado de un nro. de asiento válido recibido como parámetro
        vi.ocupar un nro. de asiento válido recibido como parámetro
        vii.liberar un nro. de asiento válido recibido como parámetro
        viii.devolver el nro. del primer asiento libre

 * @author paliv
 */
public class Micro {
    private String patente;
    private String destino;
    private String horaSalida;
    private boolean [] vector;
    private int ocupados;
    
    public Micro (){
        
    }
    
    public Micro(String patente, String destino, String horaSalida){
        this.patente=patente;
        this.destino=destino;
        this.horaSalida=horaSalida;
        vector = new boolean[20]; //inicializa automaticamente en false
        ocupados=0;
    }
    
    public void setPatente(String patente){
        this.patente=patente;
    }
    
    public void setDestino(String destino){
        this.destino=destino;
    }
    
    public void setHoraSalida(String horaSalida){
        this.horaSalida=horaSalida;
    }
    
    public void setOcupados(int ocupados) {
        this.ocupados = ocupados;
    }
    
    public String getPatente(){
        return patente;
    }
    
    public String getDestino(){
        return destino;
    }
    
    public String getHoraSalida(){
        return horaSalida;
    }

    public int getOcupados() {
        return ocupados;
    }
    
    public boolean estaLlenoElMicro(){
        return ocupados == 20;
    }
    
    public boolean validacionAsiento(int unNro){
        return (-1 < unNro) && (unNro < 20);
    }
    
    public boolean getEstadoAsiento(int unNro){
        return vector[unNro];
    }
    
    public void setAsiento(int unNro){
        vector[unNro]=true;
        ocupados++;
    }
    
    public void setAsientoLibre(int unNro){
        vector[unNro]=false;
        ocupados--;
    }
    
    public int getPrimerAsientoLibre(){
        int i=0;
        while (i<20 && vector[i])
            i++;
        return i;
    }
    
    
    
}