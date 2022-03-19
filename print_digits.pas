program PrintDigits;

procedure PrintDigitsOfNumber(n: longint);
begin
	if n < 0 then
	begin
		write('- ');
		n := -n
	end;
	if n > 0 then
	begin
		PrintDigitsOfNumber(n div 10);
		write(n mod 10, ' ')
	end
end;

var
	n: longint;
begin
	write('Enter the number: ');
	readln(n);
	PrintDigitsOfNumber(n);
	writeln
end.
