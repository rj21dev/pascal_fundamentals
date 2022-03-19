program TestIsAlpha;

function IsAlpha(ch: char): boolean;
begin
	IsAlpha :=
		(ch >= 'a') and (ch <= 'z') or
		(ch >= 'A') and (ch <= 'Z')
end;

var
	ch: char;
begin
	write('Enter any symbol: ');
	readln(ch);
	if IsAlpha(ch) then
		writeln('You enter the letter ', '"', ch, '".')
	else
		writeln('You enter something, but NOT a letter.')
end.
