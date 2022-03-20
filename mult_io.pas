program MultIO;
var
	x, y: integer;
begin
	{$I-}
	read(x, y);
	if IOResult = 0 then
		writeln(x * y)
	else
		writeln('I couldn''t parse your input')
end.
