{
   Se cuenta con un archivo de productos de una cadena de venta de alimentos congelados.
De cada producto se almacena: código del producto, nombre, descripción, stock disponible,
stock mínimo y precio del producto.
Se recibe diariamente un archivo detalle de cada una de las 30 sucursales de la cadena. Se
debe realizar el procedimiento que recibe los 30 detalles y actualiza el stock del archivo
maestro. La información que se recibe en los detalles es: código de producto y cantidad
vendida. Además, se deberá informar en un archivo de texto: nombre de producto,
descripción, stock disponible y precio de aquellos productos que tengan stock disponible por
debajo del stock mínimo.
Nota: todos los archivos se encuentran ordenados por código de productos. En cada detalle
puede venir 0 o N registros de un determinado producto
}


program Prac2Punt3;
type
producto = record
nombre,descr:string;
cod,stockmin,precio,stockd:integer;
end;
Maestro = file of producto;
infoDetalle = record
cod,cant:integer;
end;
detalle = file of infoDetalle;
ArrayReg = array[1..30] of infoDetalle;
ArrayDet = array[1..30] of detalle;
procedure leer(var ArcDet:detalle;var Reg:infoDetalle);
begin
if(not EoF(ArcDet))then begin
Read(ArcDet,Reg);
end else Reg.cod := 0;
end;
procedure minimo(var ArrayD:ArrayDet;var ArrayR:ArrayReg;var min:infoDetalle);
var
i,imin:integer
begin
min.cod := 9999;
	
for i := 1 to 30 do begin 
	leer(ArrayD[i],ArrayR[i]);
	if(ArrayR[i].cid<min.cod) then
		min := ArrayR[i];
		imin := i;
	end;
	leer(ArrayD[imin],ArrayR[imin]);
	end;

end;
var
i,imin:integer;
S:string;
regM:producto;
ArrayD:ArrayDet;
M:Maestro;
ArrayR:ArrayReg;
min:infoDetalle;

BEGIN
	min.cod := 9999;
	Assign(M,'Maestro');
	for i := 1 to 30 do begin 
	Str(i,S);
	Assign(ArrayD[i],'det'+ S);
	reset(ArrayD[i]);
	leer(ArrayD[i],ArrayR[i]);
	if(ArrayR[i].cid<min.cod) then begin
		min := ArrayR[i];
		imin := i;
	end;
	leer(ArrayD[imin],ArrayR[imin]);
	
	end;
	reset(M);
	read(M,regM);
	while(min.cod <> 9999)do begin
		while(regM.cod = min.cod)do begin
			regM.stockd := regM.stockd - min.cant;
			minimo(ArrayD;ArrayR,min);
		end;
	seek(M,filepos(M)-1);
	write(M,regM);
	read(M,regM);
	end;
	close(M);
	for i := 1 to 30 do
		close(ArrayD[i]);
	
END.

