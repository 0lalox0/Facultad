package ar.edu.unlp.info.oo1.ejercicio6;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class Farola {
	private boolean prendida;
	private Set<Farola> Neighbors;
	/*
	* Crear una farola. Debe inicializarla como apagada
	*/
	public Farola () {
		prendida = false;
		Neighbors = new HashSet<Farola>();
	};
	/*
	* Crea la relación de vecinos entre las farolas.
	*  La relación de vecinos entre las farolas es recíproca,
	*   es decir el receptor del mensaje será vecino de otraFarola,
	*    al igual que otraFarola también se convertirá en vecina del
	*    receptor del mensaje
	*/
	public void pairWithNeighbor( Farola otraFarola ) {
	if(!Neighbors.contains(otraFarola)) {
		Neighbors.add(otraFarola);
		otraFarola.pairWithNeighbor(this);
	}
	}
	/*
	* Retorna sus farolas vecinas
	*/
	public Set<Farola> getNeighbors (){
		return Neighbors;
	}


	/*
	* Si la farola no está encendida, la enciende y propaga la acción.
	*/
	public void turnOn() {
		if(!prendida) {
			prendida = true;
			for(Iterator<Farola> it = Neighbors.iterator(); it.hasNext();) {
				Farola fa = it.next();
				fa.turnOn();
			}
		}
		
	}

	/*
	* Si la farola no está apagada, la apaga y propaga la acción.
	*/
	public void turnOff() {
		if(prendida)
		{
			prendida = false;
			Neighbors.iterator().forEachRemaining(f -> f.turnOff());
			
		}
	}
	/*
	* Retorna true si la farola está encendida.
	*/
	public boolean isOn() {
		return  prendida;
	}

}
