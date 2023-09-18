package tp06.ejercicio3.ejercicio5;

import tp02.ejercicio2.*;
import tp06.ejercicio3.*;

public class Parcial {

	public static ListaGenerica<String> resolver(Grafo<String> ciudades, String origen, String destino,
			ListaGenerica<String> pasandoPor) {
		ListaGenerica<String> l = new ListaEnlazadaGenerica<String>();
		String des = " ";
		ListaGenerica<Vertice<String>> vertices = ciudades.listaDeVertices();
		Vertice<String> v;
		if (!vertices.esVacia()) {
			v = vertices.proximo();
			while ((!vertices.fin()) && ((v.dato() != origen) || (des != destino))) {
				Vertice<String> aux = vertices.proximo();
				if (v.dato() != origen)
					v = aux;
				if (des != destino)
					des = aux.dato();
			}
			if ((v.dato() == origen) && (des == destino)) {
				ListaGenerica<String> act = new ListaEnlazadaGenerica<String>();
				boolean[] marcas = new boolean[vertices.tamanio() + 1];
				dfs(ciudades, v, destino, pasandoPor, l, act, marcas, 0);
			}
		}

		return l;
	}

	private static boolean dfs(Grafo<String> ciudades, Vertice<String> v, String destino,
			ListaGenerica<String> pasandoPor, ListaGenerica<String> l, ListaGenerica<String> act, boolean[] marcas,
			int cant) {
		marcas[v.getPosicion()] = true;
		boolean ok = false;
		act.agregarFinal(v.dato());
		if (EstaEn(v.dato(), pasandoPor))
			cant++;
		// System.out.print(pasandoPor.tamanio());
		if (v.dato().equals(destino) && (cant == pasandoPor.tamanio())) {
			ok = true;
			l.comenzar();
			while (!l.fin()) {
				l.eliminar(l.proximo());
			}
			act.comenzar();
			while (!act.fin()) {
				l.agregarFinal(act.proximo());
			}
		} else {
			ListaGenerica<Arista<String>> ady = ciudades.listaDeAdyacentes(v);
			ady.comenzar();
			while ((!ady.fin()) && (!ok)) {
				Vertice<String> next = ady.proximo().verticeDestino();
				if (!marcas[next.getPosicion()]) {
					ok = dfs(ciudades, next, destino, pasandoPor, l, act, marcas, cant);
				}
			}
			if (!ok) {
				act.eliminarEn(act.tamanio());
				marcas[v.getPosicion()] = false;
			}
		}
		return ok;
	}

	private static boolean EstaEn(String s, ListaGenerica<String> l) {
		boolean esta = false;
		l.comenzar();
		while ((!l.fin()) && (!esta)) {
			if (l.proximo() == s)
				esta = true;
		}
		return esta;
	}

	/*
	 * Dado un Grafo orientado y valorado positivamente, como por ejemplo el que
	 * muestra la figura, implemente un método que retorne una lista con todos los
	 * caminos cuyo costo total sea igual a 10. Se considera costo total del camino
	 * a la suma de los costos de las aristas que forman parte del camino, desde un
	 * vértice origen a un vértice destino. Se recomienda implementar un método
	 * público que invoque a un método recursivo privado.
	 */
	public static ListaGenerica<ListaGenerica<String>> caminosSon10(Grafo<String> grafo) {
		ListaGenerica<ListaGenerica<String>> l = new ListaEnlazadaGenerica<ListaGenerica<String>>();
		boolean[] marcas = new boolean[grafo.listaDeVertices().tamanio() + 1];
		ListaGenerica<String> act = new ListaEnlazadaGenerica<String>();
		for (int i = 1; i <= grafo.listaDeVertices().tamanio(); i++) {
			if (!marcas[i]) {
				dfs(i, grafo, act, l, marcas, 0);
			}
		}

		return l;
	}

	private static void dfs(int i, Grafo<String> grafo, ListaGenerica<String> act,
			ListaGenerica<ListaGenerica<String>> l, boolean[] marcas, int costo) {
		marcas[i] = true;
		Vertice<String> v = grafo.listaDeVertices().elemento(i);
		act.agregarFinal(v.dato());
		if (costo == 10) {
			System.out.print("Test");
			l.agregarFinal(act.clonar());

		} else {

			ListaGenerica<Arista<String>> ady = grafo.listaDeAdyacentes(v);
			ady.comenzar();
			while (!ady.fin()) {
				Arista<String> A = ady.proximo();
				if (((A.peso() + costo) <= 10) && (!marcas[A.verticeDestino().getPosicion()])) {
					dfs(A.verticeDestino().getPosicion(), grafo, act, l, marcas, costo + A.peso());
				}
			}

		}
		marcas[i] = false;
		act.eliminarEn(act.tamanio());
	}

	public static ListaGenerica<ListaGenerica<String>> resolverFrancia(Grafo<String> grafo, String origen,
			String destino, int kmMax) {
		ListaGenerica<ListaGenerica<String>> l = new ListaEnlazadaGenerica<ListaGenerica<String>>();
		ListaGenerica<Vertice<String>> vertices = grafo.listaDeVertices();
		String des;
		Vertice<String> o;
		vertices.comenzar();
		if (!vertices.esVacia()) {
			o = vertices.proximo();
			des = o.dato();
			System.out.println();
			while ((!vertices.fin()) && ((o.dato() != origen) || (des != destino))) {
				Vertice<String> v = vertices.proximo();
				if (o.dato() != origen)
					o = v;
				if (des != destino)
					des = v.dato();
			}
			if ((o.dato() == origen) && (des == destino)) {
				
				boolean[] marcas = new boolean[vertices.tamanio() + 1];
				ListaGenerica<String> Aux = new ListaEnlazadaGenerica<String>();
				dfsFrancia(grafo, o, destino, kmMax, 0, l, Aux, marcas);
			}
		}
		return l;
	}

	private static void dfsFrancia(Grafo<String> g, Vertice<String> origen, String destino, int kmMax, int kmAct,
		ListaGenerica<ListaGenerica<String>> Listas, ListaGenerica<String> ActL, boolean[] marcas) {
		marcas[origen.getPosicion()] = true;
		ActL.agregarFinal(origen.dato());
		if ((origen.dato().equals(destino))) {
			Listas.agregarFinal(ActL.clonar());
		} else {
			ListaGenerica<Arista<String>> ady = g.listaDeAdyacentes(origen);
			ady.comenzar();
			while (!ady.fin()) {
				Arista<String> A = ady.proximo();
				if ((!marcas[A.verticeDestino().getPosicion()]) && ((kmAct + A.peso()) <= kmMax)) {
					//System.out.print("Test");
					dfsFrancia(g, A.verticeDestino(), destino, kmMax, kmAct + A.peso(), Listas, ActL, marcas);
				}

			}

		}
		marcas[origen.getPosicion()] = false;
		ActL.eliminarEn(ActL.tamanio());

	}
}
