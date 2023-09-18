program untitled;
type 
cliente = record
dni,nombre:integer
end;
clientes = ^nodo;
nodo = record
dato:cliente;
sig:clientes;
end;
procedure leer(var i:integer;var cli:clientes);
begin
if(i = 2)then writeln('puto');
end;
var
cli,p:clientes;
i:integer;
BEGIN
	leer(i,cli);
	cli:=nil;
	new(cli);
	p:=cli;
	dispose(cli);
	read(p^.dato.dni);
END.

