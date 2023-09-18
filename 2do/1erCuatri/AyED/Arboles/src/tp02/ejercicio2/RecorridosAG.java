package tp02.ejercicio2;

public class RecorridosAG {

	public static ListaGenerica<Integer> numerosImparesMayoresQuePreOrden (ArbolGeneral<Integer> a, Integer n){
		ListaGenerica<Integer> L = new ListaEnlazadaGenerica<Integer>();
		recuMayoPosOrden(a,n,L);
		
		return L;
	}
	public static ListaGenerica<Integer> numerosImparesMayoresNiveles (ArbolGeneral<Integer> a, Integer n){
		ListaGenerica<Integer> L = new ListaEnlazadaGenerica<Integer>();
		ListaGenerica<ArbolGeneral<Integer>> LH = new ListaEnlazadaGenerica<ArbolGeneral<Integer>>();
		ColaGenerica<ArbolGeneral<Integer>> C = new ColaGenerica <ArbolGeneral<Integer>>();
		ArbolGeneral<Integer> b;
		C.encolar(a);
		C.encolar(null);
		while(!C.esVacia()) {
			b = C.desencolar();
			if(b != null) {
				if((b.getDato() % 2 != 0) && (b.getDato() > n)) {
					L.agregarFinal(b.getDato());
				}	
			LH = b.getHijos();
			while(!LH.fin()) {
				C.encolar(LH.proximo());
			}
			} else if(!C.esVacia()) {
				C.encolar(null);
			}
			
		}
		
		return L;
	}
	private static void recuMayoPreOrden(ArbolGeneral<Integer> a, Integer n,ListaGenerica<Integer>L) {
		if((a.getDato() % 2 != 0) && (a.getDato() > n)) {
			L.agregarFinal(a.getDato());
		}

		if(!a.getHijos().esVacia()) {
		a.getHijos().comenzar();
		while(!a.getHijos().fin()) {
			recuMayoPreOrden(a.getHijos().proximo(),n,L);
		}
		}
	}
	private static void recuMayoInOrden(ArbolGeneral<Integer> a, Integer n,ListaGenerica<Integer>L) {


			if(!a.getHijos().esVacia()) {
			int x = a.getHijos().tamanio();
			a.getHijos().comenzar();
			if(x == 1) {
				recuMayoInOrden(a.getHijos().proximo(),n,L);
				if((a.getDato() % 2 != 0) && (a.getDato() > n)) {
					L.agregarFinal(a.getDato());
					}
			} else {
				
			for(int i = 1; i <= x/2;i++) {
				recuMayoInOrden(a.getHijos().elemento(i),n,L);
			}
			if((a.getDato() % 2 != 0) && (a.getDato() > n)) {
				L.agregarFinal(a.getDato());
			}
			for(int i = x/2 + 1; i <= x;i++) {
				recuMayoInOrden(a.getHijos().elemento(i),n,L);
			}
		
			}
			
		} else {
			if((a.getDato() % 2 != 0) && (a.getDato() > n)) {
				L.agregarFinal(a.getDato());
				}
		}
			
		
	}
	private static void recuMayoPosOrden(ArbolGeneral<Integer> a, Integer n,ListaGenerica<Integer>L) {
		if(!a.getHijos().esVacia()) {
			a.getHijos().comenzar();
			while(!a.getHijos().fin()) {
				recuMayoPosOrden(a.getHijos().proximo(),n,L);
			}
			}
		if((a.getDato() % 2 != 0) && (a.getDato() > n)) {
			L.agregarFinal(a.getDato());
		}

	}
	
	
}
