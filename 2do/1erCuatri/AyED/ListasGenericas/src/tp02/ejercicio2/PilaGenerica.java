package tp02.ejercicio2;

public class PilaGenerica<T> {
	private ListaEnlazadaGenerica<T> L;
	
	public PilaGenerica()
	{
		L = new ListaEnlazadaGenerica<T>();		
	}	
	public void apilar(T elem) {
		L.agregarInicio(elem);
	}
	public T desapilar() {
		T a = L.elemento(1);
		L.eliminarEn(1);
		return a;
	}
	public T tope() {
		return L.elemento(1);
	}
	public boolean esVacia()
{		
		return L.esVacia();
}
	}
