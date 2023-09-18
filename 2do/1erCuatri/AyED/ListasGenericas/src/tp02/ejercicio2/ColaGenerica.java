package tp02.ejercicio2;

public class ColaGenerica<T> {
	private ListaEnlazadaGenerica<T> L = new ListaEnlazadaGenerica<T>();
	
	
	
	public void encolar(T elem) {
		L.agregarFinal(elem);	
		
	}
	public T desencolar() {
		T a = L.elemento(1);
		L.eliminarEn(1);
		return a;
	}
	public T tope() {
		return L.elemento(1);
	}
	public boolean esVacia() {
		return L.esVacia();		
	}
}
