package tp03.ejercicio1;
import tp02.ejercicio2.*;
public class contadorArbol {
private ArbolBinario<Integer> A;
public contadorArbol(ArbolBinario<Integer> A) {
	this.A = A;
	
}
public ListaEnlazadaGenerica<Integer> numerosPares() {
	if(!(this.A.esVacio())) {
		
		ListaEnlazadaGenerica<Integer> L = new ListaEnlazadaGenerica<Integer>();
		recuParInOrder(this.A,L);
		return L;
	}else
		return null;
	
}
@SuppressWarnings("unused")
private void recuPar(ArbolBinario<Integer> A,ListaEnlazadaGenerica<Integer> L) {
		
		if((A.getDato() % 2) == 0) {
		L.agregarFinal(A.getDato());
		System.out.print(A.getDato());
		}
		if(A.getHijoDerecho() != null) {
			recuPar(A.getHijoDerecho(),L);
		}
		 if(A.getHijoIzquierdo() != null) {
			recuPar(A.getHijoIzquierdo(),L);
		}
	
}
@SuppressWarnings("unused")
private void recuParPosOrden(ArbolBinario<Integer> A,ListaEnlazadaGenerica<Integer> L) {
	
    if(A.getHijoIzquierdo() != null) {
		recuParPosOrden(A.getHijoIzquierdo(),L);
	}
    if(A.getHijoDerecho() != null) {
		recuParPosOrden(A.getHijoDerecho(),L);
	}
	if((A.getDato() % 2) == 0) {
	L.agregarFinal(A.getDato());
	//System.out.print(A.getDato());
	}
	
	

}
@SuppressWarnings("unused")
private void recuParInOrder(ArbolBinario<Integer> A,ListaEnlazadaGenerica<Integer> L) {
	
	if(A.getHijoIzquierdo() != null) {
		recuParInOrder(A.getHijoIzquierdo(),L);
	}
	if((A.getDato() % 2) == 0) {
	L.agregarFinal(A.getDato());
	System.out.print(A.getDato());
	}
	if(A.getHijoDerecho() != null) {
		recuParInOrder(A.getHijoDerecho(),L);
	}
	 

}
}

