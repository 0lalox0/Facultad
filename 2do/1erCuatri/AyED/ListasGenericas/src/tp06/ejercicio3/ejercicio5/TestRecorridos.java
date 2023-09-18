package tp06.ejercicio3.ejercicio5;
import tp02.ejercicio2.*;
import tp06.ejercicio3.*;
public class TestRecorridos {

	
	public static void main(String[] args) {
        // Crear el grafo
        Grafo<Integer> grafo = new GrafoImplListAdy<>();

        // Crear vértices
        Vertice<Integer> v1 = new VerticeImplListAdy<>(1);
        Vertice<Integer> v2 = new VerticeImplListAdy<>(2);
        Vertice<Integer> v3 = new VerticeImplListAdy<>(3);
        Vertice<Integer> v4 = new VerticeImplListAdy<>(4);
        Vertice<Integer> v5 = new VerticeImplListAdy<>(5);
        Vertice<Integer> v6 = new VerticeImplListAdy<>(6);

        // Agregar vértices al grafo
        grafo.agregarVertice(v1);
        grafo.agregarVertice(v2);
        grafo.agregarVertice(v3);
        grafo.agregarVertice(v4);
        grafo.agregarVertice(v5);
        grafo.agregarVertice(v6);

        // Conectar vértices
        grafo.conectar(v1, v2);
        grafo.conectar(v1, v4);
        grafo.conectar(v1, v5);
        grafo.conectar(v2, v3);
        grafo.conectar(v3, v4);
        grafo.conectar(v5, v6);
        grafo.conectar(v6, v3);
        Recorridos<Integer> T = new Recorridos<Integer>();
        ListaGenerica<Integer> L = T.bfs(grafo);
        L.comenzar();
        while(!L.fin()) {
        	System.out.print(L.proximo());
        }
	}
}
