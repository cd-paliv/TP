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
public class LibroAutor {
    private String nombre;
    private String biografia;
    
    public String getNombre(){
        return nombre;
    }
    
    public String getBiografia(){
        return biografia;
    }
    
    public void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    public void setBiografia(String unaBio){
        biografia=unaBio;
    }
    
    @Override
    public String toString(){
        String aux;
        aux=nombre + " (Biografía: "+biografia+")";
        return aux;
    }
}
