{
4. Suponga que trabaja en una oficina donde está montada una LAN (red local). La misma
fue construida sobre una topología de red que conecta 5 máquinas entre sí y todas las
máquinas se conectan con un servidor central. Semanalmente cada máquina genera un
archivo de logs informando las sesiones abiertas por cada usuario en cada terminal y por
cuánto tiempo estuvo abierta. Cada archivo detalle contiene los siguientes campos:
cod_usuario, fecha, tiempo_sesion. Debe realizar un procedimiento que reciba los archivos
detalle y genere un archivo maestro con los siguientes datos: cod_usuario, fecha,
tiempo_total_de_sesiones_abiertas.
Notas:
- Cada archivo detalle está ordenado por cod_usuario y fecha.
- Un usuario puede iniciar más de una sesión el mismo día en la misma o en diferentes
máquinas.
- El archivo maestro debe crearse en la siguiente ubicación física: /var/log.
}


program Prac2Punt4;
type
log = record
cod_usuario, fecha, tiempo_sesion:integer;
end;
arc = file of log;
procedure leer(var a:arc;var r:log);
begin
if(not (EoF(a)))then
	read(a,r)
else r.cod_usuario := 19999;

end;
procedure importarTxt(var arc:arc);
var
	arcTxt:text;
	p:log;
	fisico:string;
begin
	write('escribir el nombre del archivo binario fisico: ');
	readln(fisico);
	assign(arc,fisico);
	rewrite(arc);
	write('escribir el nombre del archivo binario fisico del texto: ');
	readln(fisico);
	assign(arcTxt,fisico);
	reset(arcTxt);
	while(not eof(arcTxt))do begin
		with p do begin
			readln(arcTxt,cod_usuario,fecha,tiempo_sesion);
		end;
		write(arc,p);
	end;
	writeln('archivo binario del maestro creado');
	close(arcTxt);
end;
procedure exportartxt(var arc:arc);
var
fisico:string;
arcTxt:text;
p:log;
begin
	write('escribir el nombre del archivo binario fisico del texto: ');
	readln(fisico);
	assign(arcTxt,fisico);
	rewrite(arcTxt);
	while(not eof(arc))do begin
		read(arc,p);
		writeln(p.cod_usuario);
		with p do begin
			writeln(arcTxt,' ',cod_usuario,' ',fecha,' ',tiempo_sesion);
		end;
	end;
	writeln('archivo de texto creado');
	close(arcTxt);

end;
procedure minimo(var det1,det2,det3,det4,det5:arc;var r1,r2,r3,r4,r5,min:log);
var
i:integer;
begin
i := 0;
min.cod_usuario := 9999;

if(r1.cod_usuario <= min.cod_usuario)then
begin
if(r1.cod_usuario < min.cod_usuario) OR (r1.fecha <= min.fecha)then
begin
	min := r1;
	i := 1;
end;
end;
if(r2.cod_usuario <= min.cod_usuario)then
begin
if(r2.cod_usuario < min.cod_usuario) OR (r2.fecha < min.fecha)then
begin
	min := r2;
	i := 2;
end;
end;
if(r3.cod_usuario <= min.cod_usuario)then
begin
if(r3.cod_usuario < min.cod_usuario) OR (r3.fecha < min.fecha)then
begin
	min := r3;
	i := 3;
end; 
end;
if(r4.cod_usuario <= min.cod_usuario)then
begin
if(r4.cod_usuario < min.cod_usuario) OR (r4.fecha < min.fecha)then
begin
	min := r4;
	i := 4;
end;
end;
if(r5.cod_usuario <= min.cod_usuario)then
begin
if(r5.cod_usuario < min.cod_usuario) OR (r5.fecha < min.fecha)then
begin
	min := r5;
	i := 5;
end;
end;
case i of
   1:leer(det1,r1);
   2:leer(det2,r2);
   3:leer(det3,r3);
   4:leer(det4,r4);
   5:leer(det5,r5);
 end;
end;
procedure Merge(var det1,det2,det3,det4,det5,M:arc);
var
r1,r2,r3,r4,r5,min,act:log;

begin
leer(det1,r1);
leer(det2,r2);
leer(det3,r3);
leer(det4,r4);
leer(det5,r5);
minimo(det1,det2,det3,det4,det5,r1,r2,r3,r4,r5,min);
while(min.cod_usuario <> 9999)do begin
act.cod_usuario := min.cod_usuario;
act.tiempo_sesion := 0;
while(act.cod_usuario = min.cod_usuario)do
begin
act.tiempo_sesion := min.tiempo_sesion + act.tiempo_sesion ;
minimo(det1,det2,det3,det4,det5,r1,r2,r3,r4,r5,min);
end;
write(m,act);
end;
end;
procedure BorrarEn(var a:arc;i:integer);
var
r:log;
begin
seek(a,filesize(a)-1);
leer(a,r);
seek(a,i);
write(a,r);
truncate(a);
end;
var
det1,det2,det3,det4,det5,M:arc;
BEGIN
	{importarTxt(det1);
	importarTxt(det2);
	importarTxt(det3);
	importarTxt(det4);
	importarTxt(det5);}
	Assign(det1,'detalle1');
	Assign(det2,'detalle2');
	Assign(det3,'detalle3');
	Assign(det4,'detalle4');
	Assign(det5,'detalle5');
	Assign(M,'maestro');
	reset(det1);
	reset(det2);
	reset(det3);
	reset(det4);
	reset(det5);
	Assign(M,'maestro');
	rewrite(m);
	Merge(det1,det2,det3,det4,det5,m);
	//BorrarEn(m,2);
	seek(m,0);
	exportartxt(m);
	close(det1);
	close(det2);
	close(det3);
	close(det4);
	close(det5);
	close(m);
END.

