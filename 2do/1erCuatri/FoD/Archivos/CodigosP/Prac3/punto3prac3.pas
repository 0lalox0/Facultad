{
3. Realizar un programa que genere un archivo de novelas filmadas durante el presente
año. De cada novela se registra: código, género, nombre, duración, director y precio.
El programa debe presentar un menú con las siguientes opciones:
a. Crear el archivo y cargarlo a partir de datos ingresados por teclado. Se
utiliza la técnica de lista invertida para recuperar espacio libre en el
archivo. Para ello, durante la creación del archivo, en el primer registro del
mismo se debe almacenar la cabecera de la lista. Es decir un registro
ficticio, inicializando con el valor cero (0) el campo correspondiente al
código de novela, el cual indica que no hay espacio libre dentro del
archivo.
b. Abrir el archivo existente y permitir su mantenimiento teniendo en cuenta el
inciso a., se utiliza lista invertida para recuperación de espacio. En
particular, para el campo de ´enlace´ de la lista, se debe especificar los
números de registro referenciados con signo negativo, (utilice el código de
novela como enlace).Una vez abierto el archivo, brindar operaciones para:
i. Dar de alta una novela leyendo la información desde teclado. Para
esta operación, en caso de ser posible, deberá recuperarse el
espacio libre. Es decir, si en el campo correspondiente al código de
novela del registro cabecera hay un valor negativo, por ejemplo -5,
se debe leer el registro en la posición 5, copiarlo en la posición 0
(actualizar la lista de espacio libre) y grabar el nuevo registro en la
posición 5. Con el valor 0 (cero) en el registro cabecera se indica
que no hay espacio libre.
ii. Modificar los datos de una novela leyendo la información desde
teclado. El código de novela no puede ser modificado.
iii. Eliminar una novela cuyo código es ingresado por teclado. Por
ejemplo, si se da de baja un registro en la posición 8, en el campo
código de novela del registro cabecera deberá figurar -8, y en el
registro en la posición 8 debe copiarse el antiguo registro cabecera.
c. Listar en un archivo de texto todas las novelas, incluyendo las borradas, que
representan la lista de espacio libre. El archivo debe llamarse “novelas.txt”.
NOTA: Tanto en la creación como en la apertura el nombre del archivo debe ser
proporcionado por el usuario
   
}


program untitled;
type
novela = record
codigo,duracion:integer;
precio:real;
genero,nombre,director:string;
end;
ArcN = file of novela;

procedure leerNovela(var r:novela);
begin
write('codigo: ');
readln(r.codigo);
end;
procedure crearArcN(var arc:arcN);
var
r:novela;
begin
rewrite(arc);
r.codigo := 0;
write(arc,r);
leerNovela(r);
while(r.codigo <> 0)do begin
write(arc,r);
leerNovela(r);
end
end;
procedure agregarNovela(var arc:arcN;n:novela);
var
r:novela;
aux:integer;
begin
seek(arc,0);
aux := 0;
read(arc,r);
if(r.codigo = 0) then
begin
seek(arc,filesize(arc));
write(arc,n);
end else begin
r.codigo := r.codigo * -1;
seek(arc,r.codigo);
read(arc,r);
seek(arc,filepos(arc)-1);
write(arc,n);
seek(arc,aux);
write(arc,r);
end;
end;
procedure Eliminar(var arc:arcN;cod:integer);
var
r:novela;
aux:integer;
begin
seek(arc,0);
read(arc,r);
aux := r.codigo;
r.codigo := 0;
while(not EoF(arc)) and (r.codigo <> cod)do begin
read(arc,r);
end;
if(r.codigo = cod)then
begin
seek(arc,filepos(arc)-1);
r.codigo := aux;
write(arc,r);
aux := filepos(arc) -1;
seek(arc,0);
r.codigo := aux * -1;
write(arc,r);
end else writeln('Codigo no encontrado papa');


end;
procedure exportartxt(var arc:arcN);
var
fisico:string;
arcTxt:text;
p:novela;
begin	
	seek(arc,0);
	{write('escribir el nombre del archivo binario fisico del texto: ');
	readln(fisico);}
	fisico := 'punto3txt.txt';
	assign(arcTxt,fisico);
	rewrite(arcTxt);
	while(not eof(arc))do begin
		read(arc,p);
		with p do begin
			write(arcTxt,' ',codigo);
		end;
	end;
	writeln('archivo de texto creado');
	close(arcTxt);

end;
var 
arc:arcN;
r:novela;

BEGIN
Assign(arc,'novelas');	
//crearArcN(arc);
reset(arc);
leerNovela(r);
agregarNovela(arc,r);
//Eliminar(arc,5);
exportartxt(arc);
close(arc);
END.

