{
1.- El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa que:
 *Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, 
	DNI del propietario y valor de la expensa. La lectura finaliza cuando llega el código de identificación -1.
 *Ordene el vector, aplicando uno de los métodos vistos en la cursada, para obtener el vector ordenado por código de identificación de la oficina.
 *Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho código está en el vector. 
    En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que el código buscado no existe.
 *Tenga un módulo recursivo que retorne el monto total de las expensas.

}


program untitled;
const
dimF = 300;
type
indice = 0..dimF;
oficina = record
codigo:integer;
dni:longint;
valor:real;
end;
vector = array[indice] of oficina;
procedure generarVector(var v:vector;var dimL:indice);
procedure leerOficina(var o:oficina);
begin
writeln('Codigo de identificacion: ');
readln(o.codigo);
if(o.codigo <> -1)then begin
writeln('DNI: ');
readln(o.dni);
writeln('Valor: ');
readln(o.valor);
end;
end;
var
o:oficina;
begin
dimL:=0;
leerOficina(o);
while(o.codigo <> -1)do begin
dimL:= dimL + 1;
v[dimL]:=o;
leerOficina(o);
end;
end;
procedure OrdenarSeleccion(var v:vector;dimL:indice);
var
i,p,j:indice;
o:oficina;
begin
for i:= 1 to dimL-1 do begin
	p:=i;
	for j:= i+1 to dimL do begin
	if(v[j].codigo<v[p].codigo)then p:=j;
	end;
	o:=v[p];
	v[p]:=v[i];
	v[i]:=o;
end;
end;
procedure OrdenarInserccion(var v:vector;dimL:indice);
var
i,j:indice;
act:oficina;
begin
for i:= 2 to dimL do begin
act:= v[i];
j:= i-1;
	while((j>0)and(v[j].codigo>act.codigo)) do begin
		v[j+1]:=v[j];
		j:= j-1;
		end;
	v[j+1]:=act;
end;
end;
procedure InformarVector(v:vector;dimL:indice);
var
i:indice;
begin
for i:= 1 to dimL do begin
writeln(v[i].codigo);
end;
end;
procedure busquedaDicotomica(v:vector;d:integer;dimL:indice);
var
ini,fin,m:indice;
t:boolean;
begin
ini:=1;
fin:=diml;
t:= false;
repeat
m:=(ini+fin)div 2;
	if(d = v[m].codigo) then t:=true else 
	if(d < v[m].codigo)then fin:=m-1 else ini:=m+1;
until((ini>fin)or (t= true));
writeln('m: ',m);
if(t)then writeln(v[m].dni) else writeln('No se encuentra el dato');
end;
procedure valorTotal(v:vector;dimL:indice;var total:real);
procedure recursion(v:vector;var dimL:indice;var total:real);
begin
	if(dimL > 0) then begin
			total:= total + v[dimL].valor;
			dimL:= dimL - 1;
			recursion(v,dimL,total);
			end;
end;
begin
recursion(v,dimL,total);
writeln(total);
end;
var
v:vector;
dimL:indice;
d:integer;
valorto:real;
BEGIN
	generarVector(v,dimL);
	InformarVector(v,dimL);
	ordenarinserccion(v,dimL);
	writeln('--------------------');
	InformarVector(v,dimL);
	writeln('Ingrese valor a busscar: ');
	readln(d);
	busquedaDicotomica(v,d,dimL);
	valorTotal(v,dimL,valorto);
END.

