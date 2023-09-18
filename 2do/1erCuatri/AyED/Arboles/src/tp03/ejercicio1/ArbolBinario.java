package tp03.ejercicio1;
import tp02.ejercicio2.*;
public class ArbolBinario<T> {
	private T dato;
	private ArbolBinario<T> hijoIzquierdo;   
	private ArbolBinario<T> hijoDerecho; 

	
	public ArbolBinario() {
		super();
	}

	public ArbolBinario(T dato) {
		this.dato = dato;
	}

	/*
	 * getters y setters
	 * 
	 */
	public T getDato() {
		return dato;
	}

	public void setDato(T dato) {
		this.dato = dato;
	}
	
	/**
	 * Preguntar antes de invocar si tieneHijoIzquierdo()
	 * @return
	 */
	public ArbolBinario<T> getHijoIzquierdo() {
		return this.hijoIzquierdo;
	}

	public ArbolBinario<T> getHijoDerecho() {
		return this.hijoDerecho;

	}

	public void agregarHijoIzquierdo(ArbolBinario<T> hijo) {
		this.hijoIzquierdo = hijo;
	}

	public void agregarHijoDerecho(ArbolBinario<T> hijo) {
		this.hijoDerecho = hijo;
	}

	public void eliminarHijoIzquierdo() {
		this.hijoIzquierdo = null;
	}

	public void eliminarHijoDerecho() {
		this.hijoDerecho = null;
	}

	public boolean esVacio() {
		return this.getDato() == null && !this.tieneHijoIzquierdo() && !this.tieneHijoDerecho();
	}

	public boolean esHoja() {
		return (!this.tieneHijoIzquierdo() && !this.tieneHijoDerecho());

	}

	@Override
	public String toString() {
		return this.getDato().toString();
	}

	 
	public boolean tieneHijoIzquierdo() {
		return this.hijoIzquierdo!=null;
	}

	 
	public boolean tieneHijoDerecho() {
		return this.hijoDerecho!=null;
	}

	public int contarHojas() {
		if(this.esVacio()) {
		return 0;
		}
		if(this.esHoja()) {
		return 1;
		} 
		
		int cont = 0;
		if(this.getHijoDerecho() != null) {
			cont = this.getHijoDerecho().contarHojas();				
		}
		if(this.getHijoIzquierdo() != null) {
				
			cont += this.getHijoIzquierdo().contarHojas();
		}
		return cont;
		}
		


    public ArbolBinario<T> espejo() {
		if(this.esVacio())
			return null;
		ArbolBinario<T> A = new ArbolBinario<T>(this.getDato());
		if(this.esHoja()) {
			return A;
		}else {
			recu(this,A);
			System.out.println("Rcuu");
		}
		return A;
	}
    private void recu(ArbolBinario<T> act,ArbolBinario<T> A){
    	if(act.getHijoIzquierdo() != null) {
    		A.agregarHijoDerecho(act.getHijoIzquierdo().espejo());
    	
    	}
    	if(act.getHijoDerecho() != null) {
    		A.agregarHijoIzquierdo(act.getHijoDerecho().espejo());
    	}
    }
    public String ToString() {
    	String S = "";
    	if(!this.esVacio()) {
    		S = S + this.getDato();
    		if(this.getHijoIzquierdo() != null)
    				S = S + this.getHijoIzquierdo().ToString();
    		if(this.getHijoDerecho() != null)
    			S = S + this.getHijoDerecho().ToString();
    	}
    	
    	return S;
    }

	public void entreNiveles(int n, int m){
		int cont = 1;
		ColaGenerica<ArbolBinario<T>> C = new ColaGenerica<ArbolBinario<T>>();
		ArbolBinario<T> arbol = null;
		C.encolar(this);
		C.encolar(null);
		while(!C.esVacia()) {
			arbol = C.desencolar();
			
			if(arbol != null) {
				if((cont >= n)&&(cont <= m))System.out.println(arbol.dato);
				if(arbol.getHijoIzquierdo() != null) {
					C.encolar(arbol.getHijoIzquierdo());
				}
				if(arbol.getHijoDerecho() != null) {
					C.encolar(arbol.getHijoDerecho());
				} 
					
				}else if(!C.esVacia()) {
					System.out.println("Cont: " + cont);
					C.encolar(null);
					cont += 1;
			}
			}
		}

	

}
