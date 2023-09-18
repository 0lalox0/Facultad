{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. De cada película se conoce: código de película, código de género 
* (* 1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. 
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1. 
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría. 
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.}
program Punto3Clase1;
const
dimF = 8;
type
indice = 0..dimF;
pelicula = record
codigoP:integer;
codigoG:indice;
puntaje:integer;
end;
lista = ^nodo;
nodo = record
dato:pelicula;
sig:lista;
end;
punteros = record
ult,pri:lista;
end;
vector = array[0..dimF]of punteros;
puntajesV = array[0..dimF]of pelicula;
procedure GenerarVector(var V:vector;var dimL:indice);
procedure LeerPelicula(var aux:pelicula);
begin
write('Ingrese Codigo de Genero: ');
readln(aux.codigoG);
write('Ingrese Codigo Pelicula: ');
readln(aux.codigoP);
write('Ingrese Puntaje promedio: ');
readln(aux.puntaje);
end;
procedure AgregarAlFinal(var V:vector; peli:pelicula;var dimL:indice);
var
aux:lista;
begin
if(dimL < dimF)then begin
if(V[peli.codigoG].pri = nil)then begin
new(V[peli.codigoG].pri);
new(V[peli.codigoG].ult);
V[peli.codigoG].pri^.dato := peli;
V[peli.codigoG].ult^.dato := peli;
dimL := dimL + 1;
end else begin 

new(aux);
aux^.dato := peli;
V[peli.codigoG].ult^.sig := aux;
V[peli.codigoG].ult := aux;
dimL := dimL + 1;
end;
end;
end;
var
aux:pelicula;
begin
dimL:= 0;
leerPelicula(aux);
while(aux.codigoP <> -1)do begin
AgregarAlFinal(V,aux,dimL);
LeerPelicula(aux);
end;

end;
procedure CargarMejorPuntaje(V:vector;var P:puntajesV;var dimLP:indice);
var
max:pelicula;
i:indice;
begin
dimLP:= 0;
for i := 1 to dimF do begin
max.puntaje := 0;
while(V[i].pri <> nil)do begin
if(V[i].pri^.dato.puntaje > max.puntaje) then begin
 max := V[i].pri^.dato;
 end;
V[i].pri := V[i].pri^.sig
end;
if(V[i].pri <> nil)then begin
P[i]:= max;
dimLP:= dimLP + 1;
end;
end;
end;
procedure OrdenarPuntajes(var P:puntajesv;var dimLP:indice);
var
i,j:indice; actual:pelicula;
begin
for i:= 2 to dimLP do begin
	actual:= P[i];
	j:= i-1;
    while(j > 0) and (P[j].puntaje > actual.puntaje) do
    begin
     P[j+1]:=P[j];
	j:=j-1;
    end;
   P[j+1]:= actual;
end;
writeln('codigo: ',P[1].codigoP, '  puntaje: ', P[1].puntaje);
writeln('codigo: ',P[dimLP].codigoP, '  puntaje: ', P[DimLP].puntaje);
end;
var V:vector;
P:puntajesV;
dimL:indice;
dimLP:indice;
BEGIN
	GenerarVector(V,dimL);
	CargarMejorPuntaje(V,P,dimLP);
	OrdenarPuntajes(P,dimLP);
END.

