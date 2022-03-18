program FibTest;

function Fibonacci(n: integer): longint;
var
	i: integer;
	prevprev, prev, current: longint;
begin
	if n <= 0 then
		Fibonacci := 0
	else
	begin
		prev := 0;
		current := 1;
		for i := 2 to n do
		begin
			prevprev := prev;
			prev := current;
			current := prevprev + prev
		end;
		Fibonacci := current
	end
end;

var
	n: integer;
begin
	readln(n);
	writeln(Fibonacci(n))
end.
