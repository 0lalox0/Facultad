package ar.edu.unlp.info.oo1.Parcial17;

public class PersonaFisica extends Cliente{
	private int dni;
	public PersonaFisica(String n, String d,int t,int dni) {
		super(n,d,t);
		this.dni = dni;
	}
}
