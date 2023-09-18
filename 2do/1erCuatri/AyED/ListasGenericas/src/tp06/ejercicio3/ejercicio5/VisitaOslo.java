package tp06.ejercicio3.ejercicio5;

import tp02.ejercicio2.*;
import tp06.ejercicio3.*;

public class VisitaOslo {
	public static ListaGenerica<String> paseoEnBici(Grafo<String> lugares, 
		int maxTiempo,ListaGenerica<String> lugaresRestringidos){
		ListaGenerica<String> L = new ListaEnlazadaGenerica<String>();
		ListaGenerica<Vertice<String>> vertices = lugares.listaDeVertices();
		String des = "";
		vertices.comenzar();
		if(!vertices.esVacia()){
		Vertice<String> ayunta = vertices.proximo();
		while((!vertices.fin())&&(ayunta.dato() != "Ayuntamiento")){
				ayunta = vertices.proximo();
		}
		if(ayunta.dato() == "Ayuntamiento") {
			boolean[] marcas = new boolean[vertices.tamanio()+1];
			dfsBici(lugares,ayunta,maxTiempo,lugaresRestringidos,maxTiempo,L,marcas);
		}
		}
		return L;
	}
	private static boolean dfsBici(Grafo<String> lugares,Vertice<String> v,int maxTiempo,ListaGenerica<String> lugaresRestringidos,int tiempo,ListaGenerica<String> L,boolean[] marcas) {
		marcas[v.getPosicion()] = true;
		boolean ok = false;
		if(tiempo <= 0) {
			ok = true;
		}else {
			L.agregarFinal(v.dato());
			ListaGenerica<Arista<String>> ady = lugares.listaDeAdyacentes(v);
 			ady.comenzar();
 			while((!ady.fin())&&(!ok)) {
 				Arista<String> arista = ady.proximo();
 				if((!EstaEn(arista.verticeDestino().dato(),lugaresRestringidos))&&(!marcas[arista.verticeDestino().getPosicion()])) {
 					ok = dfsBici(lugares,arista.verticeDestino(),maxTiempo,lugaresRestringidos,tiempo-arista.peso(),L,marcas);
 				}
 			}
		}
		return ok;
	}
	private static boolean EstaEn(String s,ListaGenerica<String> l) {
		boolean esta = false;
		l.comenzar();
		while((!l.fin())&&(!esta)) {
			if(l.proximo() == s)
				esta = true;
		}
		return esta;
	}
	 
	public static ListaGenerica<String> paseoEnBiciDes(Grafo<String> lugares, 
			int maxTiempo,String destino,ListaGenerica<String> lugaresRestringidos){
			ListaGenerica<String> L = new ListaEnlazadaGenerica<String>();
			ListaGenerica<Vertice<String>> vertices = lugares.listaDeVertices();
			String des = "";
			vertices.comenzar();
			if(!vertices.esVacia()){
			Vertice<String> ayunta = vertices.proximo();
			while((!vertices.fin())&&((ayunta.dato() != "Ayuntamiento")||(des != destino))){
					Vertice<String> v = vertices.proximo();
					if(ayunta.dato() != "Ayuntamiento")
						ayunta = v;
					if(des != destino)
						des = v.dato();
					
					
			}
			if((ayunta.dato() == "Ayuntamiento")&&(des == destino)) {
				boolean[] marcas = new boolean[vertices.tamanio()+1];
				dfsBiciDes(lugares,ayunta,maxTiempo,destino,lugaresRestringidos,maxTiempo,L,marcas);
			}
			}
			return L;
		}
		private static boolean dfsBiciDes(Grafo<String> lugares,Vertice<String> v,int maxTiempo,String destino,ListaGenerica<String> lugaresRestringidos,int tiempo,ListaGenerica<String> L,boolean[] marcas) {
			marcas[v.getPosicion()] = true;
			L.agregarFinal(v.dato());
			boolean ok = false;
			if(v.dato() == destino) {
				ok = true;
			}else {
				ListaGenerica<Arista<String>> ady = lugares.listaDeAdyacentes(v);
	 			ady.comenzar();
	 			while((!ady.fin())&&(!ok)) {
	 				Arista<String> arista = ady.proximo();
	 				if((!EstaEn(arista.verticeDestino().dato(),lugaresRestringidos))&&(!marcas[arista.verticeDestino().getPosicion()])&&(tiempo-arista.peso() >= 0)) {
	 					ok = dfsBiciDes(lugares,arista.verticeDestino(),maxTiempo,destino,lugaresRestringidos,tiempo-arista.peso(),L,marcas);
	 				
	 				}
	 			}
	 			if(!ok) {
						L.eliminarEn(L.tamanio());
						marcas[v.getPosicion()]= false;
					}
			}
			return ok;
		}
		public static ListaGenerica<String> paseoEnBiciMin(Grafo<String> lugares, 
				int maxTiempo,String destino,ListaGenerica<String> lugaresRestringidos){
				ListaGenerica<String> L = new ListaEnlazadaGenerica<String>();
				ListaGenerica<Vertice<String>> vertices = lugares.listaDeVertices();
				String des = "";
				vertices.comenzar();
				if(!vertices.esVacia()){
				Vertice<String> ayunta = vertices.proximo();
				while((!vertices.fin())&&((ayunta.dato() != "Ayuntamiento")||(des != destino))){
						Vertice<String> v = vertices.proximo();
						if(ayunta.dato() != "Ayuntamiento")
							ayunta = v;
						if(des != destino)
							des = v.dato();
						
						
				}
				if((ayunta.dato() == "Ayuntamiento")&&(des == destino)) {
					boolean[] marcas = new boolean[vertices.tamanio()+1];
					ListaGenerica<String> aux = new ListaEnlazadaGenerica<String>();
					dfsBiciMin(lugares,ayunta,maxTiempo,9999,destino,lugaresRestringidos,maxTiempo,aux,L,marcas);
				}
				}
				return L;
			}
			private static int dfsBiciMin(Grafo<String> lugares,Vertice<String> v,int maxTiempo,int min,String destino,ListaGenerica<String> lugaresRestringidos,int tiempo,ListaGenerica<String> L,ListaGenerica<String> CMin,boolean[] marcas) {
				marcas[v.getPosicion()] = true;
				
				L.agregarFinal(v.dato());
				
				if(v.dato() == destino) {
					min = tiempo;
					System.out.print("MINIMOOO: "+min);
					CMin.comenzar();
					while(!CMin.fin()) {
						CMin.eliminar(CMin.proximo());
					}
					L.comenzar();
					while(!L.fin()) {
						CMin.agregarFinal(L.proximo());
					}
				}else {
					ListaGenerica<Arista<String>> ady = lugares.listaDeAdyacentes(v);
		 			ady.comenzar();
		 			
		 			while((!ady.fin())&&(tiempo < min)) {
		 				
		 				Arista<String> arista = ady.proximo();
		 				if((!EstaEn(arista.verticeDestino().dato(),lugaresRestringidos))&&(!marcas[arista.verticeDestino().getPosicion()])&&(tiempo-arista.peso() >= 0)) {
		 					min = dfsBiciMin(lugares,arista.verticeDestino(),maxTiempo,min,destino,lugaresRestringidos,tiempo-arista.peso(),L,CMin,marcas);
		 				}
		 				
		 			}
		 			
		 		
				}
				L.eliminarEn(L.tamanio());
				marcas[v.getPosicion()]= false;
				return min;
			}
}
