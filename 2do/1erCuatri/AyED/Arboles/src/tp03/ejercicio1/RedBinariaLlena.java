package tp03.ejercicio1;
import tp02.ejercicio2.*;
public class RedBinariaLlena {
/*Una red binaria es una red que posee una topología de árbol binario lleno. Por ejemplo:
Los nodos que conforman una red binaria llena tiene la particularidad de que todos ellos conocen
cuál es su retardo de reenvío. El retardo de reenvío se define como el período comprendido entre
que un nodo recibe un mensaje y lo reenvía a sus dos hijos.
Su tarea es calcular el mayor retardo posible, en el camino que realiza un mensaje desde la raíz
hasta llegar a las hojas en una red binaria llena.
Nota: asuma que cada nodo tiene el dato de retardo de reenvío expresado en cantidad de segundos.
a) Indique qué estrategia (recorrido en profundidad o por niveles) utilizará para resolver el
problema.
b) Cree una clase Java llamada RedBinariaLlena (dentro del paquete tp03.ejercicio4)
donde implementará lo solicitado en el método retardoReenvio():int */
	
	
	public static int retardoEnvio(ArbolBinario<Integer> A) {
		int x = 0;
		ListaEnlazadaGenerica<Integer> L = new ListaEnlazadaGenerica<Integer>(); 
	ListaEnlazadaGenerica<Integer> LM = new ListaEnlazadaGenerica<Integer>(); 
		int max = -1;
		if(!A.esVacio()) {
			max = recuRetardo(max,x,L,LM,A);
		}
		return max;
		
	}
	
	private static int recuRetardo(int max, int x, ListaEnlazadaGenerica<Integer> L,ListaEnlazadaGenerica<Integer> LM,ArbolBinario<Integer> A) 
	{
		x += A.getDato(); 
		L.agregarFinal(A.getDato());
		if(A.esHoja()) {
			if(x>max)
			{
				max = x;
				while(!LM.fin()) {
					LM.eliminarEn(LM.tamanio());
				
				}
				while(!L.fin()) {
				LM.agregarFinal(L.proximo());
				
			
				}
			}
		}
		 else {
		if(A.getHijoDerecho() != null) {
			max = recuRetardo(max,x,L,LM,A.getHijoDerecho());
			L.eliminarEn(L.tamanio());
			
		}
		if(A.getHijoDerecho() != null) {
			max = recuRetardo(max,x,L,LM,A.getHijoIzquierdo());
			L.eliminarEn(L.tamanio());
		}
		}
		return max;
	}
	

		
	
}