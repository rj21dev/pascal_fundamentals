program PrintZ;

procedure PrintChars(ch: char; count: integer);
var
	i: integer;
begin
	for i := 1 to count do
		write(ch)
end;

procedure PrintBigZed(h: integer);
var
	row: integer;
begin
	for row := 1 to h do
	begin
		if (row <> 1) and (row <> h) and (row <> h div 2 + 1) then
		begin
			PrintChars(' ', h - row);
			PrintChars('*', 1);
		end
		else
			PrintChars('*', h);
		writeln
	end
end;

var
	h: integer;
begin
	repeat
		write('Enter the Zed''s height (positive odd >= 5): ');
		readln(h)
	until (h >= 5) and (h mod 2 = 1);
	PrintBigZed(h)
end.
