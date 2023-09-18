{
  De cada producto se almacena: código del producto, nombre, descripción, stock disponible,
stock mínimo y precio del producto.
Se recibe diariamente un archivo detalle de cada una de las 30 sucursales de la cadena. Se
debe realizar el procedimiento que recibe los 30 detalles y actualiza el stock del archivo
maestro. La información que se recibe en los detalles es: código de producto y cantidad
vendida. Además, se deberá informar en un archivo de texto: nombre de producto,
descripción, stock disponible y precio de aquellos productos que tengan stock disponible por
debajo del stock mínimo.
Nota: todos los archivos se encuentran ordenados por código de productos. En cada detalle
puede venir 0 o N registros de un determinado producto.
   
}


program Prac2Punt3rehecho;
const df = 30; // Dimension Fisica
const valoralto = 9999;
type
producto = record
nombre,descripcion:string;
stock,stockmin,cod:integer;
precio:real;
end;
detalle_producto = record
	cod:integer;
	cant:integer;
end;
det = file of detalle_producto;
mae = file of producto;
vecDet = array[1..df] of det;
vecReg = array[1..df] of detalle_producto;
procedure leer(var d:det; var reg:detalle_producto);
begin
	if(not eof(d))then
		read(d,reg)
	else
		reg.cod := valoralto;
end;

procedure inicializar(var vecD:vecDet;var vecR:vecReg);
var
i:integer;
begin
	for i := 1 to df do
		leer(vecD[i],vecR[i]);

end;
procedure minimo(var vecD:vecDet;var vecR:vecReg;min:detalle_producto);
var 
i,pos:integer;

begin
	min.cod := valoralto;
	for i := 1 to df do begin
		if(vecR[i].cod < min.cod)then
		begin
			min:= vecR[i];
			pos := i;
		end;
	end;
	leer(vecD[pos],vecR[pos]);
end;
procedure actualizarMae(var m:mae;var vecD:vecDet);
var
aux,i:integer;
total:integer;
min:detalle_producto;
vecR:vecReg;
regM:producto;
txt:text;
begin
	reset(m);
	assign(txt,'stockmin.txt');
	rewrite(txt);
	for i := 1 to df do 
		reset(vecD[i]);
	inicializar(vecDt,vecR);
	minimo(vecD,vecR,min):
	read(M,regM)
	while(min.cod <> valoralto)do
	begin
		aux := min.cod;
		total := 0;
		while(aux = min.cod)do begin
		total := total + min.cant;
		minimo(vecDet,vecReg,min);
		end;
		while(aux <> regM.cod)do
			read(m,regM);
		regM.stock := regM.stock-total;
		if(regM.stock < regM.stockmin)then
		begin
		//demásse deberá informar en un archivo de texto: nombre de producto,descripción, stock disponible y precio de aquellos productos que tengan stock disponible por debajo del stock mínimo.
		write(txt,regM.nombre,regM.descripcion,regM.stocka,regM.precio);
		
		end;
		seek(m,filepos(m)-1);
		write(m,regM)
		if(not eof(m))then
			read(m,regm);
end;
		for i := 1 to df do 
		close(vecD[i]);
		close(txt);
end;

var 

BEGIN
	
	
END.

