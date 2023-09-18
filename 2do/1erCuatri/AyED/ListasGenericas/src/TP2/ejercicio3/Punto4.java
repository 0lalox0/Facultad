package TP2.ejercicio3;

import tp02.ejercicio2.*;

public class Punto4 {
	static boolean balanceado(String S) {
		PilaGenerica<Character> p = new PilaGenerica<Character>();
		for(int i = 0; i < S.length();i++) {
			char a  = S.charAt(i);
			char aux;
			switch(a){
				case '{':
					p.apilar(a);
				break;
				case '[':
				p.apilar(a);
				break;
				case '(':
				p.apilar(a);
				break;
				case '}':
					if(p.esVacia()) {
						return false;
					} else {
					aux = p.desapilar();
						if(!(aux == '{')) {
							return false;
						}
					}
				break;
				case ')':
					if(p.esVacia()) {
						return false;
					} else {
					aux = p.desapilar();
					if(!(aux == '(')) {
						return false;
					}
				}
				break;
				case ']':
					if(p.esVacia()) {
						return false;
					}{
					aux = p.desapilar();
					if(!(aux == '[')) {
						return false;
					}
				}
				break;
			}
		}
		if(p.esVacia()) {
			return true;
		} else return false;

			
	}
		
		public static void main(String args[]) {
				String S = "{[(anashixs)puto]gay{}}";
				System.out.print(balanceado(S));
				
			}
			
		
		
		
	
}
