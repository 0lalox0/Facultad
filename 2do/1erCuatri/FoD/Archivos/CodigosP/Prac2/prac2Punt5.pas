{
   A partir de un siniestro ocurrido se perdieron las actas de nacimiento y fallecimientos de
toda la provincia de buenos aires de los últimos diez años. En pos de recuperar dicha
información, se deberá procesar 2 archivos por cada una de las 50 delegaciones distribuidas
en la provincia, un archivo de nacimientos y otro de fallecimientos y crear el archivo maestro
reuniendo dicha información.
Los archivos detalles con nacimientos, contendrán la siguiente información: nro partida
nacimiento, nombre, apellido, dirección detallada (calle,nro, piso, depto, ciudad), matrícula
del médico, nombre y apellido de la madre, DNI madre, nombre y apellido del padre, DNI del
padre.
En cambio, los 50 archivos de fallecimientos tendrán: nro partida nacimiento, DNI, nombre y
apellido del fallecido, matrícula del médico que firma el deceso, fecha y hora del deceso y
lugar.
Realizar un programa que cree el archivo maestro a partir de toda la información de los
archivos detalles. Se debe almacenar en el maestro: nro partida nacimiento, nombre,
apellido, dirección detallada (calle,nro, piso, depto, ciudad), matrícula del médico, nombre y
apellido de la madre, DNI madre, nombre y apellido del padre, DNI del padre y si falleció,
además matrícula del médico que firma el deceso, fecha y hora del deceso y lugar. Se
deberá, además, listar en un archivo de texto la información recolectada de cada persona.
Nota: Todos los archivos están ordenados por nro partida de nacimiento que es única.
Tenga en cuenta que no necesariamente va a fallecer en el distrito donde nació la persona y
además puede no haber fallecido.
   
}


program Prac2Punto5;
type
direccion = record
calle,nro,piso,depto:integer;
ciudad:string;
end;
nacimiento = record
n,matricula:integer;
nobmre,apellido:string;
dir:direccion;
end;
fallecido = record
n,dni,matricula,fecha,hora:integer;
lugar,nombre,apellido:string;
end;
maestro = record
n,matriculaVivo,matriculaMuerto:integer;
muerto:boolean;
end;
detF = file of fallecido;
detN = file of nacimiento;
Maes = file of maestro;
delegacion = record
F:detF;
N:detN;
end;
delegaciones = array[1..50] of delegacion;
FReg = array[1..50] of fallecido;
NReg = array[1..50] of nacimiento;
procedure leerN(var a:detN;var r:nacimiento);
begin
if(not (EoF(a)))then
	read(a,r)
else r.n := 19999;

end;
procedure leerF(var a:detF;var r:Fallecido);
begin
if(not (EoF(a)))then
	read(a,r)
else r.n := 19999;

end;
procedure minimo(var D:delegaciones;var RegN:Nreg;var RegF:Freg;var minF:fallecido; var minN:nacimiento);
var
i,posN,posF:integer;
begin
minN.n = 19999;
minF.n = 19999;
posF := -1;
for i := 1 to 50 do begin
if(D[i].N.n < minN.n)then
	begin
	minN := D[i].N;
	posN := i;
	end;
if(D[i].F.n < minF.n)then
	begin
	minN := D[i].N;
	posF := i;
	end;
leerN(D[posN],regN[posN]);
if(posF <> -1)then
	leerN(D[posF],regN[posF]);
end;



end;
var
i:integer;
M:maes;
regM:maestro;
D:delegaciones;
RN:NReg;
RF:Freg;
minF:fallecido;
minN:nacimiento;
BEGIN
	Assign(D,'nombre arca');
	for i := 1 to 50 do begin
	reset(D[i].N);
	leerN(D[i].N,RN[i]);
	reset(D[i].F);
	leerF(D[i].F,RF[i]);
	end;
	Assign(M,'maestro1');
	rewrite(M);
	minimo(D,RN,RF,minF,minN);
	while(minN <> 19999)begin
	regM := nil;
	regM.n := minN.n;
	regM.matriculaVivo := minN.matricula6;
	if(minN.n = minF.n)then
	begin
	regM.muerto := true;
	RegM.matriculaMuerto := minF.matricula;
	end else regM.muerto := false;
	write(M,regM);
	minimo(D,RN,RF,minF,minN);
	end;
	
END.

