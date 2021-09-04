/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/*
5-A- ​Modifique el ejercicio 2-A. Ahora la balanza debe poder generar un resumen de compra más 
completo. Para eso agregue a la balanza la característica ​resumen (String). Modifique los métodos: 
    ▪iniciarCompra para que además inicie el ​resumen en el String vacío.  
    ▪registrarProducto para que reciba un objeto Producto (que se caracteriza por peso en kg y 
descripción) y su precio por kg. La operación debe realizar las actualizaciones en monto 
/cantidad de ítems y adicionar al ​resumen (string) la descripción y el monto pagado por este 
producto.  
    ▪devolverResumenDeCompra() para que retorne un String del siguiente estilo: “​Naranja 100 
pesos – Banana 40 pesos – Lechuga 50 pesos – Total a pagar 190 pesos por la compra de 3 
productos” . La sección ​subrayada​ es el contenido de ​resumen


*/
public class Producto {
    
    private double monto;
    private int cantActual;
    private double pesoEnKg;
    private String descripcion;

    public Producto(){

    }
    
    public Producto(double unPeso,String unaDescripcion){
        pesoEnKg = unPeso;
        descripcion = unaDescripcion;
    }
    
    public double getPesoEnKg() {
        return pesoEnKg;
    }

    public void setPesoEnKg(double unPeso) {
        pesoEnKg = unPeso;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String unaDescripcion) {
        descripcion = unaDescripcion;
    }
    
    public void iniciarCompra(){
        monto=0.0;
        cantActual=0;
        descripcion="";
    }
    
}