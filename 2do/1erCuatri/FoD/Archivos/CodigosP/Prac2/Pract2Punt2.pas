{2. Se dispone de un archivo con información de los alumnos de la Facultad de Informática. Por
cada alumno se dispone de su código de alumno, apellido, nombre, cantidad de materias
(cursadas) aprobadas sin final y cantidad de materias con final aprobado. Además, se tiene
un archivo detalle con el código de alumno e información correspondiente a una materia
(esta información indica si aprobó la cursada o aprobó el final).
Todos los archivos están ordenados por código de alumno y en el archivo detalle puede
haber 0, 1 ó más registros por cada alumno del archivo maestro. Se pide realizar un
programa con opciones para:
a. Actualizar el archivo maestro de la siguiente manera:
i.Si aprobó el final se incrementa en uno la cantidad de materias con final aprobado.
ii.Si aprobó la cursada se incrementa en uno la cantidad de materias aprobadas sin
final.
b. Listar en un archivo de texto los alumnos que tengan más de cuatro materias
con cursada aprobada pero no aprobaron el final. Deben listarse todos los campos.
NOTA: Para la actualización del inciso a) los archivos deben ser recorridos sólo una vez.
}


program Prac2Punt2;

type
alumno = record
cod,cantF,cantA:integer;
nombre,apellido:string;
end;
arch = file of alumno;
procedure leer(var A:arch; var reg:alumno);
begin
if(not EoF(A))then
read(A,reg) else reg.cod := 0;
end;
var
M,D:arch;
regM,regD:alumno;

BEGIN
	Assign(M,'maestro');
	Assign(D,'detalle');
	Rewrite(M);
	Rewrite(D);
	leer(M,regM);
	leer(D,regD);
	while(regD.cod <> 0) do begin
	while(regD.cod = regM.cod) do begin
	if(regD.cantF = 1) then
		regM.cantF := regM.cantF + 1
	else regM.cantA := regM.cantA + 1;
	leer(D,regD)
	end;
	seek(M,filepos(M)-1);
	Write(M,regM);
	leer(M,regM)
	end;
	
END.
