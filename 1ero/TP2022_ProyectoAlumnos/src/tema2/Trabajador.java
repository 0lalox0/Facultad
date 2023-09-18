/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author Lalo
 */
public class Trabajador extends Persona{
           private String trabajo;

    public Trabajador(String unNombre, int unDNI, int unaEdad,String trabajo) {
        super(unNombre, unDNI, unaEdad);
        this.trabajo = trabajo;
    }
    public Trabajador(){
    
    }
    public String getTrabajo(){
        return this.trabajo;
    }
    public String toString(){
    return "Mi nombre es " + this.getNombre()+ " mi DNI es "+ getDNI() +" y tengo "+ getEdad() + " años. Soy "+this.trabajo;
    }
}
