program PrintAscii2;
var
	i, j: integer;
begin
	for i := 0 to 7 do
	begin
		for j := 4 to 15 do
			write(chr(j * 8 + i), '  ');
		writeln
	end
end.
