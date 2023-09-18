package Practica2;

public class Estudiante {

	private String Nombre;
	private int legajo;
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public int getLegajo() {
		return legajo;
	}
	public void setLegajo(int legajo) {
		this.legajo = legajo;
	}
	public String ToString() {
		
		
		return "Nombre: " + this.Nombre + " Legajo: " + this.legajo;
	}
	

}
