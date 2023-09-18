
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos

    import PaqueteLectura.Lector;
public class Ej02Jugadores {


    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double [] v = new double[15];
        //Paso 3: Crear el vector para 15 double 
        
        //Paso 4: Declarar indice y variables auxiliares a usar
              int i;
              double total;
              total = 0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
            for(i=0;i<=15;i++){
            v[i]= Lector.leerDouble();
            total += v[i];
            }
        //Paso 7: Calcular el promedio de alturas, informarlo
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
     
        //Paso 9: Informar la cantidad.
    }
    
}
