package Practica2;
import tp02.ejercicio2.*;
public class punto2 {

	public static void main(String args[]) {
		Estudiante alum = new Estudiante();
		ListaEnlazadaGenerica<Estudiante> L = new ListaEnlazadaGenerica<Estudiante>();
		for (int i = 0;i<8;i= i +2) {	
		alum = new Estudiante();
		alum.setNombre(args[i]);
	    alum.setLegajo(Integer.parseInt(args[i+1]));
		L.agregarFinal(alum);
		}
		L.comenzar();
		while(!L.fin()) {
		System.out.print(L.proximo().ToString());
		}
		Estudiante[] E = new Estudiante[2];
		E[0] = new Estudiante();
		E[0].setNombre("julio");
		E[0].setLegajo(5213);
		E[1] = new Estudiante();
		E[1].setNombre("manuel");
		E[1].setLegajo(987);
		L.agregar(E);
		L.comenzar();
		while(!L.fin()) {
			System.out.print(L.proximo().ToString());
		}
		int[] nums = {1,6,7,2};
}
}
