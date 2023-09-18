program ej3p2;
const
	valorAlto=9999;
	dimF=30;
type
	infoProd=record
		cod:integer;
		nombre:string;
		descripcion:string;
		stockDisp:integer;
		stockMin:integer;
		precioProd:real;
	end;
	maestro=file of infoProd;
	infoDet=record
		cod:integer;
		cantVend:integer;
	end;
	detalle=file of infoDet;
	vecDet=array[1..dimF]of detalle;
	vecRegDet=array[1..dimF]of infoDet;
//PROCESOS PARA IMPORTAR TEXTO A BINARIO PRA LABURAR MEJOR igual no lo puedo probar asi q no sirve hacerlo
{procedure importarTxtMae(var arcM:maestro);
var
	arcTxt:text;
	p:infoProd;
	fisico:string;
begin
	write('escribir el nombre del archivo binario fisico del maestro: ');
	readln(fisico);
	assign(arcM,fisico);
	rewrite(arcM);
	assign(arcTxt,'maestro.txt');
	reset(arcTxt);
	while(not eof(arcTxt))do begin
		with p do begin
			readln(arcTxt,cod,stockDisp,stockMin,precioProd,nombre);
			readln(arcTxt,descripcion);
		end;
		write(arcM,p);
	end;
	writeln('archivo binario del maestro creado');
	close(arcM);
	close(arcTxt);
end;
procedure importarTxtDet(var arcD:detalle; i:integer);
var
	arcTxt:text;
	d:infoDet;
	fisicoDet,fisicoTxt:string;
begin
	writeln('escribir el nombre del arc fisico del detalle numero: ',i,' : ');
	readln(fisicoDet);
	assign(arcD,fisicoDet);
	rewrite(arcD);
	writeln('escribir el nombre del arc d texto fisico que vas a usar: ');
	readln(fisicoTxt);
	assign(arcTxt,fisicoTxt);
	reset(arcTxt);
	while(not eof(arcTxt))do begin
		with d do 
			readln(arcTxt,cod,cantVend);
		write(arcD,d);
	end;
	writeln('archivo detalle: ',i,' importado');
	close(arcD);
	close(arcTxt);
end;}

//PROCESOS
procedure abrirArc (var vDet:vecDet;var vRegD:vecRegDet);
var
	i:integer;
	s:string;
begin
	for i:=1 to dimF do begin
		Str(i,s);//lo q vale i lo pasa a string y lo guarda en s
		assign(vDet[i],'det'+s);
		reset(vDet[i]);
		leer(vDet[i],vRegD[i]);//hago un leer de cada archivo detalle y guardo su primer registro en el vector de reg d detalles q es el mas chico en cuanto a codigo 
	end; 
end;
procedure leer( var arcD:detalle;var regD:infoDet);
begin
	if(not eof(arcD))then
		read(arcD,regD)
	else
		regD.cod:=valorAlto;
end;
procedure minimo (var vRegD:vecRegDet;var min:infoDet; var vDet:vecDet);
var
	i,pos:integer;
begin
	min.cod:=valorAlto;//se pone ak xq se supone q los cod del vector estan ordenados d menor a mayor
	for i:=1 to 30 do begin
		if(vRegD[i].cod<min.cod)then begin//sacamos el minimo del vector que tiene el primer registro de cada archivo detalle, osea el primer reg corresponde al primer detalle, el seg al seg detalle y asi
			min:=vRegD[i];//en min guardamos el registro minimo del vector
			pos:=i;//y en pos la posicion de este registro minimo
		end;
	end;
	if(min.cod<>valorAlto)then
		leer(vDet[pos],vRegD[pos]);//leemos el archivo detalle que corresponda con la posicion del registro minimo sacado anteriormente x ende avanzamos en el archivo q esta guardado en el elemento del vector detalle en la posicion pos
end;
procedure actualizarMae(var arcM:maestro;var vDet:vecDet;var vRegD:vecRegDet);
var
	min:infoDet;
	codProdAct:integer;
	p:infoProd;
begin
	abrirArc(vDet,vRegD);
	assign(arcM,'maestro');
	reset(arcM);
	minimo(vReg,min,vDet);
	read(arcM,p);
	while(min.cod<>valorAlto)do begin
		codProdAct:=min.cod;
		total:=0;
		while(min.cod=codProdAct)do begin
			total:=total+min.cantVend;
			minimo(vReg,min,vDet);
		end;
		while(p.cod<>codProdAct)do 
			read(arcM,p);
		p.stockDisp:=p.stockDisp-total;
		seek(arcM,filepos(arcM)-1);
		write(arcM,p);
	end;
	close(arcM);
	for i:=1 to dimF do 
		close(vDet[i]);
end;
procedure exportar (var arcM:maestro);
var
	arcTxt:text;
	fisicoTxt:string;
	p:infoProd;
begin
	write('escribir el nombre del arc fisico d texto a crear: ');
	readln(fisicoTxt);
	assign(arcTxt,fisicoTxt);
	rewrite(arcTxt);
	while(not eof(arcM))do begin
		read(arcM,p);
		if(p.stockDisp<p.stockMin)then begin
			with p do begin
				writeln(arcTxt,' ',stockDisp,' ',precio,' 'nombre);
				writeln(arcTxt,' ',descripcion);
			end;
		end;
	end;
	close(arcM);
	close(arcTxt);
end;
//PROGRAMA PRINCIPAL
var
	mae:maestro;
	vDet:vecDet;
	vRegD:vecRegDet;
begin
	{importarTxtMae(mae);
	for i:=1 to 30 do 
		importarTxtDet(vDet[i],i);}
	actualizarMae(mae,vDet,vRegD);
	exportar(mae);
end.
