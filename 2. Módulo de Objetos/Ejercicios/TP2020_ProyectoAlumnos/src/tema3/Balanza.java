/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
2.  Definir una clase para representar balanzas comerciales ​(​para ser utilizadas en verdulerías, 
carnicerías, etc). Una balanza comercial sólo mantiene el monto y la cantidad de items 
correspondientes a la compra actual (es decir, no almacena los ítems de la compra). La balanza 
debe responder a los siguientes mensajes:  
    ▪iniciarCompra(): inicializa el monto y cantidad de ítems de la compra actual.  
    ▪registrarProducto(​pesoEnKg, ​precioPorKg): recibe el peso en kg del ítem comprado y su precio 
por kg, debiendo  realizar las actualizaciones en el estado de la balanza.  
    ▪devolverMontoAPagar(): retorna el monto de la compra actual.  
    ▪devolverResumenDeCompra(): retorna un String del siguiente estilo “Total a pagar ​X ​por la 
compra de ​Y​ productos” , donde ​X​ es el monto e ​​ es la cantidad de ítems de la compra.  

 * @author paliv
 */
public class Balanza {
    private double monto;
    private int cantActual;
    private String descripcion;
    
    public void iniciarCompra(){
        monto=0.0;
        cantActual=0;
        descripcion = new String(); //lo genero vacío
    }
    
    public void registrarProducto(Producto p, double precioEnKg){
        /*
        double costo = p.getPesoEnKg()*precioEnKg;
        monto += costo;; //monto = monto + costo;
        */
        monto=monto + (p.getPesoEnKg()*precioEnKg);
        cantActual++;
        descripcion= descripcion + p.getDescripcion() + " $" + monto + " - "; //con esto voy llenando el string con todos los productos que voy teniendo
    }
    
    public double devolverMontoAPagar(){
        return monto;
    }
    
    public String devolverResumenDeCompra(){
        return descripcion + "Total a pagar $"+monto+" por la compra de "+cantActual+" productos";
    }
    
}
