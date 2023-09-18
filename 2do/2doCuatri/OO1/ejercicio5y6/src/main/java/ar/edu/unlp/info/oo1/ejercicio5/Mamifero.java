package ar.edu.unlp.info.oo1.ejercicio5;

public class Mamifero {
	private String Identificador;
	private String Especie;
	private Mamifero Madre;
	private Mamifero Padre;
	public Mamifero() {
	
	}
	public Mamifero(String identificador) {
		Identificador = identificador;
	}
	public String getIdentificador() {
		return Identificador;
	}
	public void setIdentificador(String identificador) {
		Identificador = identificador;
	}
	public String getEspecie() {
		return Especie;
	}
	public void setEspecie(String especie) {
		Especie = especie;
	}
	public Mamifero getMadre() {
		return Madre;
	}
	public void setMadre(Mamifero madre) {
		Madre = madre;
	}
	public Mamifero getPadre() {
		return Padre;
	}
	public void setPadre(Mamifero padre) {
		Padre = padre;
	}
	
	public Mamifero getAbueloMaterno() {
		Mamifero Madre = getMadre();
		if(Madre != null)
			return Madre.getPadre();
		return null;
	}
	public Mamifero getAbuelaMaterna() {
		Mamifero Madre = getMadre();
		if(Madre != null)
			return Madre.getMadre();
		return null;
	}
	public Mamifero getAbueloPaterno() {
		Mamifero Padre = getPadre();
		if(Padre != null)
			return Padre.getPadre();
		return null;
	}
	public Mamifero getAbuelaPaterna() {
		Mamifero Padre = getPadre();
		if(Padre != null)
			return Padre.getMadre();
		return null;
	}
	public boolean tieneComoAncestroA(Mamifero unMamifero) {
		boolean t = false;
		t = recursion(this,unMamifero);
		
		return t;
	}
	private boolean recursion(Mamifero uno,Mamifero unMamifero) {
		boolean aux = false;
		Mamifero Madre = uno.getMadre();
		Mamifero Padre = uno.getPadre();
		if(Padre != null) {
			if(Padre == unMamifero) {
				aux = true;
			}else {
				aux = recursion(Padre,unMamifero);
			}
			
		}
		if((Madre != null)&&(!aux)) {
			if(Madre == unMamifero) {
				aux = true;
			}else {
				aux = recursion(Madre,unMamifero);
			}
		}
			
		return aux;
	}
}
