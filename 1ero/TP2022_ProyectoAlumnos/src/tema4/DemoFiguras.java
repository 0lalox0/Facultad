/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;


public class DemoFiguras {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        /*
        Realice un programa que instancie el visor, guarde dos cuadrados y un rectángulo en el
visor y por último haga que el visor muestre sus figuras almacenadas.
       */
        Cuadrado cuad = new Cuadrado(10,"Rojo", "Negro");
        Rectangulo Rec = new Rectangulo(12,77,"Azul", "Amarillo");
        VisorFiguras V = new VisorFiguras();
        V.guardar(cuad);
      Cuadrado cuad1 = new Cuadrado(10,"blanco", "rojo");
        V.guardar(cuad1);
        V.guardar(Rec);
        V.mostrar();
    }
    
    
    
}
