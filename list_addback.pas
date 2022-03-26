program ListAddBack;
type
	list = ^node;
	node = record
		data: integer;
		next: list;
	end;
var
	first, tmp, last: list;
	n: integer;
begin
	first := nil;
	while not SeekEof do
	begin
		read(n);
		if first = nil then
		begin
			new(first);
			last := first
		end
		else
		begin
			new(last^.next);
			last := last^.next
		end;
		last^.data := n;
		last^.next := nil
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
