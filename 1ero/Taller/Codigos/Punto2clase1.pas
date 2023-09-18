program Punto2clase1;
const dimF = 300;
type
dimLog = 0..dimF;
oficina = record
codigo, DNI:integer;
valor:real;
end;
vector = array[1..dimF] of oficina;



procedure GenerarVector(var V:vector;var dimL:dimLog);

procedure leerVector(var V:vector;i:integer);
begin
write('Codigo: ');
readln(V[i].codigo);
if(V[i].codigo <> -1)then begin
write('DNI: ');
readln(V[i].DNI);
write('Valor: ');
readln(V[i].valor);
end;
end;
var
i:dimLog;
begin
i:= 1;
while(V[i].codigo <> -1) and (dimL < dimF) do
begin
leerVector(V,i);
dimL := dimL + 1;
end;

end;
procedure OrdenarVectorSelec(var V:vector;dimL:dimLog);
var
i,j,p:dimLog;
item:oficina;
begin
for i:= 1 to (dimL-1) do begin
	p:= i;
	for j:= i+1 to dimL do
		if(v[j].codigo<v[p].codigo) then p:=j;
	
	item := v[p];
	v[p]:= v[i];
	v[i]:= item;
end;
end;
procedure OrdenarVectorInser(var V:vector;dimL:dimLog);
var i, j: dimLog; actual: oficina;	
		
begin
 for i:=2 to dimL do begin 
     actual:= v[i];
		j:= i-1; 
     while (j > 0) and (v[j].codigo > actual.codigo) do      
       begin
         v[j+1]:= v[j];
         j := j -1 ;                  
       end;  
     v[j+1]:= actual; 
end;
end;
var
V:vector;
dimL:dimLog;
BEGIN
	GenerarVector(V,dimL);
	
END.

