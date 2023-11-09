package ar.edu.unlp.info.oo1.Parcial17;
import java.util.Date;
public class LlamadaInterurbana extends Llamada implements LlamadaInter{
	
	private int distancia;
	
	public LlamadaInterurbana(Date f, int duracion, int numIda, int numRec, int dist) {
		super(f, duracion, numIda, numRec);
		this.distancia = dist;
		
	}
	public int calcularCosto() {
		int costoMinuto = 2;
		if((distancia < 500)&&(distancia > 100)) 
			costoMinuto = 3;
			else if(distancia > 500)
					costoMinuto = 5;
	
		
		int costo = 5 + (costoMinuto * duracion);
		return costo;
	}
}
