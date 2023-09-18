package tp03.ejercicio1;

import tp02.ejercicio2.*;

public class EJ2c {
	public static void main(String args[]) {
	ArbolBinario<Integer> A = new ArbolBinario<Integer>(6);
	A.agregarHijoDerecho(new ArbolBinario<Integer>(16));
	A.agregarHijoIzquierdo(new ArbolBinario<Integer>(2));
	A.getHijoIzquierdo().agregarHijoIzquierdo(new ArbolBinario<Integer>(4));
	A.getHijoIzquierdo().agregarHijoDerecho(new ArbolBinario<Integer>(10));
	A.getHijoDerecho().agregarHijoIzquierdo(new ArbolBinario<Integer>(12));
	A.getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Integer>(14));
	A.getHijoIzquierdo().getHijoIzquierdo().agregarHijoIzquierdo(new ArbolBinario<Integer>(8));
	//A.entreNiveles(2, 3);
	
	/*contadorArbol c = new contadorArbol(A);
	ListaEnlazadaGenerica<Integer> L = c.numerosPares();
	while(!(L.fin())) {
		System.out.print(L.proximo());
	}*/
	System.out.print(RedBinariaLlena.retardoEnvio(A));	
	
	
	}
	
}
