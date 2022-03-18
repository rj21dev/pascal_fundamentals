program DiamondProcBg;

procedure PrintChars(ch: char; count: integer);
var
	i: integer;
begin
	for i := 1 to count do
		write(ch)
end;

procedure PrintLineOfDiamond(k, n: integer);
begin
	if k > 1 then
	begin
		PrintChars('*', n + 3 - k);
		PrintChars(' ', 2 * k - 3);
		PrintChars('*', n + 3 - k)
	end
	else
		PrintChars('*', 2 * n + 3);
	writeln
end;

var
	n, k, h: integer;
begin
	repeat
		write('Enter the diamond''s height (positive odd)');
		readln(h)
	until (h > 0) and (h mod 2 = 1);
	n := h div 2;
	for k := 1 to n + 2 do
		PrintLineOfDiamond(k, n);
	for k := n + 1 downto 1 do
		PrintLineOfDiamond(k, n)
end.
