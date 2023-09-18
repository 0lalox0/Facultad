package TP2.ejercicio3;

public class Test {
	public static void aray(boolean[] a) 
		
	
	{
		a[1] = true;
	}
	
	public static void main(String args[]) {
		boolean [] a = new boolean[4];
		a[1] = false;
		aray(a);
		
		System.out.print(a[1]);
		
	}
}
