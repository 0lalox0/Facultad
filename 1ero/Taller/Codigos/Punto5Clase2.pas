program untitled;
const
dimF =10;
type 
indice = 0..dimF;
vector = array[1..dimF] of integer;




procedure MostrarVector(V:vector;dimL:indice);
var i:indice;
begin
for i:= 1 to dimL do begin
write('| ', V[i],'| ');
end;
end;
Procedure Ordenar ( var v: vector; dimLog: indice );
var i, j, p: indice; item:integer;			
begin
 for i:=1 to dimLog-1 do begin {busca el mínimo y guarda en p la posición}
          p := i;
          for j := i+1 to dimLog do
             if v[ j ] < v[ p ] then p:=j;
         {intercambia v[i] y v[p]}
         item := v[ p ];   
         v[ p ] := v[ i ];   
         v[ i ] := item;
      end;
end;
procedure GenerarVectorOrdenado(var V:vector;var dimL:indice);
var
i:indice;
begin
for i:=1 to dimF do begin
readln(V[i]);
end;
dimL := dimF;
Ordenar(v,dimL);
end;
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
var
m:indice;
begin
m:= (ini+fin)div 2;
if((ini+fin)mod 2 = 1)then m:= m+1;
writeln('m = ',m);
if(ini <> fin)then begin
if(v[m] = dato) then begin pos:=m; writeln('el num ',dato,' esta en la poscicion ',pos); end else if(v[m]>dato)then begin
fin:=m;
busquedaDicotomica(v,ini,fin,dato,pos);
end else begin
ini:=m;
busquedaDicotomica(v,ini,fin,dato,pos);
end;
end else if(v[m]=dato) then begin pos:=m; writeln('el num ',dato,' esta en la poscicion ',pos);end else writeln('NO ESTA EN EL VECTOR');
end;
var
V:vector;
dimL:indice;
dato:integer;
pos:indice;
BEGIN
	GenerarVectorOrdenado(V,dimL);
	MostrarVector(v,dimL);
	writeln('dato a buscar: ');
	readln(dato);
	busquedaDicotomica(v,1,10,dato,pos);
	
	
END.

