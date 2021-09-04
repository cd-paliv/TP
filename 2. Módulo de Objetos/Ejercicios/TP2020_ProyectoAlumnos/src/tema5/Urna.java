/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 ​Queremos representar dos tipos de urnas electrónicas: electorales (usada en elecciones donde se 
presentan varias listas) y de referéndum (usada para saber si la población está a favor/en contra de la 
aprobación de una ley).  
    ●Cualquier urna se caracteriza por su número de urna y un contador de votos en blanco.  
    ●Una urna electoral es una urna que se caracteriza además por la cantidad de listas existentes y por 
mantener un contador de votos para cada lista (son “L” listas, y están numeradas desde 0). 
    ●Una urna de referéndum es una urna que se caracteriza además por mantener un contador de votos a 
favor y un contador de votos en contra.  
    A) ​Realice el modelo de clases. Implemente las clases con sus atributos y métodos para obtener/modificar el 
valor de aquellos que considere adecuado.  
    B) ​Implemente constructores. El constructor de las urnas electorales recibe dos números “U” y “L” e inicia el 
número de urna a “U”, la cant. de listas a “L”, y todos los contadores de votos a 0. El constructor de las urnas 
de referéndum recibe un nro. “U” e inicia el número de urna a “U” y todos sus contadores de votos a 0. 
    C) ​Incorpore los métodos listados a continuación:  
i. ​Cualquier urna debe saber responder al mensaje ​votarEnBlanco ​que incrementa en 1 el contador de 
votos en blanco.  
ii.​  Las urnas electorales deben responder a los mensajes: 
    ●validarNumeroDeLista: ​recibe un nro. “N” y devuelve un boolean indicando si N es un nro. de lista 
válido.  
    ●votarPorLista: recibe un nro. de lista válido “I” y debe ​incrementar en 1 el contador de votos de esa 
lista.  
    ●devolverVotosPorLista​: recibe un nro de lista válido “I” y devuelve la cantidad de votos para esa lista. 
iii.​ Las urnas de referéndum deben responder a los mensajes: 
    ●votarAFavor:​ incrementa en 1 el contador de votos a favor.  
    ●votarEnContra: ​incrementa en 1 el contador de votos en contra. 
iv.​ Ambos tipos de urnas deben saber responder al mensaje ​calcularGanador pero de manera diferente: 
    ●Para las urnas electorales debe devolver el nro. de la lista ganadora. En caso de empate entre 2 o más 
 listas, se elegirá una como ganadora – indistintamente.  
    ●Para las urnas de referéndum debe devolver un nro. -1 si hubo empate, 0 si ganó la opción En Contra, 1 
 si gano la opción A Favor.  
v.​ Ambos tipos de urnas deben saber responder al mensaje ​calcularTotalVotos pero de manera diferente: 
    ●Para las urnas electorales debe devolver la suma de votos en blanco y votos a favor de cada lista.  
    ●Para las urnas de referéndum debe devolver la suma de votos en blanco, a favor y en contra.  

 * @author paliv
 */
public abstract class Urna {
    private int numero;
    private int votosBlanco;
    
    public Urna (int numero){
        this.numero=numero;
        votosBlanco=0;
    }
    
    public int getNumero(){
        return numero;
    }
    
    public int getVotosBlanco(){
        return votosBlanco;
    }
    
    public void setNumero(int numero){
        this.numero=numero;
    }
    
    public void votarEnBlanco(){
        votosBlanco++;
    }
    
    public abstract int calcularGanador();
    public abstract int calcularTotalVotos();
    
}
