/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import tema1.Auto;


/**
Utilizando la clase Auto dada por la cátedra.  
Definir una clase para representar un Estacionamiento. El estacionamiento conoce su 
nombre, dirección, hora de apertura y hora de cierre, y almacena para cada número de 
piso (1..N) y número de plaza (1..M), el auto que ocupa dicho lugar. 
 a) Implemente un constructor que reciba nombre y dirección, e inicie el 
estacionamiento con hora de apertura “8:00”, hora de cierre “21:00”, y para 5 pisos y 
10 plazas por piso. El estacionamiento inicialmente no tiene autos.  
 b) Implemente un segundo constructor que reciba nombre, dirección,  hora de 
apertura, hora de cierre, el número de pisos (N)  y el número de plazas por piso (M) 
e inicie el  estacionamiento con los datos recibidos, y sin autos.  
 c) Implemente métodos para:  
    -Dado un auto A, un número de piso X y un número de plaza Y, registrar al auto en 
el estacionamiento en el lugar X,Y. Suponga que X, Y son válidos y que el lugar 
está desocupado. 
    -Dada una patente, obtener un string que contenga el número de piso y plaza 
donde está dicho auto. En caso de no encontrarse, retornar el mensaje “Auto 
Inexistente”. 
    -Obtener un String con la representación del estacionamiento. Ejemplo: “Piso 1 
Plaza 1: ​libre...Piso 1 Plaza 2: ​representación del auto...Piso 2 Plaza 1: ​libre 
​
… etc” 

 * @author paliv
 */
public class Estacionamiento {
    private String nombre;
    private int direccion;
    private String horaApertura;
    private String horaCierre;
    private int numeroPiso;
    private int numeroPlaza;
    private Auto [][] matriz;
   
    Estacionamiento() {
    }
    
    public void setEstacionamiento(String unNombre, int unaDireccion){
        nombre=unNombre;
        direccion=unaDireccion;
        horaApertura="08:00";
        horaCierre="21:00";
        numeroPiso=5;
        numeroPlaza=10;
        matriz=new Auto[numeroPiso][numeroPlaza];
        this.inicializarMatriz();
    }
    
    public void setEstacionamiento(String unNombre, int unaDireccion,
                                    String unaApertura, String unCierre,
                                    int unPiso, int unaPlaza){
        nombre=unNombre;
        direccion=unaDireccion;
        horaApertura=unaApertura;
        horaCierre=unCierre;
        numeroPiso=unPiso;
        numeroPlaza=unaPlaza;
        matriz=new Auto[numeroPiso][numeroPlaza];
        this.inicializarMatriz();
    }
    
    private void inicializarMatriz(){
        for (int i=0; i<5; i++)
            for (int j=0; j<10; j++)
                matriz[i][j]=null;
    }
    
    public void setPosicion (Auto a, int x, int y){
        //matriz[x][y]=a;
        matriz[x-1][y-1]=a;
    }
    
    public String getPosicion(int unaPatente){
        boolean encontre=false;
        int i=0,j=0;
        while (!encontre && i<numeroPiso){
            while (!encontre && j<numeroPlaza){
                if ((matriz[i][j] != null) && (unaPatente == matriz[i][j].getPatente())){
                        encontre=true;
                    }else
                        j++;
            }
            i++;
        }
        String aux;
        if (encontre){
            aux = (i+1) + ", " + (j+1);
        }else{
            aux = "Auto inexistente";
        }
        return aux;
    }

    public String toStringEstacionamiento(){
        int i,j;
        String aux="";
        for (i=0; i<numeroPiso; i++){
            for (j=0; j<numeroPlaza; j++){
                aux=aux + "Piso " + (i+1) + ". Plaza " + (j+1);
                if (matriz[i][j] != null){
                    aux=aux + "| " + matriz[i][j].toString() + " \n";
                }else
                    aux=aux + "| -> Libre \n";  // (\n) es como un printLN
            }
        }
        return aux; //aux guarda algo así como un array de strings
    }
    
}
