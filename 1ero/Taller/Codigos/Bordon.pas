{
TURNO B - TEMA 1                           Módulo Imperativo                12/09/2022



IMPORTANTE : Cree un   programa en Pascal .Utilice su  apellido como nombre delprograma y delarchivo
pas , yguardelo en elEscritorio de sucomputadora . 
Un comercio  necesita el procesamiento de cada compra se conoce código delcliente , dia ,cantidad de productos y
monto pagado compras realizadas  por sus clientesdurante el mes de julio  de 2022. De

  a ) Implementar  un módulo quelea compras , genere y retorne unaestructura adecuada para la búsqueda por código
del cliente ,donde para cada código de cliente se almacenan juntas todas sus compras ( dia ,cantidad de productos y
monto ) que realizó .La lectura finaliza con cantidad de productos 0. Se suglere utilizar el modulo leerRegistro.
 b ) Implementar  un módulo que reciba la estructura generada en a ) y un código de cliente y retorne todas las compras
de dicho cliente .
c ) Realizar un  módulo recursivo que reciba la estructura que retorna el inciso b ) yretorne el monto de la compra con
mayor cantidad de productos .
NOTA : Implementar el programa principal , que  invoque a los incisos a , b y c .
En caso de ser necesario , adjuntamos algunas porciones de código que puede utilizar en su programa .
   
}


program Bordon;
type
dias = 1..31;
compra = record
codigo:integer;
dia:dias;
cant:integer;
monto:real;
end;
lista = ^nodo;
nodo = record
dato:compra;
sig:lista;
end;
arbol = ^nodoArbol;
nodoArbol = record
dato:lista;
HI:arbol;
HD:arbol;
end;
function ContarCompras(l:lista):integer;
var
c:integer;
begin
c:= 0;
while(l <> nil) do begin
writeln(l^.dato.codigo);
c:= c + 1;
l:=l^.sig;
end;
ContarCompras:= c;
end;
procedure InsertarLista(var l:lista;c:compra);
var
aux:lista;
begin
new(aux);
aux^.dato := c;
aux^.sig:= nil;
if(l = nil)then begin 
l:=aux;
writeln('entro');
end
else begin
aux^.sig := l;
l:= aux;
end;
writeln(ContarCompras(l));
end;
procedure leerCompra(var c:compra);
begin
writeln('cantidad: ');
readln(c.cant);
if(c.cant <> 0) then begin
writeln('codigo del cliente: ');
readln(c.codigo);
writeln('dia de la compra: ');
readln(c.dia);
end;
end;
procedure GenerarArbol(var A:arbol);
procedure InsertarArbol(var A:arbol;c:compra);
begin
if(A<>nil)then begin
if(A^.dato^.dato.codigo > c.codigo) then InsertarArbol(A^.HI,c)
 else if(A^.dato^.dato.codigo < c.codigo)then InsertarArbol(A^.HD,c) 
 else begin
 InsertarLista(A^.dato,c);
 end
end else begin
new(A);
 a^.dato:=nil;
InsertarLista(A^.dato,c);
end;
end;
var
c:compra;
begin
leerCompra(c);
while(c.cant <> 0)do begin
InsertarArbol(A,c);
leerCompra(c);
end;
end;
procedure InformarCompras(A:arbol;cod:integer;var cant:integer);
begin
if(A<>nil)then begin
if(A^.dato^.dato.codigo = cod)then cant := ContarCompras(A^.dato)
else if(A^.dato^.dato.codigo < cod)then InformarCompras(A^.HD,cod,cant)
else InformarCompras(A^.HI,cod,cant);

end
end;
var
A:arbol;
cod:integer;
cant:integer;
BEGIN
		GenerarArbol(A);
		writeln('codigo a buscar: ');
		readln(cod);
		InformarCompras(A,cod,cant);
		writeln('cantidad: ',cant)
END.

