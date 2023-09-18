package tp06.ejercicio3.ejercicio5;
import tp02.ejercicio2.*;
import tp06.ejercicio3.*;
public class TestCaminos {
	    public static void main(String[] args) {
	        // Crear grafo de ciudades
	    	Grafo<String> grafo = new GrafoImplListAdy<>();

	    	// Crear vértices
	    	Vertice<String> v1 = new VerticeImplListAdy<>("Ayuntamiento");
	    	Vertice<String> v2 = new VerticeImplListAdy<>("El Tigre");
	    	Vertice<String> v3 = new VerticeImplListAdy<>("Museo Munch");
	    	Vertice<String> v4 = new VerticeImplListAdy<>("Parque Botánico");
	    	Vertice<String> v5 = new VerticeImplListAdy<>("Galeria Nacional");
	    	Vertice<String> v6 = new VerticeImplListAdy<>("PArque Vigeland");
	    	Vertice<String> v7 = new VerticeImplListAdy<>("FolkMuseum");
	    	Vertice<String> v8 = new VerticeImplListAdy<>("Museo Farm");
	    	Vertice<String> v9 = new VerticeImplListAdy<>("Museo del BarcoPolar");
	    	Vertice<String> v0 = new VerticeImplListAdy<>("Museo Vikingo");
	    	Vertice<String> v11 = new VerticeImplListAdy<>("Akker Brigge");
	    	Vertice<String> v12= new VerticeImplListAdy<>("Palacio Real");
	    	// Agregar vértices al grafo
	    	grafo.agregarVertice(v1);
	    	grafo.agregarVertice(v2);
	    	grafo.agregarVertice(v3);
	    	grafo.agregarVertice(v4);
	    	grafo.agregarVertice(v5);
	    	grafo.agregarVertice(v6);
	    	grafo.agregarVertice(v7);
	    	grafo.agregarVertice(v8);
	    	grafo.agregarVertice(v9);
	    	grafo.agregarVertice(v11);
	    	grafo.agregarVertice(v12);
	    	grafo.agregarVertice(v0);
	    
	    	// Agregar conexiones entre vértices
	    	grafo.conectar(v1, v11, 10);
	    	grafo.conectar(v1, v12, 10);
	    	grafo.conectar(v1, v2, 15);
	    	grafo.conectar(v1, v4, 10);
	    	grafo.conectar(v2, v3, 15);
	    	grafo.conectar(v3, v4, 1);
	    	grafo.conectar(v4, v5, 15);
	    	grafo.conectar(v5, v6, 10);
	    	grafo.conectar(v6, v7, 20);
	    	grafo.conectar(v7, v8, 5);
	    	grafo.conectar(v7, v11, 30);
	    	grafo.conectar(v8, v9, 5);
	    	grafo.conectar(v9, v0, 5);
	    	grafo.conectar(v11, v0, 30);
	    	grafo.conectar(v12, v7, 5);
	    	grafo.conectar(v11, v7, 30);
	 
	        // Crear objeto MapaCiudades
	       /// MapaCiudades mapa = new MapaCiudades(grafo);
	       
	        // Prueba del método devolverCamino
	        ListaGenerica<String> ciudades = new ListaEnlazadaGenerica<>();
	        ciudades.agregarFinal("Akker Brigge");
	        ciudades.agregarFinal("Palacio Real");
	        ListaGenerica<ListaGenerica<String>> camino =   Parcial.caminosSon10(grafo);      //VisitaOslo.paseoEnBiciMin(grafo, 120, "Museo Vikingo", ciudades);  //Parcial.resolver(grafo,"Ayuntamiento","Museo Vikingo",ciudades);                  //mapa.caminoConMenorCargaDeCombustible("Ciudad 1", "Ciudad 5",10);
	        imprimirListas(camino);
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

