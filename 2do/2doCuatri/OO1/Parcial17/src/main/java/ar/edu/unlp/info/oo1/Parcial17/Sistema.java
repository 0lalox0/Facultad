package ar.edu.unlp.info.oo1.Parcial17;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
public class Sistema {
	private List<Integer> telefonos = new ArrayList<Integer>();
	private ArrayList<Cliente> clientes = new ArrayList<Cliente>();
	private List<Llamada> llamadas = new ArrayList<Llamada>();
	public void agregarNum(int num) {
		telefonos.add(num);
	}
	public Cliente DarAltaPersonaFisica(String n,String Dire,int dni) {
		int tel = telefonos.get(0);
		PersonaFisica p = new PersonaFisica(n,Dire,dni,tel);
		clientes.add(p);
		telefonos.remove(0);
		return p;
	}
	public Cliente DarAltaPersonaJuridica(String n,String Dire,String tipo) {
		int tel = telefonos.get(0);
		PersonaJuridico p = new PersonaJuridico(n,Dire,tipo,tel);
		clientes.add(p);
		telefonos.remove(0);
		return p;
	}
	public Llamada registrarLlamadaLocal(Date fecha,int duracion,int numIda, int numRec) {
		Llamada l;
		l = new Llamada(fecha,duracion,numIda,numRec);
		llamadas.add(l);
		return l;
	}
	public Llamada registrarLlamadaInterurbana(Date fecha,int duracion,int numIda, int numRec,int distancia) {
		Llamada l;
		l = new LlamadaInterurbana(fecha,duracion,numIda,numRec,distancia);
		llamadas.add(l);
		return l;
	}
	public Llamada registrarLlamadaInternacional(Date fecha,int duracion,int numIda, int numRec,String origen,String destino) {
		Llamada l;
		l = new LlamadaInternacional(fecha,duracion,numIda,numRec,origen,destino);
		llamadas.add(l);
		return l;
	}
	public Factura Facturar(Cliente cli,Date FechaIni,Date FechaFin) {
		Factura f;
		int monto = 0;
		l
		f = new Factura(cli,FechaIni,FechaFin,monto);
		
		return f;
	}
}
