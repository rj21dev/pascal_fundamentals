program PointerTest;
var
	x: integer;
	p: ^integer;
begin
	p := @x;
	p^ := 42;
	writeln(x)
end.	
