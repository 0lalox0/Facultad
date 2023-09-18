package tp06.ejercicio3.ejercicio5;

import tp02.ejercicio2.*;
import tp06.ejercicio3.*;

public class MapaCiudades {
	Grafo<String> mapa;
	
	public MapaCiudades(Grafo<String> m){
		mapa = m;
	}
	public ListaGenerica<String> devolverCamino (String ciudad1, String ciudad2){
		ListaGenerica<String> L = new ListaEnlazadaGenerica<String>();
		ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
		boolean ok = false;
		vertices.comenzar();
		Vertice<String> origen = vertices.proximo();
		while((!vertices.fin())&&(origen.dato() != ciudad1)){
			origen = vertices.proximo();
		}
		if (origen.dato() == ciudad1) {
		boolean[] visitas = new boolean[vertices.tamanio()+1];
		for(int i = 0; i<vertices.tamanio();i++)
			visitas[i] = false;
		System.out.println("ORIGEEN: "+origen.dato());
 		ok = dfs((VerticeImplListAdy)origen,ciudad2,L,visitas);
		}
		if(!ok) {
			L = new ListaEnlazadaGenerica<String>();
		}
		return L;
	}
	private boolean dfs (VerticeImplListAdy<String> v,String destino,ListaGenerica<String> camino,boolean[] visitas) {
		visitas[v.getPosicion()] = true;
		camino.agregarFinal(v.dato());
		boolean encontre = false;
		if(v.dato() == destino) {
			encontre = true;
		}else {
			ListaGenerica<Arista<String>> adyacentes = v.obtenerAdyacentes();
			adyacentes.comenzar();
			while((!encontre)&&(!adyacentes.fin())){
				VerticeImplListAdy<String> ver = (VerticeImplListAdy<String>)adyacentes.proximo().verticeDestino();
				if(!visitas[ver.getPosicion()]) {
					encontre = dfs(ver,destino,camino,visitas);
				}
				if(!encontre) {
					camino.eliminarEn(camino.tamanio()-1);
				}
			}
			 
		}
		return encontre;
		
	}
	public ListaGenerica<String> devolverCaminoExceptuando(String ciudad1,String ciudad2,ListaGenerica<String> ciudades){
	    ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
	  ListaGenerica<String> L = new ListaEnlazadaGenerica<String>();
	  boolean ok = false;
	  if(!vertices.esVacia()) {
	  Vertice<String> origen = vertices.proximo();
	  vertices.comenzar();
	  while((!vertices.fin())&&(origen.dato() != ciudad1)){
	      origen = vertices.proximo();
	  }
	  if(origen.dato() == ciudad1){
	      boolean[] vistas = new boolean[vertices.tamanio()+1];
	    for(int i = 0;i<vertices.tamanio();i++)
	        vistas[i] = false;
	      ok = dfsExceptuando((VerticeImplListAdy<String>)origen,ciudad2,ciudades,L,vistas);
	  }
	  }
	  if(!ok) {
		  L = new ListaEnlazadaGenerica<String>();
	  }
	  return L;
	}

