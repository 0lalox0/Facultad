package ar.edu.unlp.info.oo1.ejercicio5;

public class Farola {
	private boolean prendida;
	/*
	* Crear una farola. Debe inicializarla como apagada
	*/
	public Farola () {
		prendida = false;
	};
	/*
	* Crea la relación de vecinos entre las farolas.
	*  La relación de vecinos entre las farolas es recíproca,
	*   es decir el receptor del mensaje será vecino de otraFarola,
	*    al igual que otraFarola también se convertirá en vecina del
	*    receptor del mensaje
	*/
	public void pairWithNeighbor( Farola otraFarola ) {
		
	}
	/*
	* Retorna sus farolas vecinas
	*/
	public List<Farola> getNeighbors (){
		
	}


	/*
	* Si la farola no está encendida, la enciende y propaga la acción.
	*/
	public void turnOn() {
		if(!prendida)
			prendida = true;
	}

	/*
	* Si la farola no está apagada, la apaga y propaga la acción.
	*/
	public void turnOff() {
		if(prendida)
			prendida = false;
	}
	/*
	* Retorna true si la farola está encendida.
	*/
	public boolean isOn() {
		return  prendida;
	}

}
