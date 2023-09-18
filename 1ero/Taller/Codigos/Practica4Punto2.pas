{
*Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada película se conoce: código de película, código de género
	(1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. Implementar un programa que contenga:
Un módulo que lea los datos de películas y los almacene ordenados por código de película y agrupados por código de género, en una estructura de datos adecuada. 
	La lectura finaliza cuando se lee el código de película -1. 
Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos donde estén todas las películas almacenadas ordenadas por código de película.

}
program Practica4Punto2;
const
dimF = 8;
type
indice = 1..dimF;
pelicula = record
codigoP:integer;
codigoG:indice;
puntaje:real;
end;
lista = ^nodo;
nodo = record
dato:pelicula;
sig:lista;
end;
vector = array[indice]of lista;
procedure GenerarVector(var v:vector);
procedure leerPeli(var p:pelicula);
begin
writeln('Codigo De pelicula: ');
readln(p.codigoP);
if(p.codigoP <> -1)then begin 
writeln('Codigo De Genero: ');
readln(p.codigoG);
//writeln('puntaje Promedio: ');
//readln(p.puntaje);}
end;
end;
procedure insertarordenado (var l:lista; dato:pelicula);
var
  act,ant,nue:lista;
begin
  act:=l;
  ant:=l;
  new(nue);
  nue^.dato:=dato;

  while ((act <> nil) and (act^.dato.codigoP < dato.codigoP)) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (act = ant) then begin
    nue^.sig:=l;
    l:=nue
  end
  else begin
    nue^.sig:=act;
    ant^.sig:=nue;
    end;
end;
var
p:pelicula;
begin
leerPeli(p);
while(p.codigoP <> -1)do begin
insertarordenado(v[p.codigoG],p);
leerPeli(p);
end;
end;
procedure InformarVector(v:vector);
var
i:indice;
begin
for i:=1 to dimf do begin
writeln('------------  Categoria ',i ,' --------');
while(v[i]<>nil)do begin
writeln('codigo de pelicula: ',v[i]^.dato.codigoP);
v[i]:=v[i]^.sig;
end;
end;
writeln('----------------------------------------------')
end;
procedure InformarLista(l:lista);
begin
writeln('error');
   if(l<>nil)then begin
   writeln(l^.dato.codigoP);
   InformarLista(l^.sig);
   end;
end;

procedure Merge(v:vector;var l:lista);
procedure insertarM(var l:lista;min:pelicula;var pu:lista);
var nue:lista;
begin
new(nue);
nue^.dato:=min;
nue^.sig:= nil;
if(l = nil)then begin
l:= nue;
pu:=l;
end else begin
pu^.sig:=nue;
pu:= nue;
end;
end;
procedure Minimo(var v:vector;var min:pelicula);
var i,pos:indice;
begin
min.codigoP := 9999;
for i := 1 to dimF do begin
if(v[i] <> nil) then begin
if(v[i]^.dato.codigoP<min.codigoP) then begin 
min:=v[i]^.dato;
pos:= i;
end;
end;
end;
if(min.codigoP <> 9999) then v[pos]:= v[pos]^.sig;
end;
var
min:pelicula;
pu:lista;
begin
Minimo(v,min);

while(min.codigoP <> 9999) do begin
writeln(min.codigoP);
insertarM(l,min,pu);
Minimo(v,min);
end;
end;
var 
v:vector;
l:lista;
BEGIN
	GenerarVector(v);
	InformarVector(v);
	Merge(v,l);
	InformarLista(l);
END.

