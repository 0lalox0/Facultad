program Prac1Ej1;
{
* Realizar un algoritmo que cree un archivo de números enteros no ordenados 
* 	y permita.
  incorporar datos al archivo. Los números son ingresados desde teclado.
* El nombre del
		archivo debe ser proporcionado por el usuario desde teclado. 
* La carga finaliza cuando
	se ingrese el número 30000, que no debe incorporarse al archivo.

* 
* }
type
numeros = file of integer;
var
arch_num:numeros;
nombre:string;
num:integer;
BEGIN
	readln(nombre);
	Assign(arch_num, nombre);
	rewrite(arch_num);
	readln(num);
	while(num <> 30000) do
	begin
		write(arch_num, num);
		readln(num);
	end;
	close(arch_num);
END.

