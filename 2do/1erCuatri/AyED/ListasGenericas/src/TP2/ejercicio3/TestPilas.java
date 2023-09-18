package TP2.ejercicio3;
import tp02.ejercicio2.*;
public class TestPilas {	
	
	public static void main(String args[]) {
		ColaGenerica<Integer> cola;
		cola = new ColaGenerica<Integer>();
		PilaGenerica<Integer> pila = new PilaGenerica<Integer>();
		cola.encolar(1);
		pila.apilar(1);
		cola.encolar(8);
		pila.apilar(8);
		System.out.println("tope pila: "+ pila.tope());
		System.out.println("tope cola: "+ cola.tope());
		System.out.println("pila: "+ pila.desapilar());
		System.out.print("Cola: "+ cola.desencolar());
	}
	
	
}
