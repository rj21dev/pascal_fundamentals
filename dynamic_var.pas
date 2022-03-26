program DynamicVar;
var
	p: ^string;
begin
	new(p);
	p^ := 'This is a string, which resides in the heap';
	writeln(p^);
	dispose(p)
end.
