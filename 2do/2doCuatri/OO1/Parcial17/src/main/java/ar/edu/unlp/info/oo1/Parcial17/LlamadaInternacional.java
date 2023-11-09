package ar.edu.unlp.info.oo1.Parcial17;

import java.util.Date;

public class LlamadaInternacional extends Llamada implements LlamadaInter{
	private String origen;
	private String destino;
	
	public LlamadaInternacional(Date f, int duracion, int numIda, int numRec, String o,String d) {
		super(f, duracion, numIda, numRec);
		origen = o;
		destino = d;
	}

}
