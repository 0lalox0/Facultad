package tp02.ejercicio2;

public class Ejercicio3Prac3 {

	
	

	public static void main(String args[]) {
		
		ArbolGeneral<Integer> a  = new ArbolGeneral<Integer>(1);
		ListaGenerica<ArbolGeneral<Integer>> H = new ListaEnlazadaGenerica<ArbolGeneral<Integer>>();
		H.agregarFinal(new ArbolGeneral<Integer>(2));
		H.agregarFinal(new ArbolGeneral<Integer>(3));
		H.agregarFinal(new ArbolGeneral<Integer>(4));
		a.setHijos(H);
		H = new ListaEnlazadaGenerica<ArbolGeneral<Integer>>();
		H.agregarFinal(new ArbolGeneral<Integer>(5));
		H.agregarFinal(new ArbolGeneral<Integer>(6));
		H.agregarFinal(new ArbolGeneral<Integer>(7));
		H.agregarFinal(new ArbolGeneral<Integer>(7));
		H.comenzar();
		a.getHijos().elemento(1).setHijos(H);
		a.getHijos().elemento(1).getHijos().elemento(1).setHijos(H);
		System.out.print(a.ancho());
		
		
		
	}
	
}
