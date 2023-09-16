package ar.edu.unlp.info.oo1.balanzaElectronica;

public class Balanza {

	private int cantidadDeProductos;
	private double precioTotal;
	private double pesoTotal;
	
	public void ponerEnCero() {
		precioTotal = 0;
		pesoTotal = 0;
		cantidadDeProductos = 0;
	}
	public void agregarProducto(Producto prod) {
		precioTotal += prod.getPrecio();
		cantidadDeProductos++;
		pesoTotal += prod.getPeso();
	}
	public Ticket emitirTicket() {
		Ticket T = new Ticket(cantidadDeProductos,precioTotal,pesoTotal);
		return T;
	}
	public int getCantidadDeProductos() {
		return cantidadDeProductos;
	}
	public double getPrecioTotal() {
		return precioTotal;
	}
	public double getPesoTotal() {
		return pesoTotal;
	}
	
}
