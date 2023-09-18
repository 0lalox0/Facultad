{
Una empresa posee un archivo con información de los ingresos percibidos por diferentes
empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado,
nombre y monto de la comisión. La información del archivo se encuentra ordenada por
código de empleado y cada empleado puede aparecer más de una vez en el archivo de
comisiones.
Realice un procedimiento que reciba el archivo anteriormente descripto y lo compacte. En
consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una
única vez con el valor total de sus comisiones.
NOTA: No se conoce a priori la cantidad de empleados. Además, el archivo debe ser
recorrido una única vez
}


program Prac2Punt1;
type
empleado = record
cod,monto:integer;
nombre:String;
end;
archE = file of empleado;

procedure leer(var A:archE;var E:empleado);
begin
if(not EoF(A))then begin
Read(A,E);
end else E.cod := 0;
end;
procedure crearArch(var A:archE);
var
E:empleado;
begin
E.cod := 123;
E.nombre := 'lalo';
E.monto := 500;
Write(A,E);
E.monto:= 1000;
Write(A,E);
end;
var 
A,nue: archE;
e,aux:empleado;

BEGIN
	Assign(A,'ArcEmp');
	Assign(nue,'nue');
	rewrite(nue);
	reset(A);
	
	while(not(EoF(A)))do begin
	leer(A,E);
	
	while(E.cod <> 0)do begin
	aux := E;
	aux.monto := 0;
	while(E.cod = aux.cod) do begin
	writeln(E.monto);
	aux.monto := E.monto + aux.monto;
	leer(A,E);
	end;
	Write(nue,aux);
	end;
	end;
	seek(nue,0);
	Read(nue,E);
	writeln(E.monto);
	close(A);
	close(nue);
	
END.

