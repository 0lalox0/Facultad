{
* 11. A partir de información sobre la alfabetización en la Argentina, se necesita actualizar un
archivo que contiene los siguientes datos: nombre de provincia, cantidad de personas
alfabetizadas y total de encuestados. Se reciben dos archivos detalle provenientes de dos
agencias de censo diferentes, dichos archivos contienen: nombre de la provincia, código de
localidad, cantidad de alfabetizados y cantidad de encuestados. Se pide realizar los módulos
necesarios para actualizar el archivo maestro a partir de los dos archivos detalle.
NOTA: Los archivos están ordenados por nombre de provincia y en los archivos detalle
pueden venir 0, 1 ó más registros por cada provincia.
   
}


program Punto11;
type
provincia = record
nombre:string;
encuestados,Alfas:integer;
end;
localidad = record
nombre:string;
encuestados,cod,Alfas:integer;
end;
Det = file of localidad;
Mae = file of provincia;
procedure leer(var D:Det;var reg:localidad);
begin
if(not EoF(D))then
	read(D,reg)
else reg.nombre := 'zzz'
end;
procedure minimo(var D1,D2:Det;var reg1,reg2,min:localidad);
begin
	if(reg1.nombre <= reg2.nombre)then
	begin
	min := reg1;
	leer(D1,reg1);
	
	end else// if(reg2.nombre > reg1.nombre)then
	begin
	min := reg2;
	leer(D2,reg2);
	end;
	{else(reg1.cod >= reg2.cod)then
	begin
	min := reg1;
	leer(D1,reg1)
	end else
	begin
	
	min := reg2;
	leer(D2,reg2);
	end;}

end;
procedure Actualizar(var M:Mae;var D1,D2:Det);
var
regD1,regD2,min:localidad;
regM:provincia;
begin
	reset(D1);
	reset(D2);
	reset(M);
	leer(D1,regD1);
	leer(D2,regD2);
	read(M,regM);
	minimo(D1,D2,regD1,regD2,min);
	while(min.nombre <> 'zzz')do begin
	while (regm.nombre <> min.nombre) do
		read(M,regm);
	while(regM.nombre = min.nombre)do begin
	regM.encuestados := regM.encuestados + min.encuestados;
	regM.Alfas := regM.Alfas + min.Alfas;
	minimo(D1,D2,regD1,regD2,min);
	end;
	seek (M, filepos(M)-1);
	write(M,regM);
	if (not eof (M))then
	read(M,regM);
	end;
	close(D1);
	close(D2);
	close(M);
		

end;
procedure GenerarArchivosDetalle(var D1, D2: Det);
var
  reg1, reg2: localidad;
begin
  assign(D1, 'detalle1.dat');
  assign(D2, 'detalle2.dat');
  
  rewrite(D1);
  rewrite(D2);
  
  // Generar registros de detalle 1
  reg1.nombre := 'Provincia1';
  reg1.encuestados := 100;
  reg1.Alfas := 80;
  write(D1, reg1);
  
  reg1.nombre := 'Provincia1';
  reg1.encuestados := 50;
  reg1.Alfas := 40;
  write(D1, reg1);
  
  reg1.nombre := 'Provincia2';
  reg1.encuestados := 70;
  reg1.Alfas := 60;
  write(D1, reg1);
  
  // Generar registros de detalle 2
  reg2.nombre := 'Provincia1';
  reg2.encuestados := 30;
  reg2.Alfas := 25;
  write(D2, reg2);
  
  reg2.nombre := 'Provincia2';
  reg2.encuestados := 40;
  reg2.Alfas := 35;
  write(D2, reg2);
  
  close(D1);
  close(D2);
end;

procedure GenerarArchivoMaestro(var M: Mae);
var
  reg: provincia;
begin
  assign(M, 'maestro.dat');
  
  rewrite(M);
  
  reg.nombre := 'Provincia1';
  reg.encuestados := 0;
  reg.Alfas := 0;
  write(M, reg);
  
  reg.nombre := 'Provincia2';
  reg.encuestados := 0;
  reg.Alfas := 0;
  write(M, reg);
  
  close(M);
end;
procedure MostrarContenidoArchivoMaestro(var M: Mae);
var
  reg: provincia;
begin
  assign(M, 'maestro.dat');
  reset(M);
  
  while not eof(M) do
  begin
    read(M, reg);
    writeln('Nombre: ', reg.nombre);
    writeln('Encuestados: ', reg.encuestados);
    writeln('Alfas: ', reg.Alfas);
    writeln;
  end;
  
  close(M);
end;
var M: Mae;
D1, D2: Det;
BEGIN
	//GenerarArchivosDetalle(D1, D2);
	//GenerarArchivoMaestro(M);
	
	assign(M, 'maestro.dat');
	assign(D1, 'detalle1.dat');
    assign(D2, 'detalle2.dat');
    MostrarContenidoArchivoMaestro(M);
    Actualizar(M,D1,D2);
    MostrarContenidoArchivoMaestro(M);
END.

