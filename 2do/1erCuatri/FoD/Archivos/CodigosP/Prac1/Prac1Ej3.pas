{
4. Agregar al menú del programa del ejercicio 3, opciones para:
a. Añadir uno o más empleados al final del archivo con sus datos ingresados por
teclado. Tener en cuenta que no se debe agregar al archivo un empleado con
un número de empleado ya registrado (control de unicidad).
b. Modificar edad a uno o más empleados.
c. Exportar el contenido del archivo a un archivo de texto llamado
“todos_empleados.txt”.
d. Exportar a un archivo de texto llamado: “faltaDNIEmpleado.txt”, los empleados
que no tengan cargado el DNI (DNI en 00).
NOTA: Las búsquedas deben realizarse por número de empleado.
}


program Prac1Ej3;
type
empleado = record
num,edad,DNI:integer;
apellido,nombre:string;
end;
archivo = file of empleado;
procedure leerEmpleado(var E:empleado);
begin
writeln('Apellido');
readln(E.apellido);
if(E.apellido <> 'fin')then begin
writeln('nombre');
readln(E.nombre);
writeln('edad');
readln(E.edad);
writeln('DNI');
readln(E.DNI);
writeln('num');
readln(E.num);
end;
end;
procedure mostrarEmleado(E:empleado);
begin
writeln(E.nombre);
writeln(E.apellido);
writeln(E.DNI);
writeln(E.edad);
writeln(E.num);
end;
var 
ach_log:archivo;
E,aux:empleado;
nombre:string;
T: Text;
I:char;
BEGIN
	writeln('A= crear archivo');
	writeln('B= leer archivo');
	writeln('C= agregar empleado al archivo');
	readln(I);
	case I of
	'A': 
	begin
	writeln('nombre del archivo: ');
	readln(nombre);
	Assign(ach_log,nombre);
	Rewrite(ach_log);
	leerEmpleado(E);
	while(E.apellido <> 'fin')do
	begin
	Write(ach_log,E);
	leerEmpleado(E);
	end;
	close(ach_log);
	end;
	'B':
	begin
	writeln('nombre de archivo');
	readln(nombre);
	Assign(ach_log,nombre);
	reset(ach_log);
	writeln('nombre de empleado: ');
	readln(nombre);
	while not EOF(ach_log)do
	begin
	Read(ach_log,E);
	writeln(E.nombre);
	if(E.edad > 70) then
		writeln('major de 70: ', E.nombre);
	if(E.nombre = nombre) then mostrarEmleado(E);
	end;
	close(ach_log);
	end;
	'C':
	begin
	writeln('nombre de archivo');
	readln(nombre);
	Assign(ach_log,nombre);
	reset(ach_log);
	leerEmpleado(E);
	while(E.apellido <> 'fin') do
	begin
	Read(ach_log,aux);
	while (not EOF(ach_log)) and (E.nombre <> aux.nombre)do
	begin
	Read(ach_log,aux);
	end;
	if(e.nombre <> aux.nombre) then Write(ach_log,E) else
	writeln('ya existe ese empleado');
	close(ach_log);
	end;
	leerEmpleado(E);
	end;
	'D':
	begin
		writeln('nombre de archivo');
		readln(nombre);
		assign(ach_log,nombre);
		reset(ach_log);
		assign(T,'todos_empleados.txt');
		rewrite(T);
		while(not EoF(ach_log)) do begin
		Read(ach_log,E);
		Writeln(T,E.edad,E.num,E.edad,E.nombre);
		Writeln(T,E.apellido);
		end;
		close(T);
		close(ach_log);
		
	end;
	else writeln('Error de caracter');
	end;
END.

