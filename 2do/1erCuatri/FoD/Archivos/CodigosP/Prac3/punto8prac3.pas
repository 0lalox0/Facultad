{
Se cuenta con un archivo con información de las diferentes distribuciones de linux
existentes. De cada distribución se conoce: nombre, año de lanzamiento, número de
versión del kernel, cantidad de desarrolladores y descripción. El nombre de las
distribuciones no puede repetirse.
Este archivo debe ser mantenido realizando bajas lógicas y utilizando la técnica de
reutilización de espacio libre llamada lista invertida.
Escriba la definición de las estructuras de datos necesarias y los siguientes
procedimientos:
ExisteDistribucion: módulo que recibe por parámetro un nombre y devuelve verdadero si
la distribución existe en el archivo o falso en caso contrario.
AltaDistribución: módulo que lee por teclado los datos de una nueva distribución y la
agrega al archivo reutilizando espacio disponible en caso de que exista. (El control de
unicidad lo debe realizar utilizando el módulo anterior). En caso de que la distribución que
se quiere agregar ya exista se debe informar “ya existe la distribución”.
BajaDistribución: módulo que da de baja lógicamente una distribución  cuyo nombre se
lee por teclado. Para marcar una distribución como borrada se debe utilizar el campo
cantidad de desarrolladores para mantener actualizada la lista invertida. Para verificar
que la distribución a borrar exista debe utilizar el módulo ExisteDistribucion. En caso de no
existir se debe informar “Distribución no existente”.
}


program punto8prac3;
const valoralto = 'zzz';
type
distribuciones = record
nom,descripcion:string;
anio,num,cant:integer;
end;
arc = file of distribuciones;
procedure leer(var reg:distribuciones; var a:arc);
begin
if(not eof(a))then
	read(a,reg)
	else
	reg.nom := valoralto;
end;
function ExisteDistribucion(nom:string;var a:arc):boolean;
var
b:boolean;
reg:distribuciones;
begin
reset(a);
b := false;
leer(reg,a);
while(reg.nom<>valoralto)do
begin
if(reg.nom = nom)then
begin
b := true;
reg.nom := valoralto;
end else
leer(reg,a);
end;
close(a);
if(b = false)then
ExisteDistribucion := b;

end;
procedure leerDistribucion(var reg:distribuciones);
begin
read(reg.nom);
read(reg.cant);
end;
procedure AltaDistribucion(var a:arc);
var
regNue,reg:distribuciones;
begin
reset(a);
leerDistribucion(regNue);
if(ExisteDistribucion(regNue.nom,a))then
	writeln('ya existe la distribucion')
	else
	begin
		leer(reg,a);
		if(reg.cant = 0)then 
		begin
			 seek(a,filesize(a));
			 write(a,regNue);
		end else
		begin
			seek(a,-reg.cant);
			leer(reg,a);
			seek(a,filepos(a)-1);
			write(a,regNue);
			seek(a,0);
			write(a,reg);
		end;
	end;
close(a);
end;
{BajaDistribución: módulo que da de baja lógicamente una distribución  cuyo nombre se
lee por teclado. Para marcar una distribución como borrada se debe utilizar el campo
cantidad de desarrolladores para mantener actualizada la lista invertida. Para verificar
que la distribución a borrar exista debe utilizar el módulo ExisteDistribucion. En caso de no
existir se debe informar “Distribución no existente”.}
procedure BajaDistribucion(var a:arc);
var
cab,reg:distribuciones;
nom:string;
begin
reset(a);
read(nom);
if(ExisteDistribucion(nom,a))then
begin
leer(cab,a);
leer(reg,a);
while(reg.nom <> nom)do
	leer(reg,a);
reg.cant := -1*(filepos(a)-1);
seek(a,filepos(a)-1);
cab.nom := '***';
write(a,cab);
seek(a,0);
write(a,reg);
end else
writeln('Distribucion no existente');
close(a);
end;
var i : byte;

BEGIN
	
	
END.

