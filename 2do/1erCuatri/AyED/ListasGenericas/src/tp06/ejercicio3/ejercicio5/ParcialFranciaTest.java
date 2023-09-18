package tp06.ejercicio3.ejercicio5;
import tp06.ejercicio3.*;
import tp02.ejercicio2.ListaGenerica;
public class ParcialFranciaTest {

		public static void main(String[] args) {
			Grafo<String> grafo = new GrafoImplListAdy<>();
			Vertice<String> v1 = new VerticeImplListAdy<String>("Champagne");
			Vertice<String> v2 = new VerticeImplListAdy<String>("Buzet");
			Vertice<String> v3 = new VerticeImplListAdy<String>("Cahors");
			Vertice<String> v4 = new VerticeImplListAdy<String>("Bellet");
			Vertice<String> v5 = new VerticeImplListAdy<String>("Beaujolais");
			Vertice<String> v6 = new VerticeImplListAdy<String>("Chabilis");
			Vertice<String> v7 = new VerticeImplListAdy<String>("Armagnac");
			Vertice<String> v8 = new VerticeImplListAdy<String>("Bugey");

			grafo.agregarVertice(v1);
			grafo.agregarVertice(v2);
			grafo.agregarVertice(v3);
			grafo.agregarVertice(v4);
			grafo.agregarVertice(v5);
			grafo.agregarVertice(v6);
			grafo.agregarVertice(v7);
			grafo.agregarVertice(v8);

			grafo.conectar(v1, v3, 10);
			grafo.conectar(v2, v1, 2);
			grafo.conectar(v3, v4, 3);
			grafo.conectar(v3, v6, 30);
			grafo.conectar(v3, v5, 1);
			grafo.conectar(v4, v5, 5);
			grafo.conectar(v5, v7, 1);
			grafo.conectar(v6, v5, 3);
			grafo.conectar(v6, v8, 3);
			grafo.conectar(v8, v7, 3);
			
			
			ListaGenerica<ListaGenerica<String>> caminos = Parcial.resolverFrancia(grafo, "Buzet", "Beaujolais", 20);
			caminos.comenzar();
			imprimirListas(caminos);
		}
	    
	    public static void imprimirListas(ListaGenerica<ListaGenerica<String>> listas) {
	    	listas.comenzar();
	    	while(!listas.fin())
	    		imprimirLista(listas.proximo());
	    }
	    public static void imprimirLista(ListaGenerica<String> lista) {
	        lista.comenzar();
	        while (!lista.fin()) {
	            System.out.print(lista.proximo() + " ");
	        }
	        System.out.println();
	    }
		
	}

