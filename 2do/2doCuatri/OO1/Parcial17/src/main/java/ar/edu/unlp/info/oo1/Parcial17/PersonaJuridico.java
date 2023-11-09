package ar.edu.unlp.info.oo1.Parcial17;

class PersonaJuridico extends Cliente{
	private String tipo;
	public PersonaJuridico(String n, String d,String tip,int t) {
		super(n,d,t);
		tipo = tip;
	}

}