	private boolean EstaEnLaLista(String dato, ListaGenerica<String> lista){
	    boolean encontre = false;
	  lista.comenzar();
	  while((!lista.fin())&&(!encontre)){
	  encontre = (lista.proximo() == dato);
	  }

	  return encontre;

	}
	private boolean dfsExceptuando(VerticeImplListAdy<String> origen,String ciudad2,ListaGenerica<String> ciudades,ListaGenerica<String> camino,boolean[] visitas){
	    boolean encontre = false;
	    camino.agregarFinal(origen.dato());
	    visitas[origen.getPosicion()] = true;
	  if(origen.dato()==ciudad2){
	      return true;
	  } else{
	      ListaGenerica<Arista<String>> adys = origen.obtenerAdyacentes();
	      adys.comenzar();
	      while((encontre == false) &&(!adys.fin())){
	          Arista<String> Arista = adys.proximo();
	        Vertice<String> Destino = Arista.verticeDestino();
	      if((!visitas[Destino.getPosicion()])&&(!EstaEnLaLista(Destino.dato(),ciudades))){
	          encontre = dfsExceptuando((VerticeImplListAdy<String>)Destino,ciudad2,ciudades,camino,visitas);
	        if(!encontre){
	            camino.eliminarEn(camino.tamanio()-1);
	        }
	      }

	  }
	     return encontre;
	  }
	}
	public ListaGenerica<String> caminoMasCorto(String ciudad1, String ciudad2) {
		ListaGenerica<String> minCam = new ListaEnlazadaGenerica<String>();
		boolean ok = false;
		ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
		if(!vertices.esVacia()) {
			vertices.comenzar();
		Vertice<String> origen = vertices.proximo();
		while((!vertices.fin())&&(origen.dato() != ciudad1)) {
			origen = vertices.proximo();
		}
		if(origen.dato() == ciudad1) {
			boolean[] marcas = new boolean[vertices.tamanio()+1];
			ListaGenerica<String> actCam = new ListaEnlazadaGenerica<String>();
			dfsMin((VerticeImplListAdy<String>)origen,ciudad2,minCam,actCam,marcas);
		}
		
		}
		return minCam;
	}
	private void dfsMin(VerticeImplListAdy<String> origen,String Destino,ListaGenerica<String> minCam,ListaGenerica<String> act,boolean[] marcas) {
		act.agregarFinal(origen.dato());
		if(origen.dato() == Destino) {
			if(minCam.esVacia()) {
				act.comenzar();
				while(!act.fin()) {
					minCam.agregarFinal(act.proximo());
				}
			}else if(minCam.tamanio()>act.tamanio()) {
				minCam.comenzar();
				while(!minCam.fin()) {
					minCam.eliminar(minCam.proximo());
				}
				act.comenzar();
				while(!act.fin()) {
					minCam.agregarFinal(act.proximo());
				}
			}			
		} else {
			marcas[origen.getPosicion()] = true;
			ListaGenerica<Arista<String>> adys = origen.obtenerAdyacentes();
			adys.comenzar();
			Vertice<String> siguiente;
			while(!adys.fin()) {
				siguiente = adys.proximo().verticeDestino();
				if(!marcas[siguiente.getPosicion()]) {
					dfsMin((VerticeImplListAdy<String>)siguiente,Destino,minCam,act,marcas);
					marcas[siguiente.getPosicion()] = false;
				}
				act.eliminarEn(act.tamanio());
			}
		}
		
	}
	public ListaGenerica<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto){
		ListaGenerica<String> camino = new ListaEnlazadaGenerica<String>();
		ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
		vertices.comenzar();
		String destino = " ";
		if(!vertices.esVacia()) {
			Vertice<String> origen = vertices.proximo();
			while((!vertices.fin())&&((origen.dato() != ciudad1))||(destino != ciudad2)) {
				Vertice<String> sig = vertices.proximo();
				if(origen.dato() != ciudad1) {
					origen = sig;
				}
				if(destino != ciudad2) {
					destino = sig.dato();
				}	
				
			}
			if((origen.dato() == ciudad1)&&(destino == ciudad2)) {
				boolean[] marcas = new boolean[vertices.tamanio()+1];
				dfsSinCargar(origen,destino,tanqueAuto,camino,marcas);
			}
		}
		
		
		return camino;
	}
	private boolean dfsSinCargar(Vertice<String> origen,String destino,int tanque,ListaGenerica<String> camino, boolean [] marcas) {
		marcas[origen.getPosicion()] = true;
		camino.agregarFinal(origen.dato());
		boolean encontre = false;
		if(origen.dato().equals(destino)) {
			encontre = true;
			
		} else {
			ListaGenerica<Arista<String>> ady = mapa.listaDeAdyacentes(origen);
			ady.comenzar();
			while((!ady.fin())&&(!encontre)) {
				Arista<String> arista = ady.proximo();
				if((arista.peso() <= tanque)&&(!marcas[arista.verticeDestino().getPosicion()])) {
					encontre = dfsSinCargar(arista.verticeDestino(),destino,tanque - arista.peso(),camino,marcas);
					if(!encontre) {
						camino.eliminarEn(camino.tamanio());
						marcas[arista.verticeDestino().getPosicion()] = false;
					}
				}
			}
		}
		
		return encontre;
	}
	public ListaGenerica<String> caminoConMenorCargaDeCombustible (String ciudad1, String ciudad2, int tanqueAuto){
		ListaGenerica<String> camino = new ListaEnlazadaGenerica<String>();
		ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
		vertices.comenzar();
		String destino = " ";
		if(!vertices.esVacia()) {
			Vertice<String> origen = vertices.proximo();
			while((!vertices.fin())&&((origen.dato() != ciudad1))||(destino != ciudad2)) {
				Vertice<String> sig = vertices.proximo();
				if(origen.dato() != ciudad1) {
					origen = sig;
				}
				if(destino != ciudad2) {
					destino = sig.dato();
				}	
				
			}
			if((origen.dato() == ciudad1)&&(destino == ciudad2)) {
				Minimo M = new Minimo();
				M.setCamMin(camino);
				M.setRecargaMin(9999);
				int recargas = 0;
				boolean[] marcas = new boolean[vertices.tamanio()+1];
				ListaGenerica<String> aux = new ListaEnlazadaGenerica<String>();
				dfsMinCargar(origen,destino,tanqueAuto,tanqueAuto,aux,M,marcas,recargas);
				System.out.println("Cantidad de cargas: "+ M.getRecargaMin()+" ");
			}
		}
		
		
		return camino;
	}
	private int dfsMinCargar(Vertice<String> origen,String destino,int tanque,int tanqueAct,ListaGenerica<String> camino,Minimo Min, boolean [] marcas,int recargas) {
		marcas[origen.getPosicion()] = true;
		int auxTanque = 0;
		int auxRecargas = 0;
		boolean cargo = false;
		camino.agregarFinal(origen.dato());
		if(origen.dato().equals(destino)) {
			
			
		} else {
			ListaGenerica<Arista<String>> ady = mapa.listaDeAdyacentes(origen);
			ady.comenzar();
			while(!ady.fin()){
				System.out.println("Tanque actual:"+tanqueAct+";  ");
				Arista<String> arista = ady.proximo();
				if((!marcas[arista.verticeDestino().getPosicion()])&&(arista.peso() <= tanque)) {
					if((arista.peso() > tanqueAct)) {
						
						auxTanque = tanqueAct;
						auxRecargas = recargas;
						recargas++;
						tanqueAct = tanque;
						cargo = true;
					}
					if(recargas < Min.getRecargaMin()) {
						recargas = dfsMinCargar(arista.verticeDestino(),destino,tanque,tanqueAct - arista.peso(),camino,Min,marcas,recargas);
						System.out.println("  Recargas: "+recargas+"  ");
						if(recargas < Min.getRecargaMin()) {
							if(camino.elemento(camino.tamanio()) == destino){
								Min.getCamMin().comenzar();
								while(!Min.getCamMin().fin()) {
									Min.getCamMin().eliminar(Min.getCamMin().proximo());
								}
								camino.comenzar();
								while(!camino.fin()) {
									Min.getCamMin().agregarFinal(camino.proximo());
								}
								Min.setRecargaMin(recargas);
							}
							
						}
						if(cargo) {
						tanqueAct = auxTanque;
						recargas = auxRecargas;
						}
						cargo = false;
					}
					
					
					
					camino.eliminarEn(camino.tamanio());
					marcas[arista.verticeDestino().getPosicion()] = false;
					}
			}
				}
			
		
		
		return recargas;
	}
}

