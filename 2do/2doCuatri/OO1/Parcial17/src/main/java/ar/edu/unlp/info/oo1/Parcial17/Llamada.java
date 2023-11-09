package ar.edu.unlp.info.oo1.Parcial17;

import java.util.Date;

public class Llamada implements LlamadaInter{
	private int nroIda;
	private int nroRec;
	private Date fecha;
	protected int duracion;
	public Llamada(Date f,int duracion,int numIda,int numRec) {
		this.nroIda = numIda;
		this.nroRec = numRec;
		fecha = f;
		this.duracion = duracion;
	}
	public int calcularCosto() {
		return duracion;
	}
}
