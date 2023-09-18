{
 Se cuenta con un archivo con información de los casos de COVID-19 registrados en los
diferentes hospitales de la Provincia de Buenos Aires cada día. Dicho archivo contiene:
cod_localidad, nombre_localidad, cod_municipio, nombre_minucipio, cod_hospital,
nombre_hospital, fecha y cantidad de casos positivos detectados.
El archivo está ordenado por localidad, luego por municipio y luego por hospital.
a. Escriba la definición de las estructuras de datos necesarias y un procedimiento que haga
un listado con el siguiente formato:
Nombre: Localidad 1
Nombre: Municipio 1
Nombre Hospital 1……………..Cantidad de casos Hospital 1
……………………..
Nombre Hospital N…………….Cantidad de casos Hospital N
Cantidad de casos Municipio 1
…………………………………………………………………….
Nombre Municipio N
Nombre Hospital 1……………..Cantidad de casos Hospital 1
……………………..
NombreHospital N…………….Cantidad de casos Hospital N
Cantidad de casos Municipio N
Cantidad de casos Localidad 1
-----------------------------------------------------------------------------------------
Nombre Localidad N
Nombre Municipio 1
Nombre Hospital 1……………..Cantidad de casos Hospital 1
……………………..
Nombre Hospital N…………….Cantidad de casos Hospital N
Cantidad de casos Municipio 1
…………………………………………………………………….
Nombre Municipio N
Nombre Hospital 1……………..Cantidad de casos Hospital 1
……………………..
Nombre Hospital N…………….Cantidad de casos Hospital N
Cantidad de casos Municipio N
Cantidad de casos Localidad N
Cantidad de casos Totales en la Provincia
b. Exportar a un archivo de texto la siguiente información nombre_localidad,
nombre_municipio y cantidad de casos de municipio, para aquellos municipios cuya
cantidad de casos supere los 1500. El formato del archivo de texto deberá ser el
adecuado para recuperar la información con la menor cantidad de lecturas posibles.
   cod_localidad, nombre_localidad, cod_municipio, nombre_minucipio, cod_hospital,
nombre_hospital, fecha y cantidada
}


program Punto18Prac2;
type
CasoR = record
codL,codM,codH,cant:integer;
nomL,nomM,nomH,fecha:string;
end;
arc = file of Casor;
procedure leer(var a:arc;var reg:casor);
begin
if(not eof(a))then
read(a,reg) 
else
reg.codL := 9999;
end;
procedure consola(var a:arc);
var
reg,act:casor;
cantL,cantM,cantH,tot:integer;
texto:text;
begin
	reset(a);
	assign(texto,'texto.txt');
	rewrite(texto);
	leer(a,reg);
	tot := 0;
	while(reg.codL <> 9999)do begin
	writeln(reg.nomL);
	act:= reg;
	cantL := 0;
	while(act.codL = reg.codL)do begin
	
	act.codM := reg.codM;
	act.nomM := reg.nomM;
	writeln(act.nomM);
	cantM :=0;
	while(act.codL = reg.codL)and(act.codM = reg.codM)do begin
	act.codH := reg.codH;
	act.nomH := reg.nomH;
	cantH := 0;
	while(act.codL = reg.codL)and(act.codM = reg.codM) and (act.codH = reg.codH)do 
	begin
	cantH := cantH + reg.cant;
	leer(a,reg);
	end;
	writeln('Cantidad de casos en ',act.nomH,': ',cantH );
	cantM := cantM + cantH;
	end;
	writeln('Cantidad de casos en ',act.nomM,': ',cantM );
	if(cantM > 1500)then
	begin
	writeln(texto,' ',act.nomL,' ',act.nomM,' cant: ',cantM);
	end;
	cantL := cantL + cantM;
	end;
	writeln('Cantidad de casos en ',act.nomL,': ',cantL );
	tot := tot + cantL;
	end;
	writeln('total en la provincia: ',tot);
	close(a);
	close(texto);
	{b. Exportar a un archivo de texto la siguiente información nombre_localidad,
nombre_municipio y cantidad de casos de municipio, para aquellos municipios cuya
cantidad de casos supere los 1500. El formato del archivo de texto deberá ser el
adecuado para recuperar la información con la menor cantidad de lecturas posibles.}
end;
procedure CrearArc(var archivo:arc);
var
  caso:casor;
begin
  assign(archivo, 'datos.dat');
  rewrite(archivo);
  caso.codL := 1;
  caso.nomL := 'Localidad1';
  caso.codM := 1;
  caso.nomM := 'Municipio1';
  caso.codH := 1;
  caso.nomH := 'Hospital1';
  caso.fecha := '2023-01-01';
  caso.cant := 1000;
  write(archivo, caso);

  caso.codL := 1;
  caso.nomL := 'Localidad1';
  caso.codM := 1;
  caso.nomM := 'Municipio1';
  caso.codH := 1;
  caso.nomH := 'Hospital1';
  caso.fecha := '2023-01-02';
  caso.cant := 500;
  write(archivo, caso);

  caso.codL := 1;
  caso.nomL := 'Localidad1';
  caso.codM := 1;
  caso.nomM := 'Municipio1';
  caso.codH := 2;
  caso.nomH := 'Hospital2';
  caso.fecha := '2023-01-01';
  caso.cant := 8;
  write(archivo, caso);

  caso.codL := 1;
  caso.nomL := 'Localidad1';
  caso.codM := 1;
  caso.nomM := 'Municipio1';
  caso.codH := 2;
  caso.nomH := 'Hospital2';
  caso.fecha := '2023-01-02';
  caso.cant := 3;
  write(archivo, caso);
  
  caso.codL := 1;
  caso.nomL := 'Localidad1';
  caso.codM := 1;
  caso.nomM := 'Municipio1';
  caso.codH := 2;
  caso.nomH := 'Hospital2';
  caso.fecha := '2023-01-02';
  caso.cant := 3;
  write(archivo, caso);

	caso.codL := 1;
  caso.nomL := 'Localidad1';
  caso.codM := 2;
  caso.nomM := 'Municipio2';
  caso.codH := 3;
  caso.nomH := 'Hospital3';
  caso.fecha := '2023-01-01';
  caso.cant := 12;
  write(archivo, caso);

  caso.codL := 1;
  caso.nomL := 'Localidad1';
  caso.codM := 2;
  caso.nomM := 'Municipio2';
  caso.codH := 3;
  caso.nomH := 'Hospital3';
  caso.fecha := '2023-01-02';
  caso.cant := 3000;
  write(archivo, caso);

  caso.codL := 2;
  caso.nomL := 'Localidad2';
  caso.codM := 3;
  caso.nomM := 'Municipio3';
  caso.codH := 4;
  caso.nomH := 'Hospital4';
  caso.fecha := '2023-01-01';
  caso.cant := 20;
  write(archivo, caso);

  caso.codL := 2;
  caso.nomL := 'Localidad2';
  caso.codM := 3;
  caso.nomM := 'Municipio3';
  caso.codH := 4;
  caso.nomH := 'Hospital4';
  caso.fecha := '2023-01-02';
  caso.cant := 18;
  write(archivo, caso);

  close(archivo);
end;
var
a:arc;
reg:casor;
BEGIN
	CrearArc(a);
	assign(a,'datos.dat');
	consola(a);
END.

