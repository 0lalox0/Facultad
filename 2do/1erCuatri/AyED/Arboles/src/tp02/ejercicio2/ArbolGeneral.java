package tp02.ejercicio2;

public class ArbolGeneral<T> {

	private T dato;

	private ListaGenerica<ArbolGeneral<T>> hijos = new ListaEnlazadaGenerica<ArbolGeneral<T>>();

	public T getDato() {
		return dato;
	}

	public void setDato(T dato) {
		this.dato = dato;
	}

	public void setHijos(ListaGenerica<ArbolGeneral<T>> hijos) {
		if (hijos==null)
			this.hijos = new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		else
			this.hijos = hijos;
	}

	public ArbolGeneral(T dato) {
		this.dato = dato;
	}

	public ArbolGeneral(T dato, ListaGenerica<ArbolGeneral<T>> hijos) {
		this(dato);
		if (hijos==null)
			this.hijos = new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		else
			this.hijos = hijos;
	}

	public ListaGenerica<ArbolGeneral<T>> getHijos() {
		return this.hijos;
	}

	public void agregarHijo(ArbolGeneral<T> unHijo) {

		this.getHijos().agregarFinal(unHijo);
	}

	public boolean esHoja() {

		return !this.tieneHijos();
	}
	
	public boolean tieneHijos() {
		return !this.hijos.esVacia();
	}
	
	public boolean esVacio() {

		return this.dato == null && !this.tieneHijos();
	}

	

	public void eliminarHijo(ArbolGeneral<T> hijo) {
		if (this.tieneHijos()) {
			ListaGenerica<ArbolGeneral<T>> hijos = this.getHijos();
			if (hijos.incluye(hijo)) 
				hijos.eliminar(hijo);
		}
	}
	
	public ListaEnlazadaGenerica<T> preOrden() {
		return null;
	}
	
	public Integer altura() {
		int max = 0;
		int act = 0;
		int M = helper(max,act,this);
		return M;
	}
	private Integer helper(int Max,int act,ArbolGeneral<T> a) {
		act++;
		while(!a.getHijos().fin()) {
		Max = helper(Max,act,a.getHijos().proximo());
		}
		if(act > Max) {
			Max = act;
		}else {
			act = Max;
		}
		return Max;
	}

	public Integer nivel(T dato) {
		ListaGenerica<ArbolGeneral<T>> LH = new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		ColaGenerica<ArbolGeneral<T>> C = new ColaGenerica <ArbolGeneral<T>>();
		ArbolGeneral<T> b;
		C.encolar(this);
		C.encolar(null);
		int N = 1;
		while(!C.esVacia()) {
			b = C.desencolar();
			if(b != null) {
			if(b.getDato() == dato) {
				return N;
			}
			LH = b.getHijos();
			while(!LH.fin()) {
				C.encolar(LH.proximo());
			}
			} else if(!C.esVacia()) {
				C.encolar(null);
				N++;
			}
			
		}
		return -1;
	}

	public Integer ancho() {
		ListaGenerica<ArbolGeneral<T>> LH = new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		ColaGenerica<ArbolGeneral<T>> C = new ColaGenerica <ArbolGeneral<T>>();
		ArbolGeneral<T> b;
		C.encolar(this);
		C.encolar(null);
		int act = 0;
		int max = -1;
		while(!C.esVacia()) {
			b = C.desencolar();
			if(b != null) {
			act++;
			LH = b.getHijos();
			while(!LH.fin()) {
				C.encolar(LH.proximo());
			}
			} else if(!C.esVacia()) {
				if (act > max) {
					max = act;
					
				}
				C.encolar(null);
				act = 0;
			}
			
		}
		if (act > max) {
			max = act;
			
		}
		return max;
	}

}