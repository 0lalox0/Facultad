package tp06.ejercicio3.ejercicio5;

import tp02.ejercicio2.*;
import tp06.ejercicio3.*;
public class Recorridos<T> {
	
	public ListaGenerica <T> dfs(Grafo<T> grafo){

		ListaEnlazadaGenerica<T> L = new ListaEnlazadaGenerica<T>();
		ListaGenerica<Vertice<T>> Vertices = grafo.listaDeVertices();
		boolean[] marcas = new boolean[Vertices.tamanio()+1];
		for(int i = 0;i < Vertices.tamanio();i++) {
			marcas[i] = false;
		}
		Vertices.comenzar();
		while(!Vertices.fin()) {
			Vertice<T> V = Vertices.proximo();
			if(!marcas[V.getPosicion()])
			dfsRecu(V,L,marcas);
		}
		
		
		return L;
			
	}
	private void dfsRecu(Vertice<T> vertice,ListaEnlazadaGenerica<T> l,boolean[] marcas) {
		
		ListaGenerica<Arista<T>> adys = ((VerticeImplListAdy<T>) vertice).obtenerAdyacentes();
		marcas[vertice.getPosicion()] = true;
		l.agregarFinal(vertice.dato());
		adys.comenzar();
		while(!adys.fin()) {
			Arista<T> A = adys.proximo();
			
			if(!marcas[A.verticeDestino().getPosicion()]) {
				dfsRecu((VerticeImplListAdy<T>)A.verticeDestino(),l,marcas);
			}
		}
	}
	
	public ListaGenerica <T> bfs(Grafo<T> grafo){

		ListaEnlazadaGenerica<T> L = new ListaEnlazadaGenerica<T>();
		ListaGenerica<Vertice<T>> Vertices = grafo.listaDeVertices();
		boolean[] marcas = new boolean[Vertices.tamanio()+1];
		for(int i = 0;i < Vertices.tamanio();i++) {
			marcas[i] = false;
		}
		Vertices.comenzar();
		while(!Vertices.fin()) {
			Vertice<T> V = Vertices.proximo();
			if(!marcas[V.getPosicion()])
			bfsRecu(V,L,marcas);
		}
		
		
		return L;
			
	}
	private void bfsRecu(Vertice<T> vertice,ListaEnlazadaGenerica<T> l,boolean[] marcas) {
		ColaGenerica<Vertice<T>> C = new ColaGenerica<Vertice<T>>();
		
		marcas[vertice.getPosicion()] = true;
		l.agregarFinal(vertice.dato());
		C.encolar(vertice);
		
		Vertice<T> v;
		while(!C.esVacia()) {
		 v = C.desencolar();
		
	    ListaGenerica<Arista<T>> adys = ((VerticeImplListAdy<T>) vertice).obtenerAdyacentes();
		adys.comenzar();
		while(!adys.fin()) {
			Arista<T> A = adys.proximo();
			 Vertice<T> Adyacente = A.verticeDestino();
			if(!marcas[Adyacente.getPosicion()]) {
				l.agregarFinal(Adyacente.dato());
				marcas[Adyacente.getPosicion()] = true;
				C.encolar(Adyacente);
				
			}
		
		} 
		}
	}
}
