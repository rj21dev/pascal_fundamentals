program MessageN;
const
	message = 'Hello, world!';
	count = 20;
var
	i: integer;
begin
	for i := 1 to count do
		writeln(i:2, ') ', message)
end.
