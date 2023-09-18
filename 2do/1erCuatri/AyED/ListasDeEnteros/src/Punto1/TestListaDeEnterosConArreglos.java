package Punto1;
import tp02.ejercicio1.*;
public class TestListaDeEnterosConArreglos {

	
	
	public static void recu(ListaDeEnteros O)
	{
		if(!O.fin()) {
			int N = O.proximo();
			recu(O);
			System.out.print(N + " ");
			
		}
		
		
		
		
	}	
	
	public static void main(String args[]) {
		int[] vector = {1,2,4,6,8,3};
		ListaDeEnterosConArreglos L = new ListaDeEnterosConArreglos();
		ListaDeEnterosEnlazada LE = new ListaDeEnterosEnlazada();
		L.comenzar();
		LE.comenzar();
		for(int num : vector) {
		L.agregarFinal(num);
		LE.agregarFinal(num);
		}
		L.comenzar();
		/*while(!(L.fin())) {
			System.out.print(L.proximo()+ " ");
			
			
		}*/
		LE.comenzar();
		System.out.print(LE.fin());
		recu(LE);
		
	}
	
	
}
