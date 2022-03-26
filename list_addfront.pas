program ListAddFront;
type
	list = ^node;
	node = record
		data: integer;
		next: list;
	end;
var
	first, tmp: list;
	n: integer;
begin
	first := nil;
	while not SeekEof do
	begin
		read(n);
		new(tmp);
		tmp^.data := n;
		tmp^.next := first;
		first := tmp
	end;
	tmp := first;
	while tmp <> nil do
	begin
		writeln(tmp^.data);
		tmp := tmp^.next
	end;
	while first <> nil do
	begin
		tmp := first;
		first := first^.next;
		dispose(tmp)
	end
end.	
