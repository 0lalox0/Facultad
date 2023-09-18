program Prac3Punto2;
{
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de producto 0. 
Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener el código de producto y la cantidad total vendida.
               Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.
}
type
venta = record
codigo:integer;
fecha:integer;
cant:integer;
end;
arbol = ^nodoA;
nodoA = record
dato:venta;
HI:arbol;
HD:arbol;
end;





procedure GenerarArbol(var a,P:arbol);
procedure LeerVenta(var V:venta);
begin
write('Codigo de Producto: ');
readln(V.codigo);
if(V.codigo <> 0) then
begin
write('Fecha: ');
readln(V.fecha);
write('Cantidad: ');
readln(V.cant);
end;
end;
 Procedure InsertarElemento (var a: arbol; elem: venta);
  Begin
    if (a = nil) 
    then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.codigo < a^.dato.codigo)
         then InsertarElemento(a^.HI, elem)
         else InsertarElemento(a^.HD, elem); 
  End;
   Procedure InsertarElementoP (var a: arbol; elem: venta);
  Begin
    if (a = nil) 
    then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end else if(elem.codigo = a^.dato.codigo)then a^.dato.cant:= a^.dato.cant +1
    else if (elem.codigo < a^.dato.codigo)
         then InsertarElementoP(a^.HI, elem)
         else InsertarElementoP(a^.HD, elem); 
  End;
  //b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.
  procedure InformarCantidad(a:arbol;c:integer;var cant:integer);
  begin
  if(a^.codigo)
  
  
  end;
var 
aux:venta;
begin
LeerVenta(aux);
while(aux.codigo<>0)do begin
InsertarElemento(a,aux);
InsertarElementoP(P,aux);
writeln;
LeerVenta(aux);
end;
end;

var i : byte;

BEGIN
	
	
END.

