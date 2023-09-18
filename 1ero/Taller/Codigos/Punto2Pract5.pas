{
2.- Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta.
Implementar un programa que:
Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. 
 	Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la marca y el modelo.
Invoque a un módulo que reciba el árbol generado en a)
	y una marca y retorne la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado. 
Invoque a un módulo que reciba el árbol generado en a)
	y retorne una estructura con la información de los autos agrupados por año de fabricación.
Contenga un módulo que reciba el árbol generado en a) 
 	y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado. 

}


program untitled;
type
anios = 2010..2018;
auto = record
patente:integer;
anio:anios;
marca,modelo:string;
end;
arbol = ^nodo;
nodo = record
dato:auto;
HI:arbol;
HD:arbol;
end;
vector = array[anios] of arbol;
procedure insertarAuto(var A:arbol;aut:auto);
begin
	if(a = nil) then begin
new(A);
A^.dato := aut;
end else 
		if(A^.dato.patente <= aut.patente) then insertarAuto(A^.HI,aut)
	else insertarAuto(A^.HD,aut);

end;
procedure generarArbol(var A:arbol); // GENERAR ARBOL ----------------
procedure leerAuto(var aut:auto);
begin
write('patente: ');
readln(aut.patente);
if(aut.patente <> 0 )then begin
write('anio: ');
readln(aut.anio);
end;
end;
var
aut:auto;
begin
	leerAuto(aut);
	while(aut.patente <> 0)do begin
	insertarAuto(a,aut);
	leerAuto(aut);
	end;
end;
function cantMarca(A:arbol;m:string):integer;
begin
if(A<>nil)then begin
if(A^.dato.marca = m) then cantMarca := cantMarca(A^.HI,m) + cantMarca(A^.HD,m) +1 else
	cantMarca:= cantMarca(A^.HI,m) + cantMarca(A^.HD,m);
end else cantMarca:= 0;
end;
procedure GenerarVectorArboles(var v:vector;a:arbol);
begin
if(a <> nil)then begin
insertarAuto(v[a^.dato.anio],a^.dato);
end;
end;
procedure BuscarPatente(a:arbol;p:integer);
begin
if (a<>nil) then
begin
	if(a^.dato.patente = p)then writeln(a^.dato.anio)
	else if(a^.dato.patente <= p) then BuscarPatente(a^.HI,p)
	else BuscarPatente(a^.HD,p);
end;
end;
var
a:arbol;
v:vector;
p:integer;
BEGIN
	generarArbol(a);
	//swriteln(cantMarca(a,'ford'));
	GenerarVectorArboles(v,a);
	writeln('Patente a Buscar: ');
	read(p);
	BuscarPatente(a,p);
END.

