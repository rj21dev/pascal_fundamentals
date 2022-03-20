program char2numBase;

function GetBaseDigit(ch: char): integer;
begin
	GetBaseDigit := -1;
	if (ch >= '0') and (ch <= '9') then
		GetBaseDigit := ord(ch) - ord('0');
	if (ch >= 'a') and (ch <= 'z') then
		GetBaseDigit := ord(ch) - ord('a') + 10;
	if (ch >= 'A') and (ch <= 'Z') then
		GetBaseDigit := ord(ch) - ord('A') + 10;
	if (ch = '-') then
		GetBaseDigit := -2
end;

procedure PrintBase(base: longint);
var
	i: longint;
begin
	write('Base: ');
	for i := 0 to base - 1 do
		if i < 10 then
			write(i)
		else
			write(chr(i + 55));
	writeln
end;

procedure ReadNumBase(var success: boolean; var num: longint; base: integer);
var
	c: char;
	digit, res: longint;
	place: integer;
	sign: boolean;
begin
	res := 0;
	place := 0;
	sign := false;
	repeat
		read(c);
		place := place + 1
	until (c <> ' ') and (c <> #10);
	while (c <> ' ') and (c <> #10) do
	begin
		digit := GetBaseDigit(c);
		if (digit = -1) or (digit >= base) then
		begin
			writeln('Unexpected ''', c, ''' in place: ', place);
			readln;
			success := false;
			exit
		end;
		if (digit = -2) then
			sign := true
		else
			res := res * base + digit;
		read(c);
		place := place + 1
	end;
	if sign then
		res := -res;
	num := res;
	success := true
end;

var
	num, base: longint;
	ok: boolean;
begin
	repeat
		write('Please type the base of number (2 - 36): ');
		ReadNumBase(ok, base, 10)
	until ok and (base >= 2) and (base <= 36);
	PrintBase(base);
	repeat
		write('Please type the number in choosen base: ');
		ReadNumBase(ok, num, base)
	until ok;
	writeln(num)
end.
