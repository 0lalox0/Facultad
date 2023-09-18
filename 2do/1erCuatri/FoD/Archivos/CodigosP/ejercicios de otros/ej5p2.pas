program ej5p2;
const
	valorAlto=9999;
	dimF=50;
type
	nacimientos=record
		nroPartida:integer;
		nombre:string;
		apellido:string;
		ciudad:string;
		matriculaMedico:integer;
		nombreMadre:string;
		apellidoMadre:string;
		dniMadre:integer;
		nombrePadre:string;
		apellidoPadre:string;
		dniPadre:integer;
	end;
	arcDetNaci=file of nacimientos;
	vecDetNaci=array[1..dimF]of arcDetNaci;
	vecDetRegNaci=array[1..dimF]of nacimientos;
	fallecimientos=record
		nroPartida:integer;
		dni:integer;
		nombre:string;
		apellido:string;
		matriculaMed:integer;
		fecha:integer;
		hora:integer;
		lugar:string;
	end;
	arcDetFalleci=file of fallecimientos;
	vecDetFalleci=array[1..dimF]of arcDetFalleci;
	vecDetRegFalleci=array[1..dimF]of fallecimientos;
	infoMaestro=record
		nroPartida:integer;
		nombre:string;
		apellido:string;
		ciudad:string;
		matriculaMed:integer;
		nombreMadre:string;
		apellidoMadre:string;
		dniMadre:integer;
		nombrePadre:string;
		apellidoPadre:string;
		dniPadre:integer;
		matriculaMedFirmDeceso:integer;
		fecha:integer;
		hora:integer;
		lugar:string;
	end;
	maestro=file of infoMaestro;
procedure leerNaci(var arc:arcDetNaci; var regDetN:nacimientos);
begin
	if(not eof(arc))then
		read(arc,regDetN)
	else
		regDetN.nroPartida:=valorAlto;
end;
procedure leerFalleci(var arc:arcDetFalleci; var regDetF:fallecimientos);
begin
	if(not eof(arc))then
		read(arc,regDetF)
	else
		regDetF.nroPartida:=valorAlto;
end;
procedure minimoFalleci (var min:fallecimientos;var vDF:vecDetFalleci;var vDRF:vecDetRegFalleci);
var
	i,pos:integer;
begin
	min.nroPartida:=valorAlto;
	for i:=1 to dimF do begin
		if(vDRF[i].nroPartida<min.nroPartida)then begin
			min:=vDRF[i];
			pos:=i;
		end;
	end;
	if(min.nroPartida<>valorAlto)then
		leerFalleci(vDF[pos],vDRF[pos]);
end;
procedure minimoNaci (var min:nacimientos;var vDN:vecDetNaci;var vDRN:vecDetRegNaci);
var
	i,pos:integer;
begin
	min.nroPartida:=valorAlto;
	for i:=1 to dimF do begin
		if(vDRN[i].nroPartida<min.nroPartida)then begin
			min:=vDRN[i];
			pos:=i;
		end;
	end;
	if(min.nroPartida<>valorAlto)then
		leerNaci(vDN[pos],vDRN[pos]);
end;
procedure abrirArcNaci (var vDN:vecDetNaci;var vDRN:vecDetRegNaci);
var
	i:integer;
	s:string;
begin
	for i:= 1 to dimF do begin
		Str(i,s);
		assign(vDN[i],'det'+s);
		reset(vDN[i]);
		leerNaci(vDN[i],vDRN[i]);
	end;
end;
procedure abrirArcFalleci (var vDF:vecDetFalleci;var vDRF:vecDetRegFalleci);
var
	i:integer;
	s:string;
begin
	for i:= 1 to dimF do begin
		Str(i,s);
		assign(vDF[i],'det'+s);
		reset(vDF[i]);
		leerFalleci(vDF[i],vDRF[i]);
	end;
end;
procedure crearMaestro (var arcM:maestro; var vDN:vecDetNaci;var vDRN:vecDetRegNaci;var vDF:vecDetFalleci; var vDRF:vecDetRegFalleci);
var
	regM:infoMaestro;
	minNaci:nacimientos;
	minFall:fallecimientos;
	i:integer;
begin
	abrirArcNaci(vDN,vDRN);
	abrirArcFalleci(vDF,vDRF);
	minimoNaci(minNaci,vDN,vDRN);
	minimoFalleci(minFall,vDF,vDRF);
	while(minNaci.nroPartida<>valorAlto)and(minFall.nroPartida<>valorAlto)do begin
		if(minNaci.nroPartida=minFall.nroPartida)then begin
			regM.nombre:=minNaci.nombre;
			regM.apellido:=minNaci.apellido;
			regM.ciudad:=minNaci.ciudad;
			regM.matriculaMed:=minNaci.matriculaMedico;
			regM.nombreMadre:=minNaci.nombreMadre;
			regM.apellidoMadre:=minNaci.apellidoMadre;
			regM.dniMadre:=minNaci.dniMadre;
			regM.nombrePadre:=minNaci.nombrePadre;
			regM.apellidoPadre:=minNaci.apellidoPadre;
			regM.dniPadre:=minNaci.dniPadre;
			regM.matriculaMedFirmDeceso:=minFall.matriculaMed;
			regM.fecha:=minFall.fecha;
			regM.hora:=minFall.hora;
			regM.lugar:=minFall.lugar;
			write(arcM,regM); 
			minimoFalleci(minFall,vDF,vDRF);//sepone ak xq si fallece hay q leer otro fallecido, si el nacido no fallecio no deberia leer otro fallecido
		end
		else begin
			regM.nombre:=minNaci.nombre;
			regM.apellido:=minNaci.apellido;
			regM.ciudad:=minNaci.ciudad;
			regM.matriculaMed:=minNaci.matriculaMedico;
			regM.nombreMadre:=minNaci.nombreMadre;
			regM.apellidoMadre:=minNaci.apellidoMadre;
			regM.dniMadre:=minNaci.dniMadre;
			regM.nombrePadre:=minNaci.nombrePadre;
			regM.apellidoPadre:=minNaci.apellidoPadre;
			regM.dniPadre:=minNaci.dniPadre;
			write(arcM,regM); 
		end;
		minimoNaci(minNaci,vDN,vDRN);
	end;
	for i:=1 to dimF do begin
		close(vDN[i]);
		close(vDF[i]);
	end;
	close(arcM);
end;
procedure exportar (var arcM:maestro);
var
	arcTxt:text;
	fisicoTxt:string;
	regM:infoMaestro;
begin
	write('escribir el nombre del archivo fisico de texto donde guardar el archivo maestro');
	readln(fisicoTxt);
	assign(arcTxt,fisicoTxt);
	rewrite(arcTxt);
	reset(arcM);
	while(not eof(arcM))do begin
		read(arcM,regM);
		with regM do begin
			writeln(arcTxt,nroPartida,matriculaMed,nombre);
			writeln(arcTxt,apellido);
			writeln(arcTxt,ciudad);
			writeln(arcTxt,dniMadre,nombreMadre);
			writeln(arcTxt,apellidoMadre);
			writeln(arcTxt,dniPadre,nombrePadre);
			writeln(arcTxt,apellidoPadre);
			writeln(arcTxt,matriculaMedFirmDeceso,fecha,lugar);
		end;
	end;
	close(arcM);
	close(arcTxt);
end;
var
	vDN:vecDetNaci;
	vDRN:vecDetRegNaci;
	vDF:vecDetFalleci;
	vDRF:vecDetRegFalleci;
	mae:maestro;
begin
	crearMaestro(mae,vDN,vDRN,vDF,vDRF);
	exportar(mae);
end.
