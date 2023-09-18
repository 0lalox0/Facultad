/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
    import PaqueteLectura.Lector;
    import PaqueteLectura.GeneradorAleatorio;

//Paso 1. importar la funcionalidad para generar datos aleatorios

public class Ej03Matrices {

    public static void main(String[] args) {
         GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
         int [][] m = new int[5][5];
         int dimLX = 0;
         int dimLY = 0;
         int total = 0;
         String sigo;
         System.out.println("sigo?");
         sigo = Lector.leerString();
         while(!sigo.equals("n")){
             if(dimLY < 5){
                 System.out.println("Ingresar elemento en fila "+ dimLX +" columna: "+dimLY);
             m[dimLX][dimLY] = GeneradorAleatorio.generarInt(9);
             dimLY++;
             total++;
             } else if(dimLX < 5-1){
             
             dimLX++;
             dimLY = 0;
             System.out.println("Ingresar elemento en fila "+ dimLX +" columna: "+dimLY);
             m[dimLX][dimLY] = GeneradorAleatorio.generarInt(9);
             dimLY++;
             total++;
             } else{
                 System.out.println("Matriz llena");
                 sigo = "n";
             }
             
             if(!sigo.equals("n")){
                System.out.println("sigo?");
                sigo = GeneradorAleatorio.generarString(1);
             }
             
         }
         //Paso 4. mostrar el contenido de la matriz en consola
         
         //parcial con dimL
          /*  for(int i = 0;i<dimLX;i++){
                for(int j = 0;j<5;j++){
                    System.out.println("fila: "+i+ "columna: "+j+" = " + m[i][j]);
            
            }
            }
            for(int i = 0; i<dimLY;i++){
             System.out.println("fila: "+dimLX+ "columna: "+i+" = " + m[dimLX][i]);
            }*/
            //pracial con total
            int X = 0;
            int Y = 0;
            for(int i = 0;i < total;i++){
                
                   System.out.println("fila: "+X+ "columna: "+Y+" = " + m[X][Y]);
                   Y++;
                   if(Y == 5) {
                       Y = 0;
                       X++;
                   }
                   }
            
            }
            
            
            
            //COMPLETA
          /*  for(int i = 0;i<5;i++){
                for(int j = 0;j<5;j++){
                    System.out.println("fila: "+i+ "columna: "+j+" = " + m[i][j]);
            
                }
            } */
            
            
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
    
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.

        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".

    }

