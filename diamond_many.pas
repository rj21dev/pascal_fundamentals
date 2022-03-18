program diamond;

procedure PrintChars(ch: char; count: integer);
var
	i: integer;
begin
	for i := 1 to count do
		write(ch)
end;

procedure PrintLineOfDiamond(k, n: integer);
begin
	PrintChars(' ', n + 1 - k);
	PrintChars('*', 1);
	if k > 1 then
	begin
		PrintChars(' ', 2 * k - 3);
		PrintChars('*', 1)
	end;
	PrintChars(' ', n + 1 - k);
end;

procedure PrintFullRow(k, n, num: integer);
var
	i: integer;
begin
	for i := 1 to num do
	begin
		PrintLineOfDiamond(k, n);
		PrintChars(' ', 1)
	end;
end;

var
	n, k, h, num: integer;
begin
	repeat
		write('Enter the diamond''s height (positive odd): ');
		readln(h)
	until (h > 0) and (h mod 2 = 1);
	repeat
		write('Enter the number of diamonds: ');
		readln(num)
	until (num > 0);

	n := h div 2;
	for k := 1 to n + 1 do
	begin
		PrintFullRow(k, n, num);
		writeln
	end;
	for k := n downto 1 do
	begin
		PrintFullRow(k, n, num);
		writeln
	end;
end.
