program Clase2Punto2;
type
lista = ^nodo;
nodo = record
dato:integer;
sig:lista;
end;
procedure GenerarLista(var L:lista);
procedure AgregarADelante(var L:lista; n:integer);
var
aux:lista;
begin
new(aux);
aux^.dato:= n;
aux^.sig:=L;
L:=aux;
end;
var
n:integer;
begin
readln(n);
while(n <> 0) do begin
AgregarADelante(L,n);
readln(n);
end;
end;
procedure DigitarLista(L:lista);
procedure Digitar(n:integer);
var dig,resto:integer;
begin
	dig:= n mod 10;
	writeln(dig);
	resto:= n div 10;
	writeln(resto);
	if(resto > 0)then Digitar(resto); 
	write('  ',dig,' ');

end;
begin

Digitar(L^.dato);



end;
var L :lista;

BEGIN
	GenerarLista(L);
	DigitarLista(L);
END.

