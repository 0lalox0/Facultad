package ar.edu.unlp.info.oo1.balanzaElectronica;

public class Producto {
	private double peso;
	private double precioPorKilo;
	private String descripcion;
	
	public double getPrecio() {
		return peso*precioPorKilo;
	}
	public double getPeso() {
		return peso;
	}
	public double getPrecioPorKilo() {
		return precioPorKilo;
	}
	public void setPrecioPorKilo(float precioPorKilo) {
		this.precioPorKilo = precioPorKilo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public void setPeso(double peso) {
		this.peso = peso;
	}
	
}
