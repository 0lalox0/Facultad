package ar.edu.unlp.info.oo1.ej3_presupuestos;

public class Item {
private String detalle;
private int cantidad;
private double costoUnitario;

public double costo(){
	return cantidad*costoUnitario;
}
}
