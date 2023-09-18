{
2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creados en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el
promedio de los números ingresados. El nombre del archivo a procesar debe ser
proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
contenido del archivo en pantalla. 
}


program Prac1Ej2;
type
numeros = file of integer;
var
arc_log:numeros;
cant:integer;
total:integer;
nombre:string;
dimF:integer;
i,aux:integer;
BEGIN
	cant := 0;
	total := 0;
	readln(nombre);
	Assign(arc_log,nombre);
	Reset(arc_log);
	dimF := FileSize(arc_log);
	for i:= 0 to dimF - 1 do begin
		Read(arc_log,aux);
		write(aux,' ');
		if(aux < 1500) then cant := cant +1;
		total := aux + total;
	end;
	write('Promedio: ',total/FileSize(arc_log));
	
END.

