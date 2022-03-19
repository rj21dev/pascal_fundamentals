program Quadratish;

procedure quadratic(a, b, c: real; var ok: boolean; var x1, x2: real);
var
	D: real;
begin
	ok := false;
	if a = 0 then
		exit;
	D := b * b - 4 * a * c;
	if D < 0 then
		exit;
	D := sqrt(D);
	x1 := (- b - D) / 2 * a;
	x2 := (- b + D) / 2 * a;
	ok := true;
end;

var
	ok: boolean;
	a, b, c, x1, x2: real;
begin
	write('Enter the coefficients A, B, C: ');
	readln(a, b, c);
	quadratic(a, b, c, ok, x1, x2);
	writeln(ok, ' ', x1:5:2, ' ', x2:5:2)
end.
