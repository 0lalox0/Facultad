package ar.edu.unlp.info.oo1.Parcial17;

import java.util.Date;

public class Factura {
	private Cliente cliente;
	private Date fechaFactura;
	private Date fechaIni;
	private Date fechaFin;
	private float MontoTotal;
	public Factura(Cliente cliente, Date fechaFactura, Date fechaIni, Date fechaFin, float montoTotal) {
		this.cliente = cliente;
		this.fechaFactura = fechaFactura;
		this.fechaIni = fechaIni;
		this.fechaFin = fechaFin;
		MontoTotal = montoTotal;
	}
	
}
