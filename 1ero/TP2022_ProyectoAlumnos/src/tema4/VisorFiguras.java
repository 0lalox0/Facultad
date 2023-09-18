/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Lalo
 */
public class VisorFiguras {
 private int mostradas;
 private int guardadas;
 private int capacidadMaxima = 5;
 private Figura [] vector;
 public VisorFiguras(){
 mostradas=0;
  vector = new Figura [5];
 }

 public void guardar(Figura f){
 if(this.quedaEspacio()){
     this.guardadas++;
 vector[guardadas] = f;
 System.out.println("Guardada");
 } else System.out.println("Capacidad maxima, no se ha guardado");
 }

public boolean quedaEspacio(){
    return guardadas <=5;
 }
 public void mostrar(){
    
     for (int i=1;i<=guardadas;i++){
     System.out.println(this.vector[i].toString());
      mostradas++;
     }
 }
 public int getGuardadas() {
     return guardadas;
 }
 public int getMostradas() {
 return mostradas;
 }
}


